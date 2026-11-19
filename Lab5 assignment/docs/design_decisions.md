# Task 1.3 — Design decisions

Everything the paper leaves open, and why it was decided this way. One line
each, as the assignment asks. Paste or adapt into the report.

## Loop order and reuse

| Decision | Reason |
|---|---|
| `s` is the outer loop, `k` the inner loop | Fig. 6b has p filters sharing one ifmap window, so the ifmap value must be the slow-changing operand |
| The ifmap spad is read only when `k == 0`, and `x_r` is held for the other p−1 cycles | Without the hold the spad would be read S·p times per window and the "each ifmap value is used p times" claim would not hold in hardware |
| A running `filt_base` register replaces the `k × S` product | Avoids a second multiplier in the address path; k advances by one every cycle so the base advances by S |
| Outputs are drained after the window completes, p per window | Simplest correct scheme; overlapping the drain with the next window's compute would remove the p + 2 cycle overhead and is noted as future work |

## Arithmetic

| Decision | Reason |
|---|---|
| Truncation is a raw bit slice `product[shift+15 : shift]`, no rounding | The paper says the selection of 16 out of the 32 bits is configurable; it does not describe rounding, and a slice is what the RTL and the Python reference both implement |
| Negative products therefore truncate toward minus infinity | Direct consequence of slicing a two's-complement value; recorded so the Python reference matches bit for bit |
| `shift` is limited to 0…16 | Beyond 16 the slice would run off the top of the 32-bit product |
| Accumulation wraps at 16 bits with no saturation | Specified by the brief; a saturating adder would cost a comparator and change the error metric |
| The multiplier uses the `*` operator | Explicitly allowed for Topic 1; the multiplier-free restriction applies to Topics 3, 4 and 5 |

## Pipeline and reset

| Decision | Reason |
|---|---|
| Two pipeline stages, not the paper's three | The third stage exists because the 65 nm multiplier was split in two; a DSP48E1 completes a 16 × 16 multiply well inside a 10 ns period |
| psum spad is read combinationally in stage 2 and written the same cycle | Removes the read-after-write hazard entirely, so p = 1 works with no forwarding logic |
| `rst_n` is synchronous and active low on all control state | Recommended for Xilinx 7-series; matches the Vivado tutorial |
| The filter spad contents and `w_r` are not reset | An asynchronous or wide synchronous reset on a RAM blocks inference; the spad is written before `start` and `w_r` is qualified by `vld_r` |
| The psum spad is reset and also cleared between windows | Replaces Fig. 12's "reset accumulation" multiplexer and lets a gated cycle skip its write unconditionally, including at s = 0 |

## Zero gating

| Decision | Reason |
|---|---|
| Gating suppresses switching but does not skip cycles | Section V-C gates the datapath; skipping cycles is the Eyeriss v2 contribution, so the cycle count here is data independent |
| The zero flag is written at the same time as the ifmap spad entry | One comparator on the write port instead of one on every read |
| When gated: filter spad read enable low, `x_r` and `w_r` held, psum write suppressed | The three places the datapath would otherwise toggle |
| The gate decision is taken once per s and applies to all p cycles | The ifmap value is constant across those cycles, so one zero value gates p consecutive MACs |

## Interface

| Decision | Reason |
|---|---|
| The PE pulls ifmap values (`ifmap_req` / `ifmap_valid`) | A W-value row cannot be preloaded into a 12-entry spad, so a circular buffer with flow control is unavoidable |
| The next value is pulled after the window completes, not during it | Removes any possibility of overwriting a value the current window still needs, which matters at S = 12 where the spad wraps exactly |
| Configuration is captured on `start` and held | Mirrors the chip's scan-chain configuration, which is static within a layer |
| q = 1 only; channel interleaving (Fig. 6c) is not built | Declared out of scope by the brief; it would need a second set of window pointers and q × S ifmap spad entries |

## Timing description (Task 1.4)

Stage 1 drives the spad addresses; stage 2 multiplies, truncates and
accumulates. A MAC issued in cycle *n* updates the psum spad at the end of
cycle *n + 1*.

| Phase | Cycles | What happens |
|---|---|---|
| `FILL` | S | Pulls x(0) … x(S−1) into spad entries 0 … S−1, setting the zero flags |
| `COMP` | S × p | One MAC issued per cycle, k fastest. Ifmap spad read on `k == 0` only |
| `FLUSH` | 1 | Bubble, lets the last MAC reach the psum spad |
| `DRAIN` | p | `psum_valid` high, one psum per cycle, k = 0 … p−1 |
| `NEXT` | 1 | Pulls x(e+S) into entry (rbase + S) mod 12, advances rbase, clears psums |

Total for a row, `start` to `done`: S + E·(S·p + p + 2) + 1 cycles. For
S = 3, p = 16, W = 32 that is 1984 cycles, and it is the same whether gating
is on or off and whatever fraction of the ifmap is zero — which is the point:
gating buys power, not time.
