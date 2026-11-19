# ELCT918 — Lab Assignment 5, Topic 1

**Eyeriss row-stationary processing element**

Y.-H. Chen, T. Krishna, J. S. Emer and V. Sze, *Eyeriss: An Energy-Efficient
Reconfigurable Accelerator for Deep Convolutional Neural Networks*,
IEEE Journal of Solid-State Circuits, vol. 52, no. 1, pp. 127–138, 2017.

Team: Mohamed Amr, Amr Walid Elkamash

---

## What this builds

A PE that runs one 1-D convolution primitive with the paper's three
scratchpads, filter interleaving and zero gating:

- 16-bit signed fixed point throughout
- ifmap spad 12 × 16 b (registers), filter spad 224 × 16 b (SRAM),
  psum spad 24 × 16 b (registers)
- 32-bit product truncated to 16 bits with a configurable slice
  `[shift+15 : shift]`; psums accumulate in 16 bits and wrap
- Filter interleaving (Fig. 6b): p filters share one ifmap window, so each
  ifmap value read from the spad feeds p MACs. S ≤ 12, p ≤ 16, q = 1
- Stride 1 sliding window (Fig. 3): `psum(e,k) = Σ_s w(k,s)·x(e+s)`, emitted
  as e = 0, 1, … with k = 0 … p−1 inside each window
- Zero gating (Section V-C, Fig. 12): a zero buffer marks zero ifmap entries;
  for those the filter spad read is skipped and the MAC inputs are held

Channel interleaving (q > 1, Fig. 6c) is out of scope per the brief.

## Layout

```
rtl/eyeriss_rs_pe.v        the PE
rtl/mac_pe_baseline.v      baseline B: plain MAC, no scratchpads
tb/tb_eyeriss_rs_pe.v      PE testbench, checks against the Python reference
tb/tb_mac_pe_baseline.v    baseline testbench, counts external accesses
python/ref_model.py        golden model, cycle-accurate model, vector generator
vec/                       generated .hex vectors (regenerate, do not hand-edit)
sim/                       ModelSim, Vivado simulation, SAIF and OOC scripts
docs/design_decisions.md   Task 1.3 decisions and Task 1.4 timing description
```

Baseline A is this same PE with `cfg_gate_en` tied low, so the gated and
ungated power numbers come from identical hardware.

## How to run

**1. Generate the vectors and the reference outputs**

```
cd python
python3 ref_model.py
```

This checks the cycle-accurate model against the behavioural golden model,
writes `vec/*.hex`, and prints the access counts for the Task 3 questions.

**2. Simulate**

ModelSim or Questa:

```
cd sim
vsim -do run_modelsim.do        (GUI, with waves)
vsim -c -do run_modelsim.do     (console)
```

Vivado xsim:

```
cd sim
run_sim.bat          (Windows, from the Vivado command prompt)
./run_sim.sh         (Linux, after sourcing settings64.sh)
```

Both testbenches are plain Verilog-2001, so no SystemVerilog licence or
edition is needed.

Expect `ALL CASES PASS` from both testbenches.

Case 0 is the worked example used in the walkthrough, sized for the annotated
waveform the report asks for:

```
x  = [1, 2, 0, 3, 4]     w0 = [1, 2, 3]     w1 = [10, 20, 30]
expected psums: 5, 50, 11, 110, 18, 180
```

33 cycles end to end, so every edge can be checked by hand.

**3. Out-of-context synthesis and implementation**

```
cd sim
vivado -mode batch -source ooc_impl.tcl -tclargs eyeriss_rs_pe
vivado -mode batch -source ooc_impl.tcl -tclargs mac_pe_baseline
```

Reports land in `reports/<top>_<period>/`. For the maximum frequency, pass a
shorter period and repeat until WNS goes negative:

```
vivado -mode batch -source ooc_impl.tcl -tclargs eyeriss_rs_pe 8.000
```

**4. Power with switching activity**

Four runs, same workload, 0% and 50% ifmap zeros × gating on and off:

| Vector case | Zeros | Gating | SAIF name |
|---|---|---|---|
| 1 | 0% | on | `pe_0pct_gate.saif` |
| 2 | 0% | off | `pe_0pct_nogate.saif` |
| 3 | 50% | on | `pe_50pct_gate.saif` |
| 4 | 50% | off | `pe_50pct_nogate.saif` |

```
xelab -debug typical tb_eyeriss_rs_pe -s pe_sim
xsim pe_sim -testplusarg CASE=3 -tclbatch saif_dump.tcl
ren pe_activity.saif pe_50pct_gate.saif
vivado -mode batch -source ooc_impl.tcl -tclargs eyeriss_rs_pe 10.000 pe_50pct_gate.saif
```

All four runs take exactly 1984 cycles, so the power figures are directly
comparable. The paper reports a 45% PE power saving from gating
(Section V-C).

## Test cases

| # | Name | S | p | W | shift | gate | zeros | cycles | MACs | gated | ifmap spad reads |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 0 | handtrace | 3 | 2 | 5 | 0 | on | (one zero) | 33 | 12 | 6 | 6 |
| 1 | pwr_0pct_gate | 3 | 16 | 32 | 8 | on | 0% | 1984 | 1440 | 0 | 90 |
| 2 | pwr_0pct_nogate | 3 | 16 | 32 | 8 | off | 0% | 1984 | 1440 | 0 | 90 |
| 3 | pwr_50pct_gate | 3 | 16 | 32 | 8 | on | 50% | 1984 | 1040 | 400 | 65 |
| 4 | pwr_50pct_nogate | 3 | 16 | 32 | 8 | off | 50% | 1984 | 1440 | 0 | 90 |
| 5 | bigS_midp | 11 | 4 | 24 | 10 | on | 30% | 712 | 300 | 316 | 75 |
| 6 | maxS_p1 | 12 | 1 | 20 | 0 | on | 25% | 148 | 57 | 51 | 57 |

Case 6 is the corner that matters: S = 12 wraps the 12-entry ifmap spad
exactly, and p = 1 is the back-to-back psum accumulation case.

## Still to do

- Nexys 4 DDR wrapper: operands from a ROM of test inputs, result on the
  7-segment display, single-step button
- Vivado reports for the tables in Task 3
- Report and the 10-minute presentation
