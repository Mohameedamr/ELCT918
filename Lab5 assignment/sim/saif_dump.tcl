# ELCT918 Lab 5, Topic 1 -- record switching activity for the power comparison
#
# Task 3 asks for the PE power with switching activity from simulation (SAIF)
# for ifmaps with 0% and 50% zeros, with and without gating, compared against
# the 45% PE power saving reported in Section V-C of the paper.
#
# The four runs map to the generated vector cases:
#   case 1  0%  zeros, gating on     -> pe_0pct_gate.saif
#   case 2  0%  zeros, gating off    -> pe_0pct_nogate.saif
#   case 3  50% zeros, gating on     -> pe_50pct_gate.saif
#   case 4  50% zeros, gating off    -> pe_50pct_nogate.saif
#
# Usage, from the sim/ directory after run_sim has compiled the design:
#
#   xelab -debug typical tb_eyeriss_rs_pe -s pe_sim
#   xsim pe_sim -testplusarg CASE=1 -tclbatch saif_dump.tcl
#
# Rename the produced pe_activity.saif after each run, then feed each one to
# ooc_impl.tcl:
#
#   vivado -mode batch -source ooc_impl.tcl \
#          -tclargs eyeriss_rs_pe 10.000 pe_50pct_gate.saif
#
# All four runs take exactly the same number of cycles (gating saves power,
# not time), so the four power figures are directly comparable.

open_saif pe_activity.saif
log_saif  [get_objects -r /tb_eyeriss_rs_pe/dut/*]
run all
close_saif
quit
