# ELCT918 Lab 5, Topic 1 -- out-of-context timing constraint
#
# Task 3 asks for a 100 MHz constraint on clk. Nothing else is constrained:
# in out-of-context mode there are no I/O buffers, so WNS reports the
# register-to-register paths inside the PE, which is what the PE-versus-
# baseline comparison is about.
#
# For the maximum-frequency sweep, lower the period until WNS goes negative:
#   10.000 ns = 100 MHz   (the required operating point)
#    8.000 ns = 125 MHz
#    6.667 ns = 150 MHz
#    5.000 ns = 200 MHz
# Report the smallest period that still meets timing, and 1000/period as Fmax.

create_clock -period 10.000 -name clk [get_ports clk]
