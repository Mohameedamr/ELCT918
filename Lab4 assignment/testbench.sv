// ---------------------------------------------------------------------------
// ELCT918 Verilog refresher - self-checking testbench
//
// Task 2 : drive mystery and solution from identical stimulus for 10,000
//          random cycles, with en toggling and resets at random times,
//          and compare dout and flag on every single cycle.
// Task 3 : apply the password and show flag going high.
// ---------------------------------------------------------------------------
`timescale 1ns/1ps
module tb;

  reg clk = 0, rst_n = 0, en = 0;
  reg [3:0] din = 0;

  wire [7:0] dout_ref, dout_sol;
  wire       flag_ref, flag_sol;

  integer cycle, errors, i;
  reg [3:0] pw [0:3];

  // The black box and the re-implementation, side by side on the same inputs
  mystery  bb  (.clk(clk), .rst_n(rst_n), .en(en), .din(din),
                .dout(dout_ref), .flag(flag_ref));
  solution uut (.clk(clk), .rst_n(rst_n), .en(en), .din(din),
                .dout(dout_sol), .flag(flag_sol));

  always #5 clk = ~clk;

  // Apply one cycle of stimulus, then compare both chips just after the edge
  task cycle_and_check(input r, input e, input [3:0] d);
    begin
      @(negedge clk); rst_n = r; en = e; din = d;
      @(posedge clk); #1;
      cycle = cycle + 1;
      if (dout_ref !== dout_sol || flag_ref !== flag_sol) begin
        errors = errors + 1;
        if (errors <= 10)
          $display("MISMATCH at cycle %0d: rst_n=%b en=%b din=%h | mystery dout=%h flag=%b | solution dout=%h flag=%b",
                   cycle, r, e, d, dout_ref, flag_ref, dout_sol, flag_sol);
      end
    end
  endtask

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    cycle  = 0;
    errors = 0;
    pw[0] = 4'h6; pw[1] = 4'h3; pw[2] = 4'hB; pw[3] = 4'h9;

    // Settle both chips into the reset state before comparing anything
    repeat (3) cycle_and_check(1'b0, 1'b0, 4'h0);

    // ---- Task 2 : random equivalence run --------------------------------
    // en is a random bit, din a random nibble, and rst_n drops roughly one
    // cycle in fifty so mid-message restarts are exercised as well.
    $display("running 10000 random cycles ...");
    for (i = 0; i < 10000; i = i + 1)
      cycle_and_check((($random % 50) != 0), ($random & 1), ($random & 15));

    if (errors == 0)
      $display("PASS - solution matched mystery on all %0d cycles", cycle);
    else
      $display("FAIL - %0d mismatches in %0d cycles", errors, cycle);

    // ---- Task 3 : the password ------------------------------------------
    $display("");
    $display("applying password 6 3 B 9 immediately after reset");
    repeat (2) cycle_and_check(1'b0, 1'b0, 4'h0);
    for (i = 0; i < 4; i = i + 1) begin
      cycle_and_check(1'b1, 1'b1, pw[i]);
      $display("  din=%h -> dout=%h flag=%b   (solution dout=%h flag=%b)",
               pw[i], dout_ref, flag_ref, dout_sol, flag_sol);
    end

    if (flag_ref === 1'b1 && flag_sol === 1'b1)
      $display("PASSWORD OK - ciphertext reached CAFE and flag went high on both chips");
    else
      $display("PASSWORD FAILED - flag did not go high");

    $display("");
    if (errors == 0) $display("ALL CHECKS PASSED");
    else             $display("THERE WERE %0d MISMATCHES", errors);

    $finish;
  end

endmodule
