# ELCT918 Lab 5, Topic 1 — measured results

Eyeriss row-stationary PE, `xc7a100tcsg324-1` (Nexys 4 DDR), Vivado 2020.1,
out-of-context synthesis and implementation.

---

## 1. Functional verification (ModelSim)

All seven cases match the Python reference model bit for bit.

| Case | S | p | E | shift | gate | zeros | psums | cycles | Result |
|---|---|---|---|---|---|---|---|---|---|
| 0 handtrace | 3 | 2 | 3 | 0 | on | one | 6 | 33 | PASS |
| 1 | 3 | 16 | 30 | 8 | on | 0% | 480 | 1983 | PASS |
| 2 | 3 | 16 | 30 | 8 | off | 0% | 480 | 1983 | PASS |
| 3 | 3 | 16 | 30 | 8 | on | 50% | 480 | 1983 | PASS |
| 4 | 3 | 16 | 30 | 8 | off | 50% | 480 | 1983 | PASS |
| 5 | 11 | 4 | 14 | 10 | on | 30% | 56 | 711 | PASS |
| 6 | 12 | 1 | 9 | 0 | on | 25% | 9 | 147 | PASS |

Cases 1–4 all take **1983 cycles**, independent of gating and of zero density.
Gating saves power, not time — the cycle count is data independent, which is
the distinction between Eyeriss v1 and v2.

Cycle count formula: `S + E·(S·p + p + 2)`.

## 2. Data reuse (S = 3, p = 16, W = 32)

| Quantity | Value |
|---|---|
| Output windows E | 30 |
| MAC operations | 1440 |
| ifmap scratchpad reads | 90 |
| filter scratchpad reads | 1440 |
| psum scratchpad read+write pairs | 1440 |
| ifmap values loaded from outside | 32 |
| filter weights loaded from outside | 48 |
| psums written out | 480 |
| **External operand reads, RS PE** | **80** |
| **External operand reads, no-spad baseline** | **2880** |
| **Reduction** | **36×** |
| Weight reuse (times each weight is used) | 30 |
| ifmap reuse (interior value, S windows × p filters) | 48 |

Confirmed in simulation by `tb_mac_pe_baseline`.

## 3. Resource utilisation

Post-route:

| Resource | Used | Available | % |
|---|---|---|---|
| Slice LUTs | 544 | 63,400 | 0.86 |
| — LUT as Logic | 432 | | |
| — LUT as Distributed RAM | 112 | 19,000 | 0.59 |
| Slice Registers | 471 | 126,800 | 0.37 |
| F7 Muxes | 96 | 31,700 | 0.30 |
| Block RAM Tile | 0 | 135 | 0.00 |
| DSP48E1 | 1 | 240 | 0.42 |

Post-synthesis LUT count was 563, reduced to 544 by `opt_design`.

### Scratchpad mapping

From the synthesis log:

```
| ifmap_spad_reg | Implied | 16 x 16  | RAM32M x 6
| filt_spad_reg  | Implied | 256 x 16 | RAM64X1D x 4, RAM64M x 20
```

| Scratchpad | Declared | Implemented as | Reason |
|---|---|---|---|
| filter | 224 × 16 b | Distributed RAM (LUTRAM), 24 primitives | 3584 bits is far too small to justify an 18 Kb block RAM |
| ifmap | 12 × 16 b | Distributed RAM, 6 × RAM32M | Synchronous read into a register allowed LUTRAM inference |
| psum | 24 × 16 b | Flip-flops | Read and written at the same address in the same cycle, plus a one-cycle bulk clear — neither is possible in a single-port RAM |

Two observations:

- Vivado built the filter spad **256 deep, not 224**, because `filt_waddr` is
  8 bits. Restricting it to 224 would need address decode logic for no benefit.
- The psum scratchpad is 24 × 16 = **384 of the 471 registers, 82% of all
  flip-flops** in the design.

### DSP absorption

```
DSP Report: register w_r_reg is absorbed into DSP product.
DSP Report: register x_r_reg is absorbed into DSP product.
DSP Report: operator product is absorbed into DSP product.
```

The stage-1 pipeline registers were pulled inside the DSP48E1, so the
multiplier and its input registers cost zero fabric.

## 4. Timing

At the required 100 MHz (10.000 ns):

| Metric | Value |
|---|---|
| WNS | +0.407 ns |
| WHS | +0.210 ns |
| Failing endpoints | 0 of 1558 |

Critical path:

```
Source:      product/CLK             (DSP48E1)
Destination: psum_spad_reg[14][11]/D (FDRE)
Data Path Delay: 9.260 ns  (logic 5.488 ns, route 3.772 ns)
Logic Levels: 5  (CARRY4 x2, LUT4, LUT5, LUT6)
```

The critical path is the **truncate-and-accumulate chain**, not the multiply.
The configurable `[shift+15:shift]` slice is a 32-bit barrel shifter, and the
16-bit accumulate adds two carry levels. A third pipeline stage between the
multiplier and the adder — as in the paper — would relieve exactly this path.

## 5. Maximum frequency

| Period | Target | WNS | Status |
|---|---|---|---|
| 9.8 ns | 102.0 MHz | +0.318 | MET |
| 9.6 ns | 104.2 MHz | +0.321 | MET |
| 9.5 ns | 105.3 MHz | +0.285 | MET |
| 9.3 ns | 107.5 MHz | +0.207 | MET |
| **9.0 ns** | **111.1 MHz** | **+0.002** | **MET** |

**Fmax ≈ 111 MHz**, 11% above the required 100 MHz.

Note that Fmax cannot be computed by subtracting WNS from a single relaxed
run: the 10 ns run suggests 104 MHz, but place-and-route is constraint-driven
and finds a faster implementation when asked for one. The same path shrank
from 9.260 ns to 8.998 ns between the 10.0 ns and 9.0 ns constraints.

## 6. Power

Vectorless estimate at 100 MHz:

| | Watts | Share |
|---|---|---|
| Total on-chip | 0.095 | |
| Dynamic | 0.011 | 12% |
| Device static | 0.084 | 88% |

With SAIF switching activity from a **post-implementation netlist simulation**
(97% of nets annotated, confidence High):

| Case | Zeros | Gating | Total (W) | Dynamic (W) | Static (W) |
|---|---|---|---|---|---|
| 1 | 0% | on | 0.096 | 0.012 | 0.084 |
| 2 | 0% | off | 0.096 | 0.012 | 0.084 |
| 3 | 50% | on | 0.096 | 0.012 | 0.084 |
| 4 | 50% | off | 0.096 | 0.012 | 0.084 |

Vivado reports power to milliwatt resolution, and the differences between
these cases are below that. An RTL-level SAIF was tried first and annotated
only 13% of nets, because synthesis renames almost every net; simulating the
implemented netlist raised this to 97%.

## 7. Switching activity (measured from the SAIF files)

Total net transitions over the 1983-cycle run:

| Case | Zeros | Gating | Transitions | vs ungated |
|---|---|---|---|---|
| 1 | 0% | on | 337,443 | −0.0% |
| 2 | 0% | off | 337,447 | — |
| 3 | 50% | on | **334,744** | **−1.7%** |
| 4 | 50% | off | 340,639 | — |

With no zeros in the ifmap, gating changes nothing — the correct negative
control for the experiment.

Per-signal, on the paths gating actually targets:

| Signal group | Gating off | Gating on | Change |
|---|---|---|---|
| DSP multiplier `ACOUT` | 1,358 | 906 | **−33.3%** |
| DSP multiplier `BCOUT` | 15,120 | 10,926 | **−27.7%** |
| psum spad write-enable logic | 180–270 | 130–195 | **−27.8%** |
| DSP `PCOUT` | 29,302 | 28,740 | −1.9% |

**The gated paths lose 27.8% of their transitions, and 400 of 1440 MAC cycles
were gated — 27.8%.** The mechanism works exactly as designed.

### Why this is not the paper's 45%

The paper measures 45% PE power saving on a 65 nm ASIC. The same mechanism
here yields 1.7% of total design switching and no measurable change in
reported power, for three reasons:

1. **Static power is 88% of total.** On this FPGA, 84 mW of the 95 mW total is
   leakage, which gating cannot touch. Even eliminating all dynamic power
   would save only 12%.
2. **The clock network and control logic dominate the dynamic component.** The
   FSM counters, the 471 flip-flops and the clock distribution keep switching
   whether or not a MAC is gated. The paper's figure is for the PE datapath
   and scratchpads alone.
3. **FPGA routing capacitance** is far larger than ASIC local interconnect, so
   the fixed overhead per toggle is higher and the datapath is a smaller share
   of the total.

The correct conclusion is that the gating mechanism is working — demonstrated
by the 27.8% reduction on exactly the paths it targets, matching the 27.8% of
cycles that were gated — but that an FPGA is the wrong substrate on which to
reproduce an ASIC PE-level power figure.
