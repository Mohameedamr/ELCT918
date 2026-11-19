//============================================================================
// tb_mac_pe_baseline.v -- testbench for the no-scratchpad baseline PE
// ELCT918 Lab Assignment 5, Topic 1, baseline B
//
// Plain Verilog-2001, same vector files as tb_eyeriss_rs_pe.v.
//
// This PE has no local storage, so every operand is counted as a read from
// outside the PE. That count is the figure compared against the
// row-stationary PE in the Task 3 table.
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

module tb_mac_pe_baseline;

    parameter DW   = 16;
    parameter MAXI = 2048;
    parameter MAXF = 2048;
    parameter MAXO = 8192;
    parameter MAXG = 256;

    reg                  clk;
    reg                  rst_n;
    reg  [4:0]           cfg_shift;
    reg                  valid_in, first, last;
    reg  signed [DW-1:0] x_in, w_in;
    wire                 psum_valid;
    wire signed [DW-1:0] psum_out;

    mac_pe_baseline #(.DW(DW)) dut (
        .clk       (clk),
        .rst_n     (rst_n),
        .cfg_shift (cfg_shift),
        .valid_in  (valid_in),
        .first     (first),
        .last      (last),
        .x_in      (x_in),
        .w_in      (w_in),
        .psum_valid(psum_valid),
        .psum_out  (psum_out)
    );

    reg [15:0] ifmap_all [0:MAXI-1];
    reg [15:0] filt_all  [0:MAXF-1];
    reg [15:0] exp_all   [0:MAXO-1];
    reg [15:0] cfg_all   [0:MAXG-1];
    reg [15:0] meta      [0:7];

    integer ncases, cfgw, cbase;
    integer ifmap_off, filt_off, exp_off;
    integer S, P, E, out_idx, errors, total_errors;
    integer ext_reads, cycles_used, rs_external;
    integer e, k, s, ci;
    reg [15:0] tmp;
    reg        checking;

    initial clk = 1'b0;
    always #5 clk = ~clk;

    always @(posedge clk) begin
        if (rst_n && checking && psum_valid) begin
            if (psum_out !== exp_all[exp_off + out_idx]) begin
                errors = errors + 1;
                if (errors <= 10)
                    $display("  MISMATCH idx=%0d  got %04h  expected %04h",
                             out_idx, psum_out, exp_all[exp_off + out_idx]);
            end
            out_idx = out_idx + 1;
        end
    end

    task run_case;
        input integer c;
        begin
            cbase = c * cfgw;
            S = cfg_all[cbase + 0];
            P = cfg_all[cbase + 1];
            E = cfg_all[cbase + 2];
            tmp = cfg_all[cbase + 3];  cfg_shift = tmp[4:0];
            ifmap_off = cfg_all[cbase + 5];
            filt_off  = cfg_all[cbase + 6];
            exp_off   = cfg_all[cbase + 7];

            rst_n       = 1'b0;
            valid_in    = 1'b0;
            first       = 1'b0;
            last        = 1'b0;
            x_in        = 16'd0;
            w_in        = 16'd0;
            out_idx     = 0;
            errors      = 0;
            ext_reads   = 0;
            cycles_used = 0;
            checking    = 1'b0;
            repeat (4) @(posedge clk);
            rst_n = 1'b1;
            @(posedge clk);
            checking = 1'b1;

            // Every multiplication fetches both operands from outside.
            for (e = 0; e < E; e = e + 1) begin
                for (k = 0; k < P; k = k + 1) begin
                    for (s = 0; s < S; s = s + 1) begin
                        @(negedge clk);
                        valid_in  = 1'b1;
                        first     = (s == 0);
                        last      = (s == S - 1);
                        x_in      = ifmap_all[ifmap_off + e + s];
                        w_in      = filt_all[filt_off + k * S + s];
                        ext_reads = ext_reads + 2;
                        cycles_used = cycles_used + 1;
                    end
                end
            end
            @(negedge clk);
            valid_in = 1'b0;
            first    = 1'b0;
            last     = 1'b0;

            repeat (4) @(posedge clk);
            checking = 1'b0;

            if (out_idx !== E * P) begin
                $display("  WRONG COUNT: got %0d psums, expected %0d",
                         out_idx, E * P);
                errors = errors + 1;
            end

            // Row-stationary PE on the same workload: the ifmap row and the
            // filter weights each cross the PE boundary exactly once.
            rs_external = (E + S - 1) + (P * S);

            total_errors = total_errors + errors;
            $display("case %0d: S=%0d p=%0d E=%0d  psums=%0d cycles=%0d  external reads: baseline %0d vs RS PE %0d (%0dx)  %s",
                     c, S, P, E, out_idx, cycles_used,
                     ext_reads, rs_external, ext_reads / rs_external,
                     errors == 0 ? "PASS" : "FAIL");
        end
    endtask

    initial begin
`ifdef DUMP_VCD
        $dumpfile("tb_mac_pe_baseline.vcd");
        $dumpvars(0, tb_mac_pe_baseline);
`endif
        total_errors = 0;
        ifmap_off    = 0;
        exp_off      = 0;
        filt_off     = 0;
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
        $display("Baseline MAC PE (no scratchpads) -- %0d cases", ncases);
        $display("--------------------------------------------------------");

        for (ci = 0; ci < ncases; ci = ci + 1)
            run_case(ci);

        $display("--------------------------------------------------------");
        if (total_errors == 0)
            $display("ALL CASES PASS");
        else
            $display("FAILED: %0d errors", total_errors);
        $display("--------------------------------------------------------");
        $finish;
    end

endmodule
