#!/usr/bin/env python3
"""
ELCT918 Lab 5 - Topic 1: Eyeriss row-stationary PE
Golden reference model, cycle-accurate RTL model, and testbench vector generator.

Reference: Y.-H. Chen, T. Krishna, J. S. Emer, V. Sze,
"Eyeriss: An Energy-Efficient Reconfigurable Accelerator for Deep
Convolutional Neural Networks", IEEE JSSC 52(1), 2017.
  Fig. 3   1-D convolution primitive (sliding window)
  Fig. 6b  filter interleaving: p filters share one ifmap window
  Fig. 12  PE datapath, three scratchpads, zero gating

Run:  python3 ref_model.py
Emits .hex vectors into ../vec/ and prints the reuse/access counts for the
Task 3 questions.
"""

import os
import random

# ---------------------------------------------------------------------------
# Hardware-exact arithmetic helpers
# ---------------------------------------------------------------------------

MASK16 = 0xFFFF


def to_signed16(v):
    """Interpret the low 16 bits of v as a two's-complement signed value."""
    v &= MASK16
    return v - 0x10000 if v & 0x8000 else v


def trunc_slice(prod, shift):
    """
    The PE's configurable truncation: keep bits [shift+15 : shift] of the
    32-bit product. This is a raw bit slice, not a rounding operation, so a
    negative product truncates toward minus infinity. Matches
    `shifted = prod >> shift; trunc = shifted[15:0];` in the RTL.
    """
    return to_signed16(prod >> shift)


def wrap_add16(a, b):
    """16-bit wrap-around accumulation, as in the psum scratchpad."""
    return to_signed16(a + b)


# ---------------------------------------------------------------------------
# Golden behavioural model
# ---------------------------------------------------------------------------

def conv1d_ref(ifmap, filters, shift):
    """
    psum(e, k) = sum_s w(k, s) * x(e + s), stride 1.

    The accumulation order matters because every partial sum wraps at 16 bits:
    the hardware adds s = 0, 1, ... S-1 in that order, so this model does too.

    filters : list of p rows, each of length S
    returns : list of (e, k, psum) in the PE's output order
              (all p filters of window e, then window e+1, ...)
    """
    p = len(filters)
    S = len(filters[0])
    E = len(ifmap) - S + 1
    out = []
    for e in range(E):
        acc = [0] * p
        for s in range(S):                      # outer loop: one ifmap read
            x = ifmap[e + s]
            for k in range(p):                  # inner loop: p filter reads
                acc[k] = wrap_add16(acc[k], trunc_slice(filters[k][s] * x, shift))
        for k in range(p):
            out.append((e, k, acc[k]))
    return out


# ---------------------------------------------------------------------------
# Cycle-accurate model of the RTL
# ---------------------------------------------------------------------------

IF_DEPTH = 12
PS_DEPTH = 24
FI_DEPTH = 224

ST_IDLE, ST_FILL, ST_COMP, ST_FLUSH, ST_DRAIN, ST_NEXT, ST_DONE = range(7)


