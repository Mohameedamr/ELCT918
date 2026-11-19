//============================================================================
// eyeriss_rs_pe.v -- Eyeriss row-stationary processing element
// ELCT918 Lab Assignment 5, Topic 1
//
// Y.-H. Chen, T. Krishna, J. S. Emer and V. Sze, "Eyeriss: An Energy-Efficient
// Reconfigurable Accelerator for Deep Convolutional Neural Networks",
// IEEE JSSC, vol. 52, no. 1, 2017.
//   Fig. 3   1-D convolution primitive: a filter row of S weights slides
//            along an ifmap row with stride 1
//   Fig. 6b  filter interleaving: p filters share the same ifmap window, so
//            each ifmap value read from the spad is used p times
//   Fig. 12  PE datapath: three scratchpads, configurable 32->16 truncation,
//            16-bit accumulation, and the zero-gating path (shown in red)
//
// Computes psum(e,k) = sum_s w(k,s) * x(e+s), emitted in the order
// e = 0, 1, ... with k = 0 ... p-1 inside each window.
//
// Scope (per the topic brief): q = 1 input channel. Channel interleaving
// (Fig. 6c) is not implemented; see the report for how it would extend.
//============================================================================

`timescale 1ns / 1ps
`default_nettype none

module eyeriss_rs_pe #(
    parameter integer DW       = 16,   // data width, signed fixed point
    parameter integer IF_DEPTH = 12,   // ifmap spad entries  (registers)
    parameter integer FI_DEPTH = 224,  // filter spad entries (SRAM)
    parameter integer PS_DEPTH = 24    // psum spad entries   (registers)
) (
    input  wire                 clk,
    input  wire                 rst_n,        // synchronous, active low

    //------------------------------------------------------------------
    // Configuration. Captured when `start` is asserted and held for the
    // whole run, mirroring the scan-chain configuration of the chip.
    //------------------------------------------------------------------
    input  wire [4:0]           cfg_s,        // filter row size S, 1..12
    input  wire [4:0]           cfg_p,        // interleaved filters p, 1..16
    input  wire [7:0]           cfg_e,        // number of windows E, 1..255
    input  wire [4:0]           cfg_shift,    // keep product bits [shift+15:shift]
    input  wire                 cfg_gate_en,  // 1 = zero gating enabled

    //------------------------------------------------------------------
    // Filter scratchpad write port. Load w(k,s) at address k*S + s before
    // asserting start.
    //------------------------------------------------------------------
    input  wire                 filt_we,
    input  wire [7:0]           filt_waddr,
    input  wire signed [DW-1:0] filt_wdata,

    //------------------------------------------------------------------
    // Run control
    //------------------------------------------------------------------
    input  wire                 start,
    output wire                 busy,
    output reg                  done,

    //------------------------------------------------------------------
    // ifmap stream. The PE pulls: it raises ifmap_req and consumes one
    // value when ifmap_valid is high. A W-value row cannot be preloaded
    // into a 12-entry spad, so the spad is a circular sliding window.
    //------------------------------------------------------------------
    output wire                 ifmap_req,
    input  wire                 ifmap_valid,
    input  wire signed [DW-1:0] ifmap_data,

    //------------------------------------------------------------------
    // psum output stream, p values per window
    //------------------------------------------------------------------
    output reg                  psum_valid,
    output reg  [4:0]           psum_k,
    output reg  signed [DW-1:0] psum_out
);

    //------------------------------------------------------------------
    // FSM states
    //------------------------------------------------------------------
    localparam [2:0] ST_IDLE  = 3'd0,
                     ST_FILL  = 3'd1,  // pull the first S ifmap values
                     ST_COMP  = 3'd2,  // S*p MAC issue cycles
                     ST_FLUSH = 3'd3,  // one bubble, lets stage 2 finish
                     ST_DRAIN = 3'd4,  // read out p psums
                     ST_NEXT  = 3'd5,  // pull one value, slide the window
                     ST_DONE  = 3'd6;

    reg [2:0] state;

    // latched configuration
    reg [4:0] s_max;        // S
    reg [4:0] p_max;        // p
    reg [7:0] e_max;        // E
    reg [4:0] shift_r;      // truncation slice offset
    reg       gate_en_r;

    // sequencing counters
    reg [3:0] rbase;        // ifmap spad index of x(e), the window base
    reg [4:0] s_cnt;        // 0 .. S-1, outer loop
    reg [4:0] k_cnt;        // 0 .. p-1, inner loop
    reg [7:0] e_cnt;        // 0 .. E-1, current window
    reg [7:0] filt_base;    // running k*S, avoids a runtime multiplier
    reg [4:0] fill_cnt;
    reg [4:0] drain_cnt;

    //------------------------------------------------------------------
    // Scratchpads
    //------------------------------------------------------------------
    reg signed [DW-1:0] ifmap_spad [0:IF_DEPTH-1];   // registers
    reg        [IF_DEPTH-1:0] zero_buf;              // one zero flag per entry
    reg signed [DW-1:0] filt_spad  [0:FI_DEPTH-1];   // inferred RAM
    reg signed [DW-1:0] psum_spad  [0:PS_DEPTH-1];   // registers

    integer i;

    //------------------------------------------------------------------
    // Stage 1 address generation
    //------------------------------------------------------------------
    // Circular ifmap index: rbase + s, wrapped. rbase <= 11 and s <= 11 so a
    // single conditional subtract is enough.
    wire [4:0] if_sum  = {1'b0, rbase} + s_cnt;
    wire [3:0] if_idx  = (if_sum >= IF_DEPTH) ? (if_sum - IF_DEPTH) : if_sum;

    // Index that the next pulled ifmap value overwrites: x(e+S).
    wire [4:0] wr_sum  = {1'b0, rbase} + s_max;
    wire [3:0] wr_idx  = (wr_sum >= IF_DEPTH) ? (wr_sum - IF_DEPTH) : wr_sum;

    wire [7:0] filt_addr = filt_base + s_cnt;

    // Zero gating (Section V-C, Fig. 12). The zero buffer records which ifmap
    // spad entries hold zero. A gated cycle still happens -- only the toggling
    // is suppressed -- so the cycle count is independent of the data.
    wire issue = (state == ST_COMP);
    wire gate  = gate_en_r & zero_buf[if_idx];

    // The ifmap spad is read once per s and held for all p filters. This is
    // what makes "one ifmap read feeds p MACs" true in hardware rather than
    // only on paper.
    wire ifmap_rd_en = issue & ~gate & (k_cnt == 5'd0);
    wire filt_rd_en  = issue & ~gate;

    //------------------------------------------------------------------
    // Stage 1 -> stage 2 pipeline registers
    //------------------------------------------------------------------
    reg signed [DW-1:0] x_r;      // held ifmap operand
    reg signed [DW-1:0] w_r;      // filter spad output register
    reg        [4:0]    k_r;
    reg                 vld_r;
    reg                 gate_r;

    //------------------------------------------------------------------
    // Stage 2 datapath: multiply, truncate, accumulate
    //------------------------------------------------------------------
    wire signed [2*DW-1:0] product  = x_r * w_r;

    // Configurable 32 -> 16 truncation: keep bits [shift+15 : shift]. This is
    // a raw bit slice, so there is no rounding and negative products truncate
    // toward minus infinity. shift <= 16 keeps the slice inside the product.
    wire        [2*DW-1:0] shifted  = product >> shift_r;
    wire signed [DW-1:0]   trunc    = shifted[DW-1:0];

    // Accumulation wraps at 16 bits, as specified in the brief.
    wire signed [DW-1:0]   acc_next = psum_spad[k_r] + trunc;

    wire mac_commit   = vld_r & ~gate_r;
    wire clear_psums  = (state == ST_FILL  && ifmap_valid && fill_cnt == s_max - 5'd1)
                      | (state == ST_NEXT  && ifmap_valid);

    assign busy      = (state != ST_IDLE);
    assign ifmap_req = (state == ST_FILL) || (state == ST_NEXT);

    //------------------------------------------------------------------
    // Control FSM
    //------------------------------------------------------------------
    always @(posedge clk) begin
        if (!rst_n) begin
            state     <= ST_IDLE;
            done      <= 1'b0;
            s_max     <= 5'd1;
            p_max     <= 5'd1;
            e_max     <= 8'd1;
            shift_r   <= 5'd0;
            gate_en_r <= 1'b0;
            rbase     <= 4'd0;
            s_cnt     <= 5'd0;
            k_cnt     <= 5'd0;
            e_cnt     <= 8'd0;
            filt_base <= 8'd0;
            fill_cnt  <= 5'd0;
            drain_cnt <= 5'd0;
        end else begin
            done <= 1'b0;

            case (state)
                ST_IDLE: begin
                    if (start) begin
                        s_max     <= cfg_s;
                        p_max     <= cfg_p;
                        e_max     <= cfg_e;
                        shift_r   <= cfg_shift;
                        gate_en_r <= cfg_gate_en;
                        fill_cnt  <= 5'd0;
                        state     <= ST_FILL;
                    end
                end

                // Fill the first window: S values at spad entries 0 .. S-1.
                ST_FILL: begin
                    if (ifmap_valid) begin
                        if (fill_cnt == s_max - 5'd1) begin
                            rbase     <= 4'd0;
                            e_cnt     <= 8'd0;
                            s_cnt     <= 5'd0;
                            k_cnt     <= 5'd0;
                            filt_base <= 8'd0;
                            state     <= ST_COMP;
                        end else begin
                            fill_cnt <= fill_cnt + 5'd1;
                        end
                    end
                end

                // S*p MAC issues. k is the fast index so that one ifmap value
                // is consumed by all p filters before the window advances.
                ST_COMP: begin
                    if (k_cnt == p_max - 5'd1) begin
                        k_cnt     <= 5'd0;
                        filt_base <= 8'd0;
                        if (s_cnt == s_max - 5'd1) begin
                            s_cnt <= 5'd0;
                            state <= ST_FLUSH;
                        end else begin
                            s_cnt <= s_cnt + 5'd1;
                        end
                    end else begin
                        k_cnt     <= k_cnt + 5'd1;
                        filt_base <= filt_base + {3'd0, s_max};
                    end
                end

                ST_FLUSH: begin
                    drain_cnt <= 5'd0;
                    state     <= ST_DRAIN;
                end

                ST_DRAIN: begin
                    if (drain_cnt == p_max - 5'd1)
                        state <= (e_cnt == e_max - 8'd1) ? ST_DONE : ST_NEXT;
                    else
                        drain_cnt <= drain_cnt + 5'd1;
                end

                // Slide the window by one: pull x(e+S), advance rbase.
                ST_NEXT: begin
                    if (ifmap_valid) begin
                        rbase     <= (rbase == IF_DEPTH - 1) ? 4'd0 : rbase + 4'd1;
                        e_cnt     <= e_cnt + 8'd1;
                        s_cnt     <= 5'd0;
                        k_cnt     <= 5'd0;
                        filt_base <= 8'd0;
                        state     <= ST_COMP;
                    end
                end

                ST_DONE: begin
                    done  <= 1'b1;
                    state <= ST_IDLE;
                end

                default: state <= ST_IDLE;
            endcase
        end
    end

    //------------------------------------------------------------------
    // ifmap scratchpad and zero buffer (registers)
    //------------------------------------------------------------------
    always @(posedge clk) begin
        if (!rst_n) begin
            zero_buf <= {IF_DEPTH{1'b0}};
        end else begin
            if (state == ST_FILL && ifmap_valid) begin
                ifmap_spad[fill_cnt[3:0]] <= ifmap_data;
                zero_buf[fill_cnt[3:0]]   <= (ifmap_data == {DW{1'b0}});
            end else if (state == ST_NEXT && ifmap_valid) begin
                ifmap_spad[wr_idx] <= ifmap_data;
                zero_buf[wr_idx]   <= (ifmap_data == {DW{1'b0}});
            end
        end
    end

    //------------------------------------------------------------------
    // Filter scratchpad. Write port plus a read with enable and a registered
    // output -- the template Vivado needs to infer a RAM rather than 3584
    // flip-flops behind a 224:1 multiplexer. When the read enable is low
    // (a gated cycle) the RAM is not read and w_r holds, so the multiplier
    // input does not switch.
    //------------------------------------------------------------------
    always @(posedge clk) begin
        if (filt_we)
            filt_spad[filt_waddr] <= filt_wdata;
        if (filt_rd_en)
            w_r <= filt_spad[filt_addr];
    end

    //------------------------------------------------------------------
    // Remaining stage 1 registers
    //------------------------------------------------------------------
    always @(posedge clk) begin
        if (!rst_n) begin
            x_r    <= {DW{1'b0}};
            k_r    <= 5'd0;
            vld_r  <= 1'b0;
            gate_r <= 1'b0;
        end else begin
            vld_r  <= issue;
            gate_r <= issue & gate;
            if (issue)
                k_r <= k_cnt;
            if (ifmap_rd_en)
                x_r <= ifmap_spad[if_idx];
        end
    end

    //------------------------------------------------------------------
    // psum scratchpad (registers). Read combinationally in stage 2 and
    // written the same cycle, so back-to-back accumulation into the same
    // entry works even at p = 1 with no forwarding logic.
    //
    // Clearing the whole spad between windows replaces Fig. 12's "reset
    // accumulation" mux and lets a gated cycle skip its write
    // unconditionally, including at s = 0.
    //------------------------------------------------------------------
    always @(posedge clk) begin
        if (!rst_n) begin
            for (i = 0; i < PS_DEPTH; i = i + 1)
                psum_spad[i] <= {DW{1'b0}};
        end else if (clear_psums) begin
            for (i = 0; i < PS_DEPTH; i = i + 1)
                psum_spad[i] <= {DW{1'b0}};
        end else if (mac_commit) begin
            psum_spad[k_r] <= acc_next;
        end
    end

    //------------------------------------------------------------------
    // psum output, driven directly from the spad during the drain phase
    //------------------------------------------------------------------
    always @(*) begin
        psum_valid = (state == ST_DRAIN);
        psum_k     = drain_cnt;
        psum_out   = psum_spad[drain_cnt];
    end

endmodule

`default_nettype wire
