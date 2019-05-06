-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Mon May  6 14:04:17 2019
-- Host        : DESKTOP-AGLPVLE running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/Soph/Documents/College/Senior/EE119c/FMReceiver/FMReceiver.sim/sim_1/synth/func/xsim/MixerTB_func_synth.vhd
-- Design      : Receiver
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k70tfbv676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity LO is
  port (
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    CLK : in STD_LOGIC;
    Reset : in STD_LOGIC;
    RF_IBUF : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FControl_IBUF : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
end LO;

architecture STRUCTURE of LO is
  signal \Count[9]_i_1_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_12_n_1\ : STD_LOGIC;
  signal \Count_carry__0_i_12_n_2\ : STD_LOGIC;
  signal \Count_carry__0_i_12_n_3\ : STD_LOGIC;
  signal \Count_carry__0_i_13_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_14_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_15_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_16_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_17_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_18_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_19_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_20_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_21_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \Count_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \Count_carry__0_n_0\ : STD_LOGIC;
  signal \Count_carry__0_n_1\ : STD_LOGIC;
  signal \Count_carry__0_n_2\ : STD_LOGIC;
  signal \Count_carry__0_n_3\ : STD_LOGIC;
  signal \Count_carry__0_n_4\ : STD_LOGIC;
  signal \Count_carry__0_n_5\ : STD_LOGIC;
  signal \Count_carry__0_n_6\ : STD_LOGIC;
  signal \Count_carry__0_n_7\ : STD_LOGIC;
  signal \Count_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \Count_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \Count_carry__1_i_3_n_3\ : STD_LOGIC;
  signal \Count_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \Count_carry__1_n_3\ : STD_LOGIC;
  signal \Count_carry__1_n_6\ : STD_LOGIC;
  signal \Count_carry__1_n_7\ : STD_LOGIC;
  signal Count_carry_i_10_n_0 : STD_LOGIC;
  signal Count_carry_i_11_n_0 : STD_LOGIC;
  signal Count_carry_i_12_n_0 : STD_LOGIC;
  signal Count_carry_i_13_n_0 : STD_LOGIC;
  signal Count_carry_i_13_n_1 : STD_LOGIC;
  signal Count_carry_i_13_n_2 : STD_LOGIC;
  signal Count_carry_i_13_n_3 : STD_LOGIC;
  signal Count_carry_i_14_n_0 : STD_LOGIC;
  signal Count_carry_i_15_n_0 : STD_LOGIC;
  signal Count_carry_i_16_n_0 : STD_LOGIC;
  signal Count_carry_i_17_n_0 : STD_LOGIC;
  signal Count_carry_i_18_n_0 : STD_LOGIC;
  signal Count_carry_i_19_n_0 : STD_LOGIC;
  signal Count_carry_i_1_n_0 : STD_LOGIC;
  signal Count_carry_i_20_n_0 : STD_LOGIC;
  signal Count_carry_i_21_n_0 : STD_LOGIC;
  signal Count_carry_i_2_n_0 : STD_LOGIC;
  signal Count_carry_i_3_n_0 : STD_LOGIC;
  signal Count_carry_i_4_n_0 : STD_LOGIC;
  signal Count_carry_i_5_n_0 : STD_LOGIC;
  signal Count_carry_i_6_n_0 : STD_LOGIC;
  signal Count_carry_i_7_n_0 : STD_LOGIC;
  signal Count_carry_i_8_n_0 : STD_LOGIC;
  signal Count_carry_i_9_n_0 : STD_LOGIC;
  signal Count_carry_n_0 : STD_LOGIC;
  signal Count_carry_n_1 : STD_LOGIC;
  signal Count_carry_n_2 : STD_LOGIC;
  signal Count_carry_n_3 : STD_LOGIC;
  signal Count_carry_n_4 : STD_LOGIC;
  signal Count_carry_n_5 : STD_LOGIC;
  signal Count_carry_n_6 : STD_LOGIC;
  signal Count_carry_n_7 : STD_LOGIC;
  signal Count_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal L : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal LO : STD_LOGIC;
  signal SigOut_i_1_n_0 : STD_LOGIC;
  signal \NLW_Count_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_Count_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_Count_carry__1_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_Count_carry__1_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \Count_carry__0_i_10\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \Count_carry__0_i_13\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \Count_carry__0_i_16\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of Count_carry_i_10 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of Count_carry_i_11 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of Count_carry_i_12 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \IFOut[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \IFOut[10]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \IFOut[11]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \IFOut[12]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \IFOut[13]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \IFOut[14]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \IFOut[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \IFOut[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \IFOut[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \IFOut[4]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \IFOut[5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \IFOut[6]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \IFOut[7]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \IFOut[8]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \IFOut[9]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of SigOut_i_1 : label is "soft_lutpair3";
begin
\Count[9]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Reset,
      O => \Count[9]_i_1_n_0\
    );
Count_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => Count_carry_n_0,
      CO(2) => Count_carry_n_1,
      CO(1) => Count_carry_n_2,
      CO(0) => Count_carry_n_3,
      CYINIT => '0',
      DI(3) => Count_carry_i_1_n_0,
      DI(2) => Count_carry_i_2_n_0,
      DI(1) => Count_carry_i_3_n_0,
      DI(0) => Count_carry_i_4_n_0,
      O(3) => Count_carry_n_4,
      O(2) => Count_carry_n_5,
      O(1) => Count_carry_n_6,
      O(0) => Count_carry_n_7,
      S(3) => Count_carry_i_5_n_0,
      S(2) => Count_carry_i_6_n_0,
      S(1) => Count_carry_i_7_n_0,
      S(0) => Count_carry_i_8_n_0
    );
\Count_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => Count_carry_n_0,
      CO(3) => \Count_carry__0_n_0\,
      CO(2) => \Count_carry__0_n_1\,
      CO(1) => \Count_carry__0_n_2\,
      CO(0) => \Count_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \Count_carry__0_i_1_n_0\,
      DI(2) => \Count_carry__0_i_2_n_0\,
      DI(1) => \Count_carry__0_i_3_n_0\,
      DI(0) => \Count_carry__0_i_4_n_0\,
      O(3) => \Count_carry__0_n_4\,
      O(2) => \Count_carry__0_n_5\,
      O(1) => \Count_carry__0_n_6\,
      O(0) => \Count_carry__0_n_7\,
      S(3) => \Count_carry__0_i_5_n_0\,
      S(2) => \Count_carry__0_i_6_n_0\,
      S(1) => \Count_carry__0_i_7_n_0\,
      S(0) => \Count_carry__0_i_8_n_0\
    );
\Count_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \Count_carry__0_i_9_n_0\,
      I1 => Count_carry_i_9_n_0,
      O => \Count_carry__0_i_1_n_0\
    );
\Count_carry__0_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EAAA"
    )
        port map (
      I0 => FControl_IBUF(4),
      I1 => FControl_IBUF(3),
      I2 => FControl_IBUF(1),
      I3 => FControl_IBUF(2),
      O => \Count_carry__0_i_10_n_0\
    );
\Count_carry__0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"820A820B0B0B0B0B"
    )
        port map (
      I0 => Count_carry_i_10_n_0,
      I1 => FControl_IBUF(3),
      I2 => FControl_IBUF(4),
      I3 => FControl_IBUF(1),
      I4 => FControl_IBUF(0),
      I5 => FControl_IBUF(2),
      O => \Count_carry__0_i_11_n_0\
    );
