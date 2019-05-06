// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon May  6 14:06:20 2019
// Host        : DESKTOP-AGLPVLE running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/Soph/Documents/College/Senior/EE119c/FMReceiver/FMReceiver.sim/sim_1/synth/timing/xsim/MixerTB_time_synth.v
// Design      : Receiver
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module LO
   (D,
    CLK,
    Reset,
    RF_IBUF,
    FControl_IBUF);
  output [15:0]D;
  input CLK;
  input Reset;
  input [15:0]RF_IBUF;
  input [6:0]FControl_IBUF;

  wire CLK;
  wire \Count[9]_i_1_n_0 ;
  wire Count_carry__0_i_10_n_0;
  wire Count_carry__0_i_11_n_0;
  wire Count_carry__0_i_12_n_0;
  wire Count_carry__0_i_12_n_1;
  wire Count_carry__0_i_12_n_2;
  wire Count_carry__0_i_12_n_3;
  wire Count_carry__0_i_13_n_0;
  wire Count_carry__0_i_14_n_0;
  wire Count_carry__0_i_15_n_0;
  wire Count_carry__0_i_16_n_0;
  wire Count_carry__0_i_17_n_0;
  wire Count_carry__0_i_18_n_0;
  wire Count_carry__0_i_19_n_0;
  wire Count_carry__0_i_1_n_0;
  wire Count_carry__0_i_20_n_0;
  wire Count_carry__0_i_21_n_0;
  wire Count_carry__0_i_2_n_0;
  wire Count_carry__0_i_3_n_0;
  wire Count_carry__0_i_4_n_0;
  wire Count_carry__0_i_5_n_0;
  wire Count_carry__0_i_6_n_0;
  wire Count_carry__0_i_7_n_0;
  wire Count_carry__0_i_8_n_0;
  wire Count_carry__0_i_9_n_0;
  wire Count_carry__0_n_0;
  wire Count_carry__0_n_1;
  wire Count_carry__0_n_2;
  wire Count_carry__0_n_3;
  wire Count_carry__0_n_4;
  wire Count_carry__0_n_5;
  wire Count_carry__0_n_6;
  wire Count_carry__0_n_7;
  wire Count_carry__1_i_1_n_0;
  wire Count_carry__1_i_2_n_0;
  wire Count_carry__1_i_3_n_3;
  wire Count_carry__1_i_4_n_0;
  wire Count_carry__1_n_3;
  wire Count_carry__1_n_6;
  wire Count_carry__1_n_7;
  wire Count_carry_i_10_n_0;
  wire Count_carry_i_11_n_0;
  wire Count_carry_i_12_n_0;
  wire Count_carry_i_13_n_0;
  wire Count_carry_i_13_n_1;
  wire Count_carry_i_13_n_2;
  wire Count_carry_i_13_n_3;
  wire Count_carry_i_14_n_0;
  wire Count_carry_i_15_n_0;
  wire Count_carry_i_16_n_0;
  wire Count_carry_i_17_n_0;
  wire Count_carry_i_18_n_0;
  wire Count_carry_i_19_n_0;
  wire Count_carry_i_1_n_0;
  wire Count_carry_i_20_n_0;
  wire Count_carry_i_21_n_0;
  wire Count_carry_i_2_n_0;
  wire Count_carry_i_3_n_0;
  wire Count_carry_i_4_n_0;
  wire Count_carry_i_5_n_0;
  wire Count_carry_i_6_n_0;
  wire Count_carry_i_7_n_0;
  wire Count_carry_i_8_n_0;
  wire Count_carry_i_9_n_0;
  wire Count_carry_n_0;
  wire Count_carry_n_1;
  wire Count_carry_n_2;
  wire Count_carry_n_3;
  wire Count_carry_n_4;
  wire Count_carry_n_5;
  wire Count_carry_n_6;
  wire Count_carry_n_7;
  wire [9:0]Count_reg;
  wire [15:0]D;
  wire [6:0]FControl_IBUF;
  wire [9:0]L;
  wire LO;
  wire [15:0]RF_IBUF;
  wire Reset;
  wire SigOut_i_1_n_0;
  wire [3:1]NLW_Count_carry__1_CO_UNCONNECTED;
  wire [3:2]NLW_Count_carry__1_O_UNCONNECTED;
  wire [3:1]NLW_Count_carry__1_i_3_CO_UNCONNECTED;
  wire [3:2]NLW_Count_carry__1_i_3_O_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \Count[9]_i_1 
       (.I0(Reset),
        .O(\Count[9]_i_1_n_0 ));
  CARRY4 Count_carry
       (.CI(1'b0),
        .CO({Count_carry_n_0,Count_carry_n_1,Count_carry_n_2,Count_carry_n_3}),
        .CYINIT(1'b0),
        .DI({Count_carry_i_1_n_0,Count_carry_i_2_n_0,Count_carry_i_3_n_0,Count_carry_i_4_n_0}),
        .O({Count_carry_n_4,Count_carry_n_5,Count_carry_n_6,Count_carry_n_7}),
        .S({Count_carry_i_5_n_0,Count_carry_i_6_n_0,Count_carry_i_7_n_0,Count_carry_i_8_n_0}));
  CARRY4 Count_carry__0
       (.CI(Count_carry_n_0),
        .CO({Count_carry__0_n_0,Count_carry__0_n_1,Count_carry__0_n_2,Count_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({Count_carry__0_i_1_n_0,Count_carry__0_i_2_n_0,Count_carry__0_i_3_n_0,Count_carry__0_i_4_n_0}),
        .O({Count_carry__0_n_4,Count_carry__0_n_5,Count_carry__0_n_6,Count_carry__0_n_7}),
        .S({Count_carry__0_i_5_n_0,Count_carry__0_i_6_n_0,Count_carry__0_i_7_n_0,Count_carry__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    Count_carry__0_i_1
       (.I0(Count_carry__0_i_9_n_0),
        .I1(Count_carry_i_9_n_0),
        .O(Count_carry__0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hEAAA)) 
    Count_carry__0_i_10
       (.I0(FControl_IBUF[4]),
        .I1(FControl_IBUF[3]),
        .I2(FControl_IBUF[1]),
        .I3(FControl_IBUF[2]),
        .O(Count_carry__0_i_10_n_0));
  LUT6 #(
    .INIT(64'h820A820B0B0B0B0B)) 
    Count_carry__0_i_11
       (.I0(Count_carry_i_10_n_0),
        .I1(FControl_IBUF[3]),
        .I2(FControl_IBUF[4]),
        .I3(FControl_IBUF[1]),
        .I4(FControl_IBUF[0]),
        .I5(FControl_IBUF[2]),
        .O(Count_carry__0_i_11_n_0));
  CARRY4 Count_carry__0_i_12
       (.CI(Count_carry_i_13_n_0),
        .CO({Count_carry__0_i_12_n_0,Count_carry__0_i_12_n_1,Count_carry__0_i_12_n_2,Count_carry__0_i_12_n_3}),
        .CYINIT(1'b0),
        .DI(Count_reg[7:4]),
        .O(L[7:4]),
        .S({Count_carry__0_i_18_n_0,Count_carry__0_i_19_n_0,Count_carry__0_i_20_n_0,Count_carry__0_i_21_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h8880)) 
    Count_carry__0_i_13
       (.I0(L[5]),
        .I1(L[4]),
        .I2(L[3]),
        .I3(L[2]),
        .O(Count_carry__0_i_13_n_0));
  LUT6 #(
    .INIT(64'h01111111FEEEEEEE)) 
    Count_carry__0_i_14
       (.I0(FControl_IBUF[5]),
        .I1(FControl_IBUF[4]),
        .I2(FControl_IBUF[3]),
        .I3(FControl_IBUF[1]),
        .I4(FControl_IBUF[2]),
        .I5(FControl_IBUF[6]),
        .O(Count_carry__0_i_14_n_0));
  LUT6 #(
    .INIT(64'h4443434343434343)) 
    Count_carry__0_i_15
       (.I0(FControl_IBUF[6]),
        .I1(FControl_IBUF[5]),
        .I2(FControl_IBUF[4]),
        .I3(FControl_IBUF[3]),
        .I4(FControl_IBUF[1]),
        .I5(FControl_IBUF[2]),
        .O(Count_carry__0_i_15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h1)) 
    Count_carry__0_i_16
       (.I0(L[2]),
        .I1(L[3]),
        .O(Count_carry__0_i_16_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    Count_carry__0_i_17
       (.I0(FControl_IBUF[1]),
        .I1(FControl_IBUF[0]),
        .I2(FControl_IBUF[2]),
        .O(Count_carry__0_i_17_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    Count_carry__0_i_18
       (.I0(Count_reg[7]),
        .I1(Count_carry__0_i_9_n_0),
        .O(Count_carry__0_i_18_n_0));
  LUT4 #(
    .INIT(16'h9996)) 
    Count_carry__0_i_19
       (.I0(Count_reg[6]),
        .I1(FControl_IBUF[6]),
        .I2(Count_carry__0_i_10_n_0),
        .I3(FControl_IBUF[5]),
        .O(Count_carry__0_i_19_n_0));
  LUT4 #(
    .INIT(16'h5600)) 
    Count_carry__0_i_2
       (.I0(FControl_IBUF[6]),
        .I1(Count_carry__0_i_10_n_0),
        .I2(FControl_IBUF[5]),
        .I3(Count_carry_i_9_n_0),
        .O(Count_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'hA969)) 
    Count_carry__0_i_20
       (.I0(Count_reg[5]),
        .I1(Count_carry__0_i_10_n_0),
        .I2(FControl_IBUF[5]),
        .I3(FControl_IBUF[6]),
        .O(Count_carry__0_i_20_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    Count_carry__0_i_21
       (.I0(Count_reg[4]),
        .I1(Count_carry__0_i_11_n_0),
        .O(Count_carry__0_i_21_n_0));
  LUT4 #(
    .INIT(16'h1900)) 
    Count_carry__0_i_3
       (.I0(Count_carry__0_i_10_n_0),
        .I1(FControl_IBUF[5]),
        .I2(FControl_IBUF[6]),
        .I3(Count_carry_i_9_n_0),
        .O(Count_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    Count_carry__0_i_4
       (.I0(Count_carry__0_i_11_n_0),
        .I1(Count_carry_i_9_n_0),
        .O(Count_carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'h55553FC0AAAA3FC0)) 
    Count_carry__0_i_5
       (.I0(Count_carry__0_i_9_n_0),
        .I1(L[6]),
        .I2(Count_carry__0_i_13_n_0),
        .I3(L[7]),
        .I4(Count_carry_i_9_n_0),
        .I5(Count_reg[7]),
        .O(Count_carry__0_i_5_n_0));
  LUT5 #(
    .INIT(32'h553CAA3C)) 
    Count_carry__0_i_6
       (.I0(Count_carry__0_i_14_n_0),
        .I1(Count_carry__0_i_13_n_0),
        .I2(L[6]),
        .I3(Count_carry_i_9_n_0),
        .I4(Count_reg[6]),
        .O(Count_carry__0_i_6_n_0));
  LUT6 #(
    .INIT(64'h5555F30CAAAAF30C)) 
    Count_carry__0_i_7
       (.I0(Count_carry__0_i_15_n_0),
        .I1(L[4]),
        .I2(Count_carry__0_i_16_n_0),
        .I3(L[5]),
        .I4(Count_carry_i_9_n_0),
        .I5(Count_reg[5]),
        .O(Count_carry__0_i_7_n_0));
  LUT6 #(
    .INIT(64'h555503FCAAAA03FC)) 
    Count_carry__0_i_8
       (.I0(Count_carry__0_i_11_n_0),
        .I1(L[3]),
        .I2(L[2]),
        .I3(L[4]),
        .I4(Count_carry_i_9_n_0),
        .I5(Count_reg[4]),
        .O(Count_carry__0_i_8_n_0));
  LUT6 #(
    .INIT(64'h02020000FF000000)) 
    Count_carry__0_i_9
       (.I0(Count_carry__0_i_17_n_0),
        .I1(FControl_IBUF[4]),
        .I2(FControl_IBUF[3]),
        .I3(Count_carry__0_i_10_n_0),
        .I4(FControl_IBUF[6]),
        .I5(FControl_IBUF[5]),
        .O(Count_carry__0_i_9_n_0));
  CARRY4 Count_carry__1
       (.CI(Count_carry__0_n_0),
        .CO({NLW_Count_carry__1_CO_UNCONNECTED[3:1],Count_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_Count_carry__1_O_UNCONNECTED[3:2],Count_carry__1_n_6,Count_carry__1_n_7}),
        .S({1'b0,1'b0,Count_carry__1_i_1_n_0,Count_carry__1_i_2_n_0}));
  LUT6 #(
    .INIT(64'hCCCCCCCE22222222)) 
    Count_carry__1_i_1
       (.I0(Count_reg[9]),
        .I1(L[9]),
        .I2(L[1]),
        .I3(L[3]),
        .I4(L[0]),
        .I5(Count_carry__1_i_4_n_0),
        .O(Count_carry__1_i_1_n_0));
  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    Count_carry__1_i_2
       (.I0(Count_reg[8]),
        .I1(Count_carry_i_9_n_0),
        .I2(L[8]),
        .I3(L[6]),
        .I4(Count_carry__0_i_13_n_0),
        .I5(L[7]),
        .O(Count_carry__1_i_2_n_0));
  CARRY4 Count_carry__1_i_3
       (.CI(Count_carry__0_i_12_n_0),
        .CO({NLW_Count_carry__1_i_3_CO_UNCONNECTED[3:1],Count_carry__1_i_3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_Count_carry__1_i_3_O_UNCONNECTED[3:2],L[9:8]}),
        .S({1'b0,1'b0,Count_reg[9:8]}));
  LUT4 #(
    .INIT(16'h8000)) 
    Count_carry__1_i_4
       (.I0(Count_carry__0_i_13_n_0),
        .I1(L[6]),
        .I2(L[8]),
        .I3(L[7]),
        .O(Count_carry__1_i_4_n_0));
  LUT6 #(
    .INIT(64'h152A2A2A00000000)) 
    Count_carry_i_1
       (.I0(FControl_IBUF[3]),
        .I1(FControl_IBUF[5]),
        .I2(FControl_IBUF[6]),
        .I3(FControl_IBUF[2]),
        .I4(FControl_IBUF[1]),
        .I5(Count_carry_i_9_n_0),
        .O(Count_carry_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h7)) 
    Count_carry_i_10
       (.I0(FControl_IBUF[5]),
        .I1(FControl_IBUF[6]),
        .O(Count_carry_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h1)) 
    Count_carry_i_11
       (.I0(FControl_IBUF[3]),
        .I1(FControl_IBUF[4]),
        .O(Count_carry_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h07770888)) 
    Count_carry_i_12
       (.I0(FControl_IBUF[1]),
        .I1(FControl_IBUF[2]),
        .I2(FControl_IBUF[6]),
        .I3(FControl_IBUF[5]),
        .I4(FControl_IBUF[3]),
        .O(Count_carry_i_12_n_0));
  CARRY4 Count_carry_i_13
       (.CI(1'b0),
        .CO({Count_carry_i_13_n_0,Count_carry_i_13_n_1,Count_carry_i_13_n_2,Count_carry_i_13_n_3}),
        .CYINIT(1'b0),
        .DI(Count_reg[3:0]),
        .O(L[3:0]),
        .S({Count_carry_i_18_n_0,Count_carry_i_19_n_0,Count_carry_i_20_n_0,Count_carry_i_21_n_0}));
  LUT6 #(
    .INIT(64'h0000FF01FF030000)) 
    Count_carry_i_14
       (.I0(FControl_IBUF[0]),
        .I1(FControl_IBUF[4]),
        .I2(FControl_IBUF[3]),
        .I3(Count_carry_i_10_n_0),
        .I4(FControl_IBUF[1]),
        .I5(FControl_IBUF[2]),
        .O(Count_carry_i_14_n_0));
  LUT6 #(
    .INIT(64'h3333333300000013)) 
    Count_carry_i_15
       (.I0(FControl_IBUF[2]),
        .I1(FControl_IBUF[1]),
        .I2(FControl_IBUF[0]),
        .I3(FControl_IBUF[3]),
        .I4(FControl_IBUF[4]),
        .I5(Count_carry_i_10_n_0),
        .O(Count_carry_i_15_n_0));
  LUT6 #(
    .INIT(64'h0100FF00FF00FF00)) 
    Count_carry_i_16
       (.I0(FControl_IBUF[3]),
        .I1(FControl_IBUF[4]),
        .I2(FControl_IBUF[2]),
        .I3(FControl_IBUF[0]),
        .I4(FControl_IBUF[5]),
        .I5(FControl_IBUF[6]),
        .O(Count_carry_i_16_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    Count_carry_i_17
       (.I0(L[1]),
        .I1(L[3]),
        .I2(L[0]),
        .O(Count_carry_i_17_n_0));
  LUT6 #(
    .INIT(64'hA999A666A666A666)) 
    Count_carry_i_18
       (.I0(Count_reg[3]),
        .I1(FControl_IBUF[3]),
        .I2(FControl_IBUF[5]),
        .I3(FControl_IBUF[6]),
        .I4(FControl_IBUF[2]),
        .I5(FControl_IBUF[1]),
        .O(Count_carry_i_18_n_0));
  LUT6 #(
    .INIT(64'h969A96AA969696AA)) 
    Count_carry_i_19
       (.I0(Count_reg[2]),
        .I1(FControl_IBUF[2]),
        .I2(FControl_IBUF[1]),
        .I3(Count_carry_i_10_n_0),
        .I4(Count_carry_i_11_n_0),
        .I5(FControl_IBUF[0]),
        .O(Count_carry_i_19_n_0));
  LUT6 #(
    .INIT(64'h6460666000000000)) 
    Count_carry_i_2
       (.I0(FControl_IBUF[2]),
        .I1(FControl_IBUF[1]),
        .I2(Count_carry_i_10_n_0),
        .I3(Count_carry_i_11_n_0),
        .I4(FControl_IBUF[0]),
        .I5(Count_carry_i_9_n_0),
        .O(Count_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'hAAAA6656AAAA5656)) 
    Count_carry_i_20
       (.I0(Count_reg[1]),
        .I1(Count_carry_i_10_n_0),
        .I2(Count_carry_i_11_n_0),
        .I3(FControl_IBUF[0]),
        .I4(FControl_IBUF[1]),
        .I5(FControl_IBUF[2]),
        .O(Count_carry_i_20_n_0));
  LUT6 #(
    .INIT(64'h6A6A6A6A6A6A6A5A)) 
    Count_carry_i_21
       (.I0(Count_reg[0]),
        .I1(Count_carry_i_10_n_0),
        .I2(FControl_IBUF[0]),
        .I3(FControl_IBUF[2]),
        .I4(FControl_IBUF[4]),
        .I5(FControl_IBUF[3]),
        .O(Count_carry_i_21_n_0));
  LUT6 #(
    .INIT(64'h00AE00EE00000000)) 
    Count_carry_i_3
       (.I0(Count_carry_i_10_n_0),
        .I1(Count_carry_i_11_n_0),
        .I2(FControl_IBUF[0]),
        .I3(FControl_IBUF[1]),
        .I4(FControl_IBUF[2]),
        .I5(Count_carry_i_9_n_0),
        .O(Count_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h8888888C00000000)) 
    Count_carry_i_4
       (.I0(Count_carry_i_10_n_0),
        .I1(FControl_IBUF[0]),
        .I2(FControl_IBUF[2]),
        .I3(FControl_IBUF[4]),
        .I4(FControl_IBUF[3]),
        .I5(Count_carry_i_9_n_0),
        .O(Count_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'h55C3AAC3)) 
    Count_carry_i_5
       (.I0(Count_carry_i_12_n_0),
        .I1(L[3]),
        .I2(L[2]),
        .I3(Count_carry_i_9_n_0),
        .I4(Count_reg[3]),
        .O(Count_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h53A3)) 
    Count_carry_i_6
       (.I0(Count_carry_i_14_n_0),
        .I1(L[2]),
        .I2(Count_carry_i_9_n_0),
        .I3(Count_reg[2]),
        .O(Count_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h5CAC)) 
    Count_carry_i_7
       (.I0(Count_carry_i_15_n_0),
        .I1(L[1]),
        .I2(Count_carry_i_9_n_0),
        .I3(Count_reg[1]),
        .O(Count_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h5CAC)) 
    Count_carry_i_8
       (.I0(Count_carry_i_16_n_0),
        .I1(L[0]),
        .I2(Count_carry_i_9_n_0),
        .I3(Count_reg[0]),
        .O(Count_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'h4555555555555555)) 
    Count_carry_i_9
       (.I0(L[9]),
        .I1(Count_carry_i_17_n_0),
        .I2(Count_carry__0_i_13_n_0),
        .I3(L[6]),
        .I4(L[8]),
        .I5(L[7]),
        .O(Count_carry_i_9_n_0));
  FDCE #(
    .INIT(1'b0)) 
    \Count_reg[0] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Count[9]_i_1_n_0 ),
        .D(Count_carry_n_7),
        .Q(Count_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Count_reg[1] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Count[9]_i_1_n_0 ),
        .D(Count_carry_n_6),
        .Q(Count_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Count_reg[2] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Count[9]_i_1_n_0 ),
        .D(Count_carry_n_5),
        .Q(Count_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Count_reg[3] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Count[9]_i_1_n_0 ),
        .D(Count_carry_n_4),
        .Q(Count_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Count_reg[4] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Count[9]_i_1_n_0 ),
        .D(Count_carry__0_n_7),
        .Q(Count_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Count_reg[5] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Count[9]_i_1_n_0 ),
        .D(Count_carry__0_n_6),
        .Q(Count_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Count_reg[6] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Count[9]_i_1_n_0 ),
        .D(Count_carry__0_n_5),
        .Q(Count_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Count_reg[7] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Count[9]_i_1_n_0 ),
        .D(Count_carry__0_n_4),
        .Q(Count_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Count_reg[8] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Count[9]_i_1_n_0 ),
        .D(Count_carry__1_n_7),
        .Q(Count_reg[8]));
  FDCE #(
    .INIT(1'b0)) 
    \Count_reg[9] 
       (.C(CLK),
        .CE(Reset),
        .CLR(\Count[9]_i_1_n_0 ),
        .D(Count_carry__1_n_6),
        .Q(Count_reg[9]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[0]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[10]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[10]),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[11]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[11]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[12]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[12]),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[13]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[13]),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[14]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[14]),
        .O(D[14]));
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[15]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[15]),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[1]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[2]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[3]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[4]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[5]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[5]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[6]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[6]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[7]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[7]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[8]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[8]),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \IFOut[9]_i_1 
       (.I0(LO),
        .I1(RF_IBUF[9]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB4)) 
    SigOut_i_1
       (.I0(Count_carry_i_9_n_0),
        .I1(Reset),
        .I2(LO),
        .O(SigOut_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    SigOut_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(\Count[9]_i_1_n_0 ),
        .D(SigOut_i_1_n_0),
        .Q(LO));
endmodule

module Mixer
   (Q,
    D,
    CLK);
  output [15:0]Q;
  input [15:0]D;
  input CLK;

  wire CLK;
  wire [15:0]D;
  wire [15:0]Q;

  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[10]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[11]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[12]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[13]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[14]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[15]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IFOut_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[9]),
        .Q(Q[9]),
        .R(1'b0));
endmodule

(* NotValidForBitStream *)
module Receiver
   (Clk,
    Reset,
    RF,
    FControl,
    IFOut);
  input Clk;
  input Reset;
  input [15:0]RF;
  input [6:0]FControl;
  output [15:0]IFOut;

  wire Clk;
  wire Clk_IBUF;
  wire Clk_IBUF_BUFG;
  wire [6:0]FControl;
  wire [6:0]FControl_IBUF;
  wire [15:0]IFOut;
  wire [15:0]IFOut_OBUF;
  wire LO_n_0;
  wire LO_n_1;
  wire LO_n_10;
  wire LO_n_11;
  wire LO_n_12;
  wire LO_n_13;
  wire LO_n_14;
  wire LO_n_15;
  wire LO_n_2;
  wire LO_n_3;
  wire LO_n_4;
  wire LO_n_5;
  wire LO_n_6;
  wire LO_n_7;
  wire LO_n_8;
  wire LO_n_9;
  wire [15:0]RF;
  wire [15:0]RF_IBUF;
  wire Reset;
  wire Reset_IBUF;

initial begin
 $sdf_annotate("MixerTB_time_synth.sdf",,,,"tool_control");
end
  BUFG Clk_IBUF_BUFG_inst
       (.I(Clk_IBUF),
        .O(Clk_IBUF_BUFG));
  IBUF Clk_IBUF_inst
       (.I(Clk),
        .O(Clk_IBUF));
  IBUF \FControl_IBUF[0]_inst 
       (.I(FControl[0]),
        .O(FControl_IBUF[0]));
  IBUF \FControl_IBUF[1]_inst 
       (.I(FControl[1]),
        .O(FControl_IBUF[1]));
  IBUF \FControl_IBUF[2]_inst 
       (.I(FControl[2]),
        .O(FControl_IBUF[2]));
  IBUF \FControl_IBUF[3]_inst 
       (.I(FControl[3]),
        .O(FControl_IBUF[3]));
  IBUF \FControl_IBUF[4]_inst 
       (.I(FControl[4]),
        .O(FControl_IBUF[4]));
  IBUF \FControl_IBUF[5]_inst 
       (.I(FControl[5]),
        .O(FControl_IBUF[5]));
  IBUF \FControl_IBUF[6]_inst 
       (.I(FControl[6]),
        .O(FControl_IBUF[6]));
  OBUF \IFOut_OBUF[0]_inst 
       (.I(IFOut_OBUF[0]),
        .O(IFOut[0]));
  OBUF \IFOut_OBUF[10]_inst 
       (.I(IFOut_OBUF[10]),
        .O(IFOut[10]));
  OBUF \IFOut_OBUF[11]_inst 
       (.I(IFOut_OBUF[11]),
        .O(IFOut[11]));
  OBUF \IFOut_OBUF[12]_inst 
       (.I(IFOut_OBUF[12]),
        .O(IFOut[12]));
  OBUF \IFOut_OBUF[13]_inst 
       (.I(IFOut_OBUF[13]),
        .O(IFOut[13]));
  OBUF \IFOut_OBUF[14]_inst 
       (.I(IFOut_OBUF[14]),
        .O(IFOut[14]));
  OBUF \IFOut_OBUF[15]_inst 
       (.I(IFOut_OBUF[15]),
        .O(IFOut[15]));
  OBUF \IFOut_OBUF[1]_inst 
       (.I(IFOut_OBUF[1]),
        .O(IFOut[1]));
  OBUF \IFOut_OBUF[2]_inst 
       (.I(IFOut_OBUF[2]),
        .O(IFOut[2]));
  OBUF \IFOut_OBUF[3]_inst 
       (.I(IFOut_OBUF[3]),
        .O(IFOut[3]));
  OBUF \IFOut_OBUF[4]_inst 
       (.I(IFOut_OBUF[4]),
        .O(IFOut[4]));
  OBUF \IFOut_OBUF[5]_inst 
       (.I(IFOut_OBUF[5]),
        .O(IFOut[5]));
  OBUF \IFOut_OBUF[6]_inst 
       (.I(IFOut_OBUF[6]),
        .O(IFOut[6]));
  OBUF \IFOut_OBUF[7]_inst 
       (.I(IFOut_OBUF[7]),
        .O(IFOut[7]));
  OBUF \IFOut_OBUF[8]_inst 
       (.I(IFOut_OBUF[8]),
        .O(IFOut[8]));
  OBUF \IFOut_OBUF[9]_inst 
       (.I(IFOut_OBUF[9]),
        .O(IFOut[9]));
  LO LO
       (.CLK(Clk_IBUF_BUFG),
        .D({LO_n_0,LO_n_1,LO_n_2,LO_n_3,LO_n_4,LO_n_5,LO_n_6,LO_n_7,LO_n_8,LO_n_9,LO_n_10,LO_n_11,LO_n_12,LO_n_13,LO_n_14,LO_n_15}),
        .FControl_IBUF(FControl_IBUF),
        .RF_IBUF(RF_IBUF),
        .Reset(Reset_IBUF));
  Mixer Mixer
       (.CLK(Clk_IBUF_BUFG),
        .D({LO_n_0,LO_n_1,LO_n_2,LO_n_3,LO_n_4,LO_n_5,LO_n_6,LO_n_7,LO_n_8,LO_n_9,LO_n_10,LO_n_11,LO_n_12,LO_n_13,LO_n_14,LO_n_15}),
        .Q(IFOut_OBUF));
  IBUF \RF_IBUF[0]_inst 
       (.I(RF[0]),
        .O(RF_IBUF[0]));
  IBUF \RF_IBUF[10]_inst 
       (.I(RF[10]),
        .O(RF_IBUF[10]));
  IBUF \RF_IBUF[11]_inst 
       (.I(RF[11]),
        .O(RF_IBUF[11]));
  IBUF \RF_IBUF[12]_inst 
       (.I(RF[12]),
        .O(RF_IBUF[12]));
  IBUF \RF_IBUF[13]_inst 
       (.I(RF[13]),
        .O(RF_IBUF[13]));
  IBUF \RF_IBUF[14]_inst 
       (.I(RF[14]),
        .O(RF_IBUF[14]));
  IBUF \RF_IBUF[15]_inst 
       (.I(RF[15]),
        .O(RF_IBUF[15]));
  IBUF \RF_IBUF[1]_inst 
       (.I(RF[1]),
        .O(RF_IBUF[1]));
  IBUF \RF_IBUF[2]_inst 
       (.I(RF[2]),
        .O(RF_IBUF[2]));
  IBUF \RF_IBUF[3]_inst 
       (.I(RF[3]),
        .O(RF_IBUF[3]));
  IBUF \RF_IBUF[4]_inst 
       (.I(RF[4]),
        .O(RF_IBUF[4]));
  IBUF \RF_IBUF[5]_inst 
       (.I(RF[5]),
        .O(RF_IBUF[5]));
  IBUF \RF_IBUF[6]_inst 
       (.I(RF[6]),
        .O(RF_IBUF[6]));
  IBUF \RF_IBUF[7]_inst 
       (.I(RF[7]),
        .O(RF_IBUF[7]));
  IBUF \RF_IBUF[8]_inst 
       (.I(RF[8]),
        .O(RF_IBUF[8]));
  IBUF \RF_IBUF[9]_inst 
       (.I(RF[9]),
        .O(RF_IBUF[9]));
  IBUF Reset_IBUF_inst
       (.I(Reset),
        .O(Reset_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif
