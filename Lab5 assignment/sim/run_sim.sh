#!/bin/sh
# ELCT918 Lab 5, Topic 1 -- run both testbenches in Vivado xsim.
# Run from the sim/ directory, with Vivado's settings64 already sourced.
#
# Windows equivalent is run_sim.bat.

set -e
cd "$(dirname "$0")"

echo "=== compiling ==="
xvlog ../rtl/eyeriss_rs_pe.v ../rtl/mac_pe_baseline.v \
      ../tb/tb_eyeriss_rs_pe.v ../tb/tb_mac_pe_baseline.v

echo
echo "=== row-stationary PE ==="
xelab -debug typical tb_eyeriss_rs_pe -s pe_sim
xsim pe_sim -R

echo
echo "=== baseline MAC PE ==="
xelab -debug typical tb_mac_pe_baseline -s base_sim
xsim base_sim -R