\Count_carry__0_i_12\: unisim.vcomponents.CARRY4
     port map (
      CI => Count_carry_i_13_n_0,
      CO(3) => \Count_carry__0_i_12_n_0\,
      CO(2) => \Count_carry__0_i_12_n_1\,
      CO(1) => \Count_carry__0_i_12_n_2\,
      CO(0) => \Count_carry__0_i_12_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Count_reg(7 downto 4),
      O(3 downto 0) => L(7 downto 4),
      S(3) => \Count_carry__0_i_18_n_0\,
      S(2) => \Count_carry__0_i_19_n_0\,
      S(1) => \Count_carry__0_i_20_n_0\,
      S(0) => \Count_carry__0_i_21_n_0\
    );
\Count_carry__0_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8880"
    )
        port map (
      I0 => L(5),
      I1 => L(4),
      I2 => L(3),
      I3 => L(2),
      O => \Count_carry__0_i_13_n_0\
    );
\Count_carry__0_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01111111FEEEEEEE"
    )
        port map (
      I0 => FControl_IBUF(5),
      I1 => FControl_IBUF(4),
      I2 => FControl_IBUF(3),
      I3 => FControl_IBUF(1),
      I4 => FControl_IBUF(2),
      I5 => FControl_IBUF(6),
      O => \Count_carry__0_i_14_n_0\
    );
