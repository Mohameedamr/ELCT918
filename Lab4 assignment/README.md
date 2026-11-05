# ELCT918 — Verilog Refresher Assignment
### Crack the Cipher Chip — Black-Box Reverse Engineering in Verilog

**Mohamed Amr** · Selected Topics in AI Accelerators Hardware Design
Dr. Eman Azab · MSc Eng. Nour ElShahawy

---

## EDA Playground

**Share link:** https://edaplayground.com/x/smMF

Simulator: Icarus Verilog 12.0 · tick *Open EPWave after run*

---

## Password

```
6 3 B 9
```

Entered one nibble per enabled clock cycle immediately after reset, these four
plaintext nibbles drive the ciphertext history to **CAFE** and raise `flag`.

Derived by inverting the cipher: `plaintext = (target − key) mod 16`, using the
key schedule `6, 7, 4, 5` measured in Experiment 1.

| cycle | target ciphertext | key | plaintext |
|---|---|---|---|
| 0 | C | 6 | 6 |
| 1 | A | 7 | 3 |
| 2 | F | 4 | B |
| 3 | E | 5 | 9 |

---

## How the chip works

| Element | Behaviour |
|---|---|
| `nibble_count` | 4-bit counter, +1 per enabled cycle, wraps at 16, published on `dout[7:4]` |
| key schedule | four secret nibbles `6, 7, 4, 5`, selected by `nibble_count[1:0]` |
| cipher | `(din + key) mod 16`, registered, published on `dout[3:0]` |
| history | the three previous ciphertext nibbles, shifted on enabled cycles |
| `flag` | combinational: high while `{hist3, hist2, hist1, cipher} == 16'hCAFE` |
| `en = 0` | freezes every register, including the schedule position |
| `rst_n = 0` | synchronous clear of all state, history included |

The key index is the counter value **before** the increment on that edge.
`flag` does not depend on the counter — it fires wherever CAFE appears in the
ciphertext stream, not only at the start of a message.

---

## Files

| File | Contents |
|---|---|
| `design.sv` | `mystery` (unchanged gate-level netlist) + `solution` (clean RTL) |
| `testbench.sv` | self-checking testbench: 10,000 random cycles + password test |

## Running

Paste `design.sv` and `testbench.sv` into the matching EDA Playground panes and run.

Expected output:

```
PASS - solution matched mystery on all 10003 cycles
PASSWORD OK - ciphertext reached CAFE and flag went high on both chips
ALL CHECKS PASSED
```
