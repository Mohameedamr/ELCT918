# ELCT918 Lab 5, Topic 1 -- maximum frequency sweep
#
# Synthesizes and implements the PE at a list of clock periods and reports the
# worst negative slack for each, so the highest frequency that still meets
# timing can be read straight off the table.
#
#   vivado -mode batch -source fmax_sweep.tcl
#
# Edit the period list below to refine the search.

set periods {9.8 9.6 9.5 9.3 9.0}
set part    xc7a100tcsg324-1
set rtl     [file normalize [file join [file dirname [info script]] .. rtl eyeriss_rs_pe.v]]
set outdir  [file normalize [file join [file dirname [info script]] .. reports]]
file mkdir $outdir

# Vivado parses file arguments as Tcl lists, so a path containing a space must
# be wrapped in [list ...] or it gets split into two filenames.
catch {close_project}

set results {}

foreach p $periods {
    puts "=============================================="
    puts " period $p ns  ([format %.1f [expr {1000.0/$p}]] MHz)"
    puts "=============================================="

    create_project -in_memory -part $part

    read_verilog [list $rtl]

    set xdc [file join $outdir sweep_clk.xdc]
    set fh [open $xdc w]
    puts $fh "create_clock -period $p -name clk \[get_ports clk\]"
    close $fh
    read_xdc [list $xdc]

    synth_design -top eyeriss_rs_pe -part $part -mode out_of_context
    opt_design
    place_design
    phys_opt_design
    route_design

    set wns [get_property SLACK [get_timing_paths -delay_type max]]
    set luts [llength [get_cells -hier -filter {PRIMITIVE_GROUP == LUT}]]
    set ffs  [llength [get_cells -hier -filter {PRIMITIVE_GROUP == FLOP_LATCH}]]
    set met  [expr {$wns >= 0 ? "MET" : "VIOLATED"}]

    report_timing_summary -file [file join $outdir timing_$p.rpt]
    lappend results [list $p [format %.1f [expr {1000.0/$p}]] $wns $met $luts $ffs]

    catch {close_project}
}

puts ""
puts "=============================================="
puts " Fmax sweep summary"
puts "=============================================="
puts [format "%-10s %-10s %-10s %-10s %-7s %-7s" "period" "MHz" "WNS(ns)" "status" "LUTs" "FFs"]
foreach r $results {
    puts [format "%-10s %-10s %-10s %-10s %-7s %-7s" \
          [lindex $r 0] [lindex $r 1] [lindex $r 2] [lindex $r 3] [lindex $r 4] [lindex $r 5]]
}
puts ""
puts "Highest frequency that still meets timing = the last row marked MET."