\Count_carry__0_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4443434343434343"
    )
        port map (
      I0 => FControl_IBUF(6),
      I1 => FControl_IBUF(5),
      I2 => FControl_IBUF(4),
      I3 => FControl_IBUF(3),
      I4 => FControl_IBUF(1),
      I5 => FControl_IBUF(2),
      O => \Count_carry__0_i_15_n_0\
    );
\Count_carry__0_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => L(2),
      I1 => L(3),
      O => \Count_carry__0_i_16_n_0\
    );
\Count_carry__0_i_17\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1F"
    )
        port map (
      I0 => FControl_IBUF(1),
      I1 => FControl_IBUF(0),
      I2 => FControl_IBUF(2),
      O => \Count_carry__0_i_17_n_0\
    );
\Count_carry__0_i_18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Count_reg(7),
      I1 => \Count_carry__0_i_9_n_0\,
      O => \Count_carry__0_i_18_n_0\
    );
\Count_carry__0_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9996"
    )
        port map (
      I0 => Count_reg(6),
      I1 => FControl_IBUF(6),
      I2 => \Count_carry__0_i_10_n_0\,
      I3 => FControl_IBUF(5),
      O => \Count_carry__0_i_19_n_0\
    );
\Count_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5600"
    )
        port map (
      I0 => FControl_IBUF(6),
      I1 => \Count_carry__0_i_10_n_0\,
      I2 => FControl_IBUF(5),
      I3 => Count_carry_i_9_n_0,
      O => \Count_carry__0_i_2_n_0\
    );
\Count_carry__0_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A969"
    )
        port map (
      I0 => Count_reg(5),
      I1 => \Count_carry__0_i_10_n_0\,
      I2 => FControl_IBUF(5),
      I3 => FControl_IBUF(6),
      O => \Count_carry__0_i_20_n_0\
    );
\Count_carry__0_i_21\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Count_reg(4),
      I1 => \Count_carry__0_i_11_n_0\,
      O => \Count_carry__0_i_21_n_0\
    );
\Count_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1900"
    )
        port map (
      I0 => \Count_carry__0_i_10_n_0\,
      I1 => FControl_IBUF(5),
      I2 => FControl_IBUF(6),
      I3 => Count_carry_i_9_n_0,
      O => \Count_carry__0_i_3_n_0\
    );
\Count_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \Count_carry__0_i_11_n_0\,
      I1 => Count_carry_i_9_n_0,
      O => \Count_carry__0_i_4_n_0\
    );
\Count_carry__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55553FC0AAAA3FC0"
    )
        port map (
      I0 => \Count_carry__0_i_9_n_0\,
      I1 => L(6),
      I2 => \Count_carry__0_i_13_n_0\,
      I3 => L(7),
      I4 => Count_carry_i_9_n_0,
      I5 => Count_reg(7),
      O => \Count_carry__0_i_5_n_0\
    );
\Count_carry__0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"553CAA3C"
    )
        port map (
      I0 => \Count_carry__0_i_14_n_0\,
      I1 => \Count_carry__0_i_13_n_0\,
      I2 => L(6),
      I3 => Count_carry_i_9_n_0,
      I4 => Count_reg(6),
      O => \Count_carry__0_i_6_n_0\
    );
