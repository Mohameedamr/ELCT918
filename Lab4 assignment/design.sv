// ELCT918 black box. Do not edit this module.
module mystery(clk, rst_n, en, din, dout, flag);
  input clk;
  input [3:0] din;
  output [7:0] dout;
  input en;
  output flag;
  input rst_n;
  reg [7:0] dout;
  wire _000_;
  wire _075_;
  wire _033_;
  wire _010_;
  wire _008_;
  wire _014_;
  wire _061_;
  wire _036_;
  reg _094_;
  wire _074_;
  wire _057_;
  wire _072_;
  wire _058_;
  wire _007_;
  wire _027_;
  wire _067_;
  wire clk;
  reg _095_;
  wire _052_;
  wire _029_;
  wire _017_;
  wire _062_;
  wire _018_;
  wire _073_;
  wire _005_;
  wire [3:0] din;
  wire _004_;
  wire _002_;
  wire _019_;
  wire _069_;
  wire _038_;
  wire _040_;
  wire _085_;
  wire _077_;
  wire _050_;
  wire _022_;
  wire _042_;
  wire _025_;
  wire _080_;
  wire _054_;
  wire _026_;
  wire _084_;
  wire _048_;
  wire _046_;
  reg _087_;
  reg _089_;
  wire rst_n;
  wire _032_;
  wire _015_;
  wire _030_;
  wire _078_;
  wire _021_;
  wire _070_;
  reg _098_;
  wire _041_;
  wire _071_;
  wire _043_;
  wire _056_;
  wire _083_;
  wire _016_;
  wire _020_;
  wire _059_;
  wire _012_;
  wire _044_;
  wire _051_;
  reg _088_;
  wire _076_;
  reg _086_;
  wire _013_;
  wire _028_;
  wire flag;
  wire _031_;
  wire _009_;
  wire _055_;
  wire _037_;
  reg _093_;
  wire _060_;
  wire _035_;
  reg _096_;
  wire _034_;
  wire _001_;
  wire _063_;
  wire _006_;
  wire _053_;
  reg _090_;
  reg _097_;
  wire _065_;
  wire _023_;
  wire _011_;
  wire _003_;
  reg _092_;
  wire _066_;
  reg _099_;
  reg _091_;
  wire _047_;
  wire _039_;
  wire _081_;
  wire _024_;
  wire _068_;
  wire _049_;
  wire en;
  wire _045_;
  wire _064_;
  wire _082_;
  wire _079_;
  always @(posedge clk)
    _089_ <= _016_;
  always @(posedge clk)
    dout[1] <= _007_;
  always @(posedge clk)
    _092_ <= _013_;
  always @(posedge clk)
    _091_ <= _014_;
  always @(posedge clk)
    dout[5] <= _003_;
  always @(posedge clk)
    _095_ <= _010_;
  always @(posedge clk)
    _099_ <= _020_;
  always @(posedge clk)
    _087_ <= _018_;
  always @(posedge clk)
    dout[6] <= _004_;
  always @(posedge clk)
    _093_ <= _012_;
  always @(posedge clk)
    _094_ <= _011_;
  always @(posedge clk)
    dout[3] <= _009_;
  always @(posedge clk)
    dout[7] <= _005_;
  always @(posedge clk)
    _098_ <= _021_;
  always @(posedge clk)
    dout[2] <= _008_;
  always @(posedge clk)
    dout[0] <= _006_;
  always @(posedge clk)
    _096_ <= _001_;
  always @(posedge clk)
    dout[4] <= _002_;
  always @(posedge clk)
    _090_ <= _015_;
  always @(posedge clk)
    _088_ <= _017_;
  always @(posedge clk)
    _097_ <= _000_;
  always @(posedge clk)
    _086_ <= _019_;
  assign _071_ = dout[5] ^ _068_;
  assign _041_ = en ? _092_ : _088_;
  assign _021_ = rst_n & _045_;
  assign _039_ = en ? _094_ : _090_;
  assign _070_ = dout[5] & _068_;
  assign _073_ = dout[6] | _070_;
  assign _084_ = ~(_076_ ^ _082_);
  assign _077_ = ~(_097_ ^ din[0]);
  assign _004_ = _072_ & _074_;
  assign _059_ = dout[1] & _048_;
  assign _052_ = ~(_087_ | _091_);
  assign _048_ = ~dout[0];
  assign _045_ = en ? _088_ : _098_;
  assign _011_ = rst_n & _035_;
  assign _003_ = rst_n & _071_;
  assign _040_ = en ? _093_ : _089_;
  assign _028_ = en | dout[2];
  assign _026_ = ~(din[2] ^ _024_);
  assign _023_ = rst_n & _022_;
  assign _053_ = _051_ & _052_;
  assign _085_ = ~(en & _084_);
  assign _016_ = rst_n & _040_;
  assign _002_ = rst_n & _069_;
  assign _000_ = rst_n & _066_;
  assign _075_ = ~(dout[7] ^ _072_);
  assign _067_ = ~(_049_ ^ _065_);
  assign _025_ = ~(_050_ & _024_);
  assign _081_ = ~(_049_ & din[1]);
  assign flag = _057_ & _064_;
  assign _061_ = _092_ & _093_;
  assign _060_ = _058_ & _059_;
  assign _005_ = rst_n & _075_;
  assign _032_ = en | dout[3];
  assign _057_ = _053_ & _056_;
  assign _042_ = en ? _091_ : _087_;
  assign _034_ = en ? dout[0] : _095_;
  assign _029_ = rst_n & _028_;
  assign _062_ = _094_ & _095_;
  assign _079_ = en | dout[0];
  assign _063_ = _061_ & _062_;
  assign _008_ = _027_ & _029_;
  assign _066_ = en ^ _097_;
  assign _006_ = _078_ & _080_;
  assign _022_ = en | dout[1];
  assign _043_ = en ? _090_ : _086_;
  assign _031_ = ~(en & _030_);
  assign _082_ = ~(_096_ ^ din[1]);
  assign _046_ = ~_089_;
  assign _036_ = en ? dout[2] : _093_;
  assign _013_ = rst_n & _037_;
  assign _035_ = en ? dout[1] : _094_;
  assign _074_ = rst_n & _073_;
  assign _069_ = en ^ dout[4];
  assign _024_ = _081_ & _083_;
  assign _058_ = dout[3] & dout[2];
  assign _049_ = ~_096_;
  assign _056_ = _054_ & _055_;
  assign _055_ = _099_ & _046_;
  assign _015_ = rst_n & _039_;
  assign _017_ = rst_n & _041_;
  assign _051_ = _047_ & _090_;
  assign _054_ = _098_ & _088_;
  assign _083_ = ~(_076_ & _082_);
  assign _009_ = _031_ & _033_;
  assign _072_ = ~(dout[6] & _070_);
  assign _044_ = en ? _089_ : _099_;
  assign _038_ = en ? _095_ : _091_;
  assign _065_ = en & _097_;
  assign _007_ = _085_ & _023_;
  assign _010_ = rst_n & _034_;
  assign _080_ = rst_n & _079_;
  assign _030_ = ~(din[3] ^ _025_);
  assign _037_ = en ? dout[3] : _092_;
  assign _078_ = ~(en & _077_);
  assign _033_ = rst_n & _032_;
  assign _001_ = rst_n & _067_;
  assign _027_ = ~(en & _026_);
  assign _076_ = _097_ & din[0];
  assign _064_ = _060_ & _063_;
  assign _018_ = rst_n & _042_;
  assign _014_ = rst_n & _038_;
  assign _050_ = ~din[2];
  assign _068_ = en & dout[4];
  assign _047_ = ~_086_;
  assign _012_ = rst_n & _036_;
  assign _019_ = rst_n & _043_;
  assign _020_ = rst_n & _044_;
