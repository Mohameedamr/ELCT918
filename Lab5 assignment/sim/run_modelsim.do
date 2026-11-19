# ELCT918 Lab 5, Topic 1 -- ModelSim / Questa script
#
# Run from the sim/ directory:
#   GUI      :  vsim -do run_modelsim.do
#   console  :  vsim -c -do run_modelsim.do
#
# Generate the vectors first:
#   cd ../python  &&  python3 ref_model.py
#
# Everything here is plain Verilog-2001, so no SystemVerilog licence or
# edition is required.

# ModelSim treats $finish as a breakpoint, which pauses this macro. Resuming
# on break lets both testbenches run in one go.
onbreak {resume}

if {[file exists work]} { vdel -all }
vlib work
vmap work work

echo "=== compiling ==="
vlog -work work ../rtl/eyeriss_rs_pe.v
vlog -work work ../rtl/mac_pe_baseline.v
vlog -work work ../tb/tb_eyeriss_rs_pe.v
vlog -work work ../tb/tb_mac_pe_baseline.v

echo "=== row-stationary PE ==="
vsim -voptargs=+acc work.tb_eyeriss_rs_pe

# Waveform for the report. Case 0 (S=3, p=2) is small enough to annotate by
# hand: 6 MAC cycles per window, 104 cycles in total.
catch {
    add wave -divider "control"
    add wave             sim:/tb_eyeriss_rs_pe/dut/state
    add wave -radix unsigned sim:/tb_eyeriss_rs_pe/dut/s_cnt
    add wave -radix unsigned sim:/tb_eyeriss_rs_pe/dut/k_cnt
    add wave -radix unsigned sim:/tb_eyeriss_rs_pe/dut/e_cnt
    add wave -radix unsigned sim:/tb_eyeriss_rs_pe/dut/rbase

    add wave -divider "scratchpad access"
    add wave -radix unsigned sim:/tb_eyeriss_rs_pe/dut/if_idx
    add wave -radix unsigned sim:/tb_eyeriss_rs_pe/dut/filt_addr
    add wave             sim:/tb_eyeriss_rs_pe/dut/ifmap_rd_en
    add wave             sim:/tb_eyeriss_rs_pe/dut/filt_rd_en
    add wave             sim:/tb_eyeriss_rs_pe/dut/gate
    add wave             sim:/tb_eyeriss_rs_pe/dut/zero_buf

    add wave -divider "datapath"
    add wave -radix decimal  sim:/tb_eyeriss_rs_pe/dut/x_r
    add wave -radix decimal  sim:/tb_eyeriss_rs_pe/dut/w_r
    add wave -radix decimal  sim:/tb_eyeriss_rs_pe/dut/product
    add wave -radix decimal  sim:/tb_eyeriss_rs_pe/dut/trunc
    add wave -radix decimal  sim:/tb_eyeriss_rs_pe/dut/acc_next
    add wave             sim:/tb_eyeriss_rs_pe/dut/mac_commit

    add wave -divider "output"
    add wave             sim:/tb_eyeriss_rs_pe/psum_valid
    add wave -radix unsigned sim:/tb_eyeriss_rs_pe/psum_k
    add wave -radix decimal  sim:/tb_eyeriss_rs_pe/psum_out
}

run -all

echo "=== baseline MAC PE ==="
quit -sim
vsim -voptargs=+acc work.tb_mac_pe_baseline
run -all

echo "=== done ==="