\Count_carry__0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555F30CAAAAF30C"
    )
        port map (
      I0 => \Count_carry__0_i_15_n_0\,
      I1 => L(4),
      I2 => \Count_carry__0_i_16_n_0\,
      I3 => L(5),
      I4 => Count_carry_i_9_n_0,
      I5 => Count_reg(5),
      O => \Count_carry__0_i_7_n_0\
    );
\Count_carry__0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555503FCAAAA03FC"
    )
        port map (
      I0 => \Count_carry__0_i_11_n_0\,
      I1 => L(3),
      I2 => L(2),
      I3 => L(4),
      I4 => Count_carry_i_9_n_0,
      I5 => Count_reg(4),
      O => \Count_carry__0_i_8_n_0\
    );
\Count_carry__0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02020000FF000000"
    )
        port map (
      I0 => \Count_carry__0_i_17_n_0\,
      I1 => FControl_IBUF(4),
      I2 => FControl_IBUF(3),
      I3 => \Count_carry__0_i_10_n_0\,
      I4 => FControl_IBUF(6),
      I5 => FControl_IBUF(5),
      O => \Count_carry__0_i_9_n_0\
    );
\Count_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \Count_carry__0_n_0\,
      CO(3 downto 1) => \NLW_Count_carry__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \Count_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_Count_carry__1_O_UNCONNECTED\(3 downto 2),
      O(1) => \Count_carry__1_n_6\,
      O(0) => \Count_carry__1_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \Count_carry__1_i_1_n_0\,
      S(0) => \Count_carry__1_i_2_n_0\
    );
\Count_carry__1_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCE22222222"
    )
        port map (
      I0 => Count_reg(9),
      I1 => L(9),
      I2 => L(1),
      I3 => L(3),
      I4 => L(0),
      I5 => \Count_carry__1_i_4_n_0\,
      O => \Count_carry__1_i_1_n_0\
    );
\Count_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BB8B8B8B8B8B8B8"
    )
        port map (
      I0 => Count_reg(8),
      I1 => Count_carry_i_9_n_0,
      I2 => L(8),
      I3 => L(6),
      I4 => \Count_carry__0_i_13_n_0\,
      I5 => L(7),
      O => \Count_carry__1_i_2_n_0\
    );
\Count_carry__1_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \Count_carry__0_i_12_n_0\,
      CO(3 downto 1) => \NLW_Count_carry__1_i_3_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \Count_carry__1_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_Count_carry__1_i_3_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => L(9 downto 8),
      S(3 downto 2) => B"00",
      S(1 downto 0) => Count_reg(9 downto 8)
    );
\Count_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \Count_carry__0_i_13_n_0\,
      I1 => L(6),
      I2 => L(8),
      I3 => L(7),
      O => \Count_carry__1_i_4_n_0\
    );
Count_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"152A2A2A00000000"
    )
        port map (
      I0 => FControl_IBUF(3),
      I1 => FControl_IBUF(5),
      I2 => FControl_IBUF(6),
      I3 => FControl_IBUF(2),
      I4 => FControl_IBUF(1),
      I5 => Count_carry_i_9_n_0,
      O => Count_carry_i_1_n_0
    );
Count_carry_i_10: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => FControl_IBUF(5),
      I1 => FControl_IBUF(6),
      O => Count_carry_i_10_n_0
    );
Count_carry_i_11: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => FControl_IBUF(3),
      I1 => FControl_IBUF(4),
      O => Count_carry_i_11_n_0
    );
Count_carry_i_12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"07770888"
    )
        port map (
      I0 => FControl_IBUF(1),
      I1 => FControl_IBUF(2),
      I2 => FControl_IBUF(6),
      I3 => FControl_IBUF(5),
      I4 => FControl_IBUF(3),
      O => Count_carry_i_12_n_0
    );