class PECycleModel:
    """
    Mirrors eyeriss_rs_pe.v cycle for cycle: same FSM, same counters, same
    two-stage pipeline, same gating. Used to prove the RTL's control logic
    agrees with the behavioural model before the design reaches Vivado.
    """

    def __init__(self, ifmap, filters, shift, gate_en):
        self.ifmap_src = list(ifmap)
        self.filters = filters
        self.P = len(filters)
        self.S = len(filters[0])
        self.E = len(ifmap) - self.S + 1
        self.SH = shift
        self.GATE = gate_en

        # filter scratchpad, flat: w(k, s) lives at k * S + s
        self.filt_spad = [0] * FI_DEPTH
        for k in range(self.P):
            for s in range(self.S):
                self.filt_spad[k * self.S + s] = filters[k][s]

        self.ifmap_spad = [0] * IF_DEPTH
        self.zbuf = [0] * IF_DEPTH
        self.psum_spad = [0] * PS_DEPTH

        # counters
        self.state = ST_IDLE
        self.rbase = 0
        self.s_cnt = 0
        self.k_cnt = 0
        self.e_cnt = 0
        self.filt_base = 0
        self.fill_cnt = 0
        self.drain_cnt = 0
        self.next_src = 0           # index of next ifmap value to pull

        # ST1 -> ST2 pipeline registers
        self.x_r = 0
        self.w_r = 0
        self.k_r = 0
        self.vld_r = 0
        self.gate_r = 0

        # instrumentation
        self.cycles = 0
        self.ifmap_spad_reads = 0
        self.filt_spad_reads = 0
        self.psum_spad_rw = 0
        self.gated_ops = 0
        self.mac_ops = 0
        self.outputs = []

    def _if_idx(self, offset):
        v = self.rbase + offset
        return v - IF_DEPTH if v >= IF_DEPTH else v

    def step(self):
        """One clock edge. Returns False once the run is finished."""
        self.cycles += 1

        # ---- ST2: multiply, truncate, accumulate (uses last cycle's regs) --
        if self.vld_r and not self.gate_r:
            prod = self.x_r * self.w_r
            t = trunc_slice(prod, self.SH)
            self.psum_spad[self.k_r] = wrap_add16(self.psum_spad[self.k_r], t)
            self.psum_spad_rw += 1
            self.mac_ops += 1
        elif self.vld_r and self.gate_r:
            self.gated_ops += 1

        nv, ng, nk = 0, 0, self.k_r
        nx, nw = self.x_r, self.w_r

        # ---- ST1 / FSM -----------------------------------------------------
        if self.state == ST_IDLE:
            self.state = ST_FILL
            self.fill_cnt = 0

        elif self.state == ST_FILL:
            d = self.ifmap_src[self.next_src]
            self.ifmap_spad[self.fill_cnt] = d
            self.zbuf[self.fill_cnt] = 1 if d == 0 else 0
            self.next_src += 1
            if self.fill_cnt == self.S - 1:
                self.rbase = 0
                self.e_cnt = 0
                self.s_cnt = 0
                self.k_cnt = 0
                self.filt_base = 0
                self.psum_spad = [0] * PS_DEPTH
                self.state = ST_COMP
            else:
                self.fill_cnt += 1

        elif self.state == ST_COMP:
            idx = self._if_idx(self.s_cnt)
            gate = self.GATE and self.zbuf[idx]
            nv, ng, nk = 1, 1 if gate else 0, self.k_cnt
            if not gate:
                # Fig. 6b: the ifmap spad is read once per s and the value is
                # held in x_r for all p filters, so one read feeds p MACs.
                if self.k_cnt == 0:
                    nx = self.ifmap_spad[idx]
                    self.ifmap_spad_reads += 1
                nw = self.filt_spad[self.filt_base + self.s_cnt]
                self.filt_spad_reads += 1
            if self.k_cnt == self.P - 1:
                self.k_cnt = 0
                self.filt_base = 0
                if self.s_cnt == self.S - 1:
                    self.s_cnt = 0
                    self.state = ST_FLUSH
                else:
                    self.s_cnt += 1
            else:
                self.k_cnt += 1
                self.filt_base += self.S

        elif self.state == ST_FLUSH:
            self.state = ST_DRAIN
            self.drain_cnt = 0

        elif self.state == ST_DRAIN:
            self.outputs.append((self.e_cnt, self.drain_cnt,
                                 self.psum_spad[self.drain_cnt]))
            if self.drain_cnt == self.P - 1:
                self.state = ST_DONE if self.e_cnt == self.E - 1 else ST_NEXT
            else:
                self.drain_cnt += 1

        elif self.state == ST_NEXT:
            w = self.rbase + self.S
            if w >= IF_DEPTH:
                w -= IF_DEPTH
            d = self.ifmap_src[self.next_src]
            self.ifmap_spad[w] = d
            self.zbuf[w] = 1 if d == 0 else 0
            self.next_src += 1
            self.rbase = (self.rbase + 1) % IF_DEPTH
            self.e_cnt += 1
            self.s_cnt = 0
            self.k_cnt = 0
            self.filt_base = 0
            self.psum_spad = [0] * PS_DEPTH
            self.state = ST_COMP

        elif self.state == ST_DONE:
            return False

        self.x_r, self.w_r, self.k_r = nx, nw, nk
        self.vld_r, self.gate_r = nv, ng
        return True

    def run(self, limit=2_000_000):
        while self.step():
            if self.cycles > limit:
                raise RuntimeError("cycle limit exceeded - FSM is stuck")
        return self.outputs


