# ELCT918 Lab 5, Topic 1 -- record switching activity from the gate-level run
#
# The netlist is flat under dut, so a recursive query here reaches every net
# in the implemented design rather than only the RTL's top-level signals.

open_saif pe_activity.saif

set objs [get_objects -r /tb_eyeriss_rs_pe/dut/*]
puts "SAIF: logging [llength $objs] objects"

log_saif $objs
run all
close_saif
quit
