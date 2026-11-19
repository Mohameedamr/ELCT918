//============================================================================
// mac_pe_baseline.v -- conventional MAC PE, no scratchpads
// ELCT918 Lab Assignment 5, Topic 1, baseline B
//
// The design that the row-stationary PE is compared against in Task 3: every
// operand is fetched from outside the PE for every multiplication, so there
// is no convolutional reuse, no filter reuse and no local psum accumulation
// storage beyond a single accumulator.
//
// Per the brief the external memory is not built -- the accesses are counted
// in the testbench instead. The pipeline depth and the truncation are kept
// identical to eyeriss_rs_pe so that the area, timing and power comparison is
// like for like.
//============================================================================

`timescale 1ns / 1ps
`default_nettype none

module mac_pe_baseline #(
    parameter integer DW = 16
) (
    input  wire                 clk,
    input  wire                 rst_n,        // synchronous, active low

    input  wire [4:0]           cfg_shift,    // keep product bits [shift+15:shift]

    // One operand pair per cycle, supplied from outside the PE.
    input  wire                 valid_in,
    input  wire                 first,        // first term of a dot product
    input  wire                 last,         // final term of a dot product
    input  wire signed [DW-1:0] x_in,
    input  wire signed [DW-1:0] w_in,

    output reg                  psum_valid,
    output reg  signed [DW-1:0] psum_out
);

    // Stage 1: operand registers
    reg signed [DW-1:0] x_r, w_r;
    reg                 v_r, first_r, last_r;

    always @(posedge clk) begin
        if (!rst_n) begin
            x_r     <= {DW{1'b0}};
            w_r     <= {DW{1'b0}};
            v_r     <= 1'b0;
            first_r <= 1'b0;
            last_r  <= 1'b0;
        end else begin
            x_r     <= x_in;
            w_r     <= w_in;
            v_r     <= valid_in;
            first_r <= first;
            last_r  <= last;
        end
    end

    // Stage 2: multiply, truncate, accumulate -- same arithmetic as the RS PE
    wire signed [2*DW-1:0] product = x_r * w_r;
    wire        [2*DW-1:0] shifted = product >> cfg_shift;
    wire signed [DW-1:0]   trunc   = shifted[DW-1:0];

    reg  signed [DW-1:0] acc;
    wire signed [DW-1:0] acc_src  = first_r ? {DW{1'b0}} : acc;
    wire signed [DW-1:0] acc_next = acc_src + trunc;   // 16-bit wrap

    always @(posedge clk) begin
        if (!rst_n) begin
            acc        <= {DW{1'b0}};
            psum_out   <= {DW{1'b0}};
            psum_valid <= 1'b0;
        end else begin
            psum_valid <= 1'b0;
            if (v_r) begin
                acc <= acc_next;
                if (last_r) begin
                    psum_out   <= acc_next;
                    psum_valid <= 1'b1;
                end
            end
        end
    end

endmodule

`default_nettype wire
