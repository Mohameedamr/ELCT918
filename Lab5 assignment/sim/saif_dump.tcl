# ELCT918 Lab 5, Topic 1 -- record switching activity for the power comparison
#
# Driven by run_power.bat, once per power case. Invoked as:
#   xsim pe_sim -onfinish stop -testplusarg "CASE=n" -tclbatch saif_dump.tcl
#
# -onfinish stop matters: the testbench calls $finish, and the default
# behaviour would terminate the simulator before close_saif could write the
# file, leaving an empty SAIF.

open_saif pe_activity.saif

set objs [get_objects -r /tb_eyeriss_rs_pe/dut/*]
if {[llength $objs] == 0} {
    puts "SAIF: nothing under dut, falling back to the whole testbench"
    set objs [get_objects -r /tb_eyeriss_rs_pe/*]
}
puts "SAIF: logging [llength $objs] objects"

log_saif $objs
run all
close_saif
quit
