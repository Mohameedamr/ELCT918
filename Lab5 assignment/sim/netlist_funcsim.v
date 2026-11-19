// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Nov 19 14:35:18 2026
// Host        : MoAmr10 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -force netlist_funcsim.v
// Design      : eyeriss_rs_pe
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* DW = "16" *) (* ECO_CHECKSUM = "88e0eb51" *) (* FI_DEPTH = "224" *) 
(* IF_DEPTH = "12" *) (* PS_DEPTH = "24" *) (* ST_COMP = "3'b010" *) 
(* ST_DONE = "3'b110" *) (* ST_DRAIN = "3'b100" *) (* ST_FILL = "3'b001" *) 
(* ST_FLUSH = "3'b011" *) (* ST_IDLE = "3'b000" *) (* ST_NEXT = "3'b101" *) 
(* NotValidForBitStream *)
module eyeriss_rs_pe
   (clk,
    rst_n,
    cfg_s,
    cfg_p,
    cfg_e,
    cfg_shift,
    cfg_gate_en,
    filt_we,
    filt_waddr,
    filt_wdata,
    start,
    busy,
    done,
    ifmap_req,
    ifmap_valid,
    ifmap_data,
    psum_valid,
    psum_k,
    psum_out);
  input clk;
  input rst_n;
  input [4:0]cfg_s;
  input [4:0]cfg_p;
  input [7:0]cfg_e;
  input [4:0]cfg_shift;
  input cfg_gate_en;
  input filt_we;
  input [7:0]filt_waddr;
  input [15:0]filt_wdata;
  input start;
  output busy;
  output done;
  output ifmap_req;
  input ifmap_valid;
  input [15:0]ifmap_data;
  output psum_valid;
  output [4:0]psum_k;
  output [15:0]psum_out;

  wire RSTA;
  wire [15:0]acc_next;
  wire busy;
  wire [7:0]cfg_e;
  wire cfg_gate_en;
  wire [4:0]cfg_p;
  wire [4:0]cfg_s;
  wire [4:0]cfg_shift;
  wire clk;
  wire done;
  wire done_i_2_n_0;
  wire \drain_cnt[0]_i_1_n_0 ;
  wire \drain_cnt[1]_i_1_n_0 ;
  wire \drain_cnt[2]_i_1_n_0 ;
  wire \drain_cnt[3]_i_1_n_0 ;
  wire \drain_cnt[4]_i_1_n_0 ;
  wire \drain_cnt[4]_i_2_n_0 ;
  wire \drain_cnt[4]_i_3_n_0 ;
  wire \drain_cnt[4]_i_4_n_0 ;
  wire \drain_cnt[4]_i_5_n_0 ;
  wire e_cnt;
  wire \e_cnt[1]_i_1_n_0 ;
  wire \e_cnt[5]_i_2_n_0 ;
  wire \e_cnt[6]_i_1_n_0 ;
  wire \e_cnt[7]_i_3_n_0 ;
  wire \e_cnt_reg_n_0_[0] ;
  wire \e_cnt_reg_n_0_[1] ;
  wire \e_cnt_reg_n_0_[2] ;
  wire \e_cnt_reg_n_0_[3] ;
  wire \e_cnt_reg_n_0_[4] ;
  wire \e_cnt_reg_n_0_[5] ;
  wire \e_cnt_reg_n_0_[6] ;
  wire \e_cnt_reg_n_0_[7] ;
  wire [7:0]e_max;
  wire \fill_cnt[0]_i_1_n_0 ;
  wire \fill_cnt[1]_i_1_n_0 ;
  wire \fill_cnt[2]_i_1_n_0 ;
  wire \fill_cnt[3]_i_1_n_0 ;
  wire \fill_cnt[4]_i_1_n_0 ;
  wire \fill_cnt[4]_i_2_n_0 ;
  wire \fill_cnt[4]_i_3_n_0 ;
  wire \fill_cnt[4]_i_4_n_0 ;
  wire \fill_cnt[4]_i_5_n_0 ;
  wire \fill_cnt_reg_n_0_[0] ;
  wire \fill_cnt_reg_n_0_[1] ;
  wire \fill_cnt_reg_n_0_[2] ;
  wire \fill_cnt_reg_n_0_[3] ;
  wire \fill_cnt_reg_n_0_[4] ;
  wire [7:0]filt_addr;
  wire filt_base;
  wire [7:0]filt_base0;
  wire \filt_base[0]_i_1_n_0 ;
  wire \filt_base[1]_i_1_n_0 ;
  wire \filt_base[2]_i_1_n_0 ;
  wire \filt_base[3]_i_1_n_0 ;
  wire \filt_base[3]_i_3_n_0 ;
  wire \filt_base[3]_i_4_n_0 ;
  wire \filt_base[3]_i_5_n_0 ;
  wire \filt_base[3]_i_6_n_0 ;
  wire \filt_base[4]_i_1_n_0 ;
  wire \filt_base[5]_i_1_n_0 ;
  wire \filt_base[6]_i_1_n_0 ;
  wire \filt_base[7]_i_1_n_0 ;
  wire \filt_base[7]_i_3_n_0 ;
  wire \filt_base_reg[3]_i_2_n_0 ;
  wire \filt_base_reg_n_0_[0] ;
  wire \filt_base_reg_n_0_[1] ;
  wire \filt_base_reg_n_0_[2] ;
  wire \filt_base_reg_n_0_[3] ;
  wire \filt_base_reg_n_0_[4] ;
  wire \filt_base_reg_n_0_[5] ;
  wire \filt_base_reg_n_0_[6] ;
  wire \filt_base_reg_n_0_[7] ;
  wire filt_rd_en;
  wire filt_spad_reg_0_63_0_2_i_1_n_0;
  wire filt_spad_reg_0_63_0_2_i_3_n_0;
  wire filt_spad_reg_0_63_0_2_i_4_n_0;
  wire filt_spad_reg_0_63_0_2_i_5_n_0;
  wire filt_spad_reg_0_63_0_2_i_6_n_0;
  wire filt_spad_reg_0_63_0_2_i_7_n_0;
  wire filt_spad_reg_0_63_0_2_i_8_n_0;
  wire filt_spad_reg_0_63_0_2_n_0;
  wire filt_spad_reg_0_63_0_2_n_1;
  wire filt_spad_reg_0_63_0_2_n_2;
  wire filt_spad_reg_0_63_12_14_n_0;
  wire filt_spad_reg_0_63_12_14_n_1;
  wire filt_spad_reg_0_63_12_14_n_2;
  wire filt_spad_reg_0_63_15_15_n_0;
  wire filt_spad_reg_0_63_3_5_n_0;
  wire filt_spad_reg_0_63_3_5_n_1;
  wire filt_spad_reg_0_63_3_5_n_2;
  wire filt_spad_reg_0_63_6_8_n_0;
  wire filt_spad_reg_0_63_6_8_n_1;
  wire filt_spad_reg_0_63_6_8_n_2;
  wire filt_spad_reg_0_63_9_11_n_0;
  wire filt_spad_reg_0_63_9_11_n_1;
  wire filt_spad_reg_0_63_9_11_n_2;
  wire filt_spad_reg_128_191_0_2_i_1_n_0;
  wire filt_spad_reg_128_191_0_2_n_0;
  wire filt_spad_reg_128_191_0_2_n_1;
  wire filt_spad_reg_128_191_0_2_n_2;
  wire filt_spad_reg_128_191_12_14_n_0;
  wire filt_spad_reg_128_191_12_14_n_1;
  wire filt_spad_reg_128_191_12_14_n_2;
  wire filt_spad_reg_128_191_15_15_n_0;
  wire filt_spad_reg_128_191_3_5_n_0;
  wire filt_spad_reg_128_191_3_5_n_1;
  wire filt_spad_reg_128_191_3_5_n_2;
  wire filt_spad_reg_128_191_6_8_n_0;
  wire filt_spad_reg_128_191_6_8_n_1;
  wire filt_spad_reg_128_191_6_8_n_2;
  wire filt_spad_reg_128_191_9_11_n_0;
  wire filt_spad_reg_128_191_9_11_n_1;
  wire filt_spad_reg_128_191_9_11_n_2;
  wire filt_spad_reg_192_255_0_2_i_1_n_0;
  wire filt_spad_reg_192_255_0_2_n_0;
  wire filt_spad_reg_192_255_0_2_n_1;
  wire filt_spad_reg_192_255_0_2_n_2;
  wire filt_spad_reg_192_255_12_14_n_0;
  wire filt_spad_reg_192_255_12_14_n_1;
  wire filt_spad_reg_192_255_12_14_n_2;
  wire filt_spad_reg_192_255_15_15_n_0;
  wire filt_spad_reg_192_255_3_5_n_0;
  wire filt_spad_reg_192_255_3_5_n_1;
  wire filt_spad_reg_192_255_3_5_n_2;
  wire filt_spad_reg_192_255_6_8_n_0;
  wire filt_spad_reg_192_255_6_8_n_1;
  wire filt_spad_reg_192_255_6_8_n_2;
  wire filt_spad_reg_192_255_9_11_n_0;
  wire filt_spad_reg_192_255_9_11_n_1;
  wire filt_spad_reg_192_255_9_11_n_2;
  wire filt_spad_reg_64_127_0_2_i_1_n_0;
  wire filt_spad_reg_64_127_0_2_n_0;
  wire filt_spad_reg_64_127_0_2_n_1;
  wire filt_spad_reg_64_127_0_2_n_2;
  wire filt_spad_reg_64_127_12_14_n_0;
  wire filt_spad_reg_64_127_12_14_n_1;
  wire filt_spad_reg_64_127_12_14_n_2;
  wire filt_spad_reg_64_127_15_15_n_0;
  wire filt_spad_reg_64_127_3_5_n_0;
  wire filt_spad_reg_64_127_3_5_n_1;
  wire filt_spad_reg_64_127_3_5_n_2;
  wire filt_spad_reg_64_127_6_8_n_0;
  wire filt_spad_reg_64_127_6_8_n_1;
  wire filt_spad_reg_64_127_6_8_n_2;
  wire filt_spad_reg_64_127_9_11_n_0;
  wire filt_spad_reg_64_127_9_11_n_1;
  wire filt_spad_reg_64_127_9_11_n_2;
  wire [7:0]filt_waddr;
  wire [15:0]filt_wdata;
  wire filt_we;
  wire gate_en_r;
  wire gate_r;
  wire gate_r0;
  wire gate_r_i_2_n_0;
  wire gate_r_i_3_n_0;
  wire gate_r_i_4_n_0;
  wire gate_r_i_5_n_0;
  wire [3:0]if_idx;
  wire [15:0]ifmap_data;
  wire ifmap_rd_en;
  wire ifmap_req;
  wire ifmap_spad_reg_r1_0_15_0_5_i_11_n_0;
  wire ifmap_spad_reg_r1_0_15_0_5_i_12_n_0;
  wire ifmap_spad_reg_r1_0_15_0_5_i_13_n_0;
  wire ifmap_spad_reg_r1_0_15_0_5_i_14_n_0;
  wire ifmap_spad_reg_r1_0_15_0_5_i_15_n_0;
  wire ifmap_spad_reg_r1_0_15_0_5_i_9_n_0;
  wire ifmap_spad_reg_r2_0_15_0_5_i_5_n_0;
  wire ifmap_valid;
  wire [4:0]k_cnt;
  wire \k_cnt[0]_i_1_n_0 ;
  wire \k_cnt[1]_i_1_n_0 ;
  wire \k_cnt[2]_i_1_n_0 ;
  wire \k_cnt[3]_i_1_n_0 ;
  wire \k_cnt[4]_i_2_n_0 ;
  wire \k_cnt[4]_i_3_n_0 ;
  wire \k_cnt[4]_i_4_n_0 ;
  wire [4:0]k_r;
  wire \k_r[4]_i_1_n_0 ;
  wire [15:0]p_0_out;
  wire [7:0]p_1_in;
  wire [15:0]p_2_in;
  wire [4:0]p_max;
  wire product_n_100;
  wire product_n_101;
  wire product_n_102;
  wire product_n_103;
  wire product_n_104;
  wire product_n_105;
  wire product_n_74;
  wire product_n_75;
  wire product_n_76;
  wire product_n_77;
  wire product_n_78;
  wire product_n_79;
  wire product_n_80;
  wire product_n_81;
  wire product_n_82;
  wire product_n_83;
  wire product_n_84;
  wire product_n_85;
  wire product_n_86;
  wire product_n_87;
  wire product_n_88;
  wire product_n_89;
  wire product_n_90;
  wire product_n_91;
  wire product_n_92;
  wire product_n_93;
  wire product_n_94;
  wire product_n_95;
  wire product_n_96;
  wire product_n_97;
  wire product_n_98;
  wire product_n_99;
  wire [4:0]psum_k;
  wire [15:0]psum_out;
  wire \psum_out[0]_INST_0_i_1_n_0 ;
  wire \psum_out[0]_INST_0_i_2_n_0 ;
  wire \psum_out[0]_INST_0_i_3_n_0 ;
  wire \psum_out[0]_INST_0_i_4_n_0 ;
  wire \psum_out[0]_INST_0_i_5_n_0 ;
  wire \psum_out[0]_INST_0_i_6_n_0 ;
  wire \psum_out[0]_INST_0_i_7_n_0 ;
  wire \psum_out[0]_INST_0_i_8_n_0 ;
  wire \psum_out[0]_INST_0_i_9_n_0 ;
  wire \psum_out[10]_INST_0_i_1_n_0 ;
  wire \psum_out[10]_INST_0_i_2_n_0 ;
  wire \psum_out[10]_INST_0_i_3_n_0 ;
  wire \psum_out[10]_INST_0_i_4_n_0 ;
  wire \psum_out[10]_INST_0_i_5_n_0 ;
  wire \psum_out[10]_INST_0_i_6_n_0 ;
  wire \psum_out[10]_INST_0_i_7_n_0 ;
  wire \psum_out[10]_INST_0_i_8_n_0 ;
  wire \psum_out[10]_INST_0_i_9_n_0 ;
  wire \psum_out[11]_INST_0_i_1_n_0 ;
  wire \psum_out[11]_INST_0_i_2_n_0 ;
  wire \psum_out[11]_INST_0_i_3_n_0 ;
  wire \psum_out[11]_INST_0_i_4_n_0 ;
  wire \psum_out[11]_INST_0_i_5_n_0 ;
  wire \psum_out[11]_INST_0_i_6_n_0 ;
  wire \psum_out[11]_INST_0_i_7_n_0 ;
  wire \psum_out[11]_INST_0_i_8_n_0 ;
  wire \psum_out[11]_INST_0_i_9_n_0 ;
  wire \psum_out[12]_INST_0_i_1_n_0 ;
  wire \psum_out[12]_INST_0_i_2_n_0 ;
  wire \psum_out[12]_INST_0_i_3_n_0 ;
  wire \psum_out[12]_INST_0_i_4_n_0 ;
  wire \psum_out[12]_INST_0_i_5_n_0 ;
  wire \psum_out[12]_INST_0_i_6_n_0 ;
  wire \psum_out[12]_INST_0_i_7_n_0 ;
  wire \psum_out[12]_INST_0_i_8_n_0 ;
  wire \psum_out[12]_INST_0_i_9_n_0 ;
  wire \psum_out[13]_INST_0_i_1_n_0 ;
  wire \psum_out[13]_INST_0_i_2_n_0 ;
  wire \psum_out[13]_INST_0_i_3_n_0 ;
  wire \psum_out[13]_INST_0_i_4_n_0 ;
  wire \psum_out[13]_INST_0_i_5_n_0 ;
  wire \psum_out[13]_INST_0_i_6_n_0 ;
  wire \psum_out[13]_INST_0_i_7_n_0 ;
  wire \psum_out[13]_INST_0_i_8_n_0 ;
  wire \psum_out[13]_INST_0_i_9_n_0 ;
  wire \psum_out[14]_INST_0_i_1_n_0 ;
  wire \psum_out[14]_INST_0_i_2_n_0 ;
  wire \psum_out[14]_INST_0_i_3_n_0 ;
  wire \psum_out[14]_INST_0_i_4_n_0 ;
  wire \psum_out[14]_INST_0_i_5_n_0 ;
  wire \psum_out[14]_INST_0_i_6_n_0 ;
  wire \psum_out[14]_INST_0_i_7_n_0 ;
  wire \psum_out[14]_INST_0_i_8_n_0 ;
  wire \psum_out[14]_INST_0_i_9_n_0 ;
  wire \psum_out[15]_INST_0_i_1_n_0 ;
  wire \psum_out[15]_INST_0_i_2_n_0 ;
  wire \psum_out[15]_INST_0_i_3_n_0 ;
  wire \psum_out[15]_INST_0_i_4_n_0 ;
  wire \psum_out[15]_INST_0_i_5_n_0 ;
  wire \psum_out[15]_INST_0_i_6_n_0 ;
  wire \psum_out[15]_INST_0_i_7_n_0 ;
  wire \psum_out[15]_INST_0_i_8_n_0 ;
  wire \psum_out[15]_INST_0_i_9_n_0 ;
  wire \psum_out[1]_INST_0_i_1_n_0 ;
  wire \psum_out[1]_INST_0_i_2_n_0 ;
  wire \psum_out[1]_INST_0_i_3_n_0 ;
  wire \psum_out[1]_INST_0_i_4_n_0 ;
  wire \psum_out[1]_INST_0_i_5_n_0 ;
  wire \psum_out[1]_INST_0_i_6_n_0 ;
  wire \psum_out[1]_INST_0_i_7_n_0 ;
  wire \psum_out[1]_INST_0_i_8_n_0 ;
  wire \psum_out[1]_INST_0_i_9_n_0 ;
  wire \psum_out[2]_INST_0_i_1_n_0 ;
  wire \psum_out[2]_INST_0_i_2_n_0 ;
  wire \psum_out[2]_INST_0_i_3_n_0 ;
  wire \psum_out[2]_INST_0_i_4_n_0 ;
  wire \psum_out[2]_INST_0_i_5_n_0 ;
  wire \psum_out[2]_INST_0_i_6_n_0 ;
  wire \psum_out[2]_INST_0_i_7_n_0 ;
  wire \psum_out[2]_INST_0_i_8_n_0 ;
  wire \psum_out[2]_INST_0_i_9_n_0 ;
  wire \psum_out[3]_INST_0_i_1_n_0 ;
  wire \psum_out[3]_INST_0_i_2_n_0 ;
  wire \psum_out[3]_INST_0_i_3_n_0 ;
  wire \psum_out[3]_INST_0_i_4_n_0 ;
  wire \psum_out[3]_INST_0_i_5_n_0 ;
  wire \psum_out[3]_INST_0_i_6_n_0 ;
  wire \psum_out[3]_INST_0_i_7_n_0 ;
  wire \psum_out[3]_INST_0_i_8_n_0 ;
  wire \psum_out[3]_INST_0_i_9_n_0 ;
  wire \psum_out[4]_INST_0_i_1_n_0 ;
  wire \psum_out[4]_INST_0_i_2_n_0 ;
  wire \psum_out[4]_INST_0_i_3_n_0 ;
  wire \psum_out[4]_INST_0_i_4_n_0 ;
  wire \psum_out[4]_INST_0_i_5_n_0 ;
  wire \psum_out[4]_INST_0_i_6_n_0 ;
  wire \psum_out[4]_INST_0_i_7_n_0 ;
  wire \psum_out[4]_INST_0_i_8_n_0 ;
  wire \psum_out[4]_INST_0_i_9_n_0 ;
  wire \psum_out[5]_INST_0_i_1_n_0 ;
  wire \psum_out[5]_INST_0_i_2_n_0 ;
  wire \psum_out[5]_INST_0_i_3_n_0 ;
  wire \psum_out[5]_INST_0_i_4_n_0 ;
  wire \psum_out[5]_INST_0_i_5_n_0 ;
  wire \psum_out[5]_INST_0_i_6_n_0 ;
  wire \psum_out[5]_INST_0_i_7_n_0 ;
  wire \psum_out[5]_INST_0_i_8_n_0 ;
  wire \psum_out[5]_INST_0_i_9_n_0 ;
  wire \psum_out[6]_INST_0_i_1_n_0 ;
  wire \psum_out[6]_INST_0_i_2_n_0 ;
  wire \psum_out[6]_INST_0_i_3_n_0 ;
  wire \psum_out[6]_INST_0_i_4_n_0 ;
  wire \psum_out[6]_INST_0_i_5_n_0 ;
  wire \psum_out[6]_INST_0_i_6_n_0 ;
  wire \psum_out[6]_INST_0_i_7_n_0 ;
  wire \psum_out[6]_INST_0_i_8_n_0 ;
  wire \psum_out[6]_INST_0_i_9_n_0 ;
  wire \psum_out[7]_INST_0_i_1_n_0 ;
  wire \psum_out[7]_INST_0_i_2_n_0 ;
  wire \psum_out[7]_INST_0_i_3_n_0 ;
  wire \psum_out[7]_INST_0_i_4_n_0 ;
  wire \psum_out[7]_INST_0_i_5_n_0 ;
  wire \psum_out[7]_INST_0_i_6_n_0 ;
  wire \psum_out[7]_INST_0_i_7_n_0 ;
  wire \psum_out[7]_INST_0_i_8_n_0 ;
  wire \psum_out[7]_INST_0_i_9_n_0 ;
  wire \psum_out[8]_INST_0_i_1_n_0 ;
  wire \psum_out[8]_INST_0_i_2_n_0 ;
  wire \psum_out[8]_INST_0_i_3_n_0 ;
  wire \psum_out[8]_INST_0_i_4_n_0 ;
  wire \psum_out[8]_INST_0_i_5_n_0 ;
  wire \psum_out[8]_INST_0_i_6_n_0 ;
  wire \psum_out[8]_INST_0_i_7_n_0 ;
  wire \psum_out[8]_INST_0_i_8_n_0 ;
  wire \psum_out[8]_INST_0_i_9_n_0 ;
  wire \psum_out[9]_INST_0_i_1_n_0 ;
  wire \psum_out[9]_INST_0_i_2_n_0 ;
  wire \psum_out[9]_INST_0_i_3_n_0 ;
  wire \psum_out[9]_INST_0_i_4_n_0 ;
  wire \psum_out[9]_INST_0_i_5_n_0 ;
  wire \psum_out[9]_INST_0_i_6_n_0 ;
  wire \psum_out[9]_INST_0_i_7_n_0 ;
  wire \psum_out[9]_INST_0_i_8_n_0 ;
  wire \psum_out[9]_INST_0_i_9_n_0 ;
  wire [14:0]psum_spad;
  wire \psum_spad[0][15]_i_1_n_0 ;
  wire \psum_spad[10][15]_i_1_n_0 ;
  wire \psum_spad[11][15]_i_1_n_0 ;
  wire \psum_spad[12][15]_i_1_n_0 ;
  wire \psum_spad[13][15]_i_1_n_0 ;
  wire \psum_spad[14][15]_i_1_n_0 ;
  wire \psum_spad[15][15]_i_1_n_0 ;
  wire \psum_spad[16][15]_i_1_n_0 ;
  wire \psum_spad[17][15]_i_1_n_0 ;
  wire \psum_spad[18][15]_i_1_n_0 ;
  wire \psum_spad[19][15]_i_1_n_0 ;
  wire \psum_spad[1][11]_i_22_n_0 ;
  wire \psum_spad[1][11]_i_23_n_0 ;
  wire \psum_spad[1][11]_i_24_n_0 ;
  wire \psum_spad[1][11]_i_25_n_0 ;
  wire \psum_spad[1][11]_i_26_n_0 ;
  wire \psum_spad[1][11]_i_27_n_0 ;
  wire \psum_spad[1][11]_i_28_n_0 ;
  wire \psum_spad[1][11]_i_29_n_0 ;
  wire \psum_spad[1][11]_i_30_n_0 ;
  wire \psum_spad[1][11]_i_31_n_0 ;
  wire \psum_spad[1][11]_i_32_n_0 ;
  wire \psum_spad[1][11]_i_33_n_0 ;
  wire \psum_spad[1][11]_i_34_n_0 ;
  wire \psum_spad[1][11]_i_35_n_0 ;
  wire \psum_spad[1][11]_i_36_n_0 ;
  wire \psum_spad[1][11]_i_37_n_0 ;
  wire \psum_spad[1][11]_i_38_n_0 ;
  wire \psum_spad[1][11]_i_39_n_0 ;
  wire \psum_spad[1][11]_i_40_n_0 ;
  wire \psum_spad[1][11]_i_41_n_0 ;
  wire \psum_spad[1][11]_i_42_n_0 ;
  wire \psum_spad[1][11]_i_43_n_0 ;
  wire \psum_spad[1][11]_i_44_n_0 ;
  wire \psum_spad[1][11]_i_45_n_0 ;
  wire \psum_spad[1][11]_i_46_n_0 ;
  wire \psum_spad[1][11]_i_47_n_0 ;
  wire \psum_spad[1][11]_i_48_n_0 ;
  wire \psum_spad[1][11]_i_49_n_0 ;
  wire \psum_spad[1][11]_i_50_n_0 ;
  wire \psum_spad[1][11]_i_51_n_0 ;
  wire \psum_spad[1][11]_i_52_n_0 ;
  wire \psum_spad[1][11]_i_53_n_0 ;
  wire \psum_spad[1][11]_i_6_n_0 ;
  wire \psum_spad[1][11]_i_7_n_0 ;
  wire \psum_spad[1][11]_i_8_n_0 ;
  wire \psum_spad[1][11]_i_9_n_0 ;
  wire \psum_spad[1][15]_i_10_n_0 ;
  wire \psum_spad[1][15]_i_11_n_0 ;
  wire \psum_spad[1][15]_i_1_n_0 ;
  wire \psum_spad[1][15]_i_21_n_0 ;
  wire \psum_spad[1][15]_i_22_n_0 ;
  wire \psum_spad[1][15]_i_23_n_0 ;
  wire \psum_spad[1][15]_i_24_n_0 ;
  wire \psum_spad[1][15]_i_25_n_0 ;
  wire \psum_spad[1][15]_i_26_n_0 ;
  wire \psum_spad[1][15]_i_27_n_0 ;
  wire \psum_spad[1][15]_i_28_n_0 ;
  wire \psum_spad[1][15]_i_29_n_0 ;
  wire \psum_spad[1][15]_i_2_n_0 ;
  wire \psum_spad[1][15]_i_30_n_0 ;
  wire \psum_spad[1][15]_i_31_n_0 ;
  wire \psum_spad[1][15]_i_32_n_0 ;
  wire \psum_spad[1][15]_i_33_n_0 ;
  wire \psum_spad[1][15]_i_34_n_0 ;
  wire \psum_spad[1][15]_i_35_n_0 ;
  wire \psum_spad[1][15]_i_36_n_0 ;
  wire \psum_spad[1][15]_i_37_n_0 ;
  wire \psum_spad[1][15]_i_38_n_0 ;
  wire \psum_spad[1][15]_i_39_n_0 ;
  wire \psum_spad[1][15]_i_40_n_0 ;
  wire \psum_spad[1][15]_i_41_n_0 ;
  wire \psum_spad[1][15]_i_42_n_0 ;
  wire \psum_spad[1][15]_i_43_n_0 ;
  wire \psum_spad[1][15]_i_44_n_0 ;
  wire \psum_spad[1][15]_i_45_n_0 ;
  wire \psum_spad[1][15]_i_46_n_0 ;
  wire \psum_spad[1][15]_i_47_n_0 ;
  wire \psum_spad[1][15]_i_4_n_0 ;
  wire \psum_spad[1][15]_i_51_n_0 ;
  wire \psum_spad[1][15]_i_52_n_0 ;
  wire \psum_spad[1][15]_i_53_n_0 ;
  wire \psum_spad[1][15]_i_54_n_0 ;
  wire \psum_spad[1][15]_i_55_n_0 ;
  wire \psum_spad[1][15]_i_56_n_0 ;
  wire \psum_spad[1][15]_i_57_n_0 ;
  wire \psum_spad[1][15]_i_58_n_0 ;
  wire \psum_spad[1][15]_i_59_n_0 ;
  wire \psum_spad[1][15]_i_60_n_0 ;
  wire \psum_spad[1][15]_i_61_n_0 ;
  wire \psum_spad[1][15]_i_62_n_0 ;
  wire \psum_spad[1][15]_i_63_n_0 ;
  wire \psum_spad[1][15]_i_64_n_0 ;
  wire \psum_spad[1][15]_i_65_n_0 ;
  wire \psum_spad[1][15]_i_8_n_0 ;
  wire \psum_spad[1][15]_i_9_n_0 ;
  wire \psum_spad[1][3]_i_22_n_0 ;
  wire \psum_spad[1][3]_i_23_n_0 ;
  wire \psum_spad[1][3]_i_24_n_0 ;
  wire \psum_spad[1][3]_i_25_n_0 ;
  wire \psum_spad[1][3]_i_26_n_0 ;
  wire \psum_spad[1][3]_i_27_n_0 ;
  wire \psum_spad[1][3]_i_28_n_0 ;
  wire \psum_spad[1][3]_i_29_n_0 ;
  wire \psum_spad[1][3]_i_30_n_0 ;
  wire \psum_spad[1][3]_i_31_n_0 ;
  wire \psum_spad[1][3]_i_32_n_0 ;
  wire \psum_spad[1][3]_i_33_n_0 ;
  wire \psum_spad[1][3]_i_34_n_0 ;
  wire \psum_spad[1][3]_i_35_n_0 ;
  wire \psum_spad[1][3]_i_36_n_0 ;
  wire \psum_spad[1][3]_i_37_n_0 ;
  wire \psum_spad[1][3]_i_38_n_0 ;
  wire \psum_spad[1][3]_i_39_n_0 ;
  wire \psum_spad[1][3]_i_40_n_0 ;
  wire \psum_spad[1][3]_i_41_n_0 ;
  wire \psum_spad[1][3]_i_42_n_0 ;
  wire \psum_spad[1][3]_i_43_n_0 ;
  wire \psum_spad[1][3]_i_44_n_0 ;
  wire \psum_spad[1][3]_i_45_n_0 ;
  wire \psum_spad[1][3]_i_46_n_0 ;
  wire \psum_spad[1][3]_i_47_n_0 ;
  wire \psum_spad[1][3]_i_48_n_0 ;
  wire \psum_spad[1][3]_i_49_n_0 ;
  wire \psum_spad[1][3]_i_50_n_0 ;
  wire \psum_spad[1][3]_i_51_n_0 ;
  wire \psum_spad[1][3]_i_52_n_0 ;
  wire \psum_spad[1][3]_i_53_n_0 ;
  wire \psum_spad[1][3]_i_54_n_0 ;
  wire \psum_spad[1][3]_i_6_n_0 ;
  wire \psum_spad[1][3]_i_7_n_0 ;
  wire \psum_spad[1][3]_i_8_n_0 ;
  wire \psum_spad[1][3]_i_9_n_0 ;
  wire \psum_spad[1][7]_i_22_n_0 ;
  wire \psum_spad[1][7]_i_23_n_0 ;
  wire \psum_spad[1][7]_i_24_n_0 ;
  wire \psum_spad[1][7]_i_25_n_0 ;
  wire \psum_spad[1][7]_i_26_n_0 ;
  wire \psum_spad[1][7]_i_27_n_0 ;
  wire \psum_spad[1][7]_i_28_n_0 ;
  wire \psum_spad[1][7]_i_29_n_0 ;
  wire \psum_spad[1][7]_i_30_n_0 ;
  wire \psum_spad[1][7]_i_31_n_0 ;
  wire \psum_spad[1][7]_i_32_n_0 ;
  wire \psum_spad[1][7]_i_33_n_0 ;
  wire \psum_spad[1][7]_i_34_n_0 ;
  wire \psum_spad[1][7]_i_35_n_0 ;
  wire \psum_spad[1][7]_i_36_n_0 ;
  wire \psum_spad[1][7]_i_37_n_0 ;
  wire \psum_spad[1][7]_i_38_n_0 ;
  wire \psum_spad[1][7]_i_39_n_0 ;
  wire \psum_spad[1][7]_i_40_n_0 ;
  wire \psum_spad[1][7]_i_41_n_0 ;
  wire \psum_spad[1][7]_i_42_n_0 ;
  wire \psum_spad[1][7]_i_43_n_0 ;
  wire \psum_spad[1][7]_i_44_n_0 ;
  wire \psum_spad[1][7]_i_45_n_0 ;
  wire \psum_spad[1][7]_i_46_n_0 ;
  wire \psum_spad[1][7]_i_47_n_0 ;
  wire \psum_spad[1][7]_i_48_n_0 ;
  wire \psum_spad[1][7]_i_49_n_0 ;
  wire \psum_spad[1][7]_i_50_n_0 ;
  wire \psum_spad[1][7]_i_51_n_0 ;
  wire \psum_spad[1][7]_i_52_n_0 ;
  wire \psum_spad[1][7]_i_53_n_0 ;
  wire \psum_spad[1][7]_i_6_n_0 ;
  wire \psum_spad[1][7]_i_7_n_0 ;
  wire \psum_spad[1][7]_i_8_n_0 ;
  wire \psum_spad[1][7]_i_9_n_0 ;
  wire \psum_spad[20][15]_i_1_n_0 ;
  wire \psum_spad[21][15]_i_1_n_0 ;
  wire \psum_spad[22][15]_i_1_n_0 ;
  wire \psum_spad[23][15]_i_1_n_0 ;
  wire \psum_spad[2][15]_i_1_n_0 ;
  wire \psum_spad[3][15]_i_1_n_0 ;
  wire \psum_spad[4][15]_i_1_n_0 ;
  wire \psum_spad[5][15]_i_1_n_0 ;
  wire \psum_spad[6][15]_i_1_n_0 ;
  wire \psum_spad[7][15]_i_1_n_0 ;
  wire \psum_spad[8][15]_i_1_n_0 ;
  wire \psum_spad[8][15]_i_2_n_0 ;
  wire \psum_spad[9][15]_i_1_n_0 ;
  wire [15:0]\psum_spad_reg[0] ;
  wire [15:0]\psum_spad_reg[10] ;
  wire [15:0]\psum_spad_reg[11] ;
  wire [15:0]\psum_spad_reg[12] ;
  wire [15:0]\psum_spad_reg[13] ;
  wire [15:0]\psum_spad_reg[14] ;
  wire [15:0]\psum_spad_reg[15] ;
  wire [15:0]\psum_spad_reg[16] ;
  wire [15:0]\psum_spad_reg[17] ;
  wire [15:0]\psum_spad_reg[18] ;
  wire [15:0]\psum_spad_reg[19] ;
  wire [15:0]\psum_spad_reg[1] ;
  wire \psum_spad_reg[1][11]_i_10_n_0 ;
  wire \psum_spad_reg[1][11]_i_11_n_0 ;
  wire \psum_spad_reg[1][11]_i_12_n_0 ;
  wire \psum_spad_reg[1][11]_i_13_n_0 ;
  wire \psum_spad_reg[1][11]_i_14_n_0 ;
  wire \psum_spad_reg[1][11]_i_15_n_0 ;
  wire \psum_spad_reg[1][11]_i_16_n_0 ;
  wire \psum_spad_reg[1][11]_i_17_n_0 ;
  wire \psum_spad_reg[1][11]_i_18_n_0 ;
  wire \psum_spad_reg[1][11]_i_19_n_0 ;
  wire \psum_spad_reg[1][11]_i_1_n_0 ;
  wire \psum_spad_reg[1][11]_i_20_n_0 ;
  wire \psum_spad_reg[1][11]_i_21_n_0 ;
  wire \psum_spad_reg[1][15]_i_12_n_0 ;
  wire \psum_spad_reg[1][15]_i_13_n_0 ;
  wire \psum_spad_reg[1][15]_i_14_n_0 ;
  wire \psum_spad_reg[1][15]_i_15_n_0 ;
  wire \psum_spad_reg[1][15]_i_16_n_0 ;
  wire \psum_spad_reg[1][15]_i_17_n_0 ;
  wire \psum_spad_reg[1][15]_i_18_n_0 ;
  wire \psum_spad_reg[1][15]_i_19_n_0 ;
  wire \psum_spad_reg[1][15]_i_20_n_0 ;
  wire \psum_spad_reg[1][15]_i_48_n_0 ;
  wire \psum_spad_reg[1][15]_i_49_n_0 ;
  wire \psum_spad_reg[1][15]_i_50_n_0 ;
  wire \psum_spad_reg[1][3]_i_10_n_0 ;
  wire \psum_spad_reg[1][3]_i_11_n_0 ;
  wire \psum_spad_reg[1][3]_i_12_n_0 ;
  wire \psum_spad_reg[1][3]_i_13_n_0 ;
  wire \psum_spad_reg[1][3]_i_14_n_0 ;
  wire \psum_spad_reg[1][3]_i_15_n_0 ;
  wire \psum_spad_reg[1][3]_i_16_n_0 ;
  wire \psum_spad_reg[1][3]_i_17_n_0 ;
  wire \psum_spad_reg[1][3]_i_18_n_0 ;
  wire \psum_spad_reg[1][3]_i_19_n_0 ;
  wire \psum_spad_reg[1][3]_i_1_n_0 ;
  wire \psum_spad_reg[1][3]_i_20_n_0 ;
  wire \psum_spad_reg[1][3]_i_21_n_0 ;
  wire \psum_spad_reg[1][7]_i_10_n_0 ;
  wire \psum_spad_reg[1][7]_i_11_n_0 ;
  wire \psum_spad_reg[1][7]_i_12_n_0 ;
  wire \psum_spad_reg[1][7]_i_13_n_0 ;
  wire \psum_spad_reg[1][7]_i_14_n_0 ;
  wire \psum_spad_reg[1][7]_i_15_n_0 ;
  wire \psum_spad_reg[1][7]_i_16_n_0 ;
  wire \psum_spad_reg[1][7]_i_17_n_0 ;
  wire \psum_spad_reg[1][7]_i_18_n_0 ;
  wire \psum_spad_reg[1][7]_i_19_n_0 ;
  wire \psum_spad_reg[1][7]_i_1_n_0 ;
  wire \psum_spad_reg[1][7]_i_20_n_0 ;
  wire \psum_spad_reg[1][7]_i_21_n_0 ;
  wire [15:0]\psum_spad_reg[20] ;
  wire [15:0]\psum_spad_reg[21] ;
  wire [15:0]\psum_spad_reg[22] ;
  wire [15:0]\psum_spad_reg[23] ;
  wire [15:0]\psum_spad_reg[2] ;
  wire [15:0]\psum_spad_reg[3] ;
  wire [15:0]\psum_spad_reg[4] ;
  wire [15:0]\psum_spad_reg[5] ;
  wire [15:0]\psum_spad_reg[6] ;
  wire [15:0]\psum_spad_reg[7] ;
  wire [15:0]\psum_spad_reg[8] ;
  wire [15:0]\psum_spad_reg[9] ;
  wire psum_valid;
  wire [3:0]rbase;
  wire \rbase[0]_i_1_n_0 ;
  wire \rbase[1]_i_1_n_0 ;
  wire \rbase[2]_i_1_n_0 ;
  wire \rbase[3]_i_1_n_0 ;
  wire rst_n;
  wire [4:0]s_cnt;
  wire \s_cnt[0]_i_1_n_0 ;
  wire \s_cnt[1]_i_1_n_0 ;
  wire \s_cnt[2]_i_1_n_0 ;
  wire \s_cnt[3]_i_1_n_0 ;
  wire \s_cnt[4]_i_1_n_0 ;
  wire \s_cnt[4]_i_2_n_0 ;
  wire \s_cnt[4]_i_3_n_0 ;
  wire \s_cnt[4]_i_4_n_0 ;
  wire \s_cnt[4]_i_5_n_0 ;
  wire \s_cnt[4]_i_6_n_0 ;
  wire \s_cnt[4]_i_7_n_0 ;
  wire [4:0]s_max;
  wire shift_r;
  wire \shift_r_reg_n_0_[0] ;
  wire \shift_r_reg_n_0_[1] ;
  wire \shift_r_reg_n_0_[2] ;
  wire \shift_r_reg_n_0_[3] ;
  wire \shift_r_reg_n_0_[4] ;
  wire start;
  wire state;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state[1]_i_2_n_0 ;
  wire \state[1]_i_3_n_0 ;
  wire \state[1]_i_4_n_0 ;
  wire \state[1]_i_5_n_0 ;
  wire \state[1]_i_6_n_0 ;
  wire \state[1]_i_7_n_0 ;
  wire \state[2]_i_1_n_0 ;
  wire \state[2]_i_3_n_0 ;
  wire \state[2]_i_4_n_0 ;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[1] ;
  wire \state_reg_n_0_[2] ;
  wire vld_r;
  wire [15:0]w_r0;
  wire [3:0]wr_idx;
  wire [15:0]x_r0;
  wire [11:0]zero_buf;
  wire \zero_buf[0]_i_1_n_0 ;
  wire \zero_buf[10]_i_1_n_0 ;
  wire \zero_buf[10]_i_2_n_0 ;
  wire \zero_buf[10]_i_3_n_0 ;
  wire \zero_buf[11]_i_10_n_0 ;
  wire \zero_buf[11]_i_1_n_0 ;
  wire \zero_buf[11]_i_2_n_0 ;
  wire \zero_buf[11]_i_3_n_0 ;
  wire \zero_buf[11]_i_4_n_0 ;
  wire \zero_buf[11]_i_5_n_0 ;
  wire \zero_buf[11]_i_6_n_0 ;
  wire \zero_buf[11]_i_7_n_0 ;
  wire \zero_buf[11]_i_8_n_0 ;
  wire \zero_buf[11]_i_9_n_0 ;
  wire \zero_buf[1]_i_1_n_0 ;
  wire \zero_buf[2]_i_1_n_0 ;
  wire \zero_buf[3]_i_1_n_0 ;
  wire \zero_buf[3]_i_2_n_0 ;
  wire \zero_buf[3]_i_3_n_0 ;
  wire \zero_buf[4]_i_1_n_0 ;
  wire \zero_buf[5]_i_1_n_0 ;
  wire \zero_buf[6]_i_1_n_0 ;
  wire \zero_buf[7]_i_1_n_0 ;
  wire \zero_buf[7]_i_2_n_0 ;
  wire \zero_buf[7]_i_3_n_0 ;
  wire \zero_buf[8]_i_1_n_0 ;
  wire \zero_buf[8]_i_2_n_0 ;
  wire \zero_buf[8]_i_3_n_0 ;
  wire \zero_buf[9]_i_1_n_0 ;
  wire \zero_buf[9]_i_2_n_0 ;
  wire \zero_buf[9]_i_3_n_0 ;
  wire [2:0]\NLW_filt_base_reg[3]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_filt_base_reg[7]_i_2_CO_UNCONNECTED ;
  wire NLW_filt_spad_reg_0_63_0_2_DOD_UNCONNECTED;
  wire [3:0]NLW_filt_spad_reg_0_63_0_2_i_2_CO_UNCONNECTED;
  wire [2:0]NLW_filt_spad_reg_0_63_0_2_i_3_CO_UNCONNECTED;
  wire NLW_filt_spad_reg_0_63_12_14_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_0_63_15_15_SPO_UNCONNECTED;
  wire NLW_filt_spad_reg_0_63_3_5_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_0_63_6_8_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_0_63_9_11_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_128_191_0_2_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_128_191_12_14_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_128_191_15_15_SPO_UNCONNECTED;
  wire NLW_filt_spad_reg_128_191_3_5_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_128_191_6_8_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_128_191_9_11_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_192_255_0_2_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_192_255_12_14_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_192_255_15_15_SPO_UNCONNECTED;
  wire NLW_filt_spad_reg_192_255_3_5_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_192_255_6_8_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_192_255_9_11_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_64_127_0_2_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_64_127_12_14_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_64_127_15_15_SPO_UNCONNECTED;
  wire NLW_filt_spad_reg_64_127_3_5_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_64_127_6_8_DOD_UNCONNECTED;
  wire NLW_filt_spad_reg_64_127_9_11_DOD_UNCONNECTED;
  wire [1:0]NLW_ifmap_spad_reg_r1_0_15_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_ifmap_spad_reg_r1_0_15_12_15_DOC_UNCONNECTED;
  wire [1:0]NLW_ifmap_spad_reg_r1_0_15_12_15_DOD_UNCONNECTED;
  wire [1:0]NLW_ifmap_spad_reg_r1_0_15_6_11_DOD_UNCONNECTED;
  wire [1:0]NLW_ifmap_spad_reg_r2_0_15_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_ifmap_spad_reg_r2_0_15_12_15_DOC_UNCONNECTED;
  wire [1:0]NLW_ifmap_spad_reg_r2_0_15_12_15_DOD_UNCONNECTED;
  wire [1:0]NLW_ifmap_spad_reg_r2_0_15_6_11_DOD_UNCONNECTED;
  wire NLW_product_CARRYCASCOUT_UNCONNECTED;
  wire NLW_product_MULTSIGNOUT_UNCONNECTED;
  wire NLW_product_OVERFLOW_UNCONNECTED;
  wire NLW_product_PATTERNBDETECT_UNCONNECTED;
  wire NLW_product_PATTERNDETECT_UNCONNECTED;
  wire NLW_product_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_product_ACOUT_UNCONNECTED;
  wire [17:0]NLW_product_BCOUT_UNCONNECTED;
  wire [3:0]NLW_product_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_product_P_UNCONNECTED;
  wire [47:0]NLW_product_PCOUT_UNCONNECTED;
  wire [2:0]\NLW_psum_spad_reg[1][11]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_psum_spad_reg[1][15]_i_3_CO_UNCONNECTED ;
  wire [2:0]\NLW_psum_spad_reg[1][3]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_psum_spad_reg[1][7]_i_1_CO_UNCONNECTED ;

  LUT3 #(
    .INIT(8'hFE)) 
    busy_INST_0
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[1] ),
        .O(busy));
  LUT1 #(
    .INIT(2'h1)) 
    done_i_1
       (.I0(rst_n),
        .O(RSTA));
  LUT3 #(
    .INIT(8'h08)) 
    done_i_2
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[2] ),
        .I2(\state_reg_n_0_[0] ),
        .O(done_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(clk),
        .CE(1'b1),
        .D(done_i_2_n_0),
        .Q(done),
        .R(RSTA));
  LUT2 #(
    .INIT(4'h2)) 
    \drain_cnt[0]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(psum_k[0]),
        .O(\drain_cnt[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \drain_cnt[1]_i_1 
       (.I0(psum_k[0]),
        .I1(psum_k[1]),
        .I2(\state_reg_n_0_[2] ),
        .O(\drain_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \drain_cnt[2]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(psum_k[1]),
        .I2(psum_k[0]),
        .I3(psum_k[2]),
        .O(\drain_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \drain_cnt[3]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(psum_k[0]),
        .I2(psum_k[1]),
        .I3(psum_k[2]),
        .I4(psum_k[3]),
        .O(\drain_cnt[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h3004)) 
    \drain_cnt[4]_i_1 
       (.I0(\drain_cnt[4]_i_3_n_0 ),
        .I1(\state_reg_n_0_[2] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .O(\drain_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \drain_cnt[4]_i_2 
       (.I0(\state_reg_n_0_[2] ),
        .I1(psum_k[2]),
        .I2(psum_k[1]),
        .I3(psum_k[0]),
        .I4(psum_k[3]),
        .I5(psum_k[4]),
        .O(\drain_cnt[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4080084004088004)) 
    \drain_cnt[4]_i_3 
       (.I0(psum_k[3]),
        .I1(\drain_cnt[4]_i_4_n_0 ),
        .I2(p_max[4]),
        .I3(\drain_cnt[4]_i_5_n_0 ),
        .I4(p_max[3]),
        .I5(psum_k[4]),
        .O(\drain_cnt[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h4120000800084120)) 
    \drain_cnt[4]_i_4 
       (.I0(psum_k[0]),
        .I1(psum_k[1]),
        .I2(p_max[1]),
        .I3(p_max[0]),
        .I4(p_max[2]),
        .I5(psum_k[2]),
        .O(\drain_cnt[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \drain_cnt[4]_i_5 
       (.I0(p_max[0]),
        .I1(p_max[1]),
        .I2(p_max[2]),
        .O(\drain_cnt[4]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drain_cnt_reg[0] 
       (.C(clk),
        .CE(\drain_cnt[4]_i_1_n_0 ),
        .D(\drain_cnt[0]_i_1_n_0 ),
        .Q(psum_k[0]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \drain_cnt_reg[1] 
       (.C(clk),
        .CE(\drain_cnt[4]_i_1_n_0 ),
        .D(\drain_cnt[1]_i_1_n_0 ),
        .Q(psum_k[1]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \drain_cnt_reg[2] 
       (.C(clk),
        .CE(\drain_cnt[4]_i_1_n_0 ),
        .D(\drain_cnt[2]_i_1_n_0 ),
        .Q(psum_k[2]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \drain_cnt_reg[3] 
       (.C(clk),
        .CE(\drain_cnt[4]_i_1_n_0 ),
        .D(\drain_cnt[3]_i_1_n_0 ),
        .Q(psum_k[3]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \drain_cnt_reg[4] 
       (.C(clk),
        .CE(\drain_cnt[4]_i_1_n_0 ),
        .D(\drain_cnt[4]_i_2_n_0 ),
        .Q(psum_k[4]),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \e_cnt[0]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\e_cnt_reg_n_0_[0] ),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \e_cnt[1]_i_1 
       (.I0(\e_cnt_reg_n_0_[0] ),
        .I1(\e_cnt_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[2] ),
        .O(\e_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \e_cnt[2]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\e_cnt_reg_n_0_[1] ),
        .I2(\e_cnt_reg_n_0_[0] ),
        .I3(\e_cnt_reg_n_0_[2] ),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \e_cnt[3]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\e_cnt_reg_n_0_[0] ),
        .I2(\e_cnt_reg_n_0_[1] ),
        .I3(\e_cnt_reg_n_0_[2] ),
        .I4(\e_cnt_reg_n_0_[3] ),
        .O(p_1_in[3]));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \e_cnt[4]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\e_cnt_reg_n_0_[2] ),
        .I2(\e_cnt_reg_n_0_[1] ),
        .I3(\e_cnt_reg_n_0_[0] ),
        .I4(\e_cnt_reg_n_0_[3] ),
        .I5(\e_cnt_reg_n_0_[4] ),
        .O(p_1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \e_cnt[5]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\e_cnt[5]_i_2_n_0 ),
        .I2(\e_cnt_reg_n_0_[5] ),
        .O(p_1_in[5]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \e_cnt[5]_i_2 
       (.I0(\e_cnt_reg_n_0_[3] ),
        .I1(\e_cnt_reg_n_0_[0] ),
        .I2(\e_cnt_reg_n_0_[1] ),
        .I3(\e_cnt_reg_n_0_[2] ),
        .I4(\e_cnt_reg_n_0_[4] ),
        .O(\e_cnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \e_cnt[6]_i_1 
       (.I0(\e_cnt[7]_i_3_n_0 ),
        .I1(\e_cnt_reg_n_0_[6] ),
        .I2(\state_reg_n_0_[2] ),
        .O(\e_cnt[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBAAAAAAA)) 
    \e_cnt[7]_i_1 
       (.I0(\k_cnt[4]_i_3_n_0 ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(ifmap_valid),
        .O(e_cnt));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \e_cnt[7]_i_2 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\e_cnt_reg_n_0_[6] ),
        .I2(\e_cnt[7]_i_3_n_0 ),
        .I3(\e_cnt_reg_n_0_[7] ),
        .O(p_1_in[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \e_cnt[7]_i_3 
       (.I0(\e_cnt_reg_n_0_[4] ),
        .I1(\e_cnt_reg_n_0_[2] ),
        .I2(\e_cnt_reg_n_0_[1] ),
        .I3(\e_cnt_reg_n_0_[0] ),
        .I4(\e_cnt_reg_n_0_[3] ),
        .I5(\e_cnt_reg_n_0_[5] ),
        .O(\e_cnt[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \e_cnt_reg[0] 
       (.C(clk),
        .CE(e_cnt),
        .D(p_1_in[0]),
        .Q(\e_cnt_reg_n_0_[0] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_cnt_reg[1] 
       (.C(clk),
        .CE(e_cnt),
        .D(\e_cnt[1]_i_1_n_0 ),
        .Q(\e_cnt_reg_n_0_[1] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_cnt_reg[2] 
       (.C(clk),
        .CE(e_cnt),
        .D(p_1_in[2]),
        .Q(\e_cnt_reg_n_0_[2] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_cnt_reg[3] 
       (.C(clk),
        .CE(e_cnt),
        .D(p_1_in[3]),
        .Q(\e_cnt_reg_n_0_[3] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_cnt_reg[4] 
       (.C(clk),
        .CE(e_cnt),
        .D(p_1_in[4]),
        .Q(\e_cnt_reg_n_0_[4] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_cnt_reg[5] 
       (.C(clk),
        .CE(e_cnt),
        .D(p_1_in[5]),
        .Q(\e_cnt_reg_n_0_[5] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_cnt_reg[6] 
       (.C(clk),
        .CE(e_cnt),
        .D(\e_cnt[6]_i_1_n_0 ),
        .Q(\e_cnt_reg_n_0_[6] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_cnt_reg[7] 
       (.C(clk),
        .CE(e_cnt),
        .D(p_1_in[7]),
        .Q(\e_cnt_reg_n_0_[7] ),
        .R(RSTA));
  FDSE #(
    .INIT(1'b1)) 
    \e_max_reg[0] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_e[0]),
        .Q(e_max[0]),
        .S(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_max_reg[1] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_e[1]),
        .Q(e_max[1]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_max_reg[2] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_e[2]),
        .Q(e_max[2]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_max_reg[3] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_e[3]),
        .Q(e_max[3]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_max_reg[4] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_e[4]),
        .Q(e_max[4]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_max_reg[5] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_e[5]),
        .Q(e_max[5]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_max_reg[6] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_e[6]),
        .Q(e_max[6]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \e_max_reg[7] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_e[7]),
        .Q(e_max[7]),
        .R(RSTA));
  LUT2 #(
    .INIT(4'h2)) 
    \fill_cnt[0]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\fill_cnt_reg_n_0_[0] ),
        .O(\fill_cnt[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h28)) 
    \fill_cnt[1]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\fill_cnt_reg_n_0_[0] ),
        .I2(\fill_cnt_reg_n_0_[1] ),
        .O(\fill_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \fill_cnt[2]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\fill_cnt_reg_n_0_[1] ),
        .I2(\fill_cnt_reg_n_0_[0] ),
        .I3(\fill_cnt_reg_n_0_[2] ),
        .O(\fill_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \fill_cnt[3]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\fill_cnt_reg_n_0_[0] ),
        .I2(\fill_cnt_reg_n_0_[1] ),
        .I3(\fill_cnt_reg_n_0_[2] ),
        .I4(\fill_cnt_reg_n_0_[3] ),
        .O(\fill_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000CA0000000A)) 
    \fill_cnt[4]_i_1 
       (.I0(start),
        .I1(ifmap_valid),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[1] ),
        .I5(\fill_cnt[4]_i_3_n_0 ),
        .O(\fill_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \fill_cnt[4]_i_2 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\fill_cnt_reg_n_0_[2] ),
        .I2(\fill_cnt_reg_n_0_[1] ),
        .I3(\fill_cnt_reg_n_0_[0] ),
        .I4(\fill_cnt_reg_n_0_[3] ),
        .I5(\fill_cnt_reg_n_0_[4] ),
        .O(\fill_cnt[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEFBFFBEFFEFBBFFE)) 
    \fill_cnt[4]_i_3 
       (.I0(\fill_cnt[4]_i_4_n_0 ),
        .I1(\fill_cnt_reg_n_0_[3] ),
        .I2(s_max[4]),
        .I3(\fill_cnt[4]_i_5_n_0 ),
        .I4(s_max[3]),
        .I5(\fill_cnt_reg_n_0_[4] ),
        .O(\fill_cnt[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF6FF9F6FFFF6FF)) 
    \fill_cnt[4]_i_4 
       (.I0(s_max[2]),
        .I1(\fill_cnt_reg_n_0_[2] ),
        .I2(\fill_cnt_reg_n_0_[1] ),
        .I3(s_max[0]),
        .I4(s_max[1]),
        .I5(\fill_cnt_reg_n_0_[0] ),
        .O(\fill_cnt[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \fill_cnt[4]_i_5 
       (.I0(s_max[0]),
        .I1(s_max[1]),
        .I2(s_max[2]),
        .O(\fill_cnt[4]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \fill_cnt_reg[0] 
       (.C(clk),
        .CE(\fill_cnt[4]_i_1_n_0 ),
        .D(\fill_cnt[0]_i_1_n_0 ),
        .Q(\fill_cnt_reg_n_0_[0] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \fill_cnt_reg[1] 
       (.C(clk),
        .CE(\fill_cnt[4]_i_1_n_0 ),
        .D(\fill_cnt[1]_i_1_n_0 ),
        .Q(\fill_cnt_reg_n_0_[1] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \fill_cnt_reg[2] 
       (.C(clk),
        .CE(\fill_cnt[4]_i_1_n_0 ),
        .D(\fill_cnt[2]_i_1_n_0 ),
        .Q(\fill_cnt_reg_n_0_[2] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \fill_cnt_reg[3] 
       (.C(clk),
        .CE(\fill_cnt[4]_i_1_n_0 ),
        .D(\fill_cnt[3]_i_1_n_0 ),
        .Q(\fill_cnt_reg_n_0_[3] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \fill_cnt_reg[4] 
       (.C(clk),
        .CE(\fill_cnt[4]_i_1_n_0 ),
        .D(\fill_cnt[4]_i_2_n_0 ),
        .Q(\fill_cnt_reg_n_0_[4] ),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \filt_base[0]_i_1 
       (.I0(filt_base0[0]),
        .I1(\k_cnt[4]_i_4_n_0 ),
        .O(\filt_base[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \filt_base[1]_i_1 
       (.I0(filt_base0[1]),
        .I1(\k_cnt[4]_i_4_n_0 ),
        .O(\filt_base[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \filt_base[2]_i_1 
       (.I0(filt_base0[2]),
        .I1(\k_cnt[4]_i_4_n_0 ),
        .O(\filt_base[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \filt_base[3]_i_1 
       (.I0(filt_base0[3]),
        .I1(\k_cnt[4]_i_4_n_0 ),
        .O(\filt_base[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \filt_base[3]_i_3 
       (.I0(\filt_base_reg_n_0_[3] ),
        .I1(s_max[3]),
        .O(\filt_base[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \filt_base[3]_i_4 
       (.I0(\filt_base_reg_n_0_[2] ),
        .I1(s_max[2]),
        .O(\filt_base[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \filt_base[3]_i_5 
       (.I0(\filt_base_reg_n_0_[1] ),
        .I1(s_max[1]),
        .O(\filt_base[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \filt_base[3]_i_6 
       (.I0(\filt_base_reg_n_0_[0] ),
        .I1(s_max[0]),
        .O(\filt_base[3]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \filt_base[4]_i_1 
       (.I0(filt_base0[4]),
        .I1(\k_cnt[4]_i_4_n_0 ),
        .O(\filt_base[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \filt_base[5]_i_1 
       (.I0(filt_base0[5]),
        .I1(\k_cnt[4]_i_4_n_0 ),
        .O(\filt_base[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \filt_base[6]_i_1 
       (.I0(filt_base0[6]),
        .I1(\k_cnt[4]_i_4_n_0 ),
        .O(\filt_base[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \filt_base[7]_i_1 
       (.I0(filt_base0[7]),
        .I1(\k_cnt[4]_i_4_n_0 ),
        .O(\filt_base[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \filt_base[7]_i_3 
       (.I0(\filt_base_reg_n_0_[4] ),
        .I1(s_max[4]),
        .O(\filt_base[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \filt_base_reg[0] 
       (.C(clk),
        .CE(filt_base),
        .D(\filt_base[0]_i_1_n_0 ),
        .Q(\filt_base_reg_n_0_[0] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \filt_base_reg[1] 
       (.C(clk),
        .CE(filt_base),
        .D(\filt_base[1]_i_1_n_0 ),
        .Q(\filt_base_reg_n_0_[1] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \filt_base_reg[2] 
       (.C(clk),
        .CE(filt_base),
        .D(\filt_base[2]_i_1_n_0 ),
        .Q(\filt_base_reg_n_0_[2] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \filt_base_reg[3] 
       (.C(clk),
        .CE(filt_base),
        .D(\filt_base[3]_i_1_n_0 ),
        .Q(\filt_base_reg_n_0_[3] ),
        .R(RSTA));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \filt_base_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\filt_base_reg[3]_i_2_n_0 ,\NLW_filt_base_reg[3]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\filt_base_reg_n_0_[3] ,\filt_base_reg_n_0_[2] ,\filt_base_reg_n_0_[1] ,\filt_base_reg_n_0_[0] }),
        .O(filt_base0[3:0]),
        .S({\filt_base[3]_i_3_n_0 ,\filt_base[3]_i_4_n_0 ,\filt_base[3]_i_5_n_0 ,\filt_base[3]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \filt_base_reg[4] 
       (.C(clk),
        .CE(filt_base),
        .D(\filt_base[4]_i_1_n_0 ),
        .Q(\filt_base_reg_n_0_[4] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \filt_base_reg[5] 
       (.C(clk),
        .CE(filt_base),
        .D(\filt_base[5]_i_1_n_0 ),
        .Q(\filt_base_reg_n_0_[5] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \filt_base_reg[6] 
       (.C(clk),
        .CE(filt_base),
        .D(\filt_base[6]_i_1_n_0 ),
        .Q(\filt_base_reg_n_0_[6] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \filt_base_reg[7] 
       (.C(clk),
        .CE(filt_base),
        .D(\filt_base[7]_i_1_n_0 ),
        .Q(\filt_base_reg_n_0_[7] ),
        .R(RSTA));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \filt_base_reg[7]_i_2 
       (.CI(\filt_base_reg[3]_i_2_n_0 ),
        .CO(\NLW_filt_base_reg[7]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\filt_base_reg_n_0_[4] }),
        .O(filt_base0[7:4]),
        .S({\filt_base_reg_n_0_[7] ,\filt_base_reg_n_0_[6] ,\filt_base_reg_n_0_[5] ,\filt_base[7]_i_3_n_0 }));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_0_63_0_2
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[0]),
        .DIB(filt_wdata[1]),
        .DIC(filt_wdata[2]),
        .DID(1'b0),
        .DOA(filt_spad_reg_0_63_0_2_n_0),
        .DOB(filt_spad_reg_0_63_0_2_n_1),
        .DOC(filt_spad_reg_0_63_0_2_n_2),
        .DOD(NLW_filt_spad_reg_0_63_0_2_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_0_63_0_2_i_1_n_0));
  LUT3 #(
    .INIT(8'h02)) 
    filt_spad_reg_0_63_0_2_i_1
       (.I0(filt_we),
        .I1(filt_waddr[6]),
        .I2(filt_waddr[7]),
        .O(filt_spad_reg_0_63_0_2_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 filt_spad_reg_0_63_0_2_i_2
       (.CI(filt_spad_reg_0_63_0_2_i_3_n_0),
        .CO(NLW_filt_spad_reg_0_63_0_2_i_2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\filt_base_reg_n_0_[4] }),
        .O(filt_addr[7:4]),
        .S({\filt_base_reg_n_0_[7] ,\filt_base_reg_n_0_[6] ,\filt_base_reg_n_0_[5] ,filt_spad_reg_0_63_0_2_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 filt_spad_reg_0_63_0_2_i_3
       (.CI(1'b0),
        .CO({filt_spad_reg_0_63_0_2_i_3_n_0,NLW_filt_spad_reg_0_63_0_2_i_3_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({\filt_base_reg_n_0_[3] ,\filt_base_reg_n_0_[2] ,\filt_base_reg_n_0_[1] ,\filt_base_reg_n_0_[0] }),
        .O(filt_addr[3:0]),
        .S({filt_spad_reg_0_63_0_2_i_5_n_0,filt_spad_reg_0_63_0_2_i_6_n_0,filt_spad_reg_0_63_0_2_i_7_n_0,filt_spad_reg_0_63_0_2_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    filt_spad_reg_0_63_0_2_i_4
       (.I0(\filt_base_reg_n_0_[4] ),
        .I1(s_cnt[4]),
        .O(filt_spad_reg_0_63_0_2_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    filt_spad_reg_0_63_0_2_i_5
       (.I0(\filt_base_reg_n_0_[3] ),
        .I1(s_cnt[3]),
        .O(filt_spad_reg_0_63_0_2_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    filt_spad_reg_0_63_0_2_i_6
       (.I0(\filt_base_reg_n_0_[2] ),
        .I1(s_cnt[2]),
        .O(filt_spad_reg_0_63_0_2_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    filt_spad_reg_0_63_0_2_i_7
       (.I0(\filt_base_reg_n_0_[1] ),
        .I1(s_cnt[1]),
        .O(filt_spad_reg_0_63_0_2_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    filt_spad_reg_0_63_0_2_i_8
       (.I0(\filt_base_reg_n_0_[0] ),
        .I1(s_cnt[0]),
        .O(filt_spad_reg_0_63_0_2_i_8_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_0_63_12_14
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[12]),
        .DIB(filt_wdata[13]),
        .DIC(filt_wdata[14]),
        .DID(1'b0),
        .DOA(filt_spad_reg_0_63_12_14_n_0),
        .DOB(filt_spad_reg_0_63_12_14_n_1),
        .DOC(filt_spad_reg_0_63_12_14_n_2),
        .DOD(NLW_filt_spad_reg_0_63_12_14_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_0_63_0_2_i_1_n_0));
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "15" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    filt_spad_reg_0_63_15_15
       (.A0(filt_waddr[0]),
        .A1(filt_waddr[1]),
        .A2(filt_waddr[2]),
        .A3(filt_waddr[3]),
        .A4(filt_waddr[4]),
        .A5(filt_waddr[5]),
        .D(filt_wdata[15]),
        .DPO(filt_spad_reg_0_63_15_15_n_0),
        .DPRA0(filt_addr[0]),
        .DPRA1(filt_addr[1]),
        .DPRA2(filt_addr[2]),
        .DPRA3(filt_addr[3]),
        .DPRA4(filt_addr[4]),
        .DPRA5(filt_addr[5]),
        .SPO(NLW_filt_spad_reg_0_63_15_15_SPO_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_0_63_3_5
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[3]),
        .DIB(filt_wdata[4]),
        .DIC(filt_wdata[5]),
        .DID(1'b0),
        .DOA(filt_spad_reg_0_63_3_5_n_0),
        .DOB(filt_spad_reg_0_63_3_5_n_1),
        .DOC(filt_spad_reg_0_63_3_5_n_2),
        .DOD(NLW_filt_spad_reg_0_63_3_5_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_0_63_6_8
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[6]),
        .DIB(filt_wdata[7]),
        .DIC(filt_wdata[8]),
        .DID(1'b0),
        .DOA(filt_spad_reg_0_63_6_8_n_0),
        .DOB(filt_spad_reg_0_63_6_8_n_1),
        .DOC(filt_spad_reg_0_63_6_8_n_2),
        .DOD(NLW_filt_spad_reg_0_63_6_8_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_0_63_9_11
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[9]),
        .DIB(filt_wdata[10]),
        .DIC(filt_wdata[11]),
        .DID(1'b0),
        .DOA(filt_spad_reg_0_63_9_11_n_0),
        .DOB(filt_spad_reg_0_63_9_11_n_1),
        .DOC(filt_spad_reg_0_63_9_11_n_2),
        .DOD(NLW_filt_spad_reg_0_63_9_11_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_0_63_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_128_191_0_2
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[0]),
        .DIB(filt_wdata[1]),
        .DIC(filt_wdata[2]),
        .DID(1'b0),
        .DOA(filt_spad_reg_128_191_0_2_n_0),
        .DOB(filt_spad_reg_128_191_0_2_n_1),
        .DOC(filt_spad_reg_128_191_0_2_n_2),
        .DOD(NLW_filt_spad_reg_128_191_0_2_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_128_191_0_2_i_1_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    filt_spad_reg_128_191_0_2_i_1
       (.I0(filt_waddr[6]),
        .I1(filt_waddr[7]),
        .I2(filt_we),
        .O(filt_spad_reg_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_128_191_12_14
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[12]),
        .DIB(filt_wdata[13]),
        .DIC(filt_wdata[14]),
        .DID(1'b0),
        .DOA(filt_spad_reg_128_191_12_14_n_0),
        .DOB(filt_spad_reg_128_191_12_14_n_1),
        .DOC(filt_spad_reg_128_191_12_14_n_2),
        .DOD(NLW_filt_spad_reg_128_191_12_14_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_128_191_0_2_i_1_n_0));
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "15" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    filt_spad_reg_128_191_15_15
       (.A0(filt_waddr[0]),
        .A1(filt_waddr[1]),
        .A2(filt_waddr[2]),
        .A3(filt_waddr[3]),
        .A4(filt_waddr[4]),
        .A5(filt_waddr[5]),
        .D(filt_wdata[15]),
        .DPO(filt_spad_reg_128_191_15_15_n_0),
        .DPRA0(filt_addr[0]),
        .DPRA1(filt_addr[1]),
        .DPRA2(filt_addr[2]),
        .DPRA3(filt_addr[3]),
        .DPRA4(filt_addr[4]),
        .DPRA5(filt_addr[5]),
        .SPO(NLW_filt_spad_reg_128_191_15_15_SPO_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_128_191_3_5
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[3]),
        .DIB(filt_wdata[4]),
        .DIC(filt_wdata[5]),
        .DID(1'b0),
        .DOA(filt_spad_reg_128_191_3_5_n_0),
        .DOB(filt_spad_reg_128_191_3_5_n_1),
        .DOC(filt_spad_reg_128_191_3_5_n_2),
        .DOD(NLW_filt_spad_reg_128_191_3_5_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_128_191_6_8
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[6]),
        .DIB(filt_wdata[7]),
        .DIC(filt_wdata[8]),
        .DID(1'b0),
        .DOA(filt_spad_reg_128_191_6_8_n_0),
        .DOB(filt_spad_reg_128_191_6_8_n_1),
        .DOC(filt_spad_reg_128_191_6_8_n_2),
        .DOD(NLW_filt_spad_reg_128_191_6_8_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "128" *) 
  (* ram_addr_end = "191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_128_191_9_11
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[9]),
        .DIB(filt_wdata[10]),
        .DIC(filt_wdata[11]),
        .DID(1'b0),
        .DOA(filt_spad_reg_128_191_9_11_n_0),
        .DOB(filt_spad_reg_128_191_9_11_n_1),
        .DOC(filt_spad_reg_128_191_9_11_n_2),
        .DOD(NLW_filt_spad_reg_128_191_9_11_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_128_191_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "223" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_192_255_0_2
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[0]),
        .DIB(filt_wdata[1]),
        .DIC(filt_wdata[2]),
        .DID(1'b0),
        .DOA(filt_spad_reg_192_255_0_2_n_0),
        .DOB(filt_spad_reg_192_255_0_2_n_1),
        .DOC(filt_spad_reg_192_255_0_2_n_2),
        .DOD(NLW_filt_spad_reg_192_255_0_2_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_192_255_0_2_i_1_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    filt_spad_reg_192_255_0_2_i_1
       (.I0(filt_we),
        .I1(filt_waddr[6]),
        .I2(filt_waddr[7]),
        .O(filt_spad_reg_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "223" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_192_255_12_14
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[12]),
        .DIB(filt_wdata[13]),
        .DIC(filt_wdata[14]),
        .DID(1'b0),
        .DOA(filt_spad_reg_192_255_12_14_n_0),
        .DOB(filt_spad_reg_192_255_12_14_n_1),
        .DOC(filt_spad_reg_192_255_12_14_n_2),
        .DOD(NLW_filt_spad_reg_192_255_12_14_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_192_255_0_2_i_1_n_0));
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "223" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "15" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    filt_spad_reg_192_255_15_15
       (.A0(filt_waddr[0]),
        .A1(filt_waddr[1]),
        .A2(filt_waddr[2]),
        .A3(filt_waddr[3]),
        .A4(filt_waddr[4]),
        .A5(filt_waddr[5]),
        .D(filt_wdata[15]),
        .DPO(filt_spad_reg_192_255_15_15_n_0),
        .DPRA0(filt_addr[0]),
        .DPRA1(filt_addr[1]),
        .DPRA2(filt_addr[2]),
        .DPRA3(filt_addr[3]),
        .DPRA4(filt_addr[4]),
        .DPRA5(filt_addr[5]),
        .SPO(NLW_filt_spad_reg_192_255_15_15_SPO_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "223" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_192_255_3_5
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[3]),
        .DIB(filt_wdata[4]),
        .DIC(filt_wdata[5]),
        .DID(1'b0),
        .DOA(filt_spad_reg_192_255_3_5_n_0),
        .DOB(filt_spad_reg_192_255_3_5_n_1),
        .DOC(filt_spad_reg_192_255_3_5_n_2),
        .DOD(NLW_filt_spad_reg_192_255_3_5_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "223" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_192_255_6_8
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[6]),
        .DIB(filt_wdata[7]),
        .DIC(filt_wdata[8]),
        .DID(1'b0),
        .DOA(filt_spad_reg_192_255_6_8_n_0),
        .DOB(filt_spad_reg_192_255_6_8_n_1),
        .DOC(filt_spad_reg_192_255_6_8_n_2),
        .DOD(NLW_filt_spad_reg_192_255_6_8_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "192" *) 
  (* ram_addr_end = "223" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_192_255_9_11
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[9]),
        .DIB(filt_wdata[10]),
        .DIC(filt_wdata[11]),
        .DID(1'b0),
        .DOA(filt_spad_reg_192_255_9_11_n_0),
        .DOB(filt_spad_reg_192_255_9_11_n_1),
        .DOC(filt_spad_reg_192_255_9_11_n_2),
        .DOD(NLW_filt_spad_reg_192_255_9_11_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_192_255_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_64_127_0_2
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[0]),
        .DIB(filt_wdata[1]),
        .DIC(filt_wdata[2]),
        .DID(1'b0),
        .DOA(filt_spad_reg_64_127_0_2_n_0),
        .DOB(filt_spad_reg_64_127_0_2_n_1),
        .DOC(filt_spad_reg_64_127_0_2_n_2),
        .DOD(NLW_filt_spad_reg_64_127_0_2_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_64_127_0_2_i_1_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    filt_spad_reg_64_127_0_2_i_1
       (.I0(filt_waddr[7]),
        .I1(filt_waddr[6]),
        .I2(filt_we),
        .O(filt_spad_reg_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "14" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_64_127_12_14
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[12]),
        .DIB(filt_wdata[13]),
        .DIC(filt_wdata[14]),
        .DID(1'b0),
        .DOA(filt_spad_reg_64_127_12_14_n_0),
        .DOB(filt_spad_reg_64_127_12_14_n_1),
        .DOC(filt_spad_reg_64_127_12_14_n_2),
        .DOD(NLW_filt_spad_reg_64_127_12_14_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_64_127_0_2_i_1_n_0));
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "15" *) 
  RAM64X1D #(
    .INIT(64'h0000000000000000)) 
    filt_spad_reg_64_127_15_15
       (.A0(filt_waddr[0]),
        .A1(filt_waddr[1]),
        .A2(filt_waddr[2]),
        .A3(filt_waddr[3]),
        .A4(filt_waddr[4]),
        .A5(filt_waddr[5]),
        .D(filt_wdata[15]),
        .DPO(filt_spad_reg_64_127_15_15_n_0),
        .DPRA0(filt_addr[0]),
        .DPRA1(filt_addr[1]),
        .DPRA2(filt_addr[2]),
        .DPRA3(filt_addr[3]),
        .DPRA4(filt_addr[4]),
        .DPRA5(filt_addr[5]),
        .SPO(NLW_filt_spad_reg_64_127_15_15_SPO_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_64_127_3_5
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[3]),
        .DIB(filt_wdata[4]),
        .DIC(filt_wdata[5]),
        .DID(1'b0),
        .DOA(filt_spad_reg_64_127_3_5_n_0),
        .DOB(filt_spad_reg_64_127_3_5_n_1),
        .DOC(filt_spad_reg_64_127_3_5_n_2),
        .DOD(NLW_filt_spad_reg_64_127_3_5_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_64_127_6_8
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[6]),
        .DIB(filt_wdata[7]),
        .DIC(filt_wdata[8]),
        .DID(1'b0),
        .DOA(filt_spad_reg_64_127_6_8_n_0),
        .DOB(filt_spad_reg_64_127_6_8_n_1),
        .DOC(filt_spad_reg_64_127_6_8_n_2),
        .DOD(NLW_filt_spad_reg_64_127_6_8_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_64_127_0_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "3584" *) 
  (* RTL_RAM_NAME = "filt_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "64" *) 
  (* ram_addr_end = "127" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "11" *) 
  RAM64M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    filt_spad_reg_64_127_9_11
       (.ADDRA(filt_addr[5:0]),
        .ADDRB(filt_addr[5:0]),
        .ADDRC(filt_addr[5:0]),
        .ADDRD(filt_waddr[5:0]),
        .DIA(filt_wdata[9]),
        .DIB(filt_wdata[10]),
        .DIC(filt_wdata[11]),
        .DID(1'b0),
        .DOA(filt_spad_reg_64_127_9_11_n_0),
        .DOB(filt_spad_reg_64_127_9_11_n_1),
        .DOC(filt_spad_reg_64_127_9_11_n_2),
        .DOD(NLW_filt_spad_reg_64_127_9_11_DOD_UNCONNECTED),
        .WCLK(clk),
        .WE(filt_spad_reg_64_127_0_2_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    gate_en_r_reg
       (.C(clk),
        .CE(shift_r),
        .D(cfg_gate_en),
        .Q(gate_en_r),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    gate_r_i_1
       (.I0(gate_r_i_2_n_0),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[2] ),
        .O(gate_r0));
  LUT6 #(
    .INIT(64'hFF00B8B800000000)) 
    gate_r_i_2
       (.I0(gate_r_i_3_n_0),
        .I1(if_idx[2]),
        .I2(gate_r_i_4_n_0),
        .I3(gate_r_i_5_n_0),
        .I4(if_idx[3]),
        .I5(gate_en_r),
        .O(gate_r_i_2_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    gate_r_i_3
       (.I0(zero_buf[7]),
        .I1(zero_buf[6]),
        .I2(if_idx[1]),
        .I3(zero_buf[5]),
        .I4(if_idx[0]),
        .I5(zero_buf[4]),
        .O(gate_r_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    gate_r_i_4
       (.I0(zero_buf[3]),
        .I1(zero_buf[2]),
        .I2(if_idx[1]),
        .I3(zero_buf[1]),
        .I4(if_idx[0]),
        .I5(zero_buf[0]),
        .O(gate_r_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    gate_r_i_5
       (.I0(zero_buf[11]),
        .I1(zero_buf[10]),
        .I2(if_idx[1]),
        .I3(zero_buf[9]),
        .I4(if_idx[0]),
        .I5(zero_buf[8]),
        .O(gate_r_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    gate_r_reg
       (.C(clk),
        .CE(1'b1),
        .D(gate_r0),
        .Q(gate_r),
        .R(RSTA));
  LUT2 #(
    .INIT(4'h2)) 
    ifmap_req_INST_0
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[1] ),
        .O(ifmap_req));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "192" *) 
  (* RTL_RAM_NAME = "ifmap_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "11" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ifmap_spad_reg_r1_0_15_0_5
       (.ADDRA({1'b0,wr_idx[3:2],ifmap_spad_reg_r1_0_15_0_5_i_9_n_0,wr_idx[0]}),
        .ADDRB({1'b0,wr_idx[3:2],ifmap_spad_reg_r1_0_15_0_5_i_9_n_0,wr_idx[0]}),
        .ADDRC({1'b0,wr_idx[3:2],ifmap_spad_reg_r1_0_15_0_5_i_9_n_0,wr_idx[0]}),
        .ADDRD({1'b0,ifmap_spad_reg_r1_0_15_0_5_i_11_n_0,ifmap_spad_reg_r1_0_15_0_5_i_12_n_0,ifmap_spad_reg_r1_0_15_0_5_i_13_n_0,ifmap_spad_reg_r1_0_15_0_5_i_14_n_0}),
        .DIA(p_2_in[1:0]),
        .DIB(p_2_in[3:2]),
        .DIC(p_2_in[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(p_0_out[1:0]),
        .DOB(p_0_out[3:2]),
        .DOC(p_0_out[5:4]),
        .DOD(NLW_ifmap_spad_reg_r1_0_15_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(rst_n));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_0_5_i_1
       (.I0(ifmap_data[1]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[1]),
        .O(p_2_in[1]));
  LUT2 #(
    .INIT(4'h6)) 
    ifmap_spad_reg_r1_0_15_0_5_i_10
       (.I0(s_max[0]),
        .I1(rbase[0]),
        .O(wr_idx[0]));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    ifmap_spad_reg_r1_0_15_0_5_i_11
       (.I0(\fill_cnt_reg_n_0_[3] ),
        .I1(ifmap_valid),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[1] ),
        .I5(wr_idx[3]),
        .O(ifmap_spad_reg_r1_0_15_0_5_i_11_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    ifmap_spad_reg_r1_0_15_0_5_i_12
       (.I0(\fill_cnt_reg_n_0_[2] ),
        .I1(ifmap_valid),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[1] ),
        .I5(wr_idx[2]),
        .O(ifmap_spad_reg_r1_0_15_0_5_i_12_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    ifmap_spad_reg_r1_0_15_0_5_i_13
       (.I0(\fill_cnt_reg_n_0_[1] ),
        .I1(ifmap_valid),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[1] ),
        .I5(ifmap_spad_reg_r1_0_15_0_5_i_9_n_0),
        .O(ifmap_spad_reg_r1_0_15_0_5_i_13_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    ifmap_spad_reg_r1_0_15_0_5_i_14
       (.I0(\fill_cnt_reg_n_0_[0] ),
        .I1(ifmap_valid),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[1] ),
        .I5(wr_idx[0]),
        .O(ifmap_spad_reg_r1_0_15_0_5_i_14_n_0));
  LUT4 #(
    .INIT(16'hE888)) 
    ifmap_spad_reg_r1_0_15_0_5_i_15
       (.I0(s_max[1]),
        .I1(rbase[1]),
        .I2(s_max[0]),
        .I3(rbase[0]),
        .O(ifmap_spad_reg_r1_0_15_0_5_i_15_n_0));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_0_5_i_2
       (.I0(ifmap_data[0]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[0]),
        .O(p_2_in[0]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_0_5_i_3
       (.I0(ifmap_data[3]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[3]),
        .O(p_2_in[3]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_0_5_i_4
       (.I0(ifmap_data[2]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[2]),
        .O(p_2_in[2]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_0_5_i_5
       (.I0(ifmap_data[5]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[5]),
        .O(p_2_in[5]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_0_5_i_6
       (.I0(ifmap_data[4]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[4]),
        .O(p_2_in[4]));
  LUT6 #(
    .INIT(64'h3DD4400340033EE8)) 
    ifmap_spad_reg_r1_0_15_0_5_i_7
       (.I0(s_max[4]),
        .I1(s_max[2]),
        .I2(rbase[2]),
        .I3(ifmap_spad_reg_r1_0_15_0_5_i_15_n_0),
        .I4(rbase[3]),
        .I5(s_max[3]),
        .O(wr_idx[3]));
  LUT6 #(
    .INIT(64'h1669944294422996)) 
    ifmap_spad_reg_r1_0_15_0_5_i_8
       (.I0(s_max[4]),
        .I1(s_max[2]),
        .I2(rbase[2]),
        .I3(ifmap_spad_reg_r1_0_15_0_5_i_15_n_0),
        .I4(rbase[3]),
        .I5(s_max[3]),
        .O(wr_idx[2]));
  LUT4 #(
    .INIT(16'h8778)) 
    ifmap_spad_reg_r1_0_15_0_5_i_9
       (.I0(rbase[0]),
        .I1(s_max[0]),
        .I2(rbase[1]),
        .I3(s_max[1]),
        .O(ifmap_spad_reg_r1_0_15_0_5_i_9_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "192" *) 
  (* RTL_RAM_NAME = "ifmap_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "11" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "15" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ifmap_spad_reg_r1_0_15_12_15
       (.ADDRA({1'b0,wr_idx[3:2],ifmap_spad_reg_r1_0_15_0_5_i_9_n_0,wr_idx[0]}),
        .ADDRB({1'b0,wr_idx[3:2],ifmap_spad_reg_r1_0_15_0_5_i_9_n_0,wr_idx[0]}),
        .ADDRC({1'b0,wr_idx[3:2],ifmap_spad_reg_r1_0_15_0_5_i_9_n_0,wr_idx[0]}),
        .ADDRD({1'b0,ifmap_spad_reg_r1_0_15_0_5_i_11_n_0,ifmap_spad_reg_r1_0_15_0_5_i_12_n_0,ifmap_spad_reg_r1_0_15_0_5_i_13_n_0,ifmap_spad_reg_r1_0_15_0_5_i_14_n_0}),
        .DIA(p_2_in[13:12]),
        .DIB(p_2_in[15:14]),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(p_0_out[13:12]),
        .DOB(p_0_out[15:14]),
        .DOC(NLW_ifmap_spad_reg_r1_0_15_12_15_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_ifmap_spad_reg_r1_0_15_12_15_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(rst_n));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_12_15_i_1
       (.I0(ifmap_data[13]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[13]),
        .O(p_2_in[13]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_12_15_i_2
       (.I0(ifmap_data[12]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[12]),
        .O(p_2_in[12]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_12_15_i_3
       (.I0(ifmap_data[15]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[15]),
        .O(p_2_in[15]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_12_15_i_4
       (.I0(ifmap_data[14]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[14]),
        .O(p_2_in[14]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "192" *) 
  (* RTL_RAM_NAME = "ifmap_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "11" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "11" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ifmap_spad_reg_r1_0_15_6_11
       (.ADDRA({1'b0,wr_idx[3:2],ifmap_spad_reg_r1_0_15_0_5_i_9_n_0,wr_idx[0]}),
        .ADDRB({1'b0,wr_idx[3:2],ifmap_spad_reg_r1_0_15_0_5_i_9_n_0,wr_idx[0]}),
        .ADDRC({1'b0,wr_idx[3:2],ifmap_spad_reg_r1_0_15_0_5_i_9_n_0,wr_idx[0]}),
        .ADDRD({1'b0,ifmap_spad_reg_r1_0_15_0_5_i_11_n_0,ifmap_spad_reg_r1_0_15_0_5_i_12_n_0,ifmap_spad_reg_r1_0_15_0_5_i_13_n_0,ifmap_spad_reg_r1_0_15_0_5_i_14_n_0}),
        .DIA(p_2_in[7:6]),
        .DIB(p_2_in[9:8]),
        .DIC(p_2_in[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(p_0_out[7:6]),
        .DOB(p_0_out[9:8]),
        .DOC(p_0_out[11:10]),
        .DOD(NLW_ifmap_spad_reg_r1_0_15_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(rst_n));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_6_11_i_1
       (.I0(ifmap_data[7]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[7]),
        .O(p_2_in[7]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_6_11_i_2
       (.I0(ifmap_data[6]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[6]),
        .O(p_2_in[6]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_6_11_i_3
       (.I0(ifmap_data[9]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[9]),
        .O(p_2_in[9]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_6_11_i_4
       (.I0(ifmap_data[8]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[8]),
        .O(p_2_in[8]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_6_11_i_5
       (.I0(ifmap_data[11]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[11]),
        .O(p_2_in[11]));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    ifmap_spad_reg_r1_0_15_6_11_i_6
       (.I0(ifmap_data[10]),
        .I1(\state_reg_n_0_[1] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(p_0_out[10]),
        .O(p_2_in[10]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "192" *) 
  (* RTL_RAM_NAME = "ifmap_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "11" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ifmap_spad_reg_r2_0_15_0_5
       (.ADDRA({1'b0,if_idx}),
        .ADDRB({1'b0,if_idx}),
        .ADDRC({1'b0,if_idx}),
        .ADDRD({1'b0,ifmap_spad_reg_r1_0_15_0_5_i_11_n_0,ifmap_spad_reg_r1_0_15_0_5_i_12_n_0,ifmap_spad_reg_r1_0_15_0_5_i_13_n_0,ifmap_spad_reg_r1_0_15_0_5_i_14_n_0}),
        .DIA(p_2_in[1:0]),
        .DIB(p_2_in[3:2]),
        .DIC(p_2_in[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(x_r0[1:0]),
        .DOB(x_r0[3:2]),
        .DOC(x_r0[5:4]),
        .DOD(NLW_ifmap_spad_reg_r2_0_15_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(rst_n));
  LUT6 #(
    .INIT(64'h9019196196898968)) 
    ifmap_spad_reg_r2_0_15_0_5_i_1
       (.I0(s_cnt[3]),
        .I1(rbase[3]),
        .I2(ifmap_spad_reg_r2_0_15_0_5_i_5_n_0),
        .I3(rbase[2]),
        .I4(s_cnt[2]),
        .I5(s_cnt[4]),
        .O(if_idx[3]));
  LUT6 #(
    .INIT(64'h5681816A28565681)) 
    ifmap_spad_reg_r2_0_15_0_5_i_2
       (.I0(s_cnt[4]),
        .I1(rbase[3]),
        .I2(s_cnt[3]),
        .I3(s_cnt[2]),
        .I4(rbase[2]),
        .I5(ifmap_spad_reg_r2_0_15_0_5_i_5_n_0),
        .O(if_idx[2]));
  LUT4 #(
    .INIT(16'h8778)) 
    ifmap_spad_reg_r2_0_15_0_5_i_3
       (.I0(rbase[0]),
        .I1(s_cnt[0]),
        .I2(s_cnt[1]),
        .I3(rbase[1]),
        .O(if_idx[1]));
  LUT2 #(
    .INIT(4'h6)) 
    ifmap_spad_reg_r2_0_15_0_5_i_4
       (.I0(s_cnt[0]),
        .I1(rbase[0]),
        .O(if_idx[0]));
  LUT4 #(
    .INIT(16'h157F)) 
    ifmap_spad_reg_r2_0_15_0_5_i_5
       (.I0(rbase[1]),
        .I1(rbase[0]),
        .I2(s_cnt[0]),
        .I3(s_cnt[1]),
        .O(ifmap_spad_reg_r2_0_15_0_5_i_5_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "192" *) 
  (* RTL_RAM_NAME = "ifmap_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "11" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "15" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ifmap_spad_reg_r2_0_15_12_15
       (.ADDRA({1'b0,if_idx}),
        .ADDRB({1'b0,if_idx}),
        .ADDRC({1'b0,if_idx}),
        .ADDRD({1'b0,ifmap_spad_reg_r1_0_15_0_5_i_11_n_0,ifmap_spad_reg_r1_0_15_0_5_i_12_n_0,ifmap_spad_reg_r1_0_15_0_5_i_13_n_0,ifmap_spad_reg_r1_0_15_0_5_i_14_n_0}),
        .DIA(p_2_in[13:12]),
        .DIB(p_2_in[15:14]),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(x_r0[13:12]),
        .DOB(x_r0[15:14]),
        .DOC(NLW_ifmap_spad_reg_r2_0_15_12_15_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_ifmap_spad_reg_r2_0_15_12_15_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(rst_n));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "192" *) 
  (* RTL_RAM_NAME = "ifmap_spad" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "11" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "11" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    ifmap_spad_reg_r2_0_15_6_11
       (.ADDRA({1'b0,if_idx}),
        .ADDRB({1'b0,if_idx}),
        .ADDRC({1'b0,if_idx}),
        .ADDRD({1'b0,ifmap_spad_reg_r1_0_15_0_5_i_11_n_0,ifmap_spad_reg_r1_0_15_0_5_i_12_n_0,ifmap_spad_reg_r1_0_15_0_5_i_13_n_0,ifmap_spad_reg_r1_0_15_0_5_i_14_n_0}),
        .DIA(p_2_in[7:6]),
        .DIB(p_2_in[9:8]),
        .DIC(p_2_in[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(x_r0[7:6]),
        .DOB(x_r0[9:8]),
        .DOC(x_r0[11:10]),
        .DOD(NLW_ifmap_spad_reg_r2_0_15_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(rst_n));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \k_cnt[0]_i_1 
       (.I0(\k_cnt[4]_i_4_n_0 ),
        .I1(k_cnt[0]),
        .O(\k_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \k_cnt[1]_i_1 
       (.I0(\k_cnt[4]_i_4_n_0 ),
        .I1(k_cnt[0]),
        .I2(k_cnt[1]),
        .O(\k_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \k_cnt[2]_i_1 
       (.I0(\k_cnt[4]_i_4_n_0 ),
        .I1(k_cnt[1]),
        .I2(k_cnt[0]),
        .I3(k_cnt[2]),
        .O(\k_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \k_cnt[3]_i_1 
       (.I0(\k_cnt[4]_i_4_n_0 ),
        .I1(k_cnt[0]),
        .I2(k_cnt[1]),
        .I3(k_cnt[2]),
        .I4(k_cnt[3]),
        .O(\k_cnt[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBAAEAAAE)) 
    \k_cnt[4]_i_1 
       (.I0(\k_cnt[4]_i_3_n_0 ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(ifmap_valid),
        .O(filt_base));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \k_cnt[4]_i_2 
       (.I0(\k_cnt[4]_i_4_n_0 ),
        .I1(k_cnt[3]),
        .I2(k_cnt[2]),
        .I3(k_cnt[1]),
        .I4(k_cnt[0]),
        .I5(k_cnt[4]),
        .O(\k_cnt[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0008)) 
    \k_cnt[4]_i_3 
       (.I0(\state_reg_n_0_[0] ),
        .I1(ifmap_valid),
        .I2(\state_reg_n_0_[1] ),
        .I3(\fill_cnt[4]_i_3_n_0 ),
        .O(\k_cnt[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \k_cnt[4]_i_4 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\s_cnt[4]_i_3_n_0 ),
        .O(\k_cnt[4]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \k_cnt_reg[0] 
       (.C(clk),
        .CE(filt_base),
        .D(\k_cnt[0]_i_1_n_0 ),
        .Q(k_cnt[0]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \k_cnt_reg[1] 
       (.C(clk),
        .CE(filt_base),
        .D(\k_cnt[1]_i_1_n_0 ),
        .Q(k_cnt[1]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \k_cnt_reg[2] 
       (.C(clk),
        .CE(filt_base),
        .D(\k_cnt[2]_i_1_n_0 ),
        .Q(k_cnt[2]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \k_cnt_reg[3] 
       (.C(clk),
        .CE(filt_base),
        .D(\k_cnt[3]_i_1_n_0 ),
        .Q(k_cnt[3]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \k_cnt_reg[4] 
       (.C(clk),
        .CE(filt_base),
        .D(\k_cnt[4]_i_2_n_0 ),
        .Q(k_cnt[4]),
        .R(RSTA));
  LUT3 #(
    .INIT(8'h10)) 
    \k_r[4]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[1] ),
        .O(\k_r[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \k_r_reg[0] 
       (.C(clk),
        .CE(\k_r[4]_i_1_n_0 ),
        .D(k_cnt[0]),
        .Q(k_r[0]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \k_r_reg[1] 
       (.C(clk),
        .CE(\k_r[4]_i_1_n_0 ),
        .D(k_cnt[1]),
        .Q(k_r[1]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \k_r_reg[2] 
       (.C(clk),
        .CE(\k_r[4]_i_1_n_0 ),
        .D(k_cnt[2]),
        .Q(k_r[2]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \k_r_reg[3] 
       (.C(clk),
        .CE(\k_r[4]_i_1_n_0 ),
        .D(k_cnt[3]),
        .Q(k_r[3]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \k_r_reg[4] 
       (.C(clk),
        .CE(\k_r[4]_i_1_n_0 ),
        .D(k_cnt[4]),
        .Q(k_r[4]),
        .R(RSTA));
  FDSE #(
    .INIT(1'b1)) 
    \p_max_reg[0] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_p[0]),
        .Q(p_max[0]),
        .S(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \p_max_reg[1] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_p[1]),
        .Q(p_max[1]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \p_max_reg[2] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_p[2]),
        .Q(p_max[2]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \p_max_reg[3] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_p[3]),
        .Q(p_max[3]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \p_max_reg[4] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_p[4]),
        .Q(p_max[4]),
        .R(RSTA));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-11 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    product
       (.A({x_r0[15],x_r0[15],x_r0[15],x_r0[15],x_r0[15],x_r0[15],x_r0[15],x_r0[15],x_r0[15],x_r0[15],x_r0[15],x_r0[15],x_r0[15],x_r0[15],x_r0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_product_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({w_r0[15],w_r0[15],w_r0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_product_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_product_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_product_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(ifmap_rd_en),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(filt_rd_en),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_product_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_product_OVERFLOW_UNCONNECTED),
        .P({NLW_product_P_UNCONNECTED[47:32],product_n_74,product_n_75,product_n_76,product_n_77,product_n_78,product_n_79,product_n_80,product_n_81,product_n_82,product_n_83,product_n_84,product_n_85,product_n_86,product_n_87,product_n_88,product_n_89,product_n_90,product_n_91,product_n_92,product_n_93,product_n_94,product_n_95,product_n_96,product_n_97,product_n_98,product_n_99,product_n_100,product_n_101,product_n_102,product_n_103,product_n_104,product_n_105}),
        .PATTERNBDETECT(NLW_product_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_product_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_product_PCOUT_UNCONNECTED[47:0]),
        .RSTA(RSTA),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_product_UNDERFLOW_UNCONNECTED));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    product_i_1
       (.I0(filt_rd_en),
        .I1(k_cnt[4]),
        .I2(k_cnt[3]),
        .I3(k_cnt[2]),
        .I4(k_cnt[1]),
        .I5(k_cnt[0]),
        .O(ifmap_rd_en));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_10
       (.I0(filt_spad_reg_192_255_6_8_n_2),
        .I1(filt_spad_reg_128_191_6_8_n_2),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_6_8_n_2),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_6_8_n_2),
        .O(w_r0[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_11
       (.I0(filt_spad_reg_192_255_6_8_n_1),
        .I1(filt_spad_reg_128_191_6_8_n_1),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_6_8_n_1),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_6_8_n_1),
        .O(w_r0[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_12
       (.I0(filt_spad_reg_192_255_6_8_n_0),
        .I1(filt_spad_reg_128_191_6_8_n_0),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_6_8_n_0),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_6_8_n_0),
        .O(w_r0[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_13
       (.I0(filt_spad_reg_192_255_3_5_n_2),
        .I1(filt_spad_reg_128_191_3_5_n_2),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_3_5_n_2),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_3_5_n_2),
        .O(w_r0[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_14
       (.I0(filt_spad_reg_192_255_3_5_n_1),
        .I1(filt_spad_reg_128_191_3_5_n_1),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_3_5_n_1),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_3_5_n_1),
        .O(w_r0[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_15
       (.I0(filt_spad_reg_192_255_3_5_n_0),
        .I1(filt_spad_reg_128_191_3_5_n_0),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_3_5_n_0),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_3_5_n_0),
        .O(w_r0[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_16
       (.I0(filt_spad_reg_192_255_0_2_n_2),
        .I1(filt_spad_reg_128_191_0_2_n_2),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_0_2_n_2),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_0_2_n_2),
        .O(w_r0[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_17
       (.I0(filt_spad_reg_192_255_0_2_n_1),
        .I1(filt_spad_reg_128_191_0_2_n_1),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_0_2_n_1),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_0_2_n_1),
        .O(w_r0[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_18
       (.I0(filt_spad_reg_192_255_0_2_n_0),
        .I1(filt_spad_reg_128_191_0_2_n_0),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_0_2_n_0),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_0_2_n_0),
        .O(w_r0[0]));
  LUT4 #(
    .INIT(16'h0002)) 
    product_i_2
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[2] ),
        .I3(gate_r_i_2_n_0),
        .O(filt_rd_en));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_3
       (.I0(filt_spad_reg_192_255_15_15_n_0),
        .I1(filt_spad_reg_128_191_15_15_n_0),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_15_15_n_0),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_15_15_n_0),
        .O(w_r0[15]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_4
       (.I0(filt_spad_reg_192_255_12_14_n_2),
        .I1(filt_spad_reg_128_191_12_14_n_2),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_12_14_n_2),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_12_14_n_2),
        .O(w_r0[14]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_5
       (.I0(filt_spad_reg_192_255_12_14_n_1),
        .I1(filt_spad_reg_128_191_12_14_n_1),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_12_14_n_1),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_12_14_n_1),
        .O(w_r0[13]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_6
       (.I0(filt_spad_reg_192_255_12_14_n_0),
        .I1(filt_spad_reg_128_191_12_14_n_0),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_12_14_n_0),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_12_14_n_0),
        .O(w_r0[12]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_7
       (.I0(filt_spad_reg_192_255_9_11_n_2),
        .I1(filt_spad_reg_128_191_9_11_n_2),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_9_11_n_2),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_9_11_n_2),
        .O(w_r0[11]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_8
       (.I0(filt_spad_reg_192_255_9_11_n_1),
        .I1(filt_spad_reg_128_191_9_11_n_1),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_9_11_n_1),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_9_11_n_1),
        .O(w_r0[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    product_i_9
       (.I0(filt_spad_reg_192_255_9_11_n_0),
        .I1(filt_spad_reg_128_191_9_11_n_0),
        .I2(filt_addr[7]),
        .I3(filt_spad_reg_64_127_9_11_n_0),
        .I4(filt_addr[6]),
        .I5(filt_spad_reg_0_63_9_11_n_0),
        .O(w_r0[9]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[0]_INST_0 
       (.I0(\psum_out[0]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[0]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[0]_INST_0_i_3_n_0 ),
        .O(psum_out[0]));
  MUXF7 \psum_out[0]_INST_0_i_1 
       (.I0(\psum_out[0]_INST_0_i_4_n_0 ),
        .I1(\psum_out[0]_INST_0_i_5_n_0 ),
        .O(\psum_out[0]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[0]_INST_0_i_2 
       (.I0(\psum_out[0]_INST_0_i_6_n_0 ),
        .I1(\psum_out[0]_INST_0_i_7_n_0 ),
        .O(\psum_out[0]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[0]_INST_0_i_3 
       (.I0(\psum_out[0]_INST_0_i_8_n_0 ),
        .I1(\psum_out[0]_INST_0_i_9_n_0 ),
        .O(\psum_out[0]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[0]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [0]),
        .I1(\psum_spad_reg[18] [0]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [0]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [0]),
        .O(\psum_out[0]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[0]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [0]),
        .I1(\psum_spad_reg[22] [0]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [0]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [0]),
        .O(\psum_out[0]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[0]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [0]),
        .I1(\psum_spad_reg[10] [0]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [0]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [0]),
        .O(\psum_out[0]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[0]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [0]),
        .I1(\psum_spad_reg[14] [0]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [0]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [0]),
        .O(\psum_out[0]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[0]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [0]),
        .I1(\psum_spad_reg[2] [0]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [0]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [0]),
        .O(\psum_out[0]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[0]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [0]),
        .I1(\psum_spad_reg[6] [0]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [0]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [0]),
        .O(\psum_out[0]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[10]_INST_0 
       (.I0(\psum_out[10]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[10]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[10]_INST_0_i_3_n_0 ),
        .O(psum_out[10]));
  MUXF7 \psum_out[10]_INST_0_i_1 
       (.I0(\psum_out[10]_INST_0_i_4_n_0 ),
        .I1(\psum_out[10]_INST_0_i_5_n_0 ),
        .O(\psum_out[10]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[10]_INST_0_i_2 
       (.I0(\psum_out[10]_INST_0_i_6_n_0 ),
        .I1(\psum_out[10]_INST_0_i_7_n_0 ),
        .O(\psum_out[10]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[10]_INST_0_i_3 
       (.I0(\psum_out[10]_INST_0_i_8_n_0 ),
        .I1(\psum_out[10]_INST_0_i_9_n_0 ),
        .O(\psum_out[10]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[10]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [10]),
        .I1(\psum_spad_reg[18] [10]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [10]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [10]),
        .O(\psum_out[10]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[10]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [10]),
        .I1(\psum_spad_reg[22] [10]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [10]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [10]),
        .O(\psum_out[10]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[10]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [10]),
        .I1(\psum_spad_reg[10] [10]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [10]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [10]),
        .O(\psum_out[10]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[10]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [10]),
        .I1(\psum_spad_reg[14] [10]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [10]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [10]),
        .O(\psum_out[10]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[10]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [10]),
        .I1(\psum_spad_reg[2] [10]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [10]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [10]),
        .O(\psum_out[10]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[10]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [10]),
        .I1(\psum_spad_reg[6] [10]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [10]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [10]),
        .O(\psum_out[10]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[11]_INST_0 
       (.I0(\psum_out[11]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[11]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[11]_INST_0_i_3_n_0 ),
        .O(psum_out[11]));
  MUXF7 \psum_out[11]_INST_0_i_1 
       (.I0(\psum_out[11]_INST_0_i_4_n_0 ),
        .I1(\psum_out[11]_INST_0_i_5_n_0 ),
        .O(\psum_out[11]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[11]_INST_0_i_2 
       (.I0(\psum_out[11]_INST_0_i_6_n_0 ),
        .I1(\psum_out[11]_INST_0_i_7_n_0 ),
        .O(\psum_out[11]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[11]_INST_0_i_3 
       (.I0(\psum_out[11]_INST_0_i_8_n_0 ),
        .I1(\psum_out[11]_INST_0_i_9_n_0 ),
        .O(\psum_out[11]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[11]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [11]),
        .I1(\psum_spad_reg[18] [11]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [11]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [11]),
        .O(\psum_out[11]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[11]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [11]),
        .I1(\psum_spad_reg[22] [11]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [11]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [11]),
        .O(\psum_out[11]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[11]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [11]),
        .I1(\psum_spad_reg[10] [11]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [11]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [11]),
        .O(\psum_out[11]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[11]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [11]),
        .I1(\psum_spad_reg[14] [11]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [11]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [11]),
        .O(\psum_out[11]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[11]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [11]),
        .I1(\psum_spad_reg[2] [11]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [11]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [11]),
        .O(\psum_out[11]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[11]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [11]),
        .I1(\psum_spad_reg[6] [11]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [11]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [11]),
        .O(\psum_out[11]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[12]_INST_0 
       (.I0(\psum_out[12]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[12]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[12]_INST_0_i_3_n_0 ),
        .O(psum_out[12]));
  MUXF7 \psum_out[12]_INST_0_i_1 
       (.I0(\psum_out[12]_INST_0_i_4_n_0 ),
        .I1(\psum_out[12]_INST_0_i_5_n_0 ),
        .O(\psum_out[12]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[12]_INST_0_i_2 
       (.I0(\psum_out[12]_INST_0_i_6_n_0 ),
        .I1(\psum_out[12]_INST_0_i_7_n_0 ),
        .O(\psum_out[12]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[12]_INST_0_i_3 
       (.I0(\psum_out[12]_INST_0_i_8_n_0 ),
        .I1(\psum_out[12]_INST_0_i_9_n_0 ),
        .O(\psum_out[12]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[12]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [12]),
        .I1(\psum_spad_reg[18] [12]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [12]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [12]),
        .O(\psum_out[12]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[12]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [12]),
        .I1(\psum_spad_reg[22] [12]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [12]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [12]),
        .O(\psum_out[12]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[12]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [12]),
        .I1(\psum_spad_reg[10] [12]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [12]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [12]),
        .O(\psum_out[12]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[12]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [12]),
        .I1(\psum_spad_reg[14] [12]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [12]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [12]),
        .O(\psum_out[12]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[12]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [12]),
        .I1(\psum_spad_reg[2] [12]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [12]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [12]),
        .O(\psum_out[12]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[12]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [12]),
        .I1(\psum_spad_reg[6] [12]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [12]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [12]),
        .O(\psum_out[12]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[13]_INST_0 
       (.I0(\psum_out[13]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[13]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[13]_INST_0_i_3_n_0 ),
        .O(psum_out[13]));
  MUXF7 \psum_out[13]_INST_0_i_1 
       (.I0(\psum_out[13]_INST_0_i_4_n_0 ),
        .I1(\psum_out[13]_INST_0_i_5_n_0 ),
        .O(\psum_out[13]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[13]_INST_0_i_2 
       (.I0(\psum_out[13]_INST_0_i_6_n_0 ),
        .I1(\psum_out[13]_INST_0_i_7_n_0 ),
        .O(\psum_out[13]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[13]_INST_0_i_3 
       (.I0(\psum_out[13]_INST_0_i_8_n_0 ),
        .I1(\psum_out[13]_INST_0_i_9_n_0 ),
        .O(\psum_out[13]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[13]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [13]),
        .I1(\psum_spad_reg[18] [13]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [13]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [13]),
        .O(\psum_out[13]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[13]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [13]),
        .I1(\psum_spad_reg[22] [13]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [13]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [13]),
        .O(\psum_out[13]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[13]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [13]),
        .I1(\psum_spad_reg[10] [13]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [13]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [13]),
        .O(\psum_out[13]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[13]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [13]),
        .I1(\psum_spad_reg[14] [13]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [13]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [13]),
        .O(\psum_out[13]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[13]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [13]),
        .I1(\psum_spad_reg[2] [13]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [13]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [13]),
        .O(\psum_out[13]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[13]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [13]),
        .I1(\psum_spad_reg[6] [13]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [13]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [13]),
        .O(\psum_out[13]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[14]_INST_0 
       (.I0(\psum_out[14]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[14]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[14]_INST_0_i_3_n_0 ),
        .O(psum_out[14]));
  MUXF7 \psum_out[14]_INST_0_i_1 
       (.I0(\psum_out[14]_INST_0_i_4_n_0 ),
        .I1(\psum_out[14]_INST_0_i_5_n_0 ),
        .O(\psum_out[14]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[14]_INST_0_i_2 
       (.I0(\psum_out[14]_INST_0_i_6_n_0 ),
        .I1(\psum_out[14]_INST_0_i_7_n_0 ),
        .O(\psum_out[14]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[14]_INST_0_i_3 
       (.I0(\psum_out[14]_INST_0_i_8_n_0 ),
        .I1(\psum_out[14]_INST_0_i_9_n_0 ),
        .O(\psum_out[14]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[14]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [14]),
        .I1(\psum_spad_reg[18] [14]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [14]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [14]),
        .O(\psum_out[14]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[14]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [14]),
        .I1(\psum_spad_reg[22] [14]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [14]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [14]),
        .O(\psum_out[14]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[14]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [14]),
        .I1(\psum_spad_reg[10] [14]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [14]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [14]),
        .O(\psum_out[14]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[14]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [14]),
        .I1(\psum_spad_reg[14] [14]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [14]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [14]),
        .O(\psum_out[14]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[14]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [14]),
        .I1(\psum_spad_reg[2] [14]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [14]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [14]),
        .O(\psum_out[14]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[14]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [14]),
        .I1(\psum_spad_reg[6] [14]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [14]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [14]),
        .O(\psum_out[14]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[15]_INST_0 
       (.I0(\psum_out[15]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[15]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[15]_INST_0_i_3_n_0 ),
        .O(psum_out[15]));
  MUXF7 \psum_out[15]_INST_0_i_1 
       (.I0(\psum_out[15]_INST_0_i_4_n_0 ),
        .I1(\psum_out[15]_INST_0_i_5_n_0 ),
        .O(\psum_out[15]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[15]_INST_0_i_2 
       (.I0(\psum_out[15]_INST_0_i_6_n_0 ),
        .I1(\psum_out[15]_INST_0_i_7_n_0 ),
        .O(\psum_out[15]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[15]_INST_0_i_3 
       (.I0(\psum_out[15]_INST_0_i_8_n_0 ),
        .I1(\psum_out[15]_INST_0_i_9_n_0 ),
        .O(\psum_out[15]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[15]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [15]),
        .I1(\psum_spad_reg[18] [15]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [15]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [15]),
        .O(\psum_out[15]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[15]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [15]),
        .I1(\psum_spad_reg[22] [15]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [15]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [15]),
        .O(\psum_out[15]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[15]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [15]),
        .I1(\psum_spad_reg[10] [15]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [15]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [15]),
        .O(\psum_out[15]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[15]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [15]),
        .I1(\psum_spad_reg[14] [15]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [15]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [15]),
        .O(\psum_out[15]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[15]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [15]),
        .I1(\psum_spad_reg[2] [15]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [15]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [15]),
        .O(\psum_out[15]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[15]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [15]),
        .I1(\psum_spad_reg[6] [15]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [15]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [15]),
        .O(\psum_out[15]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[1]_INST_0 
       (.I0(\psum_out[1]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[1]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[1]_INST_0_i_3_n_0 ),
        .O(psum_out[1]));
  MUXF7 \psum_out[1]_INST_0_i_1 
       (.I0(\psum_out[1]_INST_0_i_4_n_0 ),
        .I1(\psum_out[1]_INST_0_i_5_n_0 ),
        .O(\psum_out[1]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[1]_INST_0_i_2 
       (.I0(\psum_out[1]_INST_0_i_6_n_0 ),
        .I1(\psum_out[1]_INST_0_i_7_n_0 ),
        .O(\psum_out[1]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[1]_INST_0_i_3 
       (.I0(\psum_out[1]_INST_0_i_8_n_0 ),
        .I1(\psum_out[1]_INST_0_i_9_n_0 ),
        .O(\psum_out[1]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[1]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [1]),
        .I1(\psum_spad_reg[18] [1]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [1]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [1]),
        .O(\psum_out[1]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[1]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [1]),
        .I1(\psum_spad_reg[22] [1]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [1]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [1]),
        .O(\psum_out[1]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[1]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [1]),
        .I1(\psum_spad_reg[10] [1]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [1]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [1]),
        .O(\psum_out[1]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[1]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [1]),
        .I1(\psum_spad_reg[14] [1]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [1]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [1]),
        .O(\psum_out[1]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[1]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [1]),
        .I1(\psum_spad_reg[2] [1]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [1]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [1]),
        .O(\psum_out[1]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[1]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [1]),
        .I1(\psum_spad_reg[6] [1]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [1]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [1]),
        .O(\psum_out[1]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[2]_INST_0 
       (.I0(\psum_out[2]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[2]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[2]_INST_0_i_3_n_0 ),
        .O(psum_out[2]));
  MUXF7 \psum_out[2]_INST_0_i_1 
       (.I0(\psum_out[2]_INST_0_i_4_n_0 ),
        .I1(\psum_out[2]_INST_0_i_5_n_0 ),
        .O(\psum_out[2]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[2]_INST_0_i_2 
       (.I0(\psum_out[2]_INST_0_i_6_n_0 ),
        .I1(\psum_out[2]_INST_0_i_7_n_0 ),
        .O(\psum_out[2]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[2]_INST_0_i_3 
       (.I0(\psum_out[2]_INST_0_i_8_n_0 ),
        .I1(\psum_out[2]_INST_0_i_9_n_0 ),
        .O(\psum_out[2]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[2]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [2]),
        .I1(\psum_spad_reg[18] [2]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [2]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [2]),
        .O(\psum_out[2]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[2]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [2]),
        .I1(\psum_spad_reg[22] [2]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [2]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [2]),
        .O(\psum_out[2]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[2]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [2]),
        .I1(\psum_spad_reg[10] [2]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [2]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [2]),
        .O(\psum_out[2]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[2]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [2]),
        .I1(\psum_spad_reg[14] [2]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [2]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [2]),
        .O(\psum_out[2]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[2]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [2]),
        .I1(\psum_spad_reg[2] [2]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [2]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [2]),
        .O(\psum_out[2]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[2]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [2]),
        .I1(\psum_spad_reg[6] [2]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [2]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [2]),
        .O(\psum_out[2]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[3]_INST_0 
       (.I0(\psum_out[3]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[3]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[3]_INST_0_i_3_n_0 ),
        .O(psum_out[3]));
  MUXF7 \psum_out[3]_INST_0_i_1 
       (.I0(\psum_out[3]_INST_0_i_4_n_0 ),
        .I1(\psum_out[3]_INST_0_i_5_n_0 ),
        .O(\psum_out[3]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[3]_INST_0_i_2 
       (.I0(\psum_out[3]_INST_0_i_6_n_0 ),
        .I1(\psum_out[3]_INST_0_i_7_n_0 ),
        .O(\psum_out[3]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[3]_INST_0_i_3 
       (.I0(\psum_out[3]_INST_0_i_8_n_0 ),
        .I1(\psum_out[3]_INST_0_i_9_n_0 ),
        .O(\psum_out[3]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[3]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [3]),
        .I1(\psum_spad_reg[18] [3]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [3]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [3]),
        .O(\psum_out[3]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[3]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [3]),
        .I1(\psum_spad_reg[22] [3]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [3]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [3]),
        .O(\psum_out[3]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[3]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [3]),
        .I1(\psum_spad_reg[10] [3]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [3]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [3]),
        .O(\psum_out[3]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[3]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [3]),
        .I1(\psum_spad_reg[14] [3]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [3]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [3]),
        .O(\psum_out[3]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[3]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [3]),
        .I1(\psum_spad_reg[2] [3]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [3]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [3]),
        .O(\psum_out[3]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[3]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [3]),
        .I1(\psum_spad_reg[6] [3]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [3]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [3]),
        .O(\psum_out[3]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[4]_INST_0 
       (.I0(\psum_out[4]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[4]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[4]_INST_0_i_3_n_0 ),
        .O(psum_out[4]));
  MUXF7 \psum_out[4]_INST_0_i_1 
       (.I0(\psum_out[4]_INST_0_i_4_n_0 ),
        .I1(\psum_out[4]_INST_0_i_5_n_0 ),
        .O(\psum_out[4]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[4]_INST_0_i_2 
       (.I0(\psum_out[4]_INST_0_i_6_n_0 ),
        .I1(\psum_out[4]_INST_0_i_7_n_0 ),
        .O(\psum_out[4]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[4]_INST_0_i_3 
       (.I0(\psum_out[4]_INST_0_i_8_n_0 ),
        .I1(\psum_out[4]_INST_0_i_9_n_0 ),
        .O(\psum_out[4]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[4]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [4]),
        .I1(\psum_spad_reg[18] [4]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [4]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [4]),
        .O(\psum_out[4]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[4]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [4]),
        .I1(\psum_spad_reg[22] [4]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [4]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [4]),
        .O(\psum_out[4]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[4]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [4]),
        .I1(\psum_spad_reg[10] [4]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [4]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [4]),
        .O(\psum_out[4]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[4]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [4]),
        .I1(\psum_spad_reg[14] [4]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [4]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [4]),
        .O(\psum_out[4]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[4]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [4]),
        .I1(\psum_spad_reg[2] [4]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [4]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [4]),
        .O(\psum_out[4]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[4]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [4]),
        .I1(\psum_spad_reg[6] [4]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [4]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [4]),
        .O(\psum_out[4]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[5]_INST_0 
       (.I0(\psum_out[5]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[5]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[5]_INST_0_i_3_n_0 ),
        .O(psum_out[5]));
  MUXF7 \psum_out[5]_INST_0_i_1 
       (.I0(\psum_out[5]_INST_0_i_4_n_0 ),
        .I1(\psum_out[5]_INST_0_i_5_n_0 ),
        .O(\psum_out[5]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[5]_INST_0_i_2 
       (.I0(\psum_out[5]_INST_0_i_6_n_0 ),
        .I1(\psum_out[5]_INST_0_i_7_n_0 ),
        .O(\psum_out[5]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[5]_INST_0_i_3 
       (.I0(\psum_out[5]_INST_0_i_8_n_0 ),
        .I1(\psum_out[5]_INST_0_i_9_n_0 ),
        .O(\psum_out[5]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[5]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [5]),
        .I1(\psum_spad_reg[18] [5]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [5]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [5]),
        .O(\psum_out[5]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[5]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [5]),
        .I1(\psum_spad_reg[22] [5]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [5]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [5]),
        .O(\psum_out[5]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[5]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [5]),
        .I1(\psum_spad_reg[10] [5]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [5]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [5]),
        .O(\psum_out[5]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[5]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [5]),
        .I1(\psum_spad_reg[14] [5]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [5]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [5]),
        .O(\psum_out[5]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[5]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [5]),
        .I1(\psum_spad_reg[2] [5]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [5]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [5]),
        .O(\psum_out[5]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[5]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [5]),
        .I1(\psum_spad_reg[6] [5]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [5]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [5]),
        .O(\psum_out[5]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[6]_INST_0 
       (.I0(\psum_out[6]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[6]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[6]_INST_0_i_3_n_0 ),
        .O(psum_out[6]));
  MUXF7 \psum_out[6]_INST_0_i_1 
       (.I0(\psum_out[6]_INST_0_i_4_n_0 ),
        .I1(\psum_out[6]_INST_0_i_5_n_0 ),
        .O(\psum_out[6]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[6]_INST_0_i_2 
       (.I0(\psum_out[6]_INST_0_i_6_n_0 ),
        .I1(\psum_out[6]_INST_0_i_7_n_0 ),
        .O(\psum_out[6]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[6]_INST_0_i_3 
       (.I0(\psum_out[6]_INST_0_i_8_n_0 ),
        .I1(\psum_out[6]_INST_0_i_9_n_0 ),
        .O(\psum_out[6]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[6]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [6]),
        .I1(\psum_spad_reg[18] [6]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [6]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [6]),
        .O(\psum_out[6]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[6]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [6]),
        .I1(\psum_spad_reg[22] [6]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [6]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [6]),
        .O(\psum_out[6]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[6]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [6]),
        .I1(\psum_spad_reg[10] [6]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [6]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [6]),
        .O(\psum_out[6]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[6]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [6]),
        .I1(\psum_spad_reg[14] [6]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [6]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [6]),
        .O(\psum_out[6]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[6]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [6]),
        .I1(\psum_spad_reg[2] [6]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [6]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [6]),
        .O(\psum_out[6]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[6]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [6]),
        .I1(\psum_spad_reg[6] [6]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [6]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [6]),
        .O(\psum_out[6]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[7]_INST_0 
       (.I0(\psum_out[7]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[7]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[7]_INST_0_i_3_n_0 ),
        .O(psum_out[7]));
  MUXF7 \psum_out[7]_INST_0_i_1 
       (.I0(\psum_out[7]_INST_0_i_4_n_0 ),
        .I1(\psum_out[7]_INST_0_i_5_n_0 ),
        .O(\psum_out[7]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[7]_INST_0_i_2 
       (.I0(\psum_out[7]_INST_0_i_6_n_0 ),
        .I1(\psum_out[7]_INST_0_i_7_n_0 ),
        .O(\psum_out[7]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[7]_INST_0_i_3 
       (.I0(\psum_out[7]_INST_0_i_8_n_0 ),
        .I1(\psum_out[7]_INST_0_i_9_n_0 ),
        .O(\psum_out[7]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[7]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [7]),
        .I1(\psum_spad_reg[18] [7]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [7]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [7]),
        .O(\psum_out[7]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[7]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [7]),
        .I1(\psum_spad_reg[22] [7]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [7]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [7]),
        .O(\psum_out[7]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[7]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [7]),
        .I1(\psum_spad_reg[10] [7]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [7]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [7]),
        .O(\psum_out[7]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[7]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [7]),
        .I1(\psum_spad_reg[14] [7]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [7]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [7]),
        .O(\psum_out[7]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[7]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [7]),
        .I1(\psum_spad_reg[2] [7]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [7]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [7]),
        .O(\psum_out[7]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[7]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [7]),
        .I1(\psum_spad_reg[6] [7]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [7]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [7]),
        .O(\psum_out[7]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[8]_INST_0 
       (.I0(\psum_out[8]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[8]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[8]_INST_0_i_3_n_0 ),
        .O(psum_out[8]));
  MUXF7 \psum_out[8]_INST_0_i_1 
       (.I0(\psum_out[8]_INST_0_i_4_n_0 ),
        .I1(\psum_out[8]_INST_0_i_5_n_0 ),
        .O(\psum_out[8]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[8]_INST_0_i_2 
       (.I0(\psum_out[8]_INST_0_i_6_n_0 ),
        .I1(\psum_out[8]_INST_0_i_7_n_0 ),
        .O(\psum_out[8]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[8]_INST_0_i_3 
       (.I0(\psum_out[8]_INST_0_i_8_n_0 ),
        .I1(\psum_out[8]_INST_0_i_9_n_0 ),
        .O(\psum_out[8]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[8]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [8]),
        .I1(\psum_spad_reg[18] [8]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [8]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [8]),
        .O(\psum_out[8]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[8]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [8]),
        .I1(\psum_spad_reg[22] [8]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [8]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [8]),
        .O(\psum_out[8]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[8]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [8]),
        .I1(\psum_spad_reg[10] [8]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [8]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [8]),
        .O(\psum_out[8]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[8]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [8]),
        .I1(\psum_spad_reg[14] [8]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [8]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [8]),
        .O(\psum_out[8]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[8]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [8]),
        .I1(\psum_spad_reg[2] [8]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [8]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [8]),
        .O(\psum_out[8]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[8]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [8]),
        .I1(\psum_spad_reg[6] [8]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [8]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [8]),
        .O(\psum_out[8]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_out[9]_INST_0 
       (.I0(\psum_out[9]_INST_0_i_1_n_0 ),
        .I1(psum_k[4]),
        .I2(\psum_out[9]_INST_0_i_2_n_0 ),
        .I3(psum_k[3]),
        .I4(\psum_out[9]_INST_0_i_3_n_0 ),
        .O(psum_out[9]));
  MUXF7 \psum_out[9]_INST_0_i_1 
       (.I0(\psum_out[9]_INST_0_i_4_n_0 ),
        .I1(\psum_out[9]_INST_0_i_5_n_0 ),
        .O(\psum_out[9]_INST_0_i_1_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[9]_INST_0_i_2 
       (.I0(\psum_out[9]_INST_0_i_6_n_0 ),
        .I1(\psum_out[9]_INST_0_i_7_n_0 ),
        .O(\psum_out[9]_INST_0_i_2_n_0 ),
        .S(psum_k[2]));
  MUXF7 \psum_out[9]_INST_0_i_3 
       (.I0(\psum_out[9]_INST_0_i_8_n_0 ),
        .I1(\psum_out[9]_INST_0_i_9_n_0 ),
        .O(\psum_out[9]_INST_0_i_3_n_0 ),
        .S(psum_k[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[9]_INST_0_i_4 
       (.I0(\psum_spad_reg[19] [9]),
        .I1(\psum_spad_reg[18] [9]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[17] [9]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[16] [9]),
        .O(\psum_out[9]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[9]_INST_0_i_5 
       (.I0(\psum_spad_reg[23] [9]),
        .I1(\psum_spad_reg[22] [9]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[21] [9]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[20] [9]),
        .O(\psum_out[9]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[9]_INST_0_i_6 
       (.I0(\psum_spad_reg[11] [9]),
        .I1(\psum_spad_reg[10] [9]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[9] [9]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[8] [9]),
        .O(\psum_out[9]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[9]_INST_0_i_7 
       (.I0(\psum_spad_reg[15] [9]),
        .I1(\psum_spad_reg[14] [9]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[13] [9]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[12] [9]),
        .O(\psum_out[9]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[9]_INST_0_i_8 
       (.I0(\psum_spad_reg[3] [9]),
        .I1(\psum_spad_reg[2] [9]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[1] [9]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[0] [9]),
        .O(\psum_out[9]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_out[9]_INST_0_i_9 
       (.I0(\psum_spad_reg[7] [9]),
        .I1(\psum_spad_reg[6] [9]),
        .I2(psum_k[1]),
        .I3(\psum_spad_reg[5] [9]),
        .I4(psum_k[0]),
        .I5(\psum_spad_reg[4] [9]),
        .O(\psum_out[9]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \psum_spad[0][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[1]),
        .I3(k_r[0]),
        .I4(\psum_spad[1][15]_i_4_n_0 ),
        .O(\psum_spad[0][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000010)) 
    \psum_spad[10][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[1]),
        .I3(k_r[0]),
        .I4(\psum_spad[8][15]_i_2_n_0 ),
        .O(\psum_spad[10][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00001000)) 
    \psum_spad[11][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[1]),
        .I3(k_r[0]),
        .I4(\psum_spad[8][15]_i_2_n_0 ),
        .O(\psum_spad[11][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000004)) 
    \psum_spad[12][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[1]),
        .I3(k_r[0]),
        .I4(\psum_spad[8][15]_i_2_n_0 ),
        .O(\psum_spad[12][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000040)) 
    \psum_spad[13][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[0]),
        .I3(k_r[1]),
        .I4(\psum_spad[8][15]_i_2_n_0 ),
        .O(\psum_spad[13][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000040)) 
    \psum_spad[14][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[1]),
        .I3(k_r[0]),
        .I4(\psum_spad[8][15]_i_2_n_0 ),
        .O(\psum_spad[14][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00004000)) 
    \psum_spad[15][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[1]),
        .I3(k_r[0]),
        .I4(\psum_spad[8][15]_i_2_n_0 ),
        .O(\psum_spad[15][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h01000000)) 
    \psum_spad[16][15]_i_1 
       (.I0(k_r[0]),
        .I1(k_r[1]),
        .I2(k_r[2]),
        .I3(\psum_spad[1][15]_i_4_n_0 ),
        .I4(k_r[4]),
        .O(\psum_spad[16][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \psum_spad[17][15]_i_1 
       (.I0(k_r[1]),
        .I1(k_r[0]),
        .I2(k_r[2]),
        .I3(\psum_spad[1][15]_i_4_n_0 ),
        .I4(k_r[4]),
        .O(\psum_spad[17][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \psum_spad[18][15]_i_1 
       (.I0(k_r[0]),
        .I1(k_r[1]),
        .I2(k_r[2]),
        .I3(\psum_spad[1][15]_i_4_n_0 ),
        .I4(k_r[4]),
        .O(\psum_spad[18][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h08000000)) 
    \psum_spad[19][15]_i_1 
       (.I0(k_r[0]),
        .I1(k_r[1]),
        .I2(k_r[2]),
        .I3(\psum_spad[1][15]_i_4_n_0 ),
        .I4(k_r[4]),
        .O(\psum_spad[19][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][11]_i_2 
       (.I0(\psum_spad_reg[1][11]_i_10_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][11]_i_11_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][11]_i_12_n_0 ),
        .O(psum_spad[11]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_22 
       (.I0(\psum_spad[1][15]_i_52_n_0 ),
        .I1(\psum_spad[1][15]_i_58_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][15]_i_54_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][11]_i_50_n_0 ),
        .O(\psum_spad[1][11]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_23 
       (.I0(\psum_spad[1][15]_i_55_n_0 ),
        .I1(\psum_spad[1][15]_i_59_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][15]_i_57_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][11]_i_51_n_0 ),
        .O(\psum_spad[1][11]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_24 
       (.I0(\psum_spad[1][15]_i_54_n_0 ),
        .I1(\psum_spad[1][11]_i_50_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][15]_i_58_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][11]_i_52_n_0 ),
        .O(\psum_spad[1][11]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_25 
       (.I0(\psum_spad[1][15]_i_57_n_0 ),
        .I1(\psum_spad[1][11]_i_51_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][15]_i_59_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][11]_i_53_n_0 ),
        .O(\psum_spad[1][11]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_26 
       (.I0(\psum_spad_reg[19] [11]),
        .I1(\psum_spad_reg[18] [11]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [11]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [11]),
        .O(\psum_spad[1][11]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_27 
       (.I0(\psum_spad_reg[23] [11]),
        .I1(\psum_spad_reg[22] [11]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [11]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [11]),
        .O(\psum_spad[1][11]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_28 
       (.I0(\psum_spad_reg[11] [11]),
        .I1(\psum_spad_reg[10] [11]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [11]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [11]),
        .O(\psum_spad[1][11]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_29 
       (.I0(\psum_spad_reg[15] [11]),
        .I1(\psum_spad_reg[14] [11]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [11]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [11]),
        .O(\psum_spad[1][11]_i_29_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][11]_i_3 
       (.I0(\psum_spad_reg[1][11]_i_13_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][11]_i_14_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][11]_i_15_n_0 ),
        .O(psum_spad[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_30 
       (.I0(\psum_spad_reg[3] [11]),
        .I1(\psum_spad_reg[2] [11]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [11]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [11]),
        .O(\psum_spad[1][11]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_31 
       (.I0(\psum_spad_reg[7] [11]),
        .I1(\psum_spad_reg[6] [11]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [11]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [11]),
        .O(\psum_spad[1][11]_i_31_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_32 
       (.I0(\psum_spad_reg[19] [10]),
        .I1(\psum_spad_reg[18] [10]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [10]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [10]),
        .O(\psum_spad[1][11]_i_32_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_33 
       (.I0(\psum_spad_reg[23] [10]),
        .I1(\psum_spad_reg[22] [10]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [10]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [10]),
        .O(\psum_spad[1][11]_i_33_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_34 
       (.I0(\psum_spad_reg[11] [10]),
        .I1(\psum_spad_reg[10] [10]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [10]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [10]),
        .O(\psum_spad[1][11]_i_34_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_35 
       (.I0(\psum_spad_reg[15] [10]),
        .I1(\psum_spad_reg[14] [10]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [10]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [10]),
        .O(\psum_spad[1][11]_i_35_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_36 
       (.I0(\psum_spad_reg[3] [10]),
        .I1(\psum_spad_reg[2] [10]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [10]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [10]),
        .O(\psum_spad[1][11]_i_36_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_37 
       (.I0(\psum_spad_reg[7] [10]),
        .I1(\psum_spad_reg[6] [10]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [10]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [10]),
        .O(\psum_spad[1][11]_i_37_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_38 
       (.I0(\psum_spad_reg[19] [9]),
        .I1(\psum_spad_reg[18] [9]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [9]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [9]),
        .O(\psum_spad[1][11]_i_38_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_39 
       (.I0(\psum_spad_reg[23] [9]),
        .I1(\psum_spad_reg[22] [9]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [9]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [9]),
        .O(\psum_spad[1][11]_i_39_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][11]_i_4 
       (.I0(\psum_spad_reg[1][11]_i_16_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][11]_i_17_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][11]_i_18_n_0 ),
        .O(psum_spad[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_40 
       (.I0(\psum_spad_reg[11] [9]),
        .I1(\psum_spad_reg[10] [9]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [9]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [9]),
        .O(\psum_spad[1][11]_i_40_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_41 
       (.I0(\psum_spad_reg[15] [9]),
        .I1(\psum_spad_reg[14] [9]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [9]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [9]),
        .O(\psum_spad[1][11]_i_41_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_42 
       (.I0(\psum_spad_reg[3] [9]),
        .I1(\psum_spad_reg[2] [9]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [9]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [9]),
        .O(\psum_spad[1][11]_i_42_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_43 
       (.I0(\psum_spad_reg[7] [9]),
        .I1(\psum_spad_reg[6] [9]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [9]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [9]),
        .O(\psum_spad[1][11]_i_43_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_44 
       (.I0(\psum_spad_reg[19] [8]),
        .I1(\psum_spad_reg[18] [8]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [8]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [8]),
        .O(\psum_spad[1][11]_i_44_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_45 
       (.I0(\psum_spad_reg[23] [8]),
        .I1(\psum_spad_reg[22] [8]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [8]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [8]),
        .O(\psum_spad[1][11]_i_45_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_46 
       (.I0(\psum_spad_reg[11] [8]),
        .I1(\psum_spad_reg[10] [8]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [8]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [8]),
        .O(\psum_spad[1][11]_i_46_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_47 
       (.I0(\psum_spad_reg[15] [8]),
        .I1(\psum_spad_reg[14] [8]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [8]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [8]),
        .O(\psum_spad[1][11]_i_47_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_48 
       (.I0(\psum_spad_reg[3] [8]),
        .I1(\psum_spad_reg[2] [8]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [8]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [8]),
        .O(\psum_spad[1][11]_i_48_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][11]_i_49 
       (.I0(\psum_spad_reg[7] [8]),
        .I1(\psum_spad_reg[6] [8]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [8]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [8]),
        .O(\psum_spad[1][11]_i_49_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][11]_i_5 
       (.I0(\psum_spad_reg[1][11]_i_19_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][11]_i_20_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][11]_i_21_n_0 ),
        .O(psum_spad[8]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \psum_spad[1][11]_i_50 
       (.I0(product_n_86),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_78),
        .I3(\shift_r_reg_n_0_[4] ),
        .I4(product_n_94),
        .O(\psum_spad[1][11]_i_50_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \psum_spad[1][11]_i_51 
       (.I0(product_n_87),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_79),
        .I3(\shift_r_reg_n_0_[4] ),
        .I4(product_n_95),
        .O(\psum_spad[1][11]_i_51_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \psum_spad[1][11]_i_52 
       (.I0(product_n_88),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_80),
        .I3(\shift_r_reg_n_0_[4] ),
        .I4(product_n_96),
        .O(\psum_spad[1][11]_i_52_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \psum_spad[1][11]_i_53 
       (.I0(product_n_89),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_81),
        .I3(\shift_r_reg_n_0_[4] ),
        .I4(product_n_97),
        .O(\psum_spad[1][11]_i_53_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \psum_spad[1][11]_i_6 
       (.I0(psum_spad[11]),
        .I1(\psum_spad[1][11]_i_22_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][15]_i_27_n_0 ),
        .O(\psum_spad[1][11]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \psum_spad[1][11]_i_7 
       (.I0(psum_spad[10]),
        .I1(\psum_spad[1][11]_i_23_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][11]_i_22_n_0 ),
        .O(\psum_spad[1][11]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \psum_spad[1][11]_i_8 
       (.I0(psum_spad[9]),
        .I1(\psum_spad[1][11]_i_24_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][11]_i_23_n_0 ),
        .O(\psum_spad[1][11]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \psum_spad[1][11]_i_9 
       (.I0(psum_spad[8]),
        .I1(\psum_spad[1][11]_i_25_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][11]_i_24_n_0 ),
        .O(\psum_spad[1][11]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAFFFFFFFF)) 
    \psum_spad[1][15]_i_1 
       (.I0(\k_cnt[4]_i_3_n_0 ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(ifmap_valid),
        .I5(rst_n),
        .O(\psum_spad[1][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h565656A6A6A656A6)) 
    \psum_spad[1][15]_i_10 
       (.I0(psum_spad[13]),
        .I1(\psum_spad[1][15]_i_26_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][15]_i_25_n_0 ),
        .I4(\shift_r_reg_n_0_[1] ),
        .I5(\psum_spad[1][15]_i_23_n_0 ),
        .O(\psum_spad[1][15]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h565656A6A6A656A6)) 
    \psum_spad[1][15]_i_11 
       (.I0(psum_spad[12]),
        .I1(\psum_spad[1][15]_i_27_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][15]_i_28_n_0 ),
        .I4(\shift_r_reg_n_0_[1] ),
        .I5(\psum_spad[1][15]_i_29_n_0 ),
        .O(\psum_spad[1][15]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    \psum_spad[1][15]_i_2 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[0]),
        .I3(k_r[1]),
        .I4(\psum_spad[1][15]_i_4_n_0 ),
        .O(\psum_spad[1][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][15]_i_21 
       (.I0(\psum_spad_reg[1][15]_i_48_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][15]_i_49_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][15]_i_50_n_0 ),
        .O(\psum_spad[1][15]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_22 
       (.I0(\psum_spad[1][15]_i_51_n_0 ),
        .I1(\psum_spad[1][15]_i_52_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][15]_i_53_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][15]_i_54_n_0 ),
        .O(\psum_spad[1][15]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \psum_spad[1][15]_i_23 
       (.I0(product_n_77),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_85),
        .I3(\shift_r_reg_n_0_[4] ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][15]_i_55_n_0 ),
        .O(\psum_spad[1][15]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \psum_spad[1][15]_i_24 
       (.I0(product_n_75),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_83),
        .I3(\shift_r_reg_n_0_[4] ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][15]_i_56_n_0 ),
        .O(\psum_spad[1][15]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \psum_spad[1][15]_i_25 
       (.I0(product_n_79),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_87),
        .I3(\shift_r_reg_n_0_[4] ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][15]_i_57_n_0 ),
        .O(\psum_spad[1][15]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_26 
       (.I0(\psum_spad[1][15]_i_53_n_0 ),
        .I1(\psum_spad[1][15]_i_54_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][15]_i_52_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][15]_i_58_n_0 ),
        .O(\psum_spad[1][15]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_27 
       (.I0(\psum_spad[1][15]_i_56_n_0 ),
        .I1(\psum_spad[1][15]_i_57_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][15]_i_55_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][15]_i_59_n_0 ),
        .O(\psum_spad[1][15]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \psum_spad[1][15]_i_28 
       (.I0(product_n_80),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_88),
        .I3(\shift_r_reg_n_0_[4] ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][15]_i_58_n_0 ),
        .O(\psum_spad[1][15]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \psum_spad[1][15]_i_29 
       (.I0(product_n_78),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_86),
        .I3(\shift_r_reg_n_0_[4] ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][15]_i_54_n_0 ),
        .O(\psum_spad[1][15]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_30 
       (.I0(\psum_spad_reg[19] [14]),
        .I1(\psum_spad_reg[18] [14]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [14]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [14]),
        .O(\psum_spad[1][15]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_31 
       (.I0(\psum_spad_reg[23] [14]),
        .I1(\psum_spad_reg[22] [14]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [14]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [14]),
        .O(\psum_spad[1][15]_i_31_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_32 
       (.I0(\psum_spad_reg[11] [14]),
        .I1(\psum_spad_reg[10] [14]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [14]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [14]),
        .O(\psum_spad[1][15]_i_32_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_33 
       (.I0(\psum_spad_reg[15] [14]),
        .I1(\psum_spad_reg[14] [14]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [14]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [14]),
        .O(\psum_spad[1][15]_i_33_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_34 
       (.I0(\psum_spad_reg[3] [14]),
        .I1(\psum_spad_reg[2] [14]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [14]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [14]),
        .O(\psum_spad[1][15]_i_34_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_35 
       (.I0(\psum_spad_reg[7] [14]),
        .I1(\psum_spad_reg[6] [14]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [14]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [14]),
        .O(\psum_spad[1][15]_i_35_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_36 
       (.I0(\psum_spad_reg[19] [13]),
        .I1(\psum_spad_reg[18] [13]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [13]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [13]),
        .O(\psum_spad[1][15]_i_36_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_37 
       (.I0(\psum_spad_reg[23] [13]),
        .I1(\psum_spad_reg[22] [13]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [13]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [13]),
        .O(\psum_spad[1][15]_i_37_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_38 
       (.I0(\psum_spad_reg[11] [13]),
        .I1(\psum_spad_reg[10] [13]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [13]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [13]),
        .O(\psum_spad[1][15]_i_38_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_39 
       (.I0(\psum_spad_reg[15] [13]),
        .I1(\psum_spad_reg[14] [13]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [13]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [13]),
        .O(\psum_spad[1][15]_i_39_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \psum_spad[1][15]_i_4 
       (.I0(k_r[3]),
        .I1(vld_r),
        .I2(gate_r),
        .O(\psum_spad[1][15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_40 
       (.I0(\psum_spad_reg[3] [13]),
        .I1(\psum_spad_reg[2] [13]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [13]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [13]),
        .O(\psum_spad[1][15]_i_40_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_41 
       (.I0(\psum_spad_reg[7] [13]),
        .I1(\psum_spad_reg[6] [13]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [13]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [13]),
        .O(\psum_spad[1][15]_i_41_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_42 
       (.I0(\psum_spad_reg[19] [12]),
        .I1(\psum_spad_reg[18] [12]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [12]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [12]),
        .O(\psum_spad[1][15]_i_42_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_43 
       (.I0(\psum_spad_reg[23] [12]),
        .I1(\psum_spad_reg[22] [12]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [12]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [12]),
        .O(\psum_spad[1][15]_i_43_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_44 
       (.I0(\psum_spad_reg[11] [12]),
        .I1(\psum_spad_reg[10] [12]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [12]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [12]),
        .O(\psum_spad[1][15]_i_44_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_45 
       (.I0(\psum_spad_reg[15] [12]),
        .I1(\psum_spad_reg[14] [12]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [12]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [12]),
        .O(\psum_spad[1][15]_i_45_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_46 
       (.I0(\psum_spad_reg[3] [12]),
        .I1(\psum_spad_reg[2] [12]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [12]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [12]),
        .O(\psum_spad[1][15]_i_46_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_47 
       (.I0(\psum_spad_reg[7] [12]),
        .I1(\psum_spad_reg[6] [12]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [12]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [12]),
        .O(\psum_spad[1][15]_i_47_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][15]_i_5 
       (.I0(\psum_spad_reg[1][15]_i_12_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][15]_i_13_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][15]_i_14_n_0 ),
        .O(psum_spad[14]));
  LUT4 #(
    .INIT(16'h00B8)) 
    \psum_spad[1][15]_i_51 
       (.I0(product_n_76),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_84),
        .I3(\shift_r_reg_n_0_[4] ),
        .O(\psum_spad[1][15]_i_51_n_0 ));
  LUT4 #(
    .INIT(16'h00B8)) 
    \psum_spad[1][15]_i_52 
       (.I0(product_n_80),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_88),
        .I3(\shift_r_reg_n_0_[4] ),
        .O(\psum_spad[1][15]_i_52_n_0 ));
  LUT4 #(
    .INIT(16'h00B8)) 
    \psum_spad[1][15]_i_53 
       (.I0(product_n_78),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_86),
        .I3(\shift_r_reg_n_0_[4] ),
        .O(\psum_spad[1][15]_i_53_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \psum_spad[1][15]_i_54 
       (.I0(product_n_82),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_74),
        .I3(\shift_r_reg_n_0_[4] ),
        .I4(product_n_90),
        .O(\psum_spad[1][15]_i_54_n_0 ));
  LUT4 #(
    .INIT(16'h00B8)) 
    \psum_spad[1][15]_i_55 
       (.I0(product_n_81),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_89),
        .I3(\shift_r_reg_n_0_[4] ),
        .O(\psum_spad[1][15]_i_55_n_0 ));
  LUT4 #(
    .INIT(16'h00B8)) 
    \psum_spad[1][15]_i_56 
       (.I0(product_n_79),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_87),
        .I3(\shift_r_reg_n_0_[4] ),
        .O(\psum_spad[1][15]_i_56_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \psum_spad[1][15]_i_57 
       (.I0(product_n_83),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_75),
        .I3(\shift_r_reg_n_0_[4] ),
        .I4(product_n_91),
        .O(\psum_spad[1][15]_i_57_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \psum_spad[1][15]_i_58 
       (.I0(product_n_84),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_76),
        .I3(\shift_r_reg_n_0_[4] ),
        .I4(product_n_92),
        .O(\psum_spad[1][15]_i_58_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \psum_spad[1][15]_i_59 
       (.I0(product_n_85),
        .I1(\shift_r_reg_n_0_[3] ),
        .I2(product_n_77),
        .I3(\shift_r_reg_n_0_[4] ),
        .I4(product_n_93),
        .O(\psum_spad[1][15]_i_59_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][15]_i_6 
       (.I0(\psum_spad_reg[1][15]_i_15_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][15]_i_16_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][15]_i_17_n_0 ),
        .O(psum_spad[13]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_60 
       (.I0(\psum_spad_reg[19] [15]),
        .I1(\psum_spad_reg[18] [15]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [15]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [15]),
        .O(\psum_spad[1][15]_i_60_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_61 
       (.I0(\psum_spad_reg[23] [15]),
        .I1(\psum_spad_reg[22] [15]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [15]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [15]),
        .O(\psum_spad[1][15]_i_61_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_62 
       (.I0(\psum_spad_reg[11] [15]),
        .I1(\psum_spad_reg[10] [15]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [15]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [15]),
        .O(\psum_spad[1][15]_i_62_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_63 
       (.I0(\psum_spad_reg[15] [15]),
        .I1(\psum_spad_reg[14] [15]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [15]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [15]),
        .O(\psum_spad[1][15]_i_63_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_64 
       (.I0(\psum_spad_reg[3] [15]),
        .I1(\psum_spad_reg[2] [15]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [15]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [15]),
        .O(\psum_spad[1][15]_i_64_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][15]_i_65 
       (.I0(\psum_spad_reg[7] [15]),
        .I1(\psum_spad_reg[6] [15]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [15]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [15]),
        .O(\psum_spad[1][15]_i_65_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][15]_i_7 
       (.I0(\psum_spad_reg[1][15]_i_18_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][15]_i_19_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][15]_i_20_n_0 ),
        .O(psum_spad[12]));
  LUT6 #(
    .INIT(64'h565656A6A6A656A6)) 
    \psum_spad[1][15]_i_8 
       (.I0(\psum_spad[1][15]_i_21_n_0 ),
        .I1(\psum_spad[1][15]_i_22_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][15]_i_23_n_0 ),
        .I4(\shift_r_reg_n_0_[1] ),
        .I5(\psum_spad[1][15]_i_24_n_0 ),
        .O(\psum_spad[1][15]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \psum_spad[1][15]_i_9 
       (.I0(psum_spad[14]),
        .I1(\psum_spad[1][15]_i_25_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][15]_i_23_n_0 ),
        .I4(\shift_r_reg_n_0_[0] ),
        .I5(\psum_spad[1][15]_i_22_n_0 ),
        .O(\psum_spad[1][15]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][3]_i_2 
       (.I0(\psum_spad_reg[1][3]_i_10_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][3]_i_11_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][3]_i_12_n_0 ),
        .O(psum_spad[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_22 
       (.I0(\psum_spad[1][11]_i_52_n_0 ),
        .I1(\psum_spad[1][7]_i_52_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][7]_i_50_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][3]_i_51_n_0 ),
        .O(\psum_spad[1][3]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_23 
       (.I0(\psum_spad[1][11]_i_53_n_0 ),
        .I1(\psum_spad[1][7]_i_53_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][7]_i_51_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][3]_i_52_n_0 ),
        .O(\psum_spad[1][3]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_24 
       (.I0(\psum_spad[1][7]_i_50_n_0 ),
        .I1(\psum_spad[1][3]_i_51_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][7]_i_52_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][3]_i_53_n_0 ),
        .O(\psum_spad[1][3]_i_24_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \psum_spad[1][3]_i_25 
       (.I0(\psum_spad[1][7]_i_53_n_0 ),
        .I1(\shift_r_reg_n_0_[2] ),
        .I2(\psum_spad[1][3]_i_54_n_0 ),
        .O(\psum_spad[1][3]_i_25_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \psum_spad[1][3]_i_26 
       (.I0(\psum_spad[1][7]_i_51_n_0 ),
        .I1(\shift_r_reg_n_0_[2] ),
        .I2(\psum_spad[1][3]_i_52_n_0 ),
        .O(\psum_spad[1][3]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_27 
       (.I0(\psum_spad_reg[19] [3]),
        .I1(\psum_spad_reg[18] [3]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [3]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [3]),
        .O(\psum_spad[1][3]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_28 
       (.I0(\psum_spad_reg[23] [3]),
        .I1(\psum_spad_reg[22] [3]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [3]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [3]),
        .O(\psum_spad[1][3]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_29 
       (.I0(\psum_spad_reg[11] [3]),
        .I1(\psum_spad_reg[10] [3]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [3]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [3]),
        .O(\psum_spad[1][3]_i_29_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][3]_i_3 
       (.I0(\psum_spad_reg[1][3]_i_13_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][3]_i_14_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][3]_i_15_n_0 ),
        .O(psum_spad[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_30 
       (.I0(\psum_spad_reg[15] [3]),
        .I1(\psum_spad_reg[14] [3]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [3]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [3]),
        .O(\psum_spad[1][3]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_31 
       (.I0(\psum_spad_reg[3] [3]),
        .I1(\psum_spad_reg[2] [3]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [3]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [3]),
        .O(\psum_spad[1][3]_i_31_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_32 
       (.I0(\psum_spad_reg[7] [3]),
        .I1(\psum_spad_reg[6] [3]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [3]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [3]),
        .O(\psum_spad[1][3]_i_32_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_33 
       (.I0(\psum_spad_reg[19] [2]),
        .I1(\psum_spad_reg[18] [2]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [2]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [2]),
        .O(\psum_spad[1][3]_i_33_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_34 
       (.I0(\psum_spad_reg[23] [2]),
        .I1(\psum_spad_reg[22] [2]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [2]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [2]),
        .O(\psum_spad[1][3]_i_34_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_35 
       (.I0(\psum_spad_reg[11] [2]),
        .I1(\psum_spad_reg[10] [2]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [2]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [2]),
        .O(\psum_spad[1][3]_i_35_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_36 
       (.I0(\psum_spad_reg[15] [2]),
        .I1(\psum_spad_reg[14] [2]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [2]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [2]),
        .O(\psum_spad[1][3]_i_36_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_37 
       (.I0(\psum_spad_reg[3] [2]),
        .I1(\psum_spad_reg[2] [2]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [2]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [2]),
        .O(\psum_spad[1][3]_i_37_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_38 
       (.I0(\psum_spad_reg[7] [2]),
        .I1(\psum_spad_reg[6] [2]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [2]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [2]),
        .O(\psum_spad[1][3]_i_38_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_39 
       (.I0(\psum_spad_reg[19] [1]),
        .I1(\psum_spad_reg[18] [1]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [1]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [1]),
        .O(\psum_spad[1][3]_i_39_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][3]_i_4 
       (.I0(\psum_spad_reg[1][3]_i_16_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][3]_i_17_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][3]_i_18_n_0 ),
        .O(psum_spad[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_40 
       (.I0(\psum_spad_reg[23] [1]),
        .I1(\psum_spad_reg[22] [1]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [1]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [1]),
        .O(\psum_spad[1][3]_i_40_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_41 
       (.I0(\psum_spad_reg[11] [1]),
        .I1(\psum_spad_reg[10] [1]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [1]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [1]),
        .O(\psum_spad[1][3]_i_41_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_42 
       (.I0(\psum_spad_reg[15] [1]),
        .I1(\psum_spad_reg[14] [1]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [1]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [1]),
        .O(\psum_spad[1][3]_i_42_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_43 
       (.I0(\psum_spad_reg[3] [1]),
        .I1(\psum_spad_reg[2] [1]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [1]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [1]),
        .O(\psum_spad[1][3]_i_43_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_44 
       (.I0(\psum_spad_reg[7] [1]),
        .I1(\psum_spad_reg[6] [1]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [1]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [1]),
        .O(\psum_spad[1][3]_i_44_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_45 
       (.I0(\psum_spad_reg[19] [0]),
        .I1(\psum_spad_reg[18] [0]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [0]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [0]),
        .O(\psum_spad[1][3]_i_45_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_46 
       (.I0(\psum_spad_reg[23] [0]),
        .I1(\psum_spad_reg[22] [0]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [0]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [0]),
        .O(\psum_spad[1][3]_i_46_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_47 
       (.I0(\psum_spad_reg[11] [0]),
        .I1(\psum_spad_reg[10] [0]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [0]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [0]),
        .O(\psum_spad[1][3]_i_47_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_48 
       (.I0(\psum_spad_reg[15] [0]),
        .I1(\psum_spad_reg[14] [0]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [0]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [0]),
        .O(\psum_spad[1][3]_i_48_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_49 
       (.I0(\psum_spad_reg[3] [0]),
        .I1(\psum_spad_reg[2] [0]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [0]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [0]),
        .O(\psum_spad[1][3]_i_49_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][3]_i_5 
       (.I0(\psum_spad_reg[1][3]_i_19_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][3]_i_20_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][3]_i_21_n_0 ),
        .O(psum_spad[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_50 
       (.I0(\psum_spad_reg[7] [0]),
        .I1(\psum_spad_reg[6] [0]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [0]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [0]),
        .O(\psum_spad[1][3]_i_50_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_51 
       (.I0(product_n_78),
        .I1(product_n_94),
        .I2(\shift_r_reg_n_0_[3] ),
        .I3(product_n_86),
        .I4(\shift_r_reg_n_0_[4] ),
        .I5(product_n_102),
        .O(\psum_spad[1][3]_i_51_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_52 
       (.I0(product_n_79),
        .I1(product_n_95),
        .I2(\shift_r_reg_n_0_[3] ),
        .I3(product_n_87),
        .I4(\shift_r_reg_n_0_[4] ),
        .I5(product_n_103),
        .O(\psum_spad[1][3]_i_52_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_53 
       (.I0(product_n_80),
        .I1(product_n_96),
        .I2(\shift_r_reg_n_0_[3] ),
        .I3(product_n_88),
        .I4(\shift_r_reg_n_0_[4] ),
        .I5(product_n_104),
        .O(\psum_spad[1][3]_i_53_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][3]_i_54 
       (.I0(product_n_81),
        .I1(product_n_97),
        .I2(\shift_r_reg_n_0_[3] ),
        .I3(product_n_89),
        .I4(\shift_r_reg_n_0_[4] ),
        .I5(product_n_105),
        .O(\psum_spad[1][3]_i_54_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \psum_spad[1][3]_i_6 
       (.I0(psum_spad[3]),
        .I1(\psum_spad[1][3]_i_22_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][7]_i_25_n_0 ),
        .O(\psum_spad[1][3]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \psum_spad[1][3]_i_7 
       (.I0(psum_spad[2]),
        .I1(\psum_spad[1][3]_i_23_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][3]_i_22_n_0 ),
        .O(\psum_spad[1][3]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \psum_spad[1][3]_i_8 
       (.I0(psum_spad[1]),
        .I1(\psum_spad[1][3]_i_24_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][3]_i_23_n_0 ),
        .O(\psum_spad[1][3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    \psum_spad[1][3]_i_9 
       (.I0(psum_spad[0]),
        .I1(\psum_spad[1][3]_i_25_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][3]_i_26_n_0 ),
        .I4(\shift_r_reg_n_0_[0] ),
        .I5(\psum_spad[1][3]_i_24_n_0 ),
        .O(\psum_spad[1][3]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][7]_i_2 
       (.I0(\psum_spad_reg[1][7]_i_10_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][7]_i_11_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][7]_i_12_n_0 ),
        .O(psum_spad[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_22 
       (.I0(\psum_spad[1][15]_i_58_n_0 ),
        .I1(\psum_spad[1][11]_i_52_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][11]_i_50_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][7]_i_50_n_0 ),
        .O(\psum_spad[1][7]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_23 
       (.I0(\psum_spad[1][15]_i_59_n_0 ),
        .I1(\psum_spad[1][11]_i_53_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][11]_i_51_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][7]_i_51_n_0 ),
        .O(\psum_spad[1][7]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_24 
       (.I0(\psum_spad[1][11]_i_50_n_0 ),
        .I1(\psum_spad[1][7]_i_50_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][11]_i_52_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][7]_i_52_n_0 ),
        .O(\psum_spad[1][7]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_25 
       (.I0(\psum_spad[1][11]_i_51_n_0 ),
        .I1(\psum_spad[1][7]_i_51_n_0 ),
        .I2(\shift_r_reg_n_0_[1] ),
        .I3(\psum_spad[1][11]_i_53_n_0 ),
        .I4(\shift_r_reg_n_0_[2] ),
        .I5(\psum_spad[1][7]_i_53_n_0 ),
        .O(\psum_spad[1][7]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_26 
       (.I0(\psum_spad_reg[19] [7]),
        .I1(\psum_spad_reg[18] [7]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [7]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [7]),
        .O(\psum_spad[1][7]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_27 
       (.I0(\psum_spad_reg[23] [7]),
        .I1(\psum_spad_reg[22] [7]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [7]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [7]),
        .O(\psum_spad[1][7]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_28 
       (.I0(\psum_spad_reg[11] [7]),
        .I1(\psum_spad_reg[10] [7]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [7]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [7]),
        .O(\psum_spad[1][7]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_29 
       (.I0(\psum_spad_reg[15] [7]),
        .I1(\psum_spad_reg[14] [7]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [7]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [7]),
        .O(\psum_spad[1][7]_i_29_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][7]_i_3 
       (.I0(\psum_spad_reg[1][7]_i_13_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][7]_i_14_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][7]_i_15_n_0 ),
        .O(psum_spad[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_30 
       (.I0(\psum_spad_reg[3] [7]),
        .I1(\psum_spad_reg[2] [7]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [7]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [7]),
        .O(\psum_spad[1][7]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_31 
       (.I0(\psum_spad_reg[7] [7]),
        .I1(\psum_spad_reg[6] [7]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [7]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [7]),
        .O(\psum_spad[1][7]_i_31_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_32 
       (.I0(\psum_spad_reg[19] [6]),
        .I1(\psum_spad_reg[18] [6]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [6]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [6]),
        .O(\psum_spad[1][7]_i_32_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_33 
       (.I0(\psum_spad_reg[23] [6]),
        .I1(\psum_spad_reg[22] [6]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [6]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [6]),
        .O(\psum_spad[1][7]_i_33_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_34 
       (.I0(\psum_spad_reg[11] [6]),
        .I1(\psum_spad_reg[10] [6]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [6]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [6]),
        .O(\psum_spad[1][7]_i_34_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_35 
       (.I0(\psum_spad_reg[15] [6]),
        .I1(\psum_spad_reg[14] [6]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [6]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [6]),
        .O(\psum_spad[1][7]_i_35_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_36 
       (.I0(\psum_spad_reg[3] [6]),
        .I1(\psum_spad_reg[2] [6]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [6]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [6]),
        .O(\psum_spad[1][7]_i_36_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_37 
       (.I0(\psum_spad_reg[7] [6]),
        .I1(\psum_spad_reg[6] [6]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [6]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [6]),
        .O(\psum_spad[1][7]_i_37_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_38 
       (.I0(\psum_spad_reg[19] [5]),
        .I1(\psum_spad_reg[18] [5]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [5]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [5]),
        .O(\psum_spad[1][7]_i_38_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_39 
       (.I0(\psum_spad_reg[23] [5]),
        .I1(\psum_spad_reg[22] [5]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [5]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [5]),
        .O(\psum_spad[1][7]_i_39_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][7]_i_4 
       (.I0(\psum_spad_reg[1][7]_i_16_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][7]_i_17_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][7]_i_18_n_0 ),
        .O(psum_spad[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_40 
       (.I0(\psum_spad_reg[11] [5]),
        .I1(\psum_spad_reg[10] [5]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [5]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [5]),
        .O(\psum_spad[1][7]_i_40_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_41 
       (.I0(\psum_spad_reg[15] [5]),
        .I1(\psum_spad_reg[14] [5]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [5]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [5]),
        .O(\psum_spad[1][7]_i_41_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_42 
       (.I0(\psum_spad_reg[3] [5]),
        .I1(\psum_spad_reg[2] [5]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [5]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [5]),
        .O(\psum_spad[1][7]_i_42_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_43 
       (.I0(\psum_spad_reg[7] [5]),
        .I1(\psum_spad_reg[6] [5]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [5]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [5]),
        .O(\psum_spad[1][7]_i_43_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_44 
       (.I0(\psum_spad_reg[19] [4]),
        .I1(\psum_spad_reg[18] [4]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[17] [4]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[16] [4]),
        .O(\psum_spad[1][7]_i_44_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_45 
       (.I0(\psum_spad_reg[23] [4]),
        .I1(\psum_spad_reg[22] [4]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[21] [4]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[20] [4]),
        .O(\psum_spad[1][7]_i_45_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_46 
       (.I0(\psum_spad_reg[11] [4]),
        .I1(\psum_spad_reg[10] [4]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[9] [4]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[8] [4]),
        .O(\psum_spad[1][7]_i_46_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_47 
       (.I0(\psum_spad_reg[15] [4]),
        .I1(\psum_spad_reg[14] [4]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[13] [4]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[12] [4]),
        .O(\psum_spad[1][7]_i_47_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_48 
       (.I0(\psum_spad_reg[3] [4]),
        .I1(\psum_spad_reg[2] [4]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[1] [4]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[0] [4]),
        .O(\psum_spad[1][7]_i_48_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_49 
       (.I0(\psum_spad_reg[7] [4]),
        .I1(\psum_spad_reg[6] [4]),
        .I2(k_r[1]),
        .I3(\psum_spad_reg[5] [4]),
        .I4(k_r[0]),
        .I5(\psum_spad_reg[4] [4]),
        .O(\psum_spad[1][7]_i_49_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \psum_spad[1][7]_i_5 
       (.I0(\psum_spad_reg[1][7]_i_19_n_0 ),
        .I1(k_r[4]),
        .I2(\psum_spad_reg[1][7]_i_20_n_0 ),
        .I3(k_r[3]),
        .I4(\psum_spad_reg[1][7]_i_21_n_0 ),
        .O(psum_spad[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_50 
       (.I0(product_n_74),
        .I1(product_n_90),
        .I2(\shift_r_reg_n_0_[3] ),
        .I3(product_n_82),
        .I4(\shift_r_reg_n_0_[4] ),
        .I5(product_n_98),
        .O(\psum_spad[1][7]_i_50_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_51 
       (.I0(product_n_75),
        .I1(product_n_91),
        .I2(\shift_r_reg_n_0_[3] ),
        .I3(product_n_83),
        .I4(\shift_r_reg_n_0_[4] ),
        .I5(product_n_99),
        .O(\psum_spad[1][7]_i_51_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_52 
       (.I0(product_n_76),
        .I1(product_n_92),
        .I2(\shift_r_reg_n_0_[3] ),
        .I3(product_n_84),
        .I4(\shift_r_reg_n_0_[4] ),
        .I5(product_n_100),
        .O(\psum_spad[1][7]_i_52_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \psum_spad[1][7]_i_53 
       (.I0(product_n_77),
        .I1(product_n_93),
        .I2(\shift_r_reg_n_0_[3] ),
        .I3(product_n_85),
        .I4(\shift_r_reg_n_0_[4] ),
        .I5(product_n_101),
        .O(\psum_spad[1][7]_i_53_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \psum_spad[1][7]_i_6 
       (.I0(psum_spad[7]),
        .I1(\psum_spad[1][7]_i_22_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][11]_i_25_n_0 ),
        .O(\psum_spad[1][7]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \psum_spad[1][7]_i_7 
       (.I0(psum_spad[6]),
        .I1(\psum_spad[1][7]_i_23_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][7]_i_22_n_0 ),
        .O(\psum_spad[1][7]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \psum_spad[1][7]_i_8 
       (.I0(psum_spad[5]),
        .I1(\psum_spad[1][7]_i_24_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][7]_i_23_n_0 ),
        .O(\psum_spad[1][7]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \psum_spad[1][7]_i_9 
       (.I0(psum_spad[4]),
        .I1(\psum_spad[1][7]_i_25_n_0 ),
        .I2(\shift_r_reg_n_0_[0] ),
        .I3(\psum_spad[1][7]_i_24_n_0 ),
        .O(\psum_spad[1][7]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h10000000)) 
    \psum_spad[20][15]_i_1 
       (.I0(k_r[0]),
        .I1(k_r[1]),
        .I2(k_r[2]),
        .I3(\psum_spad[1][15]_i_4_n_0 ),
        .I4(k_r[4]),
        .O(\psum_spad[20][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \psum_spad[21][15]_i_1 
       (.I0(k_r[1]),
        .I1(k_r[0]),
        .I2(k_r[2]),
        .I3(\psum_spad[1][15]_i_4_n_0 ),
        .I4(k_r[4]),
        .O(\psum_spad[21][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \psum_spad[22][15]_i_1 
       (.I0(k_r[0]),
        .I1(k_r[1]),
        .I2(k_r[2]),
        .I3(\psum_spad[1][15]_i_4_n_0 ),
        .I4(k_r[4]),
        .O(\psum_spad[22][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \psum_spad[23][15]_i_1 
       (.I0(k_r[0]),
        .I1(k_r[1]),
        .I2(k_r[2]),
        .I3(\psum_spad[1][15]_i_4_n_0 ),
        .I4(k_r[4]),
        .O(\psum_spad[23][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    \psum_spad[2][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[1]),
        .I3(k_r[0]),
        .I4(\psum_spad[1][15]_i_4_n_0 ),
        .O(\psum_spad[2][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h10000000)) 
    \psum_spad[3][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[1]),
        .I3(k_r[0]),
        .I4(\psum_spad[1][15]_i_4_n_0 ),
        .O(\psum_spad[3][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    \psum_spad[4][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[1]),
        .I3(k_r[0]),
        .I4(\psum_spad[1][15]_i_4_n_0 ),
        .O(\psum_spad[4][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    \psum_spad[5][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[0]),
        .I3(k_r[1]),
        .I4(\psum_spad[1][15]_i_4_n_0 ),
        .O(\psum_spad[5][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    \psum_spad[6][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[1]),
        .I3(k_r[0]),
        .I4(\psum_spad[1][15]_i_4_n_0 ),
        .O(\psum_spad[6][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \psum_spad[7][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[1]),
        .I3(k_r[0]),
        .I4(\psum_spad[1][15]_i_4_n_0 ),
        .O(\psum_spad[7][15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \psum_spad[8][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[1]),
        .I3(k_r[0]),
        .I4(\psum_spad[8][15]_i_2_n_0 ),
        .O(\psum_spad[8][15]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hDF)) 
    \psum_spad[8][15]_i_2 
       (.I0(vld_r),
        .I1(gate_r),
        .I2(k_r[3]),
        .O(\psum_spad[8][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000010)) 
    \psum_spad[9][15]_i_1 
       (.I0(k_r[4]),
        .I1(k_r[2]),
        .I2(k_r[0]),
        .I3(k_r[1]),
        .I4(\psum_spad[8][15]_i_2_n_0 ),
        .O(\psum_spad[9][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][0] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[0] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][10] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[0] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][11] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[0] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][12] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[0] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][13] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[0] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][14] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[0] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][15] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[0] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][1] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[0] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][2] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[0] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][3] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[0] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][4] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[0] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][5] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[0] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][6] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[0] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][7] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[0] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][8] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[0] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[0][9] 
       (.C(clk),
        .CE(\psum_spad[0][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[0] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][0] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[10] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][10] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[10] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][11] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[10] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][12] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[10] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][13] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[10] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][14] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[10] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][15] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[10] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][1] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[10] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][2] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[10] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][3] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[10] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][4] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[10] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][5] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[10] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][6] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[10] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][7] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[10] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][8] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[10] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[10][9] 
       (.C(clk),
        .CE(\psum_spad[10][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[10] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][0] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[11] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][10] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[11] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][11] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[11] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][12] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[11] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][13] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[11] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][14] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[11] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][15] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[11] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][1] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[11] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][2] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[11] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][3] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[11] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][4] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[11] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][5] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[11] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][6] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[11] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][7] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[11] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][8] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[11] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[11][9] 
       (.C(clk),
        .CE(\psum_spad[11][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[11] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][0] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[12] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][10] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[12] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][11] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[12] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][12] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[12] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][13] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[12] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][14] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[12] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][15] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[12] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][1] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[12] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][2] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[12] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][3] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[12] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][4] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[12] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][5] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[12] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][6] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[12] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][7] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[12] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][8] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[12] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[12][9] 
       (.C(clk),
        .CE(\psum_spad[12][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[12] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][0] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[13] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][10] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[13] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][11] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[13] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][12] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[13] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][13] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[13] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][14] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[13] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][15] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[13] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][1] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[13] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][2] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[13] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][3] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[13] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][4] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[13] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][5] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[13] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][6] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[13] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][7] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[13] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][8] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[13] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[13][9] 
       (.C(clk),
        .CE(\psum_spad[13][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[13] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][0] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[14] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][10] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[14] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][11] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[14] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][12] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[14] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][13] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[14] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][14] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[14] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][15] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[14] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][1] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[14] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][2] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[14] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][3] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[14] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][4] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[14] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][5] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[14] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][6] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[14] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][7] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[14] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][8] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[14] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[14][9] 
       (.C(clk),
        .CE(\psum_spad[14][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[14] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][0] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[15] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][10] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[15] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][11] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[15] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][12] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[15] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][13] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[15] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][14] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[15] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][15] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[15] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][1] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[15] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][2] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[15] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][3] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[15] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][4] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[15] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][5] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[15] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][6] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[15] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][7] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[15] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][8] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[15] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[15][9] 
       (.C(clk),
        .CE(\psum_spad[15][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[15] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][0] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[16] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][10] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[16] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][11] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[16] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][12] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[16] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][13] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[16] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][14] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[16] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][15] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[16] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][1] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[16] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][2] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[16] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][3] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[16] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][4] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[16] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][5] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[16] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][6] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[16] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][7] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[16] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][8] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[16] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[16][9] 
       (.C(clk),
        .CE(\psum_spad[16][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[16] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][0] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[17] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][10] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[17] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][11] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[17] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][12] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[17] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][13] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[17] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][14] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[17] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][15] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[17] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][1] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[17] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][2] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[17] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][3] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[17] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][4] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[17] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][5] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[17] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][6] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[17] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][7] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[17] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][8] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[17] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[17][9] 
       (.C(clk),
        .CE(\psum_spad[17][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[17] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][0] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[18] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][10] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[18] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][11] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[18] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][12] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[18] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][13] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[18] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][14] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[18] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][15] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[18] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][1] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[18] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][2] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[18] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][3] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[18] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][4] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[18] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][5] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[18] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][6] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[18] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][7] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[18] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][8] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[18] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[18][9] 
       (.C(clk),
        .CE(\psum_spad[18][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[18] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][0] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[19] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][10] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[19] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][11] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[19] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][12] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[19] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][13] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[19] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][14] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[19] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][15] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[19] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][1] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[19] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][2] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[19] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][3] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[19] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][4] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[19] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][5] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[19] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][6] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[19] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][7] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[19] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][8] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[19] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[19][9] 
       (.C(clk),
        .CE(\psum_spad[19][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[19] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][0] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[1] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][10] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[1] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][11] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[1] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \psum_spad_reg[1][11]_i_1 
       (.CI(\psum_spad_reg[1][7]_i_1_n_0 ),
        .CO({\psum_spad_reg[1][11]_i_1_n_0 ,\NLW_psum_spad_reg[1][11]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(psum_spad[11:8]),
        .O(acc_next[11:8]),
        .S({\psum_spad[1][11]_i_6_n_0 ,\psum_spad[1][11]_i_7_n_0 ,\psum_spad[1][11]_i_8_n_0 ,\psum_spad[1][11]_i_9_n_0 }));
  MUXF7 \psum_spad_reg[1][11]_i_10 
       (.I0(\psum_spad[1][11]_i_26_n_0 ),
        .I1(\psum_spad[1][11]_i_27_n_0 ),
        .O(\psum_spad_reg[1][11]_i_10_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][11]_i_11 
       (.I0(\psum_spad[1][11]_i_28_n_0 ),
        .I1(\psum_spad[1][11]_i_29_n_0 ),
        .O(\psum_spad_reg[1][11]_i_11_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][11]_i_12 
       (.I0(\psum_spad[1][11]_i_30_n_0 ),
        .I1(\psum_spad[1][11]_i_31_n_0 ),
        .O(\psum_spad_reg[1][11]_i_12_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][11]_i_13 
       (.I0(\psum_spad[1][11]_i_32_n_0 ),
        .I1(\psum_spad[1][11]_i_33_n_0 ),
        .O(\psum_spad_reg[1][11]_i_13_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][11]_i_14 
       (.I0(\psum_spad[1][11]_i_34_n_0 ),
        .I1(\psum_spad[1][11]_i_35_n_0 ),
        .O(\psum_spad_reg[1][11]_i_14_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][11]_i_15 
       (.I0(\psum_spad[1][11]_i_36_n_0 ),
        .I1(\psum_spad[1][11]_i_37_n_0 ),
        .O(\psum_spad_reg[1][11]_i_15_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][11]_i_16 
       (.I0(\psum_spad[1][11]_i_38_n_0 ),
        .I1(\psum_spad[1][11]_i_39_n_0 ),
        .O(\psum_spad_reg[1][11]_i_16_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][11]_i_17 
       (.I0(\psum_spad[1][11]_i_40_n_0 ),
        .I1(\psum_spad[1][11]_i_41_n_0 ),
        .O(\psum_spad_reg[1][11]_i_17_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][11]_i_18 
       (.I0(\psum_spad[1][11]_i_42_n_0 ),
        .I1(\psum_spad[1][11]_i_43_n_0 ),
        .O(\psum_spad_reg[1][11]_i_18_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][11]_i_19 
       (.I0(\psum_spad[1][11]_i_44_n_0 ),
        .I1(\psum_spad[1][11]_i_45_n_0 ),
        .O(\psum_spad_reg[1][11]_i_19_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][11]_i_20 
       (.I0(\psum_spad[1][11]_i_46_n_0 ),
        .I1(\psum_spad[1][11]_i_47_n_0 ),
        .O(\psum_spad_reg[1][11]_i_20_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][11]_i_21 
       (.I0(\psum_spad[1][11]_i_48_n_0 ),
        .I1(\psum_spad[1][11]_i_49_n_0 ),
        .O(\psum_spad_reg[1][11]_i_21_n_0 ),
        .S(k_r[2]));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][12] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[1] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][13] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[1] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][14] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[1] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][15] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[1] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  MUXF7 \psum_spad_reg[1][15]_i_12 
       (.I0(\psum_spad[1][15]_i_30_n_0 ),
        .I1(\psum_spad[1][15]_i_31_n_0 ),
        .O(\psum_spad_reg[1][15]_i_12_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][15]_i_13 
       (.I0(\psum_spad[1][15]_i_32_n_0 ),
        .I1(\psum_spad[1][15]_i_33_n_0 ),
        .O(\psum_spad_reg[1][15]_i_13_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][15]_i_14 
       (.I0(\psum_spad[1][15]_i_34_n_0 ),
        .I1(\psum_spad[1][15]_i_35_n_0 ),
        .O(\psum_spad_reg[1][15]_i_14_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][15]_i_15 
       (.I0(\psum_spad[1][15]_i_36_n_0 ),
        .I1(\psum_spad[1][15]_i_37_n_0 ),
        .O(\psum_spad_reg[1][15]_i_15_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][15]_i_16 
       (.I0(\psum_spad[1][15]_i_38_n_0 ),
        .I1(\psum_spad[1][15]_i_39_n_0 ),
        .O(\psum_spad_reg[1][15]_i_16_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][15]_i_17 
       (.I0(\psum_spad[1][15]_i_40_n_0 ),
        .I1(\psum_spad[1][15]_i_41_n_0 ),
        .O(\psum_spad_reg[1][15]_i_17_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][15]_i_18 
       (.I0(\psum_spad[1][15]_i_42_n_0 ),
        .I1(\psum_spad[1][15]_i_43_n_0 ),
        .O(\psum_spad_reg[1][15]_i_18_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][15]_i_19 
       (.I0(\psum_spad[1][15]_i_44_n_0 ),
        .I1(\psum_spad[1][15]_i_45_n_0 ),
        .O(\psum_spad_reg[1][15]_i_19_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][15]_i_20 
       (.I0(\psum_spad[1][15]_i_46_n_0 ),
        .I1(\psum_spad[1][15]_i_47_n_0 ),
        .O(\psum_spad_reg[1][15]_i_20_n_0 ),
        .S(k_r[2]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \psum_spad_reg[1][15]_i_3 
       (.CI(\psum_spad_reg[1][11]_i_1_n_0 ),
        .CO(\NLW_psum_spad_reg[1][15]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,psum_spad[14:12]}),
        .O(acc_next[15:12]),
        .S({\psum_spad[1][15]_i_8_n_0 ,\psum_spad[1][15]_i_9_n_0 ,\psum_spad[1][15]_i_10_n_0 ,\psum_spad[1][15]_i_11_n_0 }));
  MUXF7 \psum_spad_reg[1][15]_i_48 
       (.I0(\psum_spad[1][15]_i_60_n_0 ),
        .I1(\psum_spad[1][15]_i_61_n_0 ),
        .O(\psum_spad_reg[1][15]_i_48_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][15]_i_49 
       (.I0(\psum_spad[1][15]_i_62_n_0 ),
        .I1(\psum_spad[1][15]_i_63_n_0 ),
        .O(\psum_spad_reg[1][15]_i_49_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][15]_i_50 
       (.I0(\psum_spad[1][15]_i_64_n_0 ),
        .I1(\psum_spad[1][15]_i_65_n_0 ),
        .O(\psum_spad_reg[1][15]_i_50_n_0 ),
        .S(k_r[2]));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][1] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[1] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][2] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[1] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][3] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[1] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \psum_spad_reg[1][3]_i_1 
       (.CI(1'b0),
        .CO({\psum_spad_reg[1][3]_i_1_n_0 ,\NLW_psum_spad_reg[1][3]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(psum_spad[3:0]),
        .O(acc_next[3:0]),
        .S({\psum_spad[1][3]_i_6_n_0 ,\psum_spad[1][3]_i_7_n_0 ,\psum_spad[1][3]_i_8_n_0 ,\psum_spad[1][3]_i_9_n_0 }));
  MUXF7 \psum_spad_reg[1][3]_i_10 
       (.I0(\psum_spad[1][3]_i_27_n_0 ),
        .I1(\psum_spad[1][3]_i_28_n_0 ),
        .O(\psum_spad_reg[1][3]_i_10_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][3]_i_11 
       (.I0(\psum_spad[1][3]_i_29_n_0 ),
        .I1(\psum_spad[1][3]_i_30_n_0 ),
        .O(\psum_spad_reg[1][3]_i_11_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][3]_i_12 
       (.I0(\psum_spad[1][3]_i_31_n_0 ),
        .I1(\psum_spad[1][3]_i_32_n_0 ),
        .O(\psum_spad_reg[1][3]_i_12_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][3]_i_13 
       (.I0(\psum_spad[1][3]_i_33_n_0 ),
        .I1(\psum_spad[1][3]_i_34_n_0 ),
        .O(\psum_spad_reg[1][3]_i_13_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][3]_i_14 
       (.I0(\psum_spad[1][3]_i_35_n_0 ),
        .I1(\psum_spad[1][3]_i_36_n_0 ),
        .O(\psum_spad_reg[1][3]_i_14_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][3]_i_15 
       (.I0(\psum_spad[1][3]_i_37_n_0 ),
        .I1(\psum_spad[1][3]_i_38_n_0 ),
        .O(\psum_spad_reg[1][3]_i_15_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][3]_i_16 
       (.I0(\psum_spad[1][3]_i_39_n_0 ),
        .I1(\psum_spad[1][3]_i_40_n_0 ),
        .O(\psum_spad_reg[1][3]_i_16_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][3]_i_17 
       (.I0(\psum_spad[1][3]_i_41_n_0 ),
        .I1(\psum_spad[1][3]_i_42_n_0 ),
        .O(\psum_spad_reg[1][3]_i_17_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][3]_i_18 
       (.I0(\psum_spad[1][3]_i_43_n_0 ),
        .I1(\psum_spad[1][3]_i_44_n_0 ),
        .O(\psum_spad_reg[1][3]_i_18_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][3]_i_19 
       (.I0(\psum_spad[1][3]_i_45_n_0 ),
        .I1(\psum_spad[1][3]_i_46_n_0 ),
        .O(\psum_spad_reg[1][3]_i_19_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][3]_i_20 
       (.I0(\psum_spad[1][3]_i_47_n_0 ),
        .I1(\psum_spad[1][3]_i_48_n_0 ),
        .O(\psum_spad_reg[1][3]_i_20_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][3]_i_21 
       (.I0(\psum_spad[1][3]_i_49_n_0 ),
        .I1(\psum_spad[1][3]_i_50_n_0 ),
        .O(\psum_spad_reg[1][3]_i_21_n_0 ),
        .S(k_r[2]));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][4] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[1] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][5] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[1] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][6] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[1] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][7] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[1] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \psum_spad_reg[1][7]_i_1 
       (.CI(\psum_spad_reg[1][3]_i_1_n_0 ),
        .CO({\psum_spad_reg[1][7]_i_1_n_0 ,\NLW_psum_spad_reg[1][7]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(psum_spad[7:4]),
        .O(acc_next[7:4]),
        .S({\psum_spad[1][7]_i_6_n_0 ,\psum_spad[1][7]_i_7_n_0 ,\psum_spad[1][7]_i_8_n_0 ,\psum_spad[1][7]_i_9_n_0 }));
  MUXF7 \psum_spad_reg[1][7]_i_10 
       (.I0(\psum_spad[1][7]_i_26_n_0 ),
        .I1(\psum_spad[1][7]_i_27_n_0 ),
        .O(\psum_spad_reg[1][7]_i_10_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][7]_i_11 
       (.I0(\psum_spad[1][7]_i_28_n_0 ),
        .I1(\psum_spad[1][7]_i_29_n_0 ),
        .O(\psum_spad_reg[1][7]_i_11_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][7]_i_12 
       (.I0(\psum_spad[1][7]_i_30_n_0 ),
        .I1(\psum_spad[1][7]_i_31_n_0 ),
        .O(\psum_spad_reg[1][7]_i_12_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][7]_i_13 
       (.I0(\psum_spad[1][7]_i_32_n_0 ),
        .I1(\psum_spad[1][7]_i_33_n_0 ),
        .O(\psum_spad_reg[1][7]_i_13_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][7]_i_14 
       (.I0(\psum_spad[1][7]_i_34_n_0 ),
        .I1(\psum_spad[1][7]_i_35_n_0 ),
        .O(\psum_spad_reg[1][7]_i_14_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][7]_i_15 
       (.I0(\psum_spad[1][7]_i_36_n_0 ),
        .I1(\psum_spad[1][7]_i_37_n_0 ),
        .O(\psum_spad_reg[1][7]_i_15_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][7]_i_16 
       (.I0(\psum_spad[1][7]_i_38_n_0 ),
        .I1(\psum_spad[1][7]_i_39_n_0 ),
        .O(\psum_spad_reg[1][7]_i_16_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][7]_i_17 
       (.I0(\psum_spad[1][7]_i_40_n_0 ),
        .I1(\psum_spad[1][7]_i_41_n_0 ),
        .O(\psum_spad_reg[1][7]_i_17_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][7]_i_18 
       (.I0(\psum_spad[1][7]_i_42_n_0 ),
        .I1(\psum_spad[1][7]_i_43_n_0 ),
        .O(\psum_spad_reg[1][7]_i_18_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][7]_i_19 
       (.I0(\psum_spad[1][7]_i_44_n_0 ),
        .I1(\psum_spad[1][7]_i_45_n_0 ),
        .O(\psum_spad_reg[1][7]_i_19_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][7]_i_20 
       (.I0(\psum_spad[1][7]_i_46_n_0 ),
        .I1(\psum_spad[1][7]_i_47_n_0 ),
        .O(\psum_spad_reg[1][7]_i_20_n_0 ),
        .S(k_r[2]));
  MUXF7 \psum_spad_reg[1][7]_i_21 
       (.I0(\psum_spad[1][7]_i_48_n_0 ),
        .I1(\psum_spad[1][7]_i_49_n_0 ),
        .O(\psum_spad_reg[1][7]_i_21_n_0 ),
        .S(k_r[2]));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][8] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[1] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[1][9] 
       (.C(clk),
        .CE(\psum_spad[1][15]_i_2_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[1] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][0] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[20] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][10] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[20] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][11] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[20] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][12] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[20] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][13] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[20] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][14] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[20] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][15] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[20] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][1] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[20] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][2] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[20] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][3] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[20] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][4] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[20] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][5] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[20] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][6] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[20] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][7] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[20] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][8] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[20] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[20][9] 
       (.C(clk),
        .CE(\psum_spad[20][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[20] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][0] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[21] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][10] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[21] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][11] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[21] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][12] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[21] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][13] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[21] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][14] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[21] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][15] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[21] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][1] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[21] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][2] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[21] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][3] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[21] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][4] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[21] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][5] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[21] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][6] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[21] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][7] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[21] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][8] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[21] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[21][9] 
       (.C(clk),
        .CE(\psum_spad[21][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[21] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][0] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[22] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][10] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[22] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][11] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[22] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][12] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[22] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][13] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[22] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][14] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[22] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][15] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[22] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][1] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[22] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][2] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[22] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][3] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[22] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][4] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[22] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][5] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[22] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][6] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[22] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][7] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[22] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][8] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[22] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[22][9] 
       (.C(clk),
        .CE(\psum_spad[22][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[22] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][0] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[23] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][10] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[23] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][11] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[23] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][12] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[23] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][13] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[23] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][14] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[23] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][15] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[23] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][1] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[23] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][2] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[23] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][3] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[23] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][4] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[23] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][5] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[23] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][6] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[23] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][7] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[23] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][8] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[23] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[23][9] 
       (.C(clk),
        .CE(\psum_spad[23][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[23] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][0] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[2] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][10] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[2] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][11] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[2] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][12] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[2] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][13] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[2] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][14] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[2] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][15] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[2] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][1] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[2] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][2] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[2] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][3] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[2] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][4] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[2] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][5] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[2] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][6] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[2] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][7] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[2] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][8] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[2] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[2][9] 
       (.C(clk),
        .CE(\psum_spad[2][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[2] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][0] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[3] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][10] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[3] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][11] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[3] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][12] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[3] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][13] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[3] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][14] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[3] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][15] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[3] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][1] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[3] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][2] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[3] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][3] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[3] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][4] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[3] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][5] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[3] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][6] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[3] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][7] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[3] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][8] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[3] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[3][9] 
       (.C(clk),
        .CE(\psum_spad[3][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[3] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][0] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[4] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][10] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[4] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][11] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[4] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][12] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[4] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][13] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[4] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][14] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[4] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][15] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[4] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][1] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[4] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][2] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[4] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][3] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[4] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][4] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[4] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][5] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[4] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][6] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[4] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][7] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[4] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][8] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[4] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[4][9] 
       (.C(clk),
        .CE(\psum_spad[4][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[4] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][0] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[5] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][10] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[5] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][11] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[5] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][12] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[5] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][13] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[5] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][14] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[5] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][15] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[5] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][1] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[5] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][2] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[5] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][3] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[5] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][4] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[5] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][5] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[5] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][6] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[5] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][7] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[5] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][8] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[5] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[5][9] 
       (.C(clk),
        .CE(\psum_spad[5][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[5] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][0] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[6] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][10] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[6] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][11] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[6] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][12] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[6] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][13] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[6] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][14] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[6] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][15] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[6] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][1] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[6] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][2] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[6] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][3] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[6] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][4] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[6] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][5] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[6] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][6] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[6] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][7] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[6] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][8] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[6] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[6][9] 
       (.C(clk),
        .CE(\psum_spad[6][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[6] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][0] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[7] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][10] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[7] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][11] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[7] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][12] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[7] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][13] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[7] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][14] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[7] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][15] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[7] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][1] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[7] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][2] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[7] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][3] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[7] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][4] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[7] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][5] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[7] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][6] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[7] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][7] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[7] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][8] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[7] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[7][9] 
       (.C(clk),
        .CE(\psum_spad[7][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[7] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][0] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[8] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][10] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[8] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][11] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[8] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][12] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[8] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][13] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[8] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][14] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[8] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][15] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[8] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][1] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[8] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][2] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[8] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][3] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[8] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][4] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[8] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][5] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[8] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][6] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[8] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][7] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[8] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][8] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[8] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[8][9] 
       (.C(clk),
        .CE(\psum_spad[8][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[8] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][0] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[0]),
        .Q(\psum_spad_reg[9] [0]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][10] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[10]),
        .Q(\psum_spad_reg[9] [10]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][11] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[11]),
        .Q(\psum_spad_reg[9] [11]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][12] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[12]),
        .Q(\psum_spad_reg[9] [12]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][13] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[13]),
        .Q(\psum_spad_reg[9] [13]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][14] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[14]),
        .Q(\psum_spad_reg[9] [14]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][15] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[15]),
        .Q(\psum_spad_reg[9] [15]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][1] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[1]),
        .Q(\psum_spad_reg[9] [1]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][2] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[2]),
        .Q(\psum_spad_reg[9] [2]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][3] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[3]),
        .Q(\psum_spad_reg[9] [3]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][4] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[4]),
        .Q(\psum_spad_reg[9] [4]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][5] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[5]),
        .Q(\psum_spad_reg[9] [5]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][6] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[6]),
        .Q(\psum_spad_reg[9] [6]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][7] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[7]),
        .Q(\psum_spad_reg[9] [7]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][8] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[8]),
        .Q(\psum_spad_reg[9] [8]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \psum_spad_reg[9][9] 
       (.C(clk),
        .CE(\psum_spad[9][15]_i_1_n_0 ),
        .D(acc_next[9]),
        .Q(\psum_spad_reg[9] [9]),
        .R(\psum_spad[1][15]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    psum_valid_INST_0
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[1] ),
        .O(psum_valid));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \rbase[0]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(rbase[0]),
        .O(\rbase[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \rbase[1]_i_1 
       (.I0(rbase[1]),
        .I1(rbase[0]),
        .I2(\state_reg_n_0_[2] ),
        .O(\rbase[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h0CCC4000)) 
    \rbase[2]_i_1 
       (.I0(rbase[3]),
        .I1(\state_reg_n_0_[2] ),
        .I2(rbase[0]),
        .I3(rbase[1]),
        .I4(rbase[2]),
        .O(\rbase[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h0AAA8000)) 
    \rbase[3]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(rbase[2]),
        .I2(rbase[1]),
        .I3(rbase[0]),
        .I4(rbase[3]),
        .O(\rbase[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rbase_reg[0] 
       (.C(clk),
        .CE(e_cnt),
        .D(\rbase[0]_i_1_n_0 ),
        .Q(rbase[0]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \rbase_reg[1] 
       (.C(clk),
        .CE(e_cnt),
        .D(\rbase[1]_i_1_n_0 ),
        .Q(rbase[1]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \rbase_reg[2] 
       (.C(clk),
        .CE(e_cnt),
        .D(\rbase[2]_i_1_n_0 ),
        .Q(rbase[2]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \rbase_reg[3] 
       (.C(clk),
        .CE(e_cnt),
        .D(\rbase[3]_i_1_n_0 ),
        .Q(rbase[3]),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s_cnt[0]_i_1 
       (.I0(\s_cnt[4]_i_4_n_0 ),
        .I1(s_cnt[0]),
        .O(\s_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \s_cnt[1]_i_1 
       (.I0(\s_cnt[4]_i_4_n_0 ),
        .I1(s_cnt[1]),
        .I2(s_cnt[0]),
        .O(\s_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \s_cnt[2]_i_1 
       (.I0(\s_cnt[4]_i_4_n_0 ),
        .I1(s_cnt[0]),
        .I2(s_cnt[1]),
        .I3(s_cnt[2]),
        .O(\s_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \s_cnt[3]_i_1 
       (.I0(\s_cnt[4]_i_4_n_0 ),
        .I1(s_cnt[1]),
        .I2(s_cnt[0]),
        .I3(s_cnt[2]),
        .I4(s_cnt[3]),
        .O(\s_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAEAAAEBAAAAAAA)) 
    \s_cnt[4]_i_1 
       (.I0(\k_cnt[4]_i_3_n_0 ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[0] ),
        .I4(ifmap_valid),
        .I5(\s_cnt[4]_i_3_n_0 ),
        .O(\s_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \s_cnt[4]_i_2 
       (.I0(\s_cnt[4]_i_4_n_0 ),
        .I1(s_cnt[2]),
        .I2(s_cnt[0]),
        .I3(s_cnt[1]),
        .I4(s_cnt[3]),
        .I5(s_cnt[4]),
        .O(\s_cnt[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000009906009)) 
    \s_cnt[4]_i_3 
       (.I0(p_max[4]),
        .I1(k_cnt[4]),
        .I2(k_cnt[3]),
        .I3(\drain_cnt[4]_i_5_n_0 ),
        .I4(p_max[3]),
        .I5(\s_cnt[4]_i_5_n_0 ),
        .O(\s_cnt[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \s_cnt[4]_i_4 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\s_cnt[4]_i_6_n_0 ),
        .O(\s_cnt[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFF6FF6FFF9FFFF6F)) 
    \s_cnt[4]_i_5 
       (.I0(p_max[2]),
        .I1(k_cnt[2]),
        .I2(p_max[0]),
        .I3(k_cnt[0]),
        .I4(k_cnt[1]),
        .I5(p_max[1]),
        .O(\s_cnt[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h4080084004088004)) 
    \s_cnt[4]_i_6 
       (.I0(s_cnt[3]),
        .I1(\s_cnt[4]_i_7_n_0 ),
        .I2(s_max[4]),
        .I3(\fill_cnt[4]_i_5_n_0 ),
        .I4(s_max[3]),
        .I5(s_cnt[4]),
        .O(\s_cnt[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h4020100804020180)) 
    \s_cnt[4]_i_7 
       (.I0(s_cnt[0]),
        .I1(s_cnt[1]),
        .I2(s_max[2]),
        .I3(s_max[0]),
        .I4(s_max[1]),
        .I5(s_cnt[2]),
        .O(\s_cnt[4]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s_cnt_reg[0] 
       (.C(clk),
        .CE(\s_cnt[4]_i_1_n_0 ),
        .D(\s_cnt[0]_i_1_n_0 ),
        .Q(s_cnt[0]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \s_cnt_reg[1] 
       (.C(clk),
        .CE(\s_cnt[4]_i_1_n_0 ),
        .D(\s_cnt[1]_i_1_n_0 ),
        .Q(s_cnt[1]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \s_cnt_reg[2] 
       (.C(clk),
        .CE(\s_cnt[4]_i_1_n_0 ),
        .D(\s_cnt[2]_i_1_n_0 ),
        .Q(s_cnt[2]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \s_cnt_reg[3] 
       (.C(clk),
        .CE(\s_cnt[4]_i_1_n_0 ),
        .D(\s_cnt[3]_i_1_n_0 ),
        .Q(s_cnt[3]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \s_cnt_reg[4] 
       (.C(clk),
        .CE(\s_cnt[4]_i_1_n_0 ),
        .D(\s_cnt[4]_i_2_n_0 ),
        .Q(s_cnt[4]),
        .R(RSTA));
  LUT4 #(
    .INIT(16'h0010)) 
    \s_max[4]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(start),
        .I3(\state_reg_n_0_[2] ),
        .O(shift_r));
  FDSE #(
    .INIT(1'b1)) 
    \s_max_reg[0] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_s[0]),
        .Q(s_max[0]),
        .S(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \s_max_reg[1] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_s[1]),
        .Q(s_max[1]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \s_max_reg[2] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_s[2]),
        .Q(s_max[2]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \s_max_reg[3] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_s[3]),
        .Q(s_max[3]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \s_max_reg[4] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_s[4]),
        .Q(s_max[4]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \shift_r_reg[0] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_shift[0]),
        .Q(\shift_r_reg_n_0_[0] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \shift_r_reg[1] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_shift[1]),
        .Q(\shift_r_reg_n_0_[1] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \shift_r_reg[2] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_shift[2]),
        .Q(\shift_r_reg_n_0_[2] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \shift_r_reg[3] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_shift[3]),
        .Q(\shift_r_reg_n_0_[3] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \shift_r_reg[4] 
       (.C(clk),
        .CE(shift_r),
        .D(cfg_shift[4]),
        .Q(\shift_r_reg_n_0_[4] ),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00FF7500)) 
    \state[0]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state[1]_i_2_n_0 ),
        .I3(state),
        .I4(\state_reg_n_0_[0] ),
        .O(\state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h03FFF400)) 
    \state[1]_i_1 
       (.I0(\state[1]_i_2_n_0 ),
        .I1(\state_reg_n_0_[2] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(state),
        .I4(\state_reg_n_0_[1] ),
        .O(\state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9EF7F79EFFFFFFFF)) 
    \state[1]_i_2 
       (.I0(\e_cnt_reg_n_0_[6] ),
        .I1(\state[1]_i_3_n_0 ),
        .I2(e_max[6]),
        .I3(e_max[7]),
        .I4(\e_cnt_reg_n_0_[7] ),
        .I5(\state[1]_i_4_n_0 ),
        .O(\state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \state[1]_i_3 
       (.I0(e_max[4]),
        .I1(e_max[2]),
        .I2(e_max[1]),
        .I3(e_max[0]),
        .I4(e_max[3]),
        .I5(e_max[5]),
        .O(\state[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000009906009)) 
    \state[1]_i_4 
       (.I0(e_max[5]),
        .I1(\e_cnt_reg_n_0_[5] ),
        .I2(\e_cnt_reg_n_0_[4] ),
        .I3(\state[1]_i_5_n_0 ),
        .I4(e_max[4]),
        .I5(\state[1]_i_6_n_0 ),
        .O(\state[1]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \state[1]_i_5 
       (.I0(e_max[2]),
        .I1(e_max[1]),
        .I2(e_max[0]),
        .I3(e_max[3]),
        .O(\state[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF5556AAA9)) 
    \state[1]_i_6 
       (.I0(e_max[3]),
        .I1(e_max[2]),
        .I2(e_max[1]),
        .I3(e_max[0]),
        .I4(\e_cnt_reg_n_0_[3] ),
        .I5(\state[1]_i_7_n_0 ),
        .O(\state[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7BDEED7BFFFF)) 
    \state[1]_i_7 
       (.I0(\e_cnt_reg_n_0_[2] ),
        .I1(e_max[1]),
        .I2(e_max[2]),
        .I3(\e_cnt_reg_n_0_[1] ),
        .I4(\e_cnt_reg_n_0_[0] ),
        .I5(e_max[0]),
        .O(\state[1]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h1F80)) 
    \state[2]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .I2(state),
        .I3(\state_reg_n_0_[2] ),
        .O(\state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFABAA)) 
    \state[2]_i_2 
       (.I0(\k_cnt[4]_i_3_n_0 ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(start),
        .I4(\state[2]_i_3_n_0 ),
        .I5(\state[2]_i_4_n_0 ),
        .O(state));
  LUT5 #(
    .INIT(32'hFFFFAA80)) 
    \state[2]_i_3 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\s_cnt[4]_i_3_n_0 ),
        .I2(\s_cnt[4]_i_6_n_0 ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[2] ),
        .O(\state[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h04000444)) 
    \state[2]_i_4 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[2] ),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(\drain_cnt[4]_i_3_n_0 ),
        .O(\state[2]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(\state_reg_n_0_[0] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(\state_reg_n_0_[1] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\state[2]_i_1_n_0 ),
        .Q(\state_reg_n_0_[2] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    vld_r_reg
       (.C(clk),
        .CE(1'b1),
        .D(\k_r[4]_i_1_n_0 ),
        .Q(vld_r),
        .R(RSTA));
  LUT6 #(
    .INIT(64'hEFAAEFEF20AA2020)) 
    \zero_buf[0]_i_1 
       (.I0(\zero_buf[11]_i_2_n_0 ),
        .I1(\zero_buf[3]_i_3_n_0 ),
        .I2(\zero_buf[8]_i_3_n_0 ),
        .I3(\zero_buf[3]_i_2_n_0 ),
        .I4(\zero_buf[8]_i_2_n_0 ),
        .I5(zero_buf[0]),
        .O(\zero_buf[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFAABFBF80AA8080)) 
    \zero_buf[10]_i_1 
       (.I0(\zero_buf[11]_i_2_n_0 ),
        .I1(\zero_buf[10]_i_2_n_0 ),
        .I2(\zero_buf[11]_i_3_n_0 ),
        .I3(\zero_buf[11]_i_5_n_0 ),
        .I4(\zero_buf[10]_i_3_n_0 ),
        .I5(zero_buf[10]),
        .O(\zero_buf[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000020000000)) 
    \zero_buf[10]_i_2 
       (.I0(ifmap_spad_reg_r1_0_15_0_5_i_9_n_0),
        .I1(wr_idx[0]),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[2] ),
        .I5(\state_reg_n_0_[1] ),
        .O(\zero_buf[10]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \zero_buf[10]_i_3 
       (.I0(\fill_cnt_reg_n_0_[1] ),
        .I1(\fill_cnt_reg_n_0_[0] ),
        .O(\zero_buf[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBFAABFBF80AA8080)) 
    \zero_buf[11]_i_1 
       (.I0(\zero_buf[11]_i_2_n_0 ),
        .I1(\zero_buf[11]_i_3_n_0 ),
        .I2(\zero_buf[11]_i_4_n_0 ),
        .I3(\zero_buf[11]_i_5_n_0 ),
        .I4(\zero_buf[11]_i_6_n_0 ),
        .I5(zero_buf[11]),
        .O(\zero_buf[11]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \zero_buf[11]_i_10 
       (.I0(ifmap_data[1]),
        .I1(ifmap_data[0]),
        .I2(ifmap_data[12]),
        .I3(ifmap_data[4]),
        .O(\zero_buf[11]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \zero_buf[11]_i_2 
       (.I0(\zero_buf[11]_i_7_n_0 ),
        .I1(ifmap_data[10]),
        .I2(ifmap_data[14]),
        .I3(ifmap_data[9]),
        .I4(ifmap_data[13]),
        .I5(\zero_buf[11]_i_8_n_0 ),
        .O(\zero_buf[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \zero_buf[11]_i_3 
       (.I0(wr_idx[3]),
        .I1(wr_idx[2]),
        .O(\zero_buf[11]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000660)) 
    \zero_buf[11]_i_4 
       (.I0(rbase[1]),
        .I1(s_max[1]),
        .I2(s_max[0]),
        .I3(rbase[0]),
        .I4(\zero_buf[11]_i_9_n_0 ),
        .O(\zero_buf[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF7FFFFFFFF)) 
    \zero_buf[11]_i_5 
       (.I0(ifmap_valid),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(\fill_cnt_reg_n_0_[2] ),
        .I5(\fill_cnt_reg_n_0_[3] ),
        .O(\zero_buf[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \zero_buf[11]_i_6 
       (.I0(\fill_cnt_reg_n_0_[1] ),
        .I1(\fill_cnt_reg_n_0_[0] ),
        .O(\zero_buf[11]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \zero_buf[11]_i_7 
       (.I0(ifmap_data[6]),
        .I1(ifmap_data[3]),
        .I2(ifmap_data[11]),
        .I3(ifmap_data[15]),
        .O(\zero_buf[11]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \zero_buf[11]_i_8 
       (.I0(ifmap_data[7]),
        .I1(ifmap_data[8]),
        .I2(ifmap_data[2]),
        .I3(ifmap_data[5]),
        .I4(\zero_buf[11]_i_10_n_0 ),
        .O(\zero_buf[11]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \zero_buf[11]_i_9 
       (.I0(ifmap_valid),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[1] ),
        .O(\zero_buf[11]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hEFAAEFEF20AA2020)) 
    \zero_buf[1]_i_1 
       (.I0(\zero_buf[11]_i_2_n_0 ),
        .I1(\zero_buf[3]_i_2_n_0 ),
        .I2(\zero_buf[9]_i_3_n_0 ),
        .I3(\zero_buf[3]_i_3_n_0 ),
        .I4(\zero_buf[9]_i_2_n_0 ),
        .I5(zero_buf[1]),
        .O(\zero_buf[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFAAEFEF20AA2020)) 
    \zero_buf[2]_i_1 
       (.I0(\zero_buf[11]_i_2_n_0 ),
        .I1(\zero_buf[3]_i_2_n_0 ),
        .I2(\zero_buf[10]_i_3_n_0 ),
        .I3(\zero_buf[3]_i_3_n_0 ),
        .I4(\zero_buf[10]_i_2_n_0 ),
        .I5(zero_buf[2]),
        .O(\zero_buf[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFAAEFEF20AA2020)) 
    \zero_buf[3]_i_1 
       (.I0(\zero_buf[11]_i_2_n_0 ),
        .I1(\zero_buf[3]_i_2_n_0 ),
        .I2(\zero_buf[11]_i_6_n_0 ),
        .I3(\zero_buf[3]_i_3_n_0 ),
        .I4(\zero_buf[11]_i_4_n_0 ),
        .I5(zero_buf[3]),
        .O(\zero_buf[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFBF)) 
    \zero_buf[3]_i_2 
       (.I0(\fill_cnt_reg_n_0_[3] ),
        .I1(ifmap_valid),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[1] ),
        .I5(\fill_cnt_reg_n_0_[2] ),
        .O(\zero_buf[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \zero_buf[3]_i_3 
       (.I0(wr_idx[3]),
        .I1(wr_idx[2]),
        .O(\zero_buf[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEFAAEFEF20AA2020)) 
    \zero_buf[4]_i_1 
       (.I0(\zero_buf[11]_i_2_n_0 ),
        .I1(\zero_buf[7]_i_3_n_0 ),
        .I2(\zero_buf[8]_i_2_n_0 ),
        .I3(\zero_buf[7]_i_2_n_0 ),
        .I4(\zero_buf[8]_i_3_n_0 ),
        .I5(zero_buf[4]),
        .O(\zero_buf[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFAAEFEF20AA2020)) 
    \zero_buf[5]_i_1 
       (.I0(\zero_buf[11]_i_2_n_0 ),
        .I1(\zero_buf[7]_i_3_n_0 ),
        .I2(\zero_buf[9]_i_3_n_0 ),
        .I3(\zero_buf[7]_i_2_n_0 ),
        .I4(\zero_buf[9]_i_2_n_0 ),
        .I5(zero_buf[5]),
        .O(\zero_buf[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFAAEFEF20AA2020)) 
    \zero_buf[6]_i_1 
       (.I0(\zero_buf[11]_i_2_n_0 ),
        .I1(\zero_buf[7]_i_3_n_0 ),
        .I2(\zero_buf[10]_i_3_n_0 ),
        .I3(\zero_buf[7]_i_2_n_0 ),
        .I4(\zero_buf[10]_i_2_n_0 ),
        .I5(zero_buf[6]),
        .O(\zero_buf[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFAAEFEF20AA2020)) 
    \zero_buf[7]_i_1 
       (.I0(\zero_buf[11]_i_2_n_0 ),
        .I1(\zero_buf[7]_i_2_n_0 ),
        .I2(\zero_buf[11]_i_4_n_0 ),
        .I3(\zero_buf[7]_i_3_n_0 ),
        .I4(\zero_buf[11]_i_6_n_0 ),
        .I5(zero_buf[7]),
        .O(\zero_buf[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \zero_buf[7]_i_2 
       (.I0(wr_idx[3]),
        .I1(wr_idx[2]),
        .O(\zero_buf[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEFFFFFFFFFFF)) 
    \zero_buf[7]_i_3 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[2] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(ifmap_valid),
        .I4(\fill_cnt_reg_n_0_[3] ),
        .I5(\fill_cnt_reg_n_0_[2] ),
        .O(\zero_buf[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAEFEFEFAA202020)) 
    \zero_buf[8]_i_1 
       (.I0(\zero_buf[11]_i_2_n_0 ),
        .I1(\zero_buf[11]_i_5_n_0 ),
        .I2(\zero_buf[8]_i_2_n_0 ),
        .I3(\zero_buf[8]_i_3_n_0 ),
        .I4(\zero_buf[11]_i_3_n_0 ),
        .I5(zero_buf[8]),
        .O(\zero_buf[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \zero_buf[8]_i_2 
       (.I0(\fill_cnt_reg_n_0_[1] ),
        .I1(\fill_cnt_reg_n_0_[0] ),
        .O(\zero_buf[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000010000000)) 
    \zero_buf[8]_i_3 
       (.I0(ifmap_spad_reg_r1_0_15_0_5_i_9_n_0),
        .I1(wr_idx[0]),
        .I2(ifmap_valid),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[2] ),
        .I5(\state_reg_n_0_[1] ),
        .O(\zero_buf[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBFAABFBF80AA8080)) 
    \zero_buf[9]_i_1 
       (.I0(\zero_buf[11]_i_2_n_0 ),
        .I1(\zero_buf[9]_i_2_n_0 ),
        .I2(\zero_buf[11]_i_3_n_0 ),
        .I3(\zero_buf[11]_i_5_n_0 ),
        .I4(\zero_buf[9]_i_3_n_0 ),
        .I5(zero_buf[9]),
        .O(\zero_buf[9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000990)) 
    \zero_buf[9]_i_2 
       (.I0(rbase[1]),
        .I1(s_max[1]),
        .I2(s_max[0]),
        .I3(rbase[0]),
        .I4(\zero_buf[11]_i_9_n_0 ),
        .O(\zero_buf[9]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \zero_buf[9]_i_3 
       (.I0(\fill_cnt_reg_n_0_[0] ),
        .I1(\fill_cnt_reg_n_0_[1] ),
        .O(\zero_buf[9]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \zero_buf_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_buf[0]_i_1_n_0 ),
        .Q(zero_buf[0]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \zero_buf_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_buf[10]_i_1_n_0 ),
        .Q(zero_buf[10]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \zero_buf_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_buf[11]_i_1_n_0 ),
        .Q(zero_buf[11]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \zero_buf_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_buf[1]_i_1_n_0 ),
        .Q(zero_buf[1]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \zero_buf_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_buf[2]_i_1_n_0 ),
        .Q(zero_buf[2]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \zero_buf_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_buf[3]_i_1_n_0 ),
        .Q(zero_buf[3]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \zero_buf_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_buf[4]_i_1_n_0 ),
        .Q(zero_buf[4]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \zero_buf_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_buf[5]_i_1_n_0 ),
        .Q(zero_buf[5]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \zero_buf_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_buf[6]_i_1_n_0 ),
        .Q(zero_buf[6]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \zero_buf_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_buf[7]_i_1_n_0 ),
        .Q(zero_buf[7]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \zero_buf_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_buf[8]_i_1_n_0 ),
        .Q(zero_buf[8]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \zero_buf_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\zero_buf[9]_i_1_n_0 ),
        .Q(zero_buf[9]),
        .R(RSTA));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
