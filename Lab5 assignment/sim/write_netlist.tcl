# ELCT918 Lab 5, Topic 1 -- export the post-implementation netlist
#
# Switching activity recorded from an RTL simulation matches a routed netlist
# poorly, because synthesis renames and restructures almost every net. Running
# the same testbench against the implemented netlist makes the names identical,
# so report_power binds nearly every net instead of about one in eight.
#
#   vivado -mode batch -source write_netlist.tcl -tclargs <routed.dcp> <out.v>

set dcp [lindex $argv 0]
set out [lindex $argv 1]

open_checkpoint $dcp
write_verilog -mode funcsim -force $out
puts "NETLIST written: $out"