endmodule

// ---------------------------------------------------------------------------
// solution : clean RTL re-implementation of the mystery cipher chip.
//
// Everything below was established by black-box simulation only:
//   Exp 1  dout[7:4] rose by one per enabled cycle; with din = 0 the low
//          nibble repeated 6,7,4,5 -> a 4-entry secret key schedule.
//   Exp 2  din = 2 produced 8, not 4  -> the cipher ADDS mod 16, not XOR.
//   Exp 3  CAFE raised flag; FACE, BABE, FADE, C0DE all ended in the same
//          ciphertext nibble E and did not -> three earlier nibbles are kept.
//   Exp F1 en = 0 froze counter, cipher, history and schedule position.
//   Exp F2 rst_n = 0 cleared the hidden history as well as dout.
//   Exp F3 flag dropped on the next nibble -> live compare, not a latch.
//   Exp F4 flag fired at counter 8 as well as 4 -> counter is not involved.
// ---------------------------------------------------------------------------
module solution(clk, rst_n, en, din, dout, flag);

  input        clk;      // all flip-flops are rising-edge triggered
  input        rst_n;    // synchronous, active low: starts a new message
  input        en;       // when high, encrypt din on this clock edge
  input  [3:0] din;      // plaintext nibble
  output [7:0] dout;     // {nibble counter, newest ciphertext nibble}
  output       flag;     // high while the last four ciphertext nibbles are CAFE

  // The word the chip watches for in its ciphertext history (Exp 3).
  localparam [15:0] SECRET_WORD = 16'hCAFE;

  // ---- state --------------------------------------------------------------
  reg [3:0] nibble_count;  // nibbles encrypted since reset, wraps at 16
  reg [3:0] cipher;        // newest ciphertext nibble
  reg [3:0] hist1;         // ciphertext one nibble ago
  reg [3:0] hist2;         // ciphertext two nibbles ago
  reg [3:0] hist3;         // ciphertext three nibbles ago (oldest in window)

  // ---- secret key schedule ------------------------------------------------
  // Four secret nibbles selected by the bottom two bits of the counter.
  // Read straight off the chip in Exp 1: encrypting din = 0 makes the
  // ciphertext equal the key, because 0 is the identity for addition.
  function [3:0] key_nibble;
    input [1:0] pos;
    begin
      case (pos)
        2'd0: key_nibble = 4'h6;
        2'd1: key_nibble = 4'h7;
        2'd2: key_nibble = 4'h4;
        2'd3: key_nibble = 4'h5;
      endcase
    end
  endfunction

  // ---- datapath -----------------------------------------------------------
  // Non-blocking assignment is doing real work in this block:
  //   * key_nibble() is indexed by the counter as it reads BEFORE this
  //     edge's increment, which is what the chip does (Exp F3 and F4).
  //   * the history shift reads the pre-edge cipher, so the old value
  //     lands in hist1 without needing a temporary variable.
  always @(posedge clk) begin
    if (!rst_n) begin
      // Synchronous clear of every register, hidden ones included (Exp F2).
      nibble_count <= 4'd0;
      cipher       <= 4'd0;
      hist1        <= 4'd0;
      hist2        <= 4'd0;
      hist3        <= 4'd0;
    end
    else if (en) begin
      // en low holds all state untouched (Exp F1), so there is no else here.
      hist3        <= hist2;
      hist2        <= hist1;
      hist1        <= cipher;
      cipher       <= din + key_nibble(nibble_count[1:0]);  // wraps mod 16
      nibble_count <= nibble_count + 4'd1;
    end
  end

  // ---- outputs ------------------------------------------------------------
  assign dout = {nibble_count, cipher};

  // Oldest nibble first: hist3 hist2 hist1 cipher == C A F E.
  // Deliberately independent of nibble_count (Exp F4).
  assign flag = ({hist3, hist2, hist1, cipher} == SECRET_WORD);

endmodule
