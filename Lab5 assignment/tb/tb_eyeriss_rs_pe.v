//============================================================================
// tb_eyeriss_rs_pe.v -- testbench for the row-stationary PE
// ELCT918 Lab Assignment 5, Topic 1
//
// Plain Verilog-2001 so that it compiles in any simulator: ModelSim (every
// edition, including those without SystemVerilog support), Vivado xsim,
// Icarus, VCS, Questa.
//
// All test cases live in four concatenated hex files with an offset table,
// because Verilog-2001 cannot build a filename at run time.
//
// Descriptor, 8 words per case:
//   0 S   1 p   2 E   3 shift   4 gate_en   5 ifmap_off   6 filt_off   7 exp_off
//
// Run one case only with  +CASE=3  (used for the SAIF power runs).
//============================================================================

`timescale 1ns / 1ps

`ifndef VEC_CFG
  `define VEC_CFG   "../vec/all_cfg.hex"
`endif
`ifndef VEC_IFMAP
  `define VEC_IFMAP "../vec/all_ifmap.hex"
`endif
`ifndef VEC_FILT
  `define VEC_FILT  "../vec/all_filt.hex"
`endif
`ifndef VEC_EXP
  `define VEC_EXP   "../vec/all_exp.hex"
`endif
`ifndef VEC_META
  `define VEC_META  "../vec/meta.hex"
`endif

module tb_eyeriss_rs_pe;

    parameter DW   = 16;
    parameter MAXI = 2048;
    parameter MAXF = 2048;
    parameter MAXO = 8192;
    parameter MAXG = 256;
    parameter TMO  = 500000;

    //------------------------------------------------------------------
    // DUT interface
    //------------------------------------------------------------------
    reg                  clk;
    reg                  rst_n;

    reg  [4:0]           cfg_s;
    reg  [4:0]           cfg_p;
    reg  [7:0]           cfg_e;
    reg  [4:0]           cfg_shift;
    reg                  cfg_gate_en;

    reg                  filt_we;
    reg  [7:0]           filt_waddr;
    reg  signed [DW-1:0] filt_wdata;

    reg                  start;
    wire                 busy;
    wire                 done;

    wire                 ifmap_req;
    reg                  ifmap_valid;
    reg  signed [DW-1:0] ifmap_data;

    wire                 psum_valid;
    wire [4:0]           psum_k;
    wire signed [DW-1:0] psum_out;

    // Synthesis resolves parameters away, so the implemented netlist has none.
    // Compile with -d GATE_SIM when running against netlist_funcsim.v.
`ifdef GATE_SIM
    eyeriss_rs_pe dut (
`else
    eyeriss_rs_pe #(.DW(DW)) dut (
