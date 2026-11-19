# ELCT918 Lab 5, Topic 1 -- SAIF-based power from the routed checkpoint
#
# Opening the already-routed checkpoint and applying switching activity takes
# seconds, instead of re-running synthesis and implementation for each case.
#
#   vivado -mode batch -source power_from_dcp.tcl -tclargs <dcp> <saif> <out.rpt>

set dcp  [lindex $argv 0]
set saif [lindex $argv 1]
set out  [lindex $argv 2]

open_checkpoint $dcp

# The SAIF was recorded inside the testbench hierarchy; strip that prefix so
# the activity binds to the checkpoint's top-level nets.
read_saif -strip_path tb_eyeriss_rs_pe/dut $saif

report_power -file $out

set total   [get_property TOTAL_POWER   [current_design]]
set dynamic [get_property DYNAMIC_POWER [current_design]]
set static  [get_property STATIC_POWER  [current_design]]
puts "RESULT $saif total=$total dynamic=$dynamic static=$static"