Count_carry_i_13: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => Count_carry_i_13_n_0,
      CO(2) => Count_carry_i_13_n_1,
      CO(1) => Count_carry_i_13_n_2,
      CO(0) => Count_carry_i_13_n_3,
      CYINIT => '0',
      DI(3 downto 0) => Count_reg(3 downto 0),
      O(3 downto 0) => L(3 downto 0),
      S(3) => Count_carry_i_18_n_0,
      S(2) => Count_carry_i_19_n_0,
      S(1) => Count_carry_i_20_n_0,
      S(0) => Count_carry_i_21_n_0
    );
Count_carry_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FF01FF030000"
    )
        port map (
      I0 => FControl_IBUF(0),
      I1 => FControl_IBUF(4),
      I2 => FControl_IBUF(3),
      I3 => Count_carry_i_10_n_0,
      I4 => FControl_IBUF(1),
      I5 => FControl_IBUF(2),
      O => Count_carry_i_14_n_0
    );
Count_carry_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333333300000013"
    )
        port map (
      I0 => FControl_IBUF(2),
      I1 => FControl_IBUF(1),
      I2 => FControl_IBUF(0),
      I3 => FControl_IBUF(3),
      I4 => FControl_IBUF(4),
      I5 => Count_carry_i_10_n_0,
      O => Count_carry_i_15_n_0
    );
Count_carry_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100FF00FF00FF00"
    )
        port map (
      I0 => FControl_IBUF(3),
      I1 => FControl_IBUF(4),
      I2 => FControl_IBUF(2),
      I3 => FControl_IBUF(0),
      I4 => FControl_IBUF(5),
      I5 => FControl_IBUF(6),
      O => Count_carry_i_16_n_0
    );
Count_carry_i_17: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => L(1),
      I1 => L(3),
      I2 => L(0),
      O => Count_carry_i_17_n_0
    );
Count_carry_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A999A666A666A666"
    )
        port map (
      I0 => Count_reg(3),
      I1 => FControl_IBUF(3),
      I2 => FControl_IBUF(5),
      I3 => FControl_IBUF(6),
      I4 => FControl_IBUF(2),
      I5 => FControl_IBUF(1),
      O => Count_carry_i_18_n_0
    );
Count_carry_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"969A96AA969696AA"
    )
        port map (
      I0 => Count_reg(2),
      I1 => FControl_IBUF(2),
      I2 => FControl_IBUF(1),
      I3 => Count_carry_i_10_n_0,
      I4 => Count_carry_i_11_n_0,
      I5 => FControl_IBUF(0),
      O => Count_carry_i_19_n_0
    );
Count_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6460666000000000"
    )
        port map (
      I0 => FControl_IBUF(2),
      I1 => FControl_IBUF(1),
      I2 => Count_carry_i_10_n_0,
      I3 => Count_carry_i_11_n_0,
      I4 => FControl_IBUF(0),
      I5 => Count_carry_i_9_n_0,
      O => Count_carry_i_2_n_0
    );
Count_carry_i_20: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA6656AAAA5656"
    )
        port map (
      I0 => Count_reg(1),
      I1 => Count_carry_i_10_n_0,
      I2 => Count_carry_i_11_n_0,
      I3 => FControl_IBUF(0),
      I4 => FControl_IBUF(1),
      I5 => FControl_IBUF(2),
      O => Count_carry_i_20_n_0
    );
Count_carry_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A6A6A6A6A6A6A5A"
    )
        port map (
      I0 => Count_reg(0),
      I1 => Count_carry_i_10_n_0,
      I2 => FControl_IBUF(0),
      I3 => FControl_IBUF(2),
      I4 => FControl_IBUF(4),
      I5 => FControl_IBUF(3),
      O => Count_carry_i_21_n_0
    );
Count_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AE00EE00000000"
    )
        port map (
      I0 => Count_carry_i_10_n_0,
      I1 => Count_carry_i_11_n_0,
      I2 => FControl_IBUF(0),
      I3 => FControl_IBUF(1),
      I4 => FControl_IBUF(2),
      I5 => Count_carry_i_9_n_0,
      O => Count_carry_i_3_n_0
    );
