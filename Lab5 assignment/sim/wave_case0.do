# ELCT918 Lab 5, Topic 1 -- waveform for the report
#
# Runs case 0 only: the worked example
#   x = [1, 2, 0, 3, 4]   w0 = [1, 2, 3]   w1 = [10, 20, 30]
#   expected psums: 5, 50, 11, 110, 18, 180
# 33 cycles, so every edge can be checked against a hand calculation.
#
# Run from the sim/ directory, after run_modelsim.do has built the library:
#   do wave_case0.do

onbreak {resume}
catch {quit -sim}

vsim -voptargs=+acc +CASE=0 work.tb_eyeriss_rs_pe

add wave -divider "control"
add wave                 sim:/tb_eyeriss_rs_pe/dut/state
add wave -radix unsigned sim:/tb_eyeriss_rs_pe/dut/s_cnt
add wave -radix unsigned sim:/tb_eyeriss_rs_pe/dut/k_cnt
add wave -radix unsigned sim:/tb_eyeriss_rs_pe/dut/e_cnt
add wave -radix unsigned sim:/tb_eyeriss_rs_pe/dut/rbase

add wave -divider "scratchpad access"
add wave -radix unsigned sim:/tb_eyeriss_rs_pe/dut/if_idx
add wave -radix unsigned sim:/tb_eyeriss_rs_pe/dut/filt_addr
add wave                 sim:/tb_eyeriss_rs_pe/dut/ifmap_rd_en
add wave                 sim:/tb_eyeriss_rs_pe/dut/filt_rd_en
add wave                 sim:/tb_eyeriss_rs_pe/dut/gate
add wave -radix binary   sim:/tb_eyeriss_rs_pe/dut/zero_buf

add wave -divider "datapath"
add wave -radix decimal  sim:/tb_eyeriss_rs_pe/dut/x_r
add wave -radix decimal  sim:/tb_eyeriss_rs_pe/dut/w_r
add wave -radix decimal  sim:/tb_eyeriss_rs_pe/dut/product
add wave -radix decimal  sim:/tb_eyeriss_rs_pe/dut/trunc
add wave -radix decimal  sim:/tb_eyeriss_rs_pe/dut/acc_next
add wave                 sim:/tb_eyeriss_rs_pe/dut/mac_commit

add wave -divider "output"
add wave                 sim:/tb_eyeriss_rs_pe/psum_valid
add wave -radix unsigned sim:/tb_eyeriss_rs_pe/psum_k
add wave -radix decimal  sim:/tb_eyeriss_rs_pe/psum_out

run -all
catch {wave zoom full}