# ---------------------------------------------------------------------------
# Test cases
# ---------------------------------------------------------------------------

# Cases 1-4 are the four SAIF power runs required by the brief: the same
# workload at 0% and 50% ifmap zeros, each with and without gating. Cases 1-4
# all use S = 3, p = 16, W = 32, which is also the configuration the Task 3
# reuse-counting question asks about.
# Case 0 is the worked example from the walkthrough, so the waveform can be
# checked line by line against a hand calculation:
#   x = [1, 2, 0, 3, 4]   w0 = [1, 2, 3]   w1 = [10, 20, 30]
#   expected psums: 5, 50, 11, 110, 18, 180
EXPLICIT = {
    "handtrace": ([1, 2, 0, 3, 4], [[1, 2, 3], [10, 20, 30]]),
}

CASES = [
    # name,              S,  p,  W,  shift, gate, zero_frac, seed
    ("handtrace",         3,  2,  5,  0, 1, 0.00, 0),
    ("pwr_0pct_gate",     3, 16, 32,  8, 1, 0.00, 2),
    ("pwr_0pct_nogate",   3, 16, 32,  8, 0, 0.00, 2),
    ("pwr_50pct_gate",    3, 16, 32,  8, 1, 0.50, 3),
    ("pwr_50pct_nogate",  3, 16, 32,  8, 0, 0.50, 3),
    ("bigS_midp",        11,  4, 24, 10, 1, 0.30, 4),
    ("maxS_p1",          12,  1, 20,  0, 1, 0.25, 5),
]


def make_case(name, S, p, W, zero_frac, seed):
    if name in EXPLICIT:
        return EXPLICIT[name]
    rng = random.Random(seed)
    ifmap = []
    for _ in range(W):
        if rng.random() < zero_frac:
            ifmap.append(0)
        else:
            v = 0
            while v == 0:
                v = rng.randint(-2000, 2000)
            ifmap.append(v)
    filters = [[rng.randint(-512, 511) for _ in range(S)] for _ in range(p)]
    return ifmap, filters


def hx(v):
    return "%04x" % (v & MASK16)


def write_vectors(outdir):
    os.makedirs(outdir, exist_ok=True)
    summary = []

    for idx, (name, S, p, W, shift, gate, zf, seed) in enumerate(CASES):
        ifmap, filters = make_case(name, S, p, W, zf, seed)
        E = W - S + 1

        golden = conv1d_ref(ifmap, filters, shift)
        model = PECycleModel(ifmap, filters, shift, gate)
        rtlout = model.run()

        assert golden == rtlout, f"case {name}: cycle model disagrees with golden"

        # also check that gating never changes the result
        ungated = PECycleModel(ifmap, filters, shift, 0).run()
        assert ungated == golden, f"case {name}: gating changed the result"

        pre = os.path.join(outdir, "case%d" % idx)

        with open(pre + "_ifmap.hex", "w") as f:
            f.write("\n".join(hx(v) for v in ifmap) + "\n")

        with open(pre + "_filt.hex", "w") as f:
            flat = [filters[k][s] for k in range(p) for s in range(S)]
            f.write("\n".join(hx(v) for v in flat) + "\n")

        with open(pre + "_cfg.hex", "w") as f:
            # S, p, E, shift, gate_en  (one 16-bit word each)
            f.write("\n".join(hx(v) for v in [S, p, E, shift, gate]) + "\n")

        with open(pre + "_exp.hex", "w") as f:
            f.write("\n".join(hx(v) for (_, _, v) in golden) + "\n")

        summary.append((idx, name, S, p, W, E, shift, gate, zf,
                        model.cycles, model.mac_ops, model.gated_ops,
                        model.ifmap_spad_reads, model.filt_spad_reads))

    with open(os.path.join(outdir, "ncases.hex"), "w") as f:
        f.write(hx(len(CASES)) + "\n")

    write_concatenated(outdir)
    return summary