Count_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888C00000000"
    )
        port map (
      I0 => Count_carry_i_10_n_0,
      I1 => FControl_IBUF(0),
      I2 => FControl_IBUF(2),
      I3 => FControl_IBUF(4),
      I4 => FControl_IBUF(3),
      I5 => Count_carry_i_9_n_0,
      O => Count_carry_i_4_n_0
    );
Count_carry_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55C3AAC3"
    )
        port map (
      I0 => Count_carry_i_12_n_0,
      I1 => L(3),
      I2 => L(2),
      I3 => Count_carry_i_9_n_0,
      I4 => Count_reg(3),
      O => Count_carry_i_5_n_0
    );
Count_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"53A3"
    )
        port map (
      I0 => Count_carry_i_14_n_0,
      I1 => L(2),
      I2 => Count_carry_i_9_n_0,
      I3 => Count_reg(2),
      O => Count_carry_i_6_n_0
    );
Count_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5CAC"
    )
        port map (
      I0 => Count_carry_i_15_n_0,
      I1 => L(1),
      I2 => Count_carry_i_9_n_0,
      I3 => Count_reg(1),
      O => Count_carry_i_7_n_0
    );
Count_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5CAC"
    )
        port map (
      I0 => Count_carry_i_16_n_0,
      I1 => L(0),
      I2 => Count_carry_i_9_n_0,
      I3 => Count_reg(0),
      O => Count_carry_i_8_n_0
    );
Count_carry_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4555555555555555"
    )
        port map (
      I0 => L(9),
      I1 => Count_carry_i_17_n_0,
      I2 => \Count_carry__0_i_13_n_0\,
      I3 => L(6),
      I4 => L(8),
      I5 => L(7),
      O => Count_carry_i_9_n_0
    );
\Count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Reset,
      CLR => \Count[9]_i_1_n_0\,
      D => Count_carry_n_7,
      Q => Count_reg(0)
    );
\Count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Reset,
      CLR => \Count[9]_i_1_n_0\,
      D => Count_carry_n_6,
      Q => Count_reg(1)
    );
\Count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Reset,
      CLR => \Count[9]_i_1_n_0\,
      D => Count_carry_n_5,
      Q => Count_reg(2)
    );
\Count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Reset,
      CLR => \Count[9]_i_1_n_0\,
      D => Count_carry_n_4,
      Q => Count_reg(3)
    );
\Count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Reset,
      CLR => \Count[9]_i_1_n_0\,
      D => \Count_carry__0_n_7\,
      Q => Count_reg(4)
    );
\Count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Reset,
      CLR => \Count[9]_i_1_n_0\,
      D => \Count_carry__0_n_6\,
      Q => Count_reg(5)
    );
\Count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Reset,
      CLR => \Count[9]_i_1_n_0\,
      D => \Count_carry__0_n_5\,
      Q => Count_reg(6)
    );
\Count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Reset,
      CLR => \Count[9]_i_1_n_0\,
      D => \Count_carry__0_n_4\,
      Q => Count_reg(7)
    );
\Count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Reset,
      CLR => \Count[9]_i_1_n_0\,
      D => \Count_carry__1_n_7\,
      Q => Count_reg(8)
    );
\Count_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Reset,
      CLR => \Count[9]_i_1_n_0\,
      D => \Count_carry__1_n_6\,
      Q => Count_reg(9)
    );
\IFOut[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(0),
      O => D(0)
    );
\IFOut[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(10),
      O => D(10)
    );
\IFOut[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(11),
      O => D(11)
    );
\IFOut[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(12),
      O => D(12)
    );
\IFOut[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(13),
      O => D(13)
    );
\IFOut[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(14),
      O => D(14)
    );
\IFOut[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(15),
      O => D(15)
    );
\IFOut[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(1),
      O => D(1)
    );
