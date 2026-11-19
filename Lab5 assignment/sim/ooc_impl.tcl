# ELCT918 Lab 5, Topic 1 -- out-of-context synthesis, implementation and reports
#
# Run from the sim/ directory:
#   vivado -mode batch -source ooc_impl.tcl -tclargs eyeriss_rs_pe
#   vivado -mode batch -source ooc_impl.tcl -tclargs mac_pe_baseline
#
# Optional third argument: a SAIF file from simulation, for switching-activity
# based power. Without it report_power falls back to vectorless estimation.
#   vivado -mode batch -source ooc_impl.tcl -tclargs eyeriss_rs_pe 10.000 pe_gated.saif
#
# GUI equivalent, if you prefer to click through it:
#   Settings -> Synthesis -> -mode out_of_context
#   add pe_ooc.xdc as the constraint file
#   Run Synthesis, Run Implementation, then open the utilization, timing
#   summary and power reports.

set top    [lindex $argv 0]
set period [expr {[llength $argv] > 1 ? [lindex $argv 1] : 10.000}]
set saif   [expr {[llength $argv] > 2 ? [lindex $argv 2] : ""}]

set part  xc7a100tcsg324-1
set rtl   ../rtl
set outd  ../reports/${top}_[format %.3f $period]

file mkdir $outd

read_verilog $rtl/${top}.v

# Write the clock constraint at the requested period so the Fmax sweep is
# a single parameter change.
set xdc $outd/clk.xdc
set fh [open $xdc w]
puts $fh "create_clock -period [format %.3f $period] -name clk \[get_ports clk\]"
close $fh
read_xdc $xdc

synth_design -top $top -part $part -mode out_of_context
write_checkpoint -force $outd/post_synth.dcp
report_utilization -file $outd/utilization_synth.rpt

opt_design
place_design
phys_opt_design
route_design

write_checkpoint -force $outd/post_route.dcp
report_utilization      -file $outd/utilization.rpt
report_timing_summary   -file $outd/timing_summary.rpt -delay_type min_max
report_clock_utilization -file $outd/clock_util.rpt

if {$saif ne ""} {
    read_saif $saif
    report_power -file $outd/power_saif.rpt
} else {
    report_power -file $outd/power_vectorless.rpt
}

# Pull the headline numbers onto the console so they are easy to transcribe
# into the report table.
set wns [get_property SLACK [get_timing_paths -delay_type max]]
puts "================================================================"
puts " top        : $top"
puts " period     : [format %.3f $period] ns  ([format %.1f [expr {1000.0/$period}]] MHz)"
puts " WNS        : $wns ns"
puts " LUTs       : [llength [get_cells -hier -filter {PRIMITIVE_GROUP == LUT}]]"
puts " FFs        : [llength [get_cells -hier -filter {PRIMITIVE_GROUP == FLOP_LATCH}]]"
puts " DSPs       : [llength [get_cells -hier -filter {PRIMITIVE_GROUP == DSP}]]"
puts " BRAMs      : [llength [get_cells -hier -filter {PRIMITIVE_GROUP == BLOCKRAM}]]"
puts " reports in : $outd"
puts "================================================================"