`endif
        .clk        (clk),
        .rst_n      (rst_n),
        .cfg_s      (cfg_s),
        .cfg_p      (cfg_p),
        .cfg_e      (cfg_e),
        .cfg_shift  (cfg_shift),
        .cfg_gate_en(cfg_gate_en),
        .filt_we    (filt_we),
        .filt_waddr (filt_waddr),
        .filt_wdata (filt_wdata),
        .start      (start),
        .busy       (busy),
        .done       (done),
        .ifmap_req  (ifmap_req),
        .ifmap_valid(ifmap_valid),
        .ifmap_data (ifmap_data),
        .psum_valid (psum_valid),
        .psum_k     (psum_k),
        .psum_out   (psum_out)
    );

    //------------------------------------------------------------------
    // Vector storage
    //------------------------------------------------------------------
    reg [15:0] ifmap_all [0:MAXI-1];
    reg [15:0] filt_all  [0:MAXF-1];
    reg [15:0] exp_all   [0:MAXO-1];
    reg [15:0] cfg_all   [0:MAXG-1];
    reg [15:0] meta      [0:7];

    integer ncases, cfgw;
    integer cbase, ifmap_off, filt_off, exp_off;
    integer src_idx, out_idx, errors, total_errors, case_cycles;
    integer n_out, n_filt, guard, a, ci, only_case;
    integer p_int;

    reg [15:0] tmp;      // Verilog-2001 cannot bit-select a memory element
    reg [4:0]  exp_k;
    reg        checking;
    reg        use_one;

    //------------------------------------------------------------------
    // Clock: 100 MHz
    //------------------------------------------------------------------
    initial clk = 1'b0;
    always #5 clk = ~clk;

    //------------------------------------------------------------------
    // ifmap source. Always ready; the PE pulls one value per request.
    //------------------------------------------------------------------
    always @(*) begin
        ifmap_valid = 1'b1;
        ifmap_data  = ifmap_all[ifmap_off + src_idx];
    end

    always @(posedge clk)
        if (rst_n && ifmap_req)
            src_idx <= src_idx + 1;

    // Count only while the PE is running, so the number matches
    // S + E*(S*p + p + 2) from docs/design_decisions.md.
    always @(posedge clk)
        if (rst_n && busy)
            case_cycles <= case_cycles + 1;

    //------------------------------------------------------------------
    // Output checker
    //------------------------------------------------------------------
    always @(posedge clk) begin
        if (rst_n && checking && psum_valid) begin
            exp_k = out_idx % p_int;
            if (psum_out !== exp_all[exp_off + out_idx]) begin
                errors = errors + 1;
                if (errors <= 10)
                    $display("  MISMATCH idx=%0d k=%0d  got %04h  expected %04h",
                             out_idx, psum_k, psum_out,
                             exp_all[exp_off + out_idx]);
            end
            if (psum_k !== exp_k) begin
                errors = errors + 1;
                if (errors <= 10)
                    $display("  BAD K    idx=%0d  got k=%0d  expected k=%0d",
                             out_idx, psum_k, exp_k);
            end
            out_idx = out_idx + 1;
        end
    end

    //------------------------------------------------------------------
    // One case
    //------------------------------------------------------------------
    task run_case;
        input integer c;
        begin
            cbase = c * cfgw;

            tmp = cfg_all[cbase + 0];  cfg_s       = tmp[4:0];
            tmp = cfg_all[cbase + 1];  cfg_p       = tmp[4:0];  p_int = tmp;
            tmp = cfg_all[cbase + 2];  cfg_e       = tmp[7:0];
            tmp = cfg_all[cbase + 3];  cfg_shift   = tmp[4:0];
            tmp = cfg_all[cbase + 4];  cfg_gate_en = tmp[0];
            ifmap_off = cfg_all[cbase + 5];
            filt_off  = cfg_all[cbase + 6];
            exp_off   = cfg_all[cbase + 7];

            n_filt = cfg_p * cfg_s;
            n_out  = cfg_e * cfg_p;

            // reset
            rst_n       = 1'b0;
            start       = 1'b0;
            filt_we     = 1'b0;
            filt_waddr  = 8'd0;
            filt_wdata  = 16'd0;
            src_idx     = 0;
            out_idx     = 0;
            errors      = 0;
            case_cycles = 0;
            checking    = 1'b0;
            repeat (4) @(posedge clk);
            rst_n = 1'b1;
            @(posedge clk);

            // load the filter scratchpad: w(k,s) at k*S + s
            for (a = 0; a < n_filt; a = a + 1) begin
                @(negedge clk);
                filt_we    = 1'b1;
                filt_waddr = a;
                filt_wdata = filt_all[filt_off + a];
            end
            @(negedge clk);
            filt_we = 1'b0;

            // run
            checking = 1'b1;
            @(negedge clk);  start = 1'b1;
            @(negedge clk);  start = 1'b0;

            guard = 0;
            while (!done && guard < TMO) begin
                @(posedge clk);
                guard = guard + 1;
            end
            if (guard >= TMO) begin
                $display("  TIMEOUT: done never asserted");
                errors = errors + 1;
            end

            @(posedge clk);
            checking = 1'b0;

            if (out_idx !== n_out) begin
                $display("  WRONG COUNT: got %0d psums, expected %0d",
                         out_idx, n_out);
                errors = errors + 1;
            end

            total_errors = total_errors + errors;
            $display("case %0d: S=%0d p=%0d E=%0d shift=%0d gate=%0b  psums=%0d cycles=%0d  %s",
                     c, cfg_s, cfg_p, cfg_e, cfg_shift, cfg_gate_en,
                     out_idx, case_cycles, errors == 0 ? "PASS" : "FAIL");
        end
    endtask

    //------------------------------------------------------------------
    // Main
    //------------------------------------------------------------------
    initial begin
`ifdef DUMP_VCD
        $dumpfile("tb_eyeriss_rs_pe.vcd");
        $dumpvars(0, tb_eyeriss_rs_pe);
`endif
        total_errors = 0;
        ifmap_off    = 0;
        src_idx      = 0;
        checking     = 1'b0;

        $readmemh(`VEC_META,  meta);
        $readmemh(`VEC_CFG,   cfg_all);
        $readmemh(`VEC_IFMAP, ifmap_all);
        $readmemh(`VEC_FILT,  filt_all);
        $readmemh(`VEC_EXP,   exp_all);

        if (meta[0] === 16'hxxxx || meta[0] === 16'h0000) begin
            $display("ERROR: vectors not found. Run python/ref_model.py first,");
            $display("       and start the simulator from the sim/ directory.");
            $finish;
        end

        ncases = meta[0];
        cfgw   = meta[1];

        $display("--------------------------------------------------------");
        if ($value$plusargs("CASE=%d", only_case)) begin
            $display("Eyeriss row-stationary PE -- case %0d only", only_case);
            $display("--------------------------------------------------------");
            run_case(only_case);
        end else begin
            $display("Eyeriss row-stationary PE -- %0d cases", ncases);
            $display("--------------------------------------------------------");
            for (ci = 0; ci < ncases; ci = ci + 1)
                run_case(ci);
        end

        $display("--------------------------------------------------------");
        if (total_errors == 0)
            $display("ALL CASES PASS");
        else
            $display("FAILED: %0d errors", total_errors);
        $display("--------------------------------------------------------");
        $finish;
    end

endmodule