\IFOut[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(2),
      O => D(2)
    );
\IFOut[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(3),
      O => D(3)
    );
\IFOut[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(4),
      O => D(4)
    );
\IFOut[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(5),
      O => D(5)
    );
\IFOut[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(6),
      O => D(6)
    );
\IFOut[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(7),
      O => D(7)
    );
\IFOut[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(8),
      O => D(8)
    );
\IFOut[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => LO,
      I1 => RF_IBUF(9),
      O => D(9)
    );
SigOut_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => Count_carry_i_9_n_0,
      I1 => Reset,
      I2 => LO,
      O => SigOut_i_1_n_0
    );
SigOut_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \Count[9]_i_1_n_0\,
      D => SigOut_i_1_n_0,
      Q => LO
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Mixer is
  port (
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    D : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CLK : in STD_LOGIC
  );
end Mixer;

architecture STRUCTURE of Mixer is
begin
\IFOut_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(0),
      Q => Q(0),
      R => '0'
    );
\IFOut_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(10),
      Q => Q(10),
      R => '0'
    );
\IFOut_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(11),
      Q => Q(11),
      R => '0'
    );
\IFOut_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(12),
      Q => Q(12),
      R => '0'
    );
\IFOut_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(13),
      Q => Q(13),
      R => '0'
    );
\IFOut_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(14),
      Q => Q(14),
      R => '0'
    );
\IFOut_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(15),
      Q => Q(15),
      R => '0'
    );
\IFOut_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(1),
      Q => Q(1),
      R => '0'
    );
\IFOut_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(2),
      Q => Q(2),
      R => '0'
    );
\IFOut_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(3),
      Q => Q(3),
      R => '0'
    );
\IFOut_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(4),
      Q => Q(4),
      R => '0'
    );
\IFOut_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(5),
      Q => Q(5),
      R => '0'
    );
\IFOut_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(6),
      Q => Q(6),
      R => '0'
    );
\IFOut_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(7),
      Q => Q(7),
      R => '0'
    );
\IFOut_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(8),
      Q => Q(8),
      R => '0'
    );
\IFOut_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => D(9),
      Q => Q(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Receiver is
  port (
    Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    RF : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FControl : in STD_LOGIC_VECTOR ( 6 downto 0 );
    IFOut : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Receiver : entity is true;
end Receiver;

architecture STRUCTURE of Receiver is
  signal Clk_IBUF : STD_LOGIC;
  signal Clk_IBUF_BUFG : STD_LOGIC;
  signal FControl_IBUF : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal IFOut_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal LO_n_0 : STD_LOGIC;
  signal LO_n_1 : STD_LOGIC;
  signal LO_n_10 : STD_LOGIC;
  signal LO_n_11 : STD_LOGIC;
  signal LO_n_12 : STD_LOGIC;
  signal LO_n_13 : STD_LOGIC;
  signal LO_n_14 : STD_LOGIC;
  signal LO_n_15 : STD_LOGIC;
  signal LO_n_2 : STD_LOGIC;
  signal LO_n_3 : STD_LOGIC;
  signal LO_n_4 : STD_LOGIC;
  signal LO_n_5 : STD_LOGIC;
  signal LO_n_6 : STD_LOGIC;
  signal LO_n_7 : STD_LOGIC;
  signal LO_n_8 : STD_LOGIC;
  signal LO_n_9 : STD_LOGIC;
  signal RF_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Reset_IBUF : STD_LOGIC;
begin
Clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => Clk_IBUF,
      O => Clk_IBUF_BUFG
    );
Clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Clk,
      O => Clk_IBUF
    );
\FControl_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => FControl(0),
      O => FControl_IBUF(0)
    );
\FControl_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => FControl(1),
      O => FControl_IBUF(1)
    );
\FControl_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => FControl(2),
      O => FControl_IBUF(2)
    );
\FControl_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => FControl(3),
      O => FControl_IBUF(3)
    );
\FControl_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => FControl(4),
      O => FControl_IBUF(4)
    );