# ---------------------------------------------------------------------------
# Concatenated vectors for the portable Verilog-2001 testbench
# ---------------------------------------------------------------------------
#
# Verilog-2001 has no string type and no $sformatf, so a testbench cannot build
# a per-case filename. Instead every case is concatenated into four files with
# fixed names, and a descriptor table gives the offsets. This keeps the
# testbench compilable by any simulator, including ModelSim editions without
# SystemVerilog support.
#
# Descriptor layout, 8 words per case:
#   0 S   1 p   2 E   3 shift   4 gate_en   5 ifmap_off   6 filt_off   7 exp_off

CFG_WORDS = 8


def write_concatenated(outdir):
    all_ifmap, all_filt, all_exp, cfg = [], [], [], []

    for (name, S, p, W, shift, gate, zf, seed) in CASES:
        ifmap, filters = make_case(name, S, p, W, zf, seed)
        golden = conv1d_ref(ifmap, filters, shift)

        cfg += [S, p, W - S + 1, shift, gate,
                len(all_ifmap), len(all_filt), len(all_exp)]

        all_ifmap += ifmap
        all_filt  += [filters[k][s] for k in range(p) for s in range(S)]
        all_exp   += [v for (_, _, v) in golden]

    def dump(fname, words):
        with open(os.path.join(outdir, fname), "w") as f:
            f.write("\n".join(hx(v) for v in words) + "\n")

    dump("all_ifmap.hex", all_ifmap)
    dump("all_filt.hex",  all_filt)
    dump("all_exp.hex",   all_exp)
    dump("all_cfg.hex",   cfg)
    dump("meta.hex",      [len(CASES), CFG_WORDS,
                           len(all_ifmap), len(all_filt), len(all_exp)])


def access_counts(S, p, W):
    """
    Task 3 question: for S = 3, p = 16 and a 32-value ifmap row, count the
    scratchpad reads and the reads from outside the PE.
    """
    E = W - S + 1
    macs = E * p * S
    return {
        "windows E": E,
        "MAC operations": macs,
        "ifmap spad reads": E * S,          # one read feeds p MACs
        "filter spad reads": macs,
        "psum spad read+write pairs": macs,
        "ifmap values loaded from outside": W,
        "filter weights loaded from outside": p * S,
        "psums written out": E * p,
        "external operand reads, RS PE": W + p * S,
        "external operand reads, no-spad baseline": 2 * macs,
        "weight reuse (times each weight is used)": E,
        "ifmap reuse (interior value, S windows x p filters)": S * p,
    }


def main():
    here = os.path.dirname(os.path.abspath(__file__))
    outdir = os.path.join(here, "..", "vec")
    summary = write_vectors(outdir)

    print("Vectors written to vec/ -- cycle model matches golden model on all cases.\n")
    hdr = ("case", "name", "S", "p", "W", "E", "sh", "gate", "zero%",
           "cycles", "MACs", "gated", "if_rd", "fi_rd")
    print("%-5s %-16s %3s %3s %3s %4s %3s %5s %6s %8s %7s %7s %7s %7s" % hdr)
    for r in summary:
        print("%-5d %-16s %3d %3d %3d %4d %3d %5d %5.0f%% %8d %7d %7d %7d %7d"
              % (r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8] * 100,
                 r[9], r[10], r[11], r[12], r[13]))

    print("\nTask 3 access counts for S=3, p=16, W=32:")
    for k, v in access_counts(3, 16, 32).items():
        print("  %-48s %8d" % (k, v))


if __name__ == "__main__":
    main()