\FControl_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => FControl(5),
      O => FControl_IBUF(5)
    );
\FControl_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => FControl(6),
      O => FControl_IBUF(6)
    );
\IFOut_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(0),
      O => IFOut(0)
    );
\IFOut_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(10),
      O => IFOut(10)
    );
\IFOut_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(11),
      O => IFOut(11)
    );
\IFOut_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(12),
      O => IFOut(12)
    );
\IFOut_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(13),
      O => IFOut(13)
    );
\IFOut_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(14),
      O => IFOut(14)
    );
\IFOut_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(15),
      O => IFOut(15)
    );
\IFOut_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(1),
      O => IFOut(1)
    );
\IFOut_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(2),
      O => IFOut(2)
    );
\IFOut_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(3),
      O => IFOut(3)
    );
\IFOut_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(4),
      O => IFOut(4)
    );
\IFOut_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(5),
      O => IFOut(5)
    );
\IFOut_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(6),
      O => IFOut(6)
    );
\IFOut_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(7),
      O => IFOut(7)
    );
\IFOut_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(8),
      O => IFOut(8)
    );
\IFOut_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => IFOut_OBUF(9),
      O => IFOut(9)
    );
LO: entity work.LO
     port map (
      CLK => Clk_IBUF_BUFG,
      D(15) => LO_n_0,
      D(14) => LO_n_1,
      D(13) => LO_n_2,
      D(12) => LO_n_3,
      D(11) => LO_n_4,
      D(10) => LO_n_5,
      D(9) => LO_n_6,
      D(8) => LO_n_7,
      D(7) => LO_n_8,
      D(6) => LO_n_9,
      D(5) => LO_n_10,
      D(4) => LO_n_11,
      D(3) => LO_n_12,
      D(2) => LO_n_13,
      D(1) => LO_n_14,
      D(0) => LO_n_15,
      FControl_IBUF(6 downto 0) => FControl_IBUF(6 downto 0),
      RF_IBUF(15 downto 0) => RF_IBUF(15 downto 0),
      Reset => Reset_IBUF
    );
Mixer: entity work.Mixer
     port map (
      CLK => Clk_IBUF_BUFG,
      D(15) => LO_n_0,
      D(14) => LO_n_1,
      D(13) => LO_n_2,
      D(12) => LO_n_3,
      D(11) => LO_n_4,
      D(10) => LO_n_5,
      D(9) => LO_n_6,
      D(8) => LO_n_7,
      D(7) => LO_n_8,
      D(6) => LO_n_9,
      D(5) => LO_n_10,
      D(4) => LO_n_11,
      D(3) => LO_n_12,
      D(2) => LO_n_13,
      D(1) => LO_n_14,
      D(0) => LO_n_15,
      Q(15 downto 0) => IFOut_OBUF(15 downto 0)
    );
\RF_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(0),
      O => RF_IBUF(0)
    );
\RF_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(10),
      O => RF_IBUF(10)
    );
\RF_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(11),
      O => RF_IBUF(11)
    );
\RF_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(12),
      O => RF_IBUF(12)
    );
\RF_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(13),
      O => RF_IBUF(13)
    );
\RF_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(14),
      O => RF_IBUF(14)
    );
\RF_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(15),
      O => RF_IBUF(15)
    );
\RF_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(1),
      O => RF_IBUF(1)
    );
\RF_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(2),
      O => RF_IBUF(2)
    );
\RF_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(3),
      O => RF_IBUF(3)
    );
\RF_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(4),
      O => RF_IBUF(4)
    );
\RF_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(5),
      O => RF_IBUF(5)
    );
\RF_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(6),
      O => RF_IBUF(6)
    );
\RF_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(7),
      O => RF_IBUF(7)
    );
\RF_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(8),
      O => RF_IBUF(8)
    );
\RF_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => RF(9),
      O => RF_IBUF(9)
    );
Reset_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Reset,
      O => Reset_IBUF
    );
end STRUCTURE;
