-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 12.0 Build 178 05/31/2012 SJ Web Edition"

-- DATE "03/09/2017 15:57:23"

-- 
-- Device: Altera 5M1270ZT144C5 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	UARTReceiver IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	data_in : IN std_logic;
	data_out : OUT std_logic_vector(7 DOWNTO 0);
	debug : OUT std_logic_vector(7 DOWNTO 0);
	data_ready : OUT std_logic
	);
END UARTReceiver;

-- Design Ports Information
-- reset	=>  Location: PIN_45,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_89,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in	=>  Location: PIN_5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_out[0]	=>  Location: PIN_58,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- data_out[1]	=>  Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- data_out[2]	=>  Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- data_out[3]	=>  Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- data_out[4]	=>  Location: PIN_52,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- data_out[5]	=>  Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- data_out[6]	=>  Location: PIN_50,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- data_out[7]	=>  Location: PIN_49,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[0]	=>  Location: PIN_85,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[1]	=>  Location: PIN_62,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[2]	=>  Location: PIN_84,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[3]	=>  Location: PIN_81,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[4]	=>  Location: PIN_121,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[5]	=>  Location: PIN_88,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[6]	=>  Location: PIN_43,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[7]	=>  Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- data_ready	=>  Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA


ARCHITECTURE structure OF UARTReceiver IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_data_in : std_logic;
SIGNAL ww_data_out : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_debug : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_data_ready : std_logic;
SIGNAL \CP|Add0~155\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \data_in~combout\ : std_logic;
SIGNAL \CP|state.S0~regout\ : std_logic;
SIGNAL \DP|incr|Add0~1_combout\ : std_logic;
SIGNAL \DP|incr|Add0~0_combout\ : std_logic;
SIGNAL \CP|process_0~0_combout\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[0]~5\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[1]~7\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[1]~7COUT1_37\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[2]~1\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[2]~1COUT1_39\ : std_logic;
SIGNAL \DP|tc|DP|Equal1~0_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal0~3_combout\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[3]~3\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[3]~3COUT1_41\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[4]~15\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[4]~15COUT1_43\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[5]~9\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[6]~21\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[6]~21COUT1_45\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[7]~11\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[7]~11COUT1_47\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[8]~13\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[8]~13COUT1_49\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[9]~19\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[9]~19COUT1_51\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[10]~25\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[11]~17\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[11]~17COUT1_53\ : std_logic;
SIGNAL \DP|tc|DP|Equal0~1_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal0~0_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal0~2_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal0~4_combout\ : std_logic;
SIGNAL \DP|tc|CP|state~7_combout\ : std_logic;
SIGNAL \DP|tc|CP|state.S2~regout\ : std_logic;
SIGNAL \DP|tc|CP|state.S3~regout\ : std_logic;
SIGNAL \DP|tc|CP|increment~2_combout\ : std_logic;
SIGNAL \DP|tc|CP|increment~4_combout\ : std_logic;
SIGNAL \DP|tc|CP|increment~3_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal2~0_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal2~1_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal2~2_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal2~3_combout\ : std_logic;
SIGNAL \CP|Selector3~0_combout\ : std_logic;
SIGNAL \DP|tc|CP|state.S4~regout\ : std_logic;
SIGNAL \DP|tc|CP|tick~0_combout\ : std_logic;
SIGNAL \CP|Selector1~0_combout\ : std_logic;
SIGNAL \DP|tc|CP|state.S0~regout\ : std_logic;
SIGNAL \DP|tc|CP|state.S1~regout\ : std_logic;
SIGNAL \DP|tc|CP|tick~1_combout\ : std_logic;
SIGNAL \DP|tc|CP|tick~2_combout\ : std_logic;
SIGNAL \CP|state.S4~regout\ : std_logic;
SIGNAL \CP|Selector2~1_combout\ : std_logic;
SIGNAL \CP|count_sig~1_combout\ : std_logic;
SIGNAL \CP|Add0~157_cout\ : std_logic;
SIGNAL \CP|Add0~0_combout\ : std_logic;
SIGNAL \CP|Add0~2\ : std_logic;
SIGNAL \CP|Add0~2COUT1_186\ : std_logic;
SIGNAL \CP|Add0~5_combout\ : std_logic;
SIGNAL \CP|Add0~7\ : std_logic;
SIGNAL \CP|Add0~7COUT1_188\ : std_logic;
SIGNAL \CP|Add0~10_combout\ : std_logic;
SIGNAL \CP|Add0~12\ : std_logic;
SIGNAL \CP|Add0~12COUT1_190\ : std_logic;
SIGNAL \CP|Add0~15_combout\ : std_logic;
SIGNAL \CP|Add0~17\ : std_logic;
SIGNAL \CP|Add0~17COUT1_192\ : std_logic;
SIGNAL \CP|Add0~20_combout\ : std_logic;
SIGNAL \CP|Add0~22\ : std_logic;
SIGNAL \CP|Add0~25_combout\ : std_logic;
SIGNAL \CP|Add0~27\ : std_logic;
SIGNAL \CP|Add0~27COUT1_194\ : std_logic;
SIGNAL \CP|Add0~30_combout\ : std_logic;
SIGNAL \CP|Add0~32\ : std_logic;
SIGNAL \CP|Add0~32COUT1_196\ : std_logic;
SIGNAL \CP|Add0~35_combout\ : std_logic;
SIGNAL \CP|Add0~37\ : std_logic;
SIGNAL \CP|Add0~37COUT1_198\ : std_logic;
SIGNAL \CP|Add0~40_combout\ : std_logic;
SIGNAL \CP|Add0~42\ : std_logic;
SIGNAL \CP|Add0~42COUT1_200\ : std_logic;
SIGNAL \CP|Add0~45_combout\ : std_logic;
SIGNAL \CP|Add0~47\ : std_logic;
SIGNAL \CP|Add0~50_combout\ : std_logic;
SIGNAL \CP|Add0~52\ : std_logic;
SIGNAL \CP|Add0~52COUT1_202\ : std_logic;
SIGNAL \CP|Add0~55_combout\ : std_logic;
SIGNAL \CP|Add0~57\ : std_logic;
SIGNAL \CP|Add0~57COUT1_204\ : std_logic;
SIGNAL \CP|Add0~60_combout\ : std_logic;
SIGNAL \CP|Add0~62\ : std_logic;
SIGNAL \CP|Add0~62COUT1_206\ : std_logic;
SIGNAL \CP|Add0~65_combout\ : std_logic;
SIGNAL \CP|Add0~67\ : std_logic;
SIGNAL \CP|Add0~67COUT1_208\ : std_logic;
SIGNAL \CP|Add0~70_combout\ : std_logic;
SIGNAL \CP|Add0~72\ : std_logic;
SIGNAL \CP|Add0~75_combout\ : std_logic;
SIGNAL \CP|Add0~77\ : std_logic;
SIGNAL \CP|Add0~77COUT1_210\ : std_logic;
SIGNAL \CP|Add0~80_combout\ : std_logic;
SIGNAL \CP|Add0~82\ : std_logic;
SIGNAL \CP|Add0~82COUT1_212\ : std_logic;
SIGNAL \CP|Add0~85_combout\ : std_logic;
SIGNAL \CP|Add0~87\ : std_logic;
SIGNAL \CP|Add0~87COUT1_214\ : std_logic;
SIGNAL \CP|Add0~90_combout\ : std_logic;
SIGNAL \CP|Add0~92\ : std_logic;
SIGNAL \CP|Add0~92COUT1_216\ : std_logic;
SIGNAL \CP|Add0~95_combout\ : std_logic;
SIGNAL \CP|Add0~97\ : std_logic;
SIGNAL \CP|Add0~100_combout\ : std_logic;
SIGNAL \CP|Add0~102\ : std_logic;
SIGNAL \CP|Add0~102COUT1_218\ : std_logic;
SIGNAL \CP|Add0~105_combout\ : std_logic;
SIGNAL \CP|Add0~107\ : std_logic;
SIGNAL \CP|Add0~107COUT1_220\ : std_logic;
SIGNAL \CP|Add0~110_combout\ : std_logic;
SIGNAL \CP|Add0~112\ : std_logic;
SIGNAL \CP|Add0~112COUT1_222\ : std_logic;
SIGNAL \CP|Add0~115_combout\ : std_logic;
SIGNAL \CP|Add0~117\ : std_logic;
SIGNAL \CP|Add0~117COUT1_224\ : std_logic;
SIGNAL \CP|Add0~120_combout\ : std_logic;
SIGNAL \CP|Add0~122\ : std_logic;
SIGNAL \CP|Add0~125_combout\ : std_logic;
SIGNAL \CP|Add0~127\ : std_logic;
SIGNAL \CP|Add0~127COUT1_226\ : std_logic;
SIGNAL \CP|Add0~130_combout\ : std_logic;
SIGNAL \CP|Equal0~8_combout\ : std_logic;
SIGNAL \CP|Add0~132\ : std_logic;
SIGNAL \CP|Add0~132COUT1_228\ : std_logic;
SIGNAL \CP|Add0~135_combout\ : std_logic;
SIGNAL \CP|Add0~137\ : std_logic;
SIGNAL \CP|Add0~137COUT1_230\ : std_logic;
SIGNAL \CP|Add0~140_combout\ : std_logic;
SIGNAL \CP|Add0~142\ : std_logic;
SIGNAL \CP|Add0~142COUT1_232\ : std_logic;
SIGNAL \CP|Add0~145_combout\ : std_logic;
SIGNAL \CP|Add0~147\ : std_logic;
SIGNAL \CP|Add0~150_combout\ : std_logic;
SIGNAL \CP|Equal0~9_combout\ : std_logic;
SIGNAL \CP|Equal0~0_combout\ : std_logic;
SIGNAL \CP|Equal0~1_combout\ : std_logic;
SIGNAL \CP|Equal0~2_combout\ : std_logic;
SIGNAL \CP|Equal0~3_combout\ : std_logic;
SIGNAL \CP|Equal0~4_combout\ : std_logic;
SIGNAL \CP|Equal0~5_combout\ : std_logic;
SIGNAL \CP|Equal0~6_combout\ : std_logic;
SIGNAL \CP|Equal0~7_combout\ : std_logic;
SIGNAL \CP|Equal0~10_combout\ : std_logic;
SIGNAL \CP|Selector2~0_combout\ : std_logic;
SIGNAL \CP|state.S1~regout\ : std_logic;
SIGNAL \CP|state.S5~regout\ : std_logic;
SIGNAL \CP|state.S2~regout\ : std_logic;
SIGNAL \CP|process_0~1_combout\ : std_logic;
SIGNAL \CP|state.S3~regout\ : std_logic;
SIGNAL \CP|Selector4~0_combout\ : std_logic;
SIGNAL \DP|shift_r|Dout~0_combout\ : std_logic;
SIGNAL \DP|dout|Dout~1_combout\ : std_logic;
SIGNAL \DP|dout|Dout~8\ : std_logic;
SIGNAL \DP|dout|Dout~7\ : std_logic;
SIGNAL \DP|dout|Dout~6\ : std_logic;
SIGNAL \DP|dout|Dout~5\ : std_logic;
SIGNAL \DP|dout|Dout~4\ : std_logic;
SIGNAL \DP|dout|Dout~3\ : std_logic;
SIGNAL \DP|dout|Dout~2\ : std_logic;
SIGNAL \CP|data_ready~0_combout\ : std_logic;
SIGNAL \CP|count_sig\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \DP|tc|DP|count_reg|Dout\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \DP|count1|Dout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \DP|shift_r|Dout\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \DP|dout|Dout\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_data_in <= data_in;
data_out <= ww_data_out;
debug <= ww_debug;
data_ready <= ww_data_ready;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_89,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: PIN_45,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: PIN_5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data_in~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_data_in,
	combout => \data_in~combout\);

-- Location: LC_X7_Y5_N7
\CP|state.S0\ : maxv_lcell
-- Equation(s):
-- \CP|state.S0~regout\ = DFFEAS((((!\reset~combout\))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f0f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \reset~combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|state.S0~regout\);

-- Location: LC_X8_Y4_N8
\DP|count1|Dout[0]\ : maxv_lcell
-- Equation(s):
-- \DP|count1|Dout\(0) = DFFEAS(((!\reset~combout\ & ((!\DP|count1|Dout\(0))))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0033",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \reset~combout\,
	datad => \DP|count1|Dout\(0),
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|count1|Dout\(0));

-- Location: LC_X8_Y4_N6
\DP|count1|Dout[1]\ : maxv_lcell
-- Equation(s):
-- \DP|count1|Dout\(1) = DFFEAS((!\reset~combout\ & (!\CP|process_0~0_combout\ & (\DP|count1|Dout\(1) $ (\DP|count1|Dout\(0))))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0102",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|count1|Dout\(1),
	datab => \reset~combout\,
	datac => \CP|process_0~0_combout\,
	datad => \DP|count1|Dout\(0),
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|count1|Dout\(1));

-- Location: LC_X8_Y4_N4
\DP|incr|Add0~1\ : maxv_lcell
-- Equation(s):
-- \DP|incr|Add0~1_combout\ = (((\DP|count1|Dout\(1) & \DP|count1|Dout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \DP|count1|Dout\(1),
	datad => \DP|count1|Dout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|incr|Add0~1_combout\);

-- Location: LC_X8_Y4_N2
\DP|count1|Dout[2]\ : maxv_lcell
-- Equation(s):
-- \DP|count1|Dout\(2) = DFFEAS((!\CP|process_0~0_combout\ & (!\reset~combout\ & (\DP|incr|Add0~1_combout\ $ (\DP|count1|Dout\(2))))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|process_0~0_combout\,
	datab => \reset~combout\,
	datac => \DP|incr|Add0~1_combout\,
	datad => \DP|count1|Dout\(2),
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|count1|Dout\(2));

-- Location: LC_X8_Y4_N9
\DP|incr|Add0~0\ : maxv_lcell
-- Equation(s):
-- \DP|incr|Add0~0_combout\ = (\DP|count1|Dout\(0) & (((\DP|count1|Dout\(1) & \DP|count1|Dout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|count1|Dout\(0),
	datac => \DP|count1|Dout\(1),
	datad => \DP|count1|Dout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|incr|Add0~0_combout\);

-- Location: LC_X8_Y4_N3
\DP|count1|Dout[3]\ : maxv_lcell
-- Equation(s):
-- \DP|count1|Dout\(3) = DFFEAS((!\reset~combout\ & (!\CP|process_0~0_combout\ & (\DP|count1|Dout\(3) $ (\DP|incr|Add0~0_combout\)))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0102",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|count1|Dout\(3),
	datab => \reset~combout\,
	datac => \CP|process_0~0_combout\,
	datad => \DP|incr|Add0~0_combout\,
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|count1|Dout\(3));

-- Location: LC_X8_Y4_N5
\CP|process_0~0\ : maxv_lcell
-- Equation(s):
-- \CP|process_0~0_combout\ = (\DP|count1|Dout\(0) & (!\DP|count1|Dout\(2) & (!\DP|count1|Dout\(1) & \DP|count1|Dout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0200",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|count1|Dout\(0),
	datab => \DP|count1|Dout\(2),
	datac => \DP|count1|Dout\(1),
	datad => \DP|count1|Dout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|process_0~0_combout\);

-- Location: LC_X10_Y7_N4
\DP|tc|DP|count_reg|Dout[0]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(0) = DFFEAS((!\DP|tc|DP|count_reg|Dout\(0)), GLOBAL(\clk~combout\), VCC, , , , , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[0]~5\ = CARRY((\DP|tc|DP|count_reg|Dout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "55aa",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|DP|count_reg|Dout\(0),
	aclr => GND,
	sclr => \DP|tc|CP|increment~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(0),
	cout => \DP|tc|DP|count_reg|Dout[0]~5\);

-- Location: LC_X10_Y7_N5
\DP|tc|DP|count_reg|Dout[1]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(1) = DFFEAS(\DP|tc|DP|count_reg|Dout\(1) $ ((((\DP|tc|DP|count_reg|Dout[0]~5\)))), GLOBAL(\clk~combout\), VCC, , , , , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[1]~7\ = CARRY(((!\DP|tc|DP|count_reg|Dout[0]~5\)) # (!\DP|tc|DP|count_reg|Dout\(1)))
-- \DP|tc|DP|count_reg|Dout[1]~7COUT1_37\ = CARRY(((!\DP|tc|DP|count_reg|Dout[0]~5\)) # (!\DP|tc|DP|count_reg|Dout\(1)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|DP|count_reg|Dout\(1),
	aclr => GND,
	sclr => \DP|tc|CP|increment~3_combout\,
	cin => \DP|tc|DP|count_reg|Dout[0]~5\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(1),
	cout0 => \DP|tc|DP|count_reg|Dout[1]~7\,
	cout1 => \DP|tc|DP|count_reg|Dout[1]~7COUT1_37\);

-- Location: LC_X10_Y7_N6
\DP|tc|DP|count_reg|Dout[2]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(2) = DFFEAS(\DP|tc|DP|count_reg|Dout\(2) $ ((((!(!\DP|tc|DP|count_reg|Dout[0]~5\ & \DP|tc|DP|count_reg|Dout[1]~7\) # (\DP|tc|DP|count_reg|Dout[0]~5\ & \DP|tc|DP|count_reg|Dout[1]~7COUT1_37\))))), GLOBAL(\clk~combout\), VCC, , , , 
-- , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[2]~1\ = CARRY((\DP|tc|DP|count_reg|Dout\(2) & ((!\DP|tc|DP|count_reg|Dout[1]~7\))))
-- \DP|tc|DP|count_reg|Dout[2]~1COUT1_39\ = CARRY((\DP|tc|DP|count_reg|Dout\(2) & ((!\DP|tc|DP|count_reg|Dout[1]~7COUT1_37\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|DP|count_reg|Dout\(2),
	aclr => GND,
	sclr => \DP|tc|CP|increment~3_combout\,
	cin => \DP|tc|DP|count_reg|Dout[0]~5\,
	cin0 => \DP|tc|DP|count_reg|Dout[1]~7\,
	cin1 => \DP|tc|DP|count_reg|Dout[1]~7COUT1_37\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(2),
	cout0 => \DP|tc|DP|count_reg|Dout[2]~1\,
	cout1 => \DP|tc|DP|count_reg|Dout[2]~1COUT1_39\);

-- Location: LC_X10_Y7_N7
\DP|tc|DP|count_reg|Dout[3]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(3) = DFFEAS((\DP|tc|DP|count_reg|Dout\(3) $ (((!\DP|tc|DP|count_reg|Dout[0]~5\ & \DP|tc|DP|count_reg|Dout[2]~1\) # (\DP|tc|DP|count_reg|Dout[0]~5\ & \DP|tc|DP|count_reg|Dout[2]~1COUT1_39\)))), GLOBAL(\clk~combout\), VCC, , , , , 
-- \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[3]~3\ = CARRY(((!\DP|tc|DP|count_reg|Dout[2]~1\) # (!\DP|tc|DP|count_reg|Dout\(3))))
-- \DP|tc|DP|count_reg|Dout[3]~3COUT1_41\ = CARRY(((!\DP|tc|DP|count_reg|Dout[2]~1COUT1_39\) # (!\DP|tc|DP|count_reg|Dout\(3))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \DP|tc|DP|count_reg|Dout\(3),
	aclr => GND,
	sclr => \DP|tc|CP|increment~3_combout\,
	cin => \DP|tc|DP|count_reg|Dout[0]~5\,
	cin0 => \DP|tc|DP|count_reg|Dout[2]~1\,
	cin1 => \DP|tc|DP|count_reg|Dout[2]~1COUT1_39\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(3),
	cout0 => \DP|tc|DP|count_reg|Dout[3]~3\,
	cout1 => \DP|tc|DP|count_reg|Dout[3]~3COUT1_41\);

-- Location: LC_X9_Y7_N6
\DP|tc|DP|Equal1~0\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal1~0_combout\ = (\DP|tc|DP|count_reg|Dout\(3) & (!\DP|tc|DP|count_reg|Dout\(1) & ((!\DP|tc|DP|count_reg|Dout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0022",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|DP|count_reg|Dout\(3),
	datab => \DP|tc|DP|count_reg|Dout\(1),
	datad => \DP|tc|DP|count_reg|Dout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal1~0_combout\);

-- Location: LC_X9_Y7_N0
\DP|tc|DP|Equal0~3\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal0~3_combout\ = ((\DP|tc|DP|count_reg|Dout\(1) & ((\DP|tc|DP|count_reg|Dout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \DP|tc|DP|count_reg|Dout\(1),
	datad => \DP|tc|DP|count_reg|Dout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal0~3_combout\);

-- Location: LC_X10_Y7_N8
\DP|tc|DP|count_reg|Dout[4]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(4) = DFFEAS(\DP|tc|DP|count_reg|Dout\(4) $ ((((!(!\DP|tc|DP|count_reg|Dout[0]~5\ & \DP|tc|DP|count_reg|Dout[3]~3\) # (\DP|tc|DP|count_reg|Dout[0]~5\ & \DP|tc|DP|count_reg|Dout[3]~3COUT1_41\))))), GLOBAL(\clk~combout\), VCC, , , , 
-- , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[4]~15\ = CARRY((\DP|tc|DP|count_reg|Dout\(4) & ((!\DP|tc|DP|count_reg|Dout[3]~3\))))
-- \DP|tc|DP|count_reg|Dout[4]~15COUT1_43\ = CARRY((\DP|tc|DP|count_reg|Dout\(4) & ((!\DP|tc|DP|count_reg|Dout[3]~3COUT1_41\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|DP|count_reg|Dout\(4),
	aclr => GND,
	sclr => \DP|tc|CP|increment~3_combout\,
	cin => \DP|tc|DP|count_reg|Dout[0]~5\,
	cin0 => \DP|tc|DP|count_reg|Dout[3]~3\,
	cin1 => \DP|tc|DP|count_reg|Dout[3]~3COUT1_41\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(4),
	cout0 => \DP|tc|DP|count_reg|Dout[4]~15\,
	cout1 => \DP|tc|DP|count_reg|Dout[4]~15COUT1_43\);

-- Location: LC_X10_Y7_N9
\DP|tc|DP|count_reg|Dout[5]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(5) = DFFEAS((\DP|tc|DP|count_reg|Dout\(5) $ (((!\DP|tc|DP|count_reg|Dout[0]~5\ & \DP|tc|DP|count_reg|Dout[4]~15\) # (\DP|tc|DP|count_reg|Dout[0]~5\ & \DP|tc|DP|count_reg|Dout[4]~15COUT1_43\)))), GLOBAL(\clk~combout\), VCC, , , , 
-- , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[5]~9\ = CARRY(((!\DP|tc|DP|count_reg|Dout[4]~15COUT1_43\) # (!\DP|tc|DP|count_reg|Dout\(5))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \DP|tc|DP|count_reg|Dout\(5),
	aclr => GND,
	sclr => \DP|tc|CP|increment~3_combout\,
	cin => \DP|tc|DP|count_reg|Dout[0]~5\,
	cin0 => \DP|tc|DP|count_reg|Dout[4]~15\,
	cin1 => \DP|tc|DP|count_reg|Dout[4]~15COUT1_43\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(5),
	cout => \DP|tc|DP|count_reg|Dout[5]~9\);

-- Location: LC_X11_Y7_N0
\DP|tc|DP|count_reg|Dout[6]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(6) = DFFEAS((\DP|tc|DP|count_reg|Dout\(6) $ ((!\DP|tc|DP|count_reg|Dout[5]~9\))), GLOBAL(\clk~combout\), VCC, , , , , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[6]~21\ = CARRY(((\DP|tc|DP|count_reg|Dout\(6) & !\DP|tc|DP|count_reg|Dout[5]~9\)))
-- \DP|tc|DP|count_reg|Dout[6]~21COUT1_45\ = CARRY(((\DP|tc|DP|count_reg|Dout\(6) & !\DP|tc|DP|count_reg|Dout[5]~9\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \DP|tc|DP|count_reg|Dout\(6),
	aclr => GND,
	sclr => \DP|tc|CP|increment~3_combout\,
	cin => \DP|tc|DP|count_reg|Dout[5]~9\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(6),
	cout0 => \DP|tc|DP|count_reg|Dout[6]~21\,
	cout1 => \DP|tc|DP|count_reg|Dout[6]~21COUT1_45\);

-- Location: LC_X11_Y7_N1
\DP|tc|DP|count_reg|Dout[7]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(7) = DFFEAS((\DP|tc|DP|count_reg|Dout\(7) $ (((!\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[6]~21\) # (\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[6]~21COUT1_45\)))), GLOBAL(\clk~combout\), VCC, , , , 
-- , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[7]~11\ = CARRY(((!\DP|tc|DP|count_reg|Dout[6]~21\) # (!\DP|tc|DP|count_reg|Dout\(7))))
-- \DP|tc|DP|count_reg|Dout[7]~11COUT1_47\ = CARRY(((!\DP|tc|DP|count_reg|Dout[6]~21COUT1_45\) # (!\DP|tc|DP|count_reg|Dout\(7))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \DP|tc|DP|count_reg|Dout\(7),
	aclr => GND,
	sclr => \DP|tc|CP|increment~3_combout\,
	cin => \DP|tc|DP|count_reg|Dout[5]~9\,
	cin0 => \DP|tc|DP|count_reg|Dout[6]~21\,
	cin1 => \DP|tc|DP|count_reg|Dout[6]~21COUT1_45\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(7),
	cout0 => \DP|tc|DP|count_reg|Dout[7]~11\,
	cout1 => \DP|tc|DP|count_reg|Dout[7]~11COUT1_47\);

-- Location: LC_X11_Y7_N2
\DP|tc|DP|count_reg|Dout[8]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(8) = DFFEAS((\DP|tc|DP|count_reg|Dout\(8) $ ((!(!\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[7]~11\) # (\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[7]~11COUT1_47\)))), GLOBAL(\clk~combout\), VCC, , , , 
-- , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[8]~13\ = CARRY(((\DP|tc|DP|count_reg|Dout\(8) & !\DP|tc|DP|count_reg|Dout[7]~11\)))
-- \DP|tc|DP|count_reg|Dout[8]~13COUT1_49\ = CARRY(((\DP|tc|DP|count_reg|Dout\(8) & !\DP|tc|DP|count_reg|Dout[7]~11COUT1_47\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \DP|tc|DP|count_reg|Dout\(8),
	aclr => GND,
	sclr => \DP|tc|CP|increment~3_combout\,
	cin => \DP|tc|DP|count_reg|Dout[5]~9\,
	cin0 => \DP|tc|DP|count_reg|Dout[7]~11\,
	cin1 => \DP|tc|DP|count_reg|Dout[7]~11COUT1_47\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(8),
	cout0 => \DP|tc|DP|count_reg|Dout[8]~13\,
	cout1 => \DP|tc|DP|count_reg|Dout[8]~13COUT1_49\);

-- Location: LC_X11_Y7_N3
\DP|tc|DP|count_reg|Dout[9]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(9) = DFFEAS(\DP|tc|DP|count_reg|Dout\(9) $ (((((!\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[8]~13\) # (\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[8]~13COUT1_49\))))), GLOBAL(\clk~combout\), VCC, , , 
-- , , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[9]~19\ = CARRY(((!\DP|tc|DP|count_reg|Dout[8]~13\)) # (!\DP|tc|DP|count_reg|Dout\(9)))
-- \DP|tc|DP|count_reg|Dout[9]~19COUT1_51\ = CARRY(((!\DP|tc|DP|count_reg|Dout[8]~13COUT1_49\)) # (!\DP|tc|DP|count_reg|Dout\(9)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|DP|count_reg|Dout\(9),
	aclr => GND,
	sclr => \DP|tc|CP|increment~3_combout\,
	cin => \DP|tc|DP|count_reg|Dout[5]~9\,
	cin0 => \DP|tc|DP|count_reg|Dout[8]~13\,
	cin1 => \DP|tc|DP|count_reg|Dout[8]~13COUT1_49\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(9),
	cout0 => \DP|tc|DP|count_reg|Dout[9]~19\,
	cout1 => \DP|tc|DP|count_reg|Dout[9]~19COUT1_51\);

-- Location: LC_X11_Y7_N4
\DP|tc|DP|count_reg|Dout[10]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(10) = DFFEAS(\DP|tc|DP|count_reg|Dout\(10) $ ((((!(!\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[9]~19\) # (\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[9]~19COUT1_51\))))), GLOBAL(\clk~combout\), VCC, , 
-- , , , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[10]~25\ = CARRY((\DP|tc|DP|count_reg|Dout\(10) & ((!\DP|tc|DP|count_reg|Dout[9]~19COUT1_51\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|DP|count_reg|Dout\(10),
	aclr => GND,
	sclr => \DP|tc|CP|increment~3_combout\,
	cin => \DP|tc|DP|count_reg|Dout[5]~9\,
	cin0 => \DP|tc|DP|count_reg|Dout[9]~19\,
	cin1 => \DP|tc|DP|count_reg|Dout[9]~19COUT1_51\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(10),
	cout => \DP|tc|DP|count_reg|Dout[10]~25\);

-- Location: LC_X11_Y7_N5
\DP|tc|DP|count_reg|Dout[11]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(11) = DFFEAS(\DP|tc|DP|count_reg|Dout\(11) $ ((((\DP|tc|DP|count_reg|Dout[10]~25\)))), GLOBAL(\clk~combout\), VCC, , , , , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[11]~17\ = CARRY(((!\DP|tc|DP|count_reg|Dout[10]~25\)) # (!\DP|tc|DP|count_reg|Dout\(11)))
-- \DP|tc|DP|count_reg|Dout[11]~17COUT1_53\ = CARRY(((!\DP|tc|DP|count_reg|Dout[10]~25\)) # (!\DP|tc|DP|count_reg|Dout\(11)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|DP|count_reg|Dout\(11),
	aclr => GND,
	sclr => \DP|tc|CP|increment~3_combout\,
	cin => \DP|tc|DP|count_reg|Dout[10]~25\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(11),
	cout0 => \DP|tc|DP|count_reg|Dout[11]~17\,
	cout1 => \DP|tc|DP|count_reg|Dout[11]~17COUT1_53\);

-- Location: LC_X11_Y7_N6
\DP|tc|DP|count_reg|Dout[12]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(12) = DFFEAS(\DP|tc|DP|count_reg|Dout\(12) $ ((((!(!\DP|tc|DP|count_reg|Dout[10]~25\ & \DP|tc|DP|count_reg|Dout[11]~17\) # (\DP|tc|DP|count_reg|Dout[10]~25\ & \DP|tc|DP|count_reg|Dout[11]~17COUT1_53\))))), GLOBAL(\clk~combout\), 
-- VCC, , , , , \DP|tc|CP|increment~3_combout\, )

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a5a5",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|DP|count_reg|Dout\(12),
	aclr => GND,
	sclr => \DP|tc|CP|increment~3_combout\,
	cin => \DP|tc|DP|count_reg|Dout[10]~25\,
	cin0 => \DP|tc|DP|count_reg|Dout[11]~17\,
	cin1 => \DP|tc|DP|count_reg|Dout[11]~17COUT1_53\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(12));

-- Location: LC_X11_Y7_N9
\DP|tc|DP|Equal0~1\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal0~1_combout\ = (\DP|tc|DP|count_reg|Dout\(10) & (\DP|tc|DP|count_reg|Dout\(6) & (!\DP|tc|DP|count_reg|Dout\(11) & !\DP|tc|DP|count_reg|Dout\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0008",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|DP|count_reg|Dout\(10),
	datab => \DP|tc|DP|count_reg|Dout\(6),
	datac => \DP|tc|DP|count_reg|Dout\(11),
	datad => \DP|tc|DP|count_reg|Dout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal0~1_combout\);

-- Location: LC_X10_Y7_N0
\DP|tc|DP|Equal0~0\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal0~0_combout\ = (\DP|tc|DP|count_reg|Dout\(4) & (!\DP|tc|DP|count_reg|Dout\(5) & (!\DP|tc|DP|count_reg|Dout\(8) & !\DP|tc|DP|count_reg|Dout\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0002",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|DP|count_reg|Dout\(4),
	datab => \DP|tc|DP|count_reg|Dout\(5),
	datac => \DP|tc|DP|count_reg|Dout\(8),
	datad => \DP|tc|DP|count_reg|Dout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal0~0_combout\);

-- Location: LC_X10_Y7_N1
\DP|tc|DP|Equal0~2\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal0~2_combout\ = (\DP|tc|DP|count_reg|Dout\(12) & (((\DP|tc|DP|Equal0~1_combout\ & \DP|tc|DP|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|DP|count_reg|Dout\(12),
	datac => \DP|tc|DP|Equal0~1_combout\,
	datad => \DP|tc|DP|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal0~2_combout\);

-- Location: LC_X9_Y7_N3
\DP|tc|DP|Equal0~4\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal0~4_combout\ = (!\DP|tc|DP|count_reg|Dout\(3) & (\DP|tc|DP|Equal0~3_combout\ & (\DP|tc|DP|count_reg|Dout\(2) & \DP|tc|DP|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|DP|count_reg|Dout\(3),
	datab => \DP|tc|DP|Equal0~3_combout\,
	datac => \DP|tc|DP|count_reg|Dout\(2),
	datad => \DP|tc|DP|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal0~4_combout\);

-- Location: LC_X9_Y5_N9
\DP|tc|CP|state~7\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|state~7_combout\ = (!\reset~combout\ & ((\CP|Selector3~0_combout\) # ((\CP|state.S3~regout\ & !\DP|tc|CP|tick~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3032",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|state.S3~regout\,
	datab => \reset~combout\,
	datac => \CP|Selector3~0_combout\,
	datad => \DP|tc|CP|tick~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|state~7_combout\);

-- Location: LC_X9_Y5_N6
\DP|tc|CP|state.S2\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|state.S2~regout\ = DFFEAS((\DP|tc|CP|state~7_combout\ & ((\DP|tc|DP|Equal0~4_combout\ & (\DP|tc|CP|state.S1~regout\)) # (!\DP|tc|DP|Equal0~4_combout\ & ((\DP|tc|CP|state.S2~regout\))))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ac00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|CP|state.S1~regout\,
	datab => \DP|tc|CP|state.S2~regout\,
	datac => \DP|tc|DP|Equal0~4_combout\,
	datad => \DP|tc|CP|state~7_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|CP|state.S2~regout\);

-- Location: LC_X9_Y5_N8
\DP|tc|CP|state.S3\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|state.S3~regout\ = DFFEAS((\DP|tc|CP|state~7_combout\ & ((\DP|tc|CP|increment~2_combout\) # ((\DP|tc|CP|state.S2~regout\ & \DP|tc|DP|Equal0~4_combout\)))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ec00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|CP|state.S2~regout\,
	datab => \DP|tc|CP|increment~2_combout\,
	datac => \DP|tc|DP|Equal0~4_combout\,
	datad => \DP|tc|CP|state~7_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|CP|state.S3~regout\);

-- Location: LC_X9_Y7_N5
\DP|tc|CP|increment~2\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|increment~2_combout\ = (\DP|tc|CP|state.S3~regout\ & (((\DP|tc|DP|count_reg|Dout\(2)) # (!\DP|tc|DP|Equal0~2_combout\)) # (!\DP|tc|DP|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c4cc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|DP|Equal1~0_combout\,
	datab => \DP|tc|CP|state.S3~regout\,
	datac => \DP|tc|DP|count_reg|Dout\(2),
	datad => \DP|tc|DP|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|increment~2_combout\);

-- Location: LC_X9_Y7_N7
\DP|tc|CP|increment~4\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|increment~4_combout\ = ((!\DP|tc|DP|Equal0~4_combout\ & ((\DP|tc|CP|state.S2~regout\) # (\DP|tc|CP|state.S1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00fa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|CP|state.S2~regout\,
	datac => \DP|tc|CP|state.S1~regout\,
	datad => \DP|tc|DP|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|increment~4_combout\);

-- Location: LC_X9_Y7_N8
\DP|tc|CP|increment~3\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|increment~3_combout\ = (\reset~combout\) # ((\DP|tc|CP|state.S0~regout\ & (!\DP|tc|CP|increment~2_combout\ & !\DP|tc|CP|increment~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aaae",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \DP|tc|CP|state.S0~regout\,
	datac => \DP|tc|CP|increment~2_combout\,
	datad => \DP|tc|CP|increment~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|increment~3_combout\);

-- Location: LC_X10_Y7_N2
\DP|tc|DP|Equal2~0\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal2~0_combout\ = (!\DP|tc|DP|count_reg|Dout\(7) & (\DP|tc|DP|count_reg|Dout\(5) & (!\DP|tc|DP|count_reg|Dout\(8) & !\DP|tc|DP|count_reg|Dout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0004",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|DP|count_reg|Dout\(7),
	datab => \DP|tc|DP|count_reg|Dout\(5),
	datac => \DP|tc|DP|count_reg|Dout\(8),
	datad => \DP|tc|DP|count_reg|Dout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal2~0_combout\);

-- Location: LC_X11_Y7_N8
\DP|tc|DP|Equal2~1\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal2~1_combout\ = (((!\DP|tc|DP|count_reg|Dout\(6) & \DP|tc|DP|count_reg|Dout\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \DP|tc|DP|count_reg|Dout\(6),
	datad => \DP|tc|DP|count_reg|Dout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal2~1_combout\);

-- Location: LC_X11_Y7_N7
\DP|tc|DP|Equal2~2\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal2~2_combout\ = (!\DP|tc|DP|count_reg|Dout\(12) & (!\DP|tc|DP|count_reg|Dout\(10) & (\DP|tc|DP|count_reg|Dout\(11) & \DP|tc|DP|Equal2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|DP|count_reg|Dout\(12),
	datab => \DP|tc|DP|count_reg|Dout\(10),
	datac => \DP|tc|DP|count_reg|Dout\(11),
	datad => \DP|tc|DP|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal2~2_combout\);

-- Location: LC_X10_Y7_N3
\DP|tc|DP|Equal2~3\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal2~3_combout\ = (\DP|tc|DP|count_reg|Dout\(2) & (\DP|tc|DP|Equal2~0_combout\ & (\DP|tc|DP|Equal1~0_combout\ & \DP|tc|DP|Equal2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|DP|count_reg|Dout\(2),
	datab => \DP|tc|DP|Equal2~0_combout\,
	datac => \DP|tc|DP|Equal1~0_combout\,
	datad => \DP|tc|DP|Equal2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal2~3_combout\);

-- Location: LC_X9_Y5_N4
\CP|Selector3~0\ : maxv_lcell
-- Equation(s):
-- \CP|Selector3~0_combout\ = (((!\DP|tc|DP|Equal2~3_combout\ & \CP|state.S2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \DP|tc|DP|Equal2~3_combout\,
	datad => \CP|state.S2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Selector3~0_combout\);

-- Location: LC_X9_Y5_N5
\DP|tc|CP|state.S4\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|state.S4~regout\ = DFFEAS((!\reset~combout\ & (!\CP|Selector3~0_combout\ & ((\DP|tc|CP|tick~2_combout\) # (!\CP|state.S3~regout\)))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0301",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S3~regout\,
	datab => \reset~combout\,
	datac => \CP|Selector3~0_combout\,
	datad => \DP|tc|CP|tick~2_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|CP|state.S4~regout\);

-- Location: LC_X9_Y4_N3
\DP|tc|CP|tick~0\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|tick~0_combout\ = (\DP|tc|CP|state.S3~regout\ & (!\DP|tc|DP|count_reg|Dout\(2) & (\DP|tc|DP|Equal0~2_combout\ & \DP|tc|DP|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "2000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|CP|state.S3~regout\,
	datab => \DP|tc|DP|count_reg|Dout\(2),
	datac => \DP|tc|DP|Equal0~2_combout\,
	datad => \DP|tc|DP|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|tick~0_combout\);

-- Location: LC_X9_Y4_N1
\CP|Selector1~0\ : maxv_lcell
-- Equation(s):
-- \CP|Selector1~0_combout\ = (\CP|state.S2~regout\ & (\DP|tc|DP|Equal2~3_combout\ & ((\DP|tc|CP|tick~2_combout\) # (!\CP|state.S3~regout\)))) # (!\CP|state.S2~regout\ & (((\DP|tc|CP|tick~2_combout\) # (!\CP|state.S3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "d0dd",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|state.S2~regout\,
	datab => \DP|tc|DP|Equal2~3_combout\,
	datac => \DP|tc|CP|tick~2_combout\,
	datad => \CP|state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Selector1~0_combout\);

-- Location: LC_X9_Y4_N2
\DP|tc|CP|state.S0\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|state.S0~regout\ = DFFEAS((!\reset~combout\ & ((\CP|Selector1~0_combout\) # ((!\DP|tc|CP|state.S4~regout\ & !\DP|tc|CP|tick~0_combout\)))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f01",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|CP|state.S4~regout\,
	datab => \DP|tc|CP|tick~0_combout\,
	datac => \reset~combout\,
	datad => \CP|Selector1~0_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|CP|state.S0~regout\);

-- Location: LC_X9_Y5_N7
\DP|tc|CP|state.S1\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|state.S1~regout\ = DFFEAS((\DP|tc|CP|state~7_combout\ & (((\DP|tc|CP|state.S1~regout\ & !\DP|tc|DP|Equal0~4_combout\)) # (!\DP|tc|CP|state.S0~regout\))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3b00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|CP|state.S1~regout\,
	datab => \DP|tc|CP|state.S0~regout\,
	datac => \DP|tc|DP|Equal0~4_combout\,
	datad => \DP|tc|CP|state~7_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|CP|state.S1~regout\);

-- Location: LC_X9_Y5_N3
\DP|tc|CP|tick~1\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|tick~1_combout\ = ((\DP|tc|CP|state.S1~regout\) # ((\DP|tc|CP|state.S2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fcfc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \DP|tc|CP|state.S1~regout\,
	datac => \DP|tc|CP|state.S2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|tick~1_combout\);

-- Location: LC_X9_Y4_N4
\DP|tc|CP|tick~2\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|tick~2_combout\ = (!\reset~combout\ & ((\DP|tc|CP|tick~0_combout\) # ((\DP|tc|CP|tick~1_combout\ & \DP|tc|DP|Equal0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "5540",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \DP|tc|CP|tick~1_combout\,
	datac => \DP|tc|DP|Equal0~4_combout\,
	datad => \DP|tc|CP|tick~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|tick~2_combout\);

-- Location: LC_X9_Y4_N6
\CP|state.S4\ : maxv_lcell
-- Equation(s):
-- \CP|state.S4~regout\ = DFFEAS(((\CP|process_0~0_combout\ & (\DP|tc|CP|tick~2_combout\ & \CP|state.S3~regout\))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \CP|process_0~0_combout\,
	datac => \DP|tc|CP|tick~2_combout\,
	datad => \CP|state.S3~regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|state.S4~regout\);

-- Location: LC_X8_Y5_N7
\CP|Selector2~1\ : maxv_lcell
-- Equation(s):
-- \CP|Selector2~1_combout\ = ((\data_in~combout\ & (\CP|state.S1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c0c0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \data_in~combout\,
	datac => \CP|state.S1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Selector2~1_combout\);

-- Location: LC_X10_Y6_N3
\CP|count_sig[25]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(25) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~120_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & ((\CP|count_sig\(25))))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b1a0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|state.S1~regout\,
	datac => \CP|Add0~120_combout\,
	datad => \CP|count_sig\(25),
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(25));

-- Location: LC_X5_Y6_N9
\CP|count_sig~1\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig~1_combout\ = ((\reset~combout\) # ((\CP|state.S1~regout\) # (\CP|state.S5~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \reset~combout\,
	datac => \CP|state.S1~regout\,
	datad => \CP|state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|count_sig~1_combout\);

-- Location: LC_X5_Y6_N5
\CP|count_sig[0]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(0) = DFFEAS(((\reset~combout\) # ((!\CP|state.S5~regout\) # (!\CP|count_sig\(0)))), GLOBAL(\clk~combout\), VCC, , \CP|count_sig~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cfff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \reset~combout\,
	datac => \CP|count_sig\(0),
	datad => \CP|state.S5~regout\,
	aclr => GND,
	ena => \CP|count_sig~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(0));

-- Location: LC_X6_Y6_N4
\CP|Add0~157\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~157_cout\ = CARRY((!\CP|count_sig\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff55",
	operation_mode => "arithmetic",
	output_mode => "none",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|count_sig\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~155\,
	cout => \CP|Add0~157_cout\);

-- Location: LC_X6_Y6_N5
\CP|Add0~0\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~0_combout\ = (\CP|count_sig\(1) $ ((\CP|Add0~157_cout\)))
-- \CP|Add0~2\ = CARRY(((!\CP|Add0~157_cout\) # (!\CP|count_sig\(1))))
-- \CP|Add0~2COUT1_186\ = CARRY(((!\CP|Add0~157_cout\) # (!\CP|count_sig\(1))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(1),
	cin => \CP|Add0~157_cout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~0_combout\,
	cout0 => \CP|Add0~2\,
	cout1 => \CP|Add0~2COUT1_186\);

-- Location: LC_X6_Y6_N1
\CP|count_sig[1]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(1) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~0_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & (\CP|count_sig\(1)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f044",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S1~regout\,
	datab => \CP|count_sig\(1),
	datac => \CP|Add0~0_combout\,
	datad => \CP|state.S5~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(1));

-- Location: LC_X6_Y6_N6
\CP|Add0~5\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~5_combout\ = (\CP|count_sig\(2) $ ((!(!\CP|Add0~157_cout\ & \CP|Add0~2\) # (\CP|Add0~157_cout\ & \CP|Add0~2COUT1_186\))))
-- \CP|Add0~7\ = CARRY(((\CP|count_sig\(2) & !\CP|Add0~2\)))
-- \CP|Add0~7COUT1_188\ = CARRY(((\CP|count_sig\(2) & !\CP|Add0~2COUT1_186\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(2),
	cin => \CP|Add0~157_cout\,
	cin0 => \CP|Add0~2\,
	cin1 => \CP|Add0~2COUT1_186\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~5_combout\,
	cout0 => \CP|Add0~7\,
	cout1 => \CP|Add0~7COUT1_188\);

-- Location: LC_X5_Y6_N2
\CP|count_sig[2]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(2) = DFFEAS((\CP|state.S5~regout\ & (\CP|Add0~5_combout\)) # (!\CP|state.S5~regout\ & (((\CP|count_sig\(2) & !\CP|state.S1~regout\)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aa0c",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|Add0~5_combout\,
	datab => \CP|count_sig\(2),
	datac => \CP|state.S1~regout\,
	datad => \CP|state.S5~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(2));

-- Location: LC_X6_Y6_N7
\CP|Add0~10\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~10_combout\ = (\CP|count_sig\(3) $ (((!\CP|Add0~157_cout\ & \CP|Add0~7\) # (\CP|Add0~157_cout\ & \CP|Add0~7COUT1_188\))))
-- \CP|Add0~12\ = CARRY(((!\CP|Add0~7\) # (!\CP|count_sig\(3))))
-- \CP|Add0~12COUT1_190\ = CARRY(((!\CP|Add0~7COUT1_188\) # (!\CP|count_sig\(3))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(3),
	cin => \CP|Add0~157_cout\,
	cin0 => \CP|Add0~7\,
	cin1 => \CP|Add0~7COUT1_188\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~10_combout\,
	cout0 => \CP|Add0~12\,
	cout1 => \CP|Add0~12COUT1_190\);

-- Location: LC_X5_Y6_N6
\CP|count_sig[3]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(3) = DFFEAS((\CP|state.S5~regout\ & (\CP|Add0~10_combout\)) # (!\CP|state.S5~regout\ & (((!\CP|state.S1~regout\ & \CP|count_sig\(3))))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aa30",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|Add0~10_combout\,
	datab => \CP|state.S1~regout\,
	datac => \CP|count_sig\(3),
	datad => \CP|state.S5~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(3));

-- Location: LC_X6_Y6_N8
\CP|Add0~15\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~15_combout\ = (\CP|count_sig\(4) $ ((!(!\CP|Add0~157_cout\ & \CP|Add0~12\) # (\CP|Add0~157_cout\ & \CP|Add0~12COUT1_190\))))
-- \CP|Add0~17\ = CARRY(((\CP|count_sig\(4) & !\CP|Add0~12\)))
-- \CP|Add0~17COUT1_192\ = CARRY(((\CP|count_sig\(4) & !\CP|Add0~12COUT1_190\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(4),
	cin => \CP|Add0~157_cout\,
	cin0 => \CP|Add0~12\,
	cin1 => \CP|Add0~12COUT1_190\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~15_combout\,
	cout0 => \CP|Add0~17\,
	cout1 => \CP|Add0~17COUT1_192\);

-- Location: LC_X5_Y6_N7
\CP|count_sig[4]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(4) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~15_combout\)))) # (!\CP|state.S5~regout\ & (\CP|count_sig\(4) & ((!\CP|state.S1~regout\)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc0a",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|count_sig\(4),
	datab => \CP|Add0~15_combout\,
	datac => \CP|state.S1~regout\,
	datad => \CP|state.S5~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(4));

-- Location: LC_X6_Y6_N9
\CP|Add0~20\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~20_combout\ = (\CP|count_sig\(5) $ (((!\CP|Add0~157_cout\ & \CP|Add0~17\) # (\CP|Add0~157_cout\ & \CP|Add0~17COUT1_192\))))
-- \CP|Add0~22\ = CARRY(((!\CP|Add0~17COUT1_192\) # (!\CP|count_sig\(5))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(5),
	cin => \CP|Add0~157_cout\,
	cin0 => \CP|Add0~17\,
	cin1 => \CP|Add0~17COUT1_192\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~20_combout\,
	cout => \CP|Add0~22\);

-- Location: LC_X5_Y6_N4
\CP|count_sig[5]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(5) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~20_combout\)))) # (!\CP|state.S5~regout\ & (\CP|count_sig\(5) & ((!\CP|state.S1~regout\)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc0a",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|count_sig\(5),
	datab => \CP|Add0~20_combout\,
	datac => \CP|state.S1~regout\,
	datad => \CP|state.S5~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(5));

-- Location: LC_X7_Y6_N0
\CP|Add0~25\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~25_combout\ = (\CP|count_sig\(6) $ ((!\CP|Add0~22\)))
-- \CP|Add0~27\ = CARRY(((\CP|count_sig\(6) & !\CP|Add0~22\)))
-- \CP|Add0~27COUT1_194\ = CARRY(((\CP|count_sig\(6) & !\CP|Add0~22\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(6),
	cin => \CP|Add0~22\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~25_combout\,
	cout0 => \CP|Add0~27\,
	cout1 => \CP|Add0~27COUT1_194\);

-- Location: LC_X5_Y6_N1
\CP|count_sig[6]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(6) = DFFEAS((\CP|state.S5~regout\ & (\CP|Add0~25_combout\)) # (!\CP|state.S5~regout\ & (((\CP|count_sig\(6) & !\CP|state.S1~regout\)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "aa0c",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|Add0~25_combout\,
	datab => \CP|count_sig\(6),
	datac => \CP|state.S1~regout\,
	datad => \CP|state.S5~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(6));

-- Location: LC_X7_Y6_N1
\CP|Add0~30\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~30_combout\ = (\CP|count_sig\(7) $ (((!\CP|Add0~22\ & \CP|Add0~27\) # (\CP|Add0~22\ & \CP|Add0~27COUT1_194\))))
-- \CP|Add0~32\ = CARRY(((!\CP|Add0~27\) # (!\CP|count_sig\(7))))
-- \CP|Add0~32COUT1_196\ = CARRY(((!\CP|Add0~27COUT1_194\) # (!\CP|count_sig\(7))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(7),
	cin => \CP|Add0~22\,
	cin0 => \CP|Add0~27\,
	cin1 => \CP|Add0~27COUT1_194\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~30_combout\,
	cout0 => \CP|Add0~32\,
	cout1 => \CP|Add0~32COUT1_196\);

-- Location: LC_X5_Y6_N8
\CP|count_sig[7]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(7) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~30_combout\)))) # (!\CP|state.S5~regout\ & (\CP|count_sig\(7) & (!\CP|state.S1~regout\))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f022",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|count_sig\(7),
	datab => \CP|state.S1~regout\,
	datac => \CP|Add0~30_combout\,
	datad => \CP|state.S5~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(7));

-- Location: LC_X7_Y6_N2
\CP|Add0~35\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~35_combout\ = (\CP|count_sig\(8) $ ((!(!\CP|Add0~22\ & \CP|Add0~32\) # (\CP|Add0~22\ & \CP|Add0~32COUT1_196\))))
-- \CP|Add0~37\ = CARRY(((\CP|count_sig\(8) & !\CP|Add0~32\)))
-- \CP|Add0~37COUT1_198\ = CARRY(((\CP|count_sig\(8) & !\CP|Add0~32COUT1_196\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(8),
	cin => \CP|Add0~22\,
	cin0 => \CP|Add0~32\,
	cin1 => \CP|Add0~32COUT1_196\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~35_combout\,
	cout0 => \CP|Add0~37\,
	cout1 => \CP|Add0~37COUT1_198\);

-- Location: LC_X6_Y6_N2
\CP|count_sig[8]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(8) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~35_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & (\CP|count_sig\(8)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f044",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S1~regout\,
	datab => \CP|count_sig\(8),
	datac => \CP|Add0~35_combout\,
	datad => \CP|state.S5~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(8));

-- Location: LC_X7_Y6_N3
\CP|Add0~40\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~40_combout\ = \CP|count_sig\(9) $ (((((!\CP|Add0~22\ & \CP|Add0~37\) # (\CP|Add0~22\ & \CP|Add0~37COUT1_198\)))))
-- \CP|Add0~42\ = CARRY(((!\CP|Add0~37\)) # (!\CP|count_sig\(9)))
-- \CP|Add0~42COUT1_200\ = CARRY(((!\CP|Add0~37COUT1_198\)) # (!\CP|count_sig\(9)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|count_sig\(9),
	cin => \CP|Add0~22\,
	cin0 => \CP|Add0~37\,
	cin1 => \CP|Add0~37COUT1_198\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~40_combout\,
	cout0 => \CP|Add0~42\,
	cout1 => \CP|Add0~42COUT1_200\);

-- Location: LC_X6_Y6_N0
\CP|count_sig[9]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(9) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~40_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & (\CP|count_sig\(9)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f044",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S1~regout\,
	datab => \CP|count_sig\(9),
	datac => \CP|Add0~40_combout\,
	datad => \CP|state.S5~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(9));

-- Location: LC_X7_Y6_N4
\CP|Add0~45\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~45_combout\ = \CP|count_sig\(10) $ ((((!(!\CP|Add0~22\ & \CP|Add0~42\) # (\CP|Add0~22\ & \CP|Add0~42COUT1_200\)))))
-- \CP|Add0~47\ = CARRY((\CP|count_sig\(10) & ((!\CP|Add0~42COUT1_200\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|count_sig\(10),
	cin => \CP|Add0~22\,
	cin0 => \CP|Add0~42\,
	cin1 => \CP|Add0~42COUT1_200\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~45_combout\,
	cout => \CP|Add0~47\);

-- Location: LC_X7_Y5_N1
\CP|count_sig[10]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(10) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~45_combout\)))) # (!\CP|state.S5~regout\ & (\CP|count_sig\(10) & (!\CP|state.S1~regout\))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f202",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|count_sig\(10),
	datab => \CP|state.S1~regout\,
	datac => \CP|state.S5~regout\,
	datad => \CP|Add0~45_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(10));

-- Location: LC_X7_Y6_N5
\CP|Add0~50\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~50_combout\ = (\CP|count_sig\(11) $ ((\CP|Add0~47\)))
-- \CP|Add0~52\ = CARRY(((!\CP|Add0~47\) # (!\CP|count_sig\(11))))
-- \CP|Add0~52COUT1_202\ = CARRY(((!\CP|Add0~47\) # (!\CP|count_sig\(11))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(11),
	cin => \CP|Add0~47\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~50_combout\,
	cout0 => \CP|Add0~52\,
	cout1 => \CP|Add0~52COUT1_202\);

-- Location: LC_X6_Y6_N3
\CP|count_sig[11]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(11) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~50_combout\)))) # (!\CP|state.S5~regout\ & (\CP|count_sig\(11) & ((!\CP|state.S1~regout\)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cc0a",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|count_sig\(11),
	datab => \CP|Add0~50_combout\,
	datac => \CP|state.S1~regout\,
	datad => \CP|state.S5~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(11));

-- Location: LC_X7_Y6_N6
\CP|Add0~55\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~55_combout\ = (\CP|count_sig\(12) $ ((!(!\CP|Add0~47\ & \CP|Add0~52\) # (\CP|Add0~47\ & \CP|Add0~52COUT1_202\))))
-- \CP|Add0~57\ = CARRY(((\CP|count_sig\(12) & !\CP|Add0~52\)))
-- \CP|Add0~57COUT1_204\ = CARRY(((\CP|count_sig\(12) & !\CP|Add0~52COUT1_202\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(12),
	cin => \CP|Add0~47\,
	cin0 => \CP|Add0~52\,
	cin1 => \CP|Add0~52COUT1_202\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~55_combout\,
	cout0 => \CP|Add0~57\,
	cout1 => \CP|Add0~57COUT1_204\);

-- Location: LC_X5_Y6_N0
\CP|count_sig[12]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(12) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~55_combout\)))) # (!\CP|state.S5~regout\ & (\CP|count_sig\(12) & (!\CP|state.S1~regout\))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ce02",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|count_sig\(12),
	datab => \CP|state.S5~regout\,
	datac => \CP|state.S1~regout\,
	datad => \CP|Add0~55_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(12));

-- Location: LC_X7_Y6_N7
\CP|Add0~60\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~60_combout\ = \CP|count_sig\(13) $ (((((!\CP|Add0~47\ & \CP|Add0~57\) # (\CP|Add0~47\ & \CP|Add0~57COUT1_204\)))))
-- \CP|Add0~62\ = CARRY(((!\CP|Add0~57\)) # (!\CP|count_sig\(13)))
-- \CP|Add0~62COUT1_206\ = CARRY(((!\CP|Add0~57COUT1_204\)) # (!\CP|count_sig\(13)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|count_sig\(13),
	cin => \CP|Add0~47\,
	cin0 => \CP|Add0~57\,
	cin1 => \CP|Add0~57COUT1_204\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~60_combout\,
	cout0 => \CP|Add0~62\,
	cout1 => \CP|Add0~62COUT1_206\);

-- Location: LC_X5_Y6_N3
\CP|count_sig[13]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(13) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~60_combout\)))) # (!\CP|state.S5~regout\ & (\CP|count_sig\(13) & (!\CP|state.S1~regout\))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f022",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|count_sig\(13),
	datab => \CP|state.S1~regout\,
	datac => \CP|Add0~60_combout\,
	datad => \CP|state.S5~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(13));

-- Location: LC_X7_Y6_N8
\CP|Add0~65\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~65_combout\ = \CP|count_sig\(14) $ ((((!(!\CP|Add0~47\ & \CP|Add0~62\) # (\CP|Add0~47\ & \CP|Add0~62COUT1_206\)))))
-- \CP|Add0~67\ = CARRY((\CP|count_sig\(14) & ((!\CP|Add0~62\))))
-- \CP|Add0~67COUT1_208\ = CARRY((\CP|count_sig\(14) & ((!\CP|Add0~62COUT1_206\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|count_sig\(14),
	cin => \CP|Add0~47\,
	cin0 => \CP|Add0~62\,
	cin1 => \CP|Add0~62COUT1_206\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~65_combout\,
	cout0 => \CP|Add0~67\,
	cout1 => \CP|Add0~67COUT1_208\);

-- Location: LC_X7_Y5_N6
\CP|count_sig[14]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(14) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~65_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & (\CP|count_sig\(14)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ba10",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|state.S1~regout\,
	datac => \CP|count_sig\(14),
	datad => \CP|Add0~65_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(14));

-- Location: LC_X7_Y6_N9
\CP|Add0~70\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~70_combout\ = \CP|count_sig\(15) $ (((((!\CP|Add0~47\ & \CP|Add0~67\) # (\CP|Add0~47\ & \CP|Add0~67COUT1_208\)))))
-- \CP|Add0~72\ = CARRY(((!\CP|Add0~67COUT1_208\)) # (!\CP|count_sig\(15)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|count_sig\(15),
	cin => \CP|Add0~47\,
	cin0 => \CP|Add0~67\,
	cin1 => \CP|Add0~67COUT1_208\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~70_combout\,
	cout => \CP|Add0~72\);

-- Location: LC_X7_Y5_N3
\CP|count_sig[15]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(15) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~70_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & ((\CP|count_sig\(15))))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b1a0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|state.S1~regout\,
	datac => \CP|Add0~70_combout\,
	datad => \CP|count_sig\(15),
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(15));

-- Location: LC_X8_Y6_N0
\CP|Add0~75\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~75_combout\ = (\CP|count_sig\(16) $ ((!\CP|Add0~72\)))
-- \CP|Add0~77\ = CARRY(((\CP|count_sig\(16) & !\CP|Add0~72\)))
-- \CP|Add0~77COUT1_210\ = CARRY(((\CP|count_sig\(16) & !\CP|Add0~72\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(16),
	cin => \CP|Add0~72\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~75_combout\,
	cout0 => \CP|Add0~77\,
	cout1 => \CP|Add0~77COUT1_210\);

-- Location: LC_X10_Y6_N7
\CP|count_sig[16]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(16) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~75_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & (\CP|count_sig\(16)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ba10",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|state.S1~regout\,
	datac => \CP|count_sig\(16),
	datad => \CP|Add0~75_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(16));

-- Location: LC_X8_Y6_N1
\CP|Add0~80\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~80_combout\ = (\CP|count_sig\(17) $ (((!\CP|Add0~72\ & \CP|Add0~77\) # (\CP|Add0~72\ & \CP|Add0~77COUT1_210\))))
-- \CP|Add0~82\ = CARRY(((!\CP|Add0~77\) # (!\CP|count_sig\(17))))
-- \CP|Add0~82COUT1_212\ = CARRY(((!\CP|Add0~77COUT1_210\) # (!\CP|count_sig\(17))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(17),
	cin => \CP|Add0~72\,
	cin0 => \CP|Add0~77\,
	cin1 => \CP|Add0~77COUT1_210\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~80_combout\,
	cout0 => \CP|Add0~82\,
	cout1 => \CP|Add0~82COUT1_212\);

-- Location: LC_X9_Y6_N8
\CP|count_sig[17]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(17) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~80_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & ((\CP|count_sig\(17))))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "b1a0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|state.S1~regout\,
	datac => \CP|Add0~80_combout\,
	datad => \CP|count_sig\(17),
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(17));

-- Location: LC_X8_Y6_N2
\CP|Add0~85\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~85_combout\ = (\CP|count_sig\(18) $ ((!(!\CP|Add0~72\ & \CP|Add0~82\) # (\CP|Add0~72\ & \CP|Add0~82COUT1_212\))))
-- \CP|Add0~87\ = CARRY(((\CP|count_sig\(18) & !\CP|Add0~82\)))
-- \CP|Add0~87COUT1_214\ = CARRY(((\CP|count_sig\(18) & !\CP|Add0~82COUT1_212\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(18),
	cin => \CP|Add0~72\,
	cin0 => \CP|Add0~82\,
	cin1 => \CP|Add0~82COUT1_212\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~85_combout\,
	cout0 => \CP|Add0~87\,
	cout1 => \CP|Add0~87COUT1_214\);

-- Location: LC_X10_Y6_N9
\CP|count_sig[18]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(18) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~85_combout\)))) # (!\CP|state.S5~regout\ & (\CP|count_sig\(18) & ((!\CP|state.S1~regout\)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a0e4",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|count_sig\(18),
	datac => \CP|Add0~85_combout\,
	datad => \CP|state.S1~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(18));

-- Location: LC_X8_Y6_N3
\CP|Add0~90\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~90_combout\ = (\CP|count_sig\(19) $ (((!\CP|Add0~72\ & \CP|Add0~87\) # (\CP|Add0~72\ & \CP|Add0~87COUT1_214\))))
-- \CP|Add0~92\ = CARRY(((!\CP|Add0~87\) # (!\CP|count_sig\(19))))
-- \CP|Add0~92COUT1_216\ = CARRY(((!\CP|Add0~87COUT1_214\) # (!\CP|count_sig\(19))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(19),
	cin => \CP|Add0~72\,
	cin0 => \CP|Add0~87\,
	cin1 => \CP|Add0~87COUT1_214\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~90_combout\,
	cout0 => \CP|Add0~92\,
	cout1 => \CP|Add0~92COUT1_216\);

-- Location: LC_X10_Y6_N2
\CP|count_sig[19]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(19) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~90_combout\)))) # (!\CP|state.S5~regout\ & (\CP|count_sig\(19) & (!\CP|state.S1~regout\))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ae04",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|count_sig\(19),
	datac => \CP|state.S1~regout\,
	datad => \CP|Add0~90_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(19));

-- Location: LC_X8_Y6_N4
\CP|Add0~95\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~95_combout\ = (\CP|count_sig\(20) $ ((!(!\CP|Add0~72\ & \CP|Add0~92\) # (\CP|Add0~72\ & \CP|Add0~92COUT1_216\))))
-- \CP|Add0~97\ = CARRY(((\CP|count_sig\(20) & !\CP|Add0~92COUT1_216\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(20),
	cin => \CP|Add0~72\,
	cin0 => \CP|Add0~92\,
	cin1 => \CP|Add0~92COUT1_216\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~95_combout\,
	cout => \CP|Add0~97\);

-- Location: LC_X9_Y5_N2
\CP|count_sig[20]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(20) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~95_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & (\CP|count_sig\(20)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f404",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S1~regout\,
	datab => \CP|count_sig\(20),
	datac => \CP|state.S5~regout\,
	datad => \CP|Add0~95_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(20));

-- Location: LC_X8_Y6_N5
\CP|Add0~100\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~100_combout\ = \CP|count_sig\(21) $ ((((\CP|Add0~97\))))
-- \CP|Add0~102\ = CARRY(((!\CP|Add0~97\)) # (!\CP|count_sig\(21)))
-- \CP|Add0~102COUT1_218\ = CARRY(((!\CP|Add0~97\)) # (!\CP|count_sig\(21)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|count_sig\(21),
	cin => \CP|Add0~97\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~100_combout\,
	cout0 => \CP|Add0~102\,
	cout1 => \CP|Add0~102COUT1_218\);

-- Location: LC_X9_Y5_N1
\CP|count_sig[21]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(21) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~100_combout\)))) # (!\CP|state.S5~regout\ & (\CP|count_sig\(21) & (!\CP|state.S1~regout\))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ce02",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|count_sig\(21),
	datab => \CP|state.S5~regout\,
	datac => \CP|state.S1~regout\,
	datad => \CP|Add0~100_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(21));

-- Location: LC_X8_Y6_N6
\CP|Add0~105\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~105_combout\ = (\CP|count_sig\(22) $ ((!(!\CP|Add0~97\ & \CP|Add0~102\) # (\CP|Add0~97\ & \CP|Add0~102COUT1_218\))))
-- \CP|Add0~107\ = CARRY(((\CP|count_sig\(22) & !\CP|Add0~102\)))
-- \CP|Add0~107COUT1_220\ = CARRY(((\CP|count_sig\(22) & !\CP|Add0~102COUT1_218\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(22),
	cin => \CP|Add0~97\,
	cin0 => \CP|Add0~102\,
	cin1 => \CP|Add0~102COUT1_218\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~105_combout\,
	cout0 => \CP|Add0~107\,
	cout1 => \CP|Add0~107COUT1_220\);

-- Location: LC_X7_Y5_N2
\CP|count_sig[22]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(22) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~105_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & (\CP|count_sig\(22)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ba10",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|state.S1~regout\,
	datac => \CP|count_sig\(22),
	datad => \CP|Add0~105_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(22));

-- Location: LC_X8_Y6_N7
\CP|Add0~110\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~110_combout\ = (\CP|count_sig\(23) $ (((!\CP|Add0~97\ & \CP|Add0~107\) # (\CP|Add0~97\ & \CP|Add0~107COUT1_220\))))
-- \CP|Add0~112\ = CARRY(((!\CP|Add0~107\) # (!\CP|count_sig\(23))))
-- \CP|Add0~112COUT1_222\ = CARRY(((!\CP|Add0~107COUT1_220\) # (!\CP|count_sig\(23))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(23),
	cin => \CP|Add0~97\,
	cin0 => \CP|Add0~107\,
	cin1 => \CP|Add0~107COUT1_220\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~110_combout\,
	cout0 => \CP|Add0~112\,
	cout1 => \CP|Add0~112COUT1_222\);

-- Location: LC_X8_Y5_N8
\CP|count_sig[23]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(23) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~110_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & (\CP|count_sig\(23)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ba10",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|state.S1~regout\,
	datac => \CP|count_sig\(23),
	datad => \CP|Add0~110_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(23));

-- Location: LC_X8_Y6_N8
\CP|Add0~115\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~115_combout\ = \CP|count_sig\(24) $ ((((!(!\CP|Add0~97\ & \CP|Add0~112\) # (\CP|Add0~97\ & \CP|Add0~112COUT1_222\)))))
-- \CP|Add0~117\ = CARRY((\CP|count_sig\(24) & ((!\CP|Add0~112\))))
-- \CP|Add0~117COUT1_224\ = CARRY((\CP|count_sig\(24) & ((!\CP|Add0~112COUT1_222\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|count_sig\(24),
	cin => \CP|Add0~97\,
	cin0 => \CP|Add0~112\,
	cin1 => \CP|Add0~112COUT1_222\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~115_combout\,
	cout0 => \CP|Add0~117\,
	cout1 => \CP|Add0~117COUT1_224\);

-- Location: LC_X9_Y6_N7
\CP|count_sig[24]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(24) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~115_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & (\CP|count_sig\(24)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ba10",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|state.S1~regout\,
	datac => \CP|count_sig\(24),
	datad => \CP|Add0~115_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(24));

-- Location: LC_X8_Y6_N9
\CP|Add0~120\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~120_combout\ = (\CP|count_sig\(25) $ (((!\CP|Add0~97\ & \CP|Add0~117\) # (\CP|Add0~97\ & \CP|Add0~117COUT1_224\))))
-- \CP|Add0~122\ = CARRY(((!\CP|Add0~117COUT1_224\) # (!\CP|count_sig\(25))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(25),
	cin => \CP|Add0~97\,
	cin0 => \CP|Add0~117\,
	cin1 => \CP|Add0~117COUT1_224\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~120_combout\,
	cout => \CP|Add0~122\);

-- Location: LC_X10_Y6_N4
\CP|count_sig[27]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(27) = DFFEAS((\CP|state.S5~regout\ & (\CP|Add0~130_combout\)) # (!\CP|state.S5~regout\ & (((\CP|count_sig\(27) & !\CP|state.S1~regout\)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a0ac",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|Add0~130_combout\,
	datab => \CP|count_sig\(27),
	datac => \CP|state.S5~regout\,
	datad => \CP|state.S1~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(27));

-- Location: LC_X9_Y6_N0
\CP|Add0~125\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~125_combout\ = (\CP|count_sig\(26) $ ((!\CP|Add0~122\)))
-- \CP|Add0~127\ = CARRY(((\CP|count_sig\(26) & !\CP|Add0~122\)))
-- \CP|Add0~127COUT1_226\ = CARRY(((\CP|count_sig\(26) & !\CP|Add0~122\)))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(26),
	cin => \CP|Add0~122\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~125_combout\,
	cout0 => \CP|Add0~127\,
	cout1 => \CP|Add0~127COUT1_226\);

-- Location: LC_X10_Y6_N8
\CP|count_sig[26]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(26) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~125_combout\)))) # (!\CP|state.S5~regout\ & (\CP|count_sig\(26) & (!\CP|state.S1~regout\))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ae04",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|count_sig\(26),
	datac => \CP|state.S1~regout\,
	datad => \CP|Add0~125_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(26));

-- Location: LC_X9_Y6_N1
\CP|Add0~130\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~130_combout\ = (\CP|count_sig\(27) $ (((!\CP|Add0~122\ & \CP|Add0~127\) # (\CP|Add0~122\ & \CP|Add0~127COUT1_226\))))
-- \CP|Add0~132\ = CARRY(((!\CP|Add0~127\) # (!\CP|count_sig\(27))))
-- \CP|Add0~132COUT1_228\ = CARRY(((!\CP|Add0~127COUT1_226\) # (!\CP|count_sig\(27))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "3c3f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(27),
	cin => \CP|Add0~122\,
	cin0 => \CP|Add0~127\,
	cin1 => \CP|Add0~127COUT1_226\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~130_combout\,
	cout0 => \CP|Add0~132\,
	cout1 => \CP|Add0~132COUT1_228\);

-- Location: LC_X9_Y6_N6
\CP|Equal0~8\ : maxv_lcell
-- Equation(s):
-- \CP|Equal0~8_combout\ = (!\CP|Add0~120_combout\ & (!\CP|Add0~130_combout\ & (!\CP|Add0~125_combout\ & !\CP|Add0~115_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|Add0~120_combout\,
	datab => \CP|Add0~130_combout\,
	datac => \CP|Add0~125_combout\,
	datad => \CP|Add0~115_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Equal0~8_combout\);

-- Location: LC_X10_Y6_N5
\CP|count_sig[30]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(30) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~145_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & (\CP|count_sig\(30)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ba10",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|state.S1~regout\,
	datac => \CP|count_sig\(30),
	datad => \CP|Add0~145_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(30));

-- Location: LC_X9_Y6_N2
\CP|Add0~135\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~135_combout\ = \CP|count_sig\(28) $ ((((!(!\CP|Add0~122\ & \CP|Add0~132\) # (\CP|Add0~122\ & \CP|Add0~132COUT1_228\)))))
-- \CP|Add0~137\ = CARRY((\CP|count_sig\(28) & ((!\CP|Add0~132\))))
-- \CP|Add0~137COUT1_230\ = CARRY((\CP|count_sig\(28) & ((!\CP|Add0~132COUT1_228\))))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "a50a",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|count_sig\(28),
	cin => \CP|Add0~122\,
	cin0 => \CP|Add0~132\,
	cin1 => \CP|Add0~132COUT1_228\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~135_combout\,
	cout0 => \CP|Add0~137\,
	cout1 => \CP|Add0~137COUT1_230\);

-- Location: LC_X10_Y6_N0
\CP|count_sig[28]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(28) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~135_combout\)))) # (!\CP|state.S5~regout\ & (!\CP|state.S1~regout\ & (\CP|count_sig\(28)))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ba10",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|state.S1~regout\,
	datac => \CP|count_sig\(28),
	datad => \CP|Add0~135_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(28));

-- Location: LC_X9_Y6_N3
\CP|Add0~140\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~140_combout\ = \CP|count_sig\(29) $ (((((!\CP|Add0~122\ & \CP|Add0~137\) # (\CP|Add0~122\ & \CP|Add0~137COUT1_230\)))))
-- \CP|Add0~142\ = CARRY(((!\CP|Add0~137\)) # (!\CP|count_sig\(29)))
-- \CP|Add0~142COUT1_232\ = CARRY(((!\CP|Add0~137COUT1_230\)) # (!\CP|count_sig\(29)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "5a5f",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|count_sig\(29),
	cin => \CP|Add0~122\,
	cin0 => \CP|Add0~137\,
	cin1 => \CP|Add0~137COUT1_230\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~140_combout\,
	cout0 => \CP|Add0~142\,
	cout1 => \CP|Add0~142COUT1_232\);

-- Location: LC_X10_Y6_N6
\CP|count_sig[29]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(29) = DFFEAS((\CP|state.S5~regout\ & (((\CP|Add0~140_combout\)))) # (!\CP|state.S5~regout\ & (\CP|count_sig\(29) & (!\CP|state.S1~regout\))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ae04",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|count_sig\(29),
	datac => \CP|state.S1~regout\,
	datad => \CP|Add0~140_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(29));

-- Location: LC_X9_Y6_N4
\CP|Add0~145\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~145_combout\ = (\CP|count_sig\(30) $ ((!(!\CP|Add0~122\ & \CP|Add0~142\) # (\CP|Add0~122\ & \CP|Add0~142COUT1_232\))))
-- \CP|Add0~147\ = CARRY(((\CP|count_sig\(30) & !\CP|Add0~142COUT1_232\)))

-- pragma translate_off
GENERIC MAP (
	cin0_used => "true",
	cin1_used => "true",
	cin_used => "true",
	lut_mask => "c30c",
	operation_mode => "arithmetic",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|count_sig\(30),
	cin => \CP|Add0~122\,
	cin0 => \CP|Add0~142\,
	cin1 => \CP|Add0~142COUT1_232\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~145_combout\,
	cout => \CP|Add0~147\);

-- Location: LC_X10_Y6_N1
\CP|count_sig[31]\ : maxv_lcell
-- Equation(s):
-- \CP|count_sig\(31) = DFFEAS(((\reset~combout\) # ((!\CP|Add0~150_combout\) # (!\CP|state.S5~regout\))), GLOBAL(\clk~combout\), VCC, , \CP|count_sig~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cfff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \reset~combout\,
	datac => \CP|state.S5~regout\,
	datad => \CP|Add0~150_combout\,
	aclr => GND,
	ena => \CP|count_sig~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|count_sig\(31));

-- Location: LC_X9_Y6_N5
\CP|Add0~150\ : maxv_lcell
-- Equation(s):
-- \CP|Add0~150_combout\ = ((\CP|Add0~147\ $ (!\CP|count_sig\(31))))

-- pragma translate_off
GENERIC MAP (
	cin_used => "true",
	lut_mask => "f00f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "cin",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datad => \CP|count_sig\(31),
	cin => \CP|Add0~147\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Add0~150_combout\);

-- Location: LC_X9_Y6_N9
\CP|Equal0~9\ : maxv_lcell
-- Equation(s):
-- \CP|Equal0~9_combout\ = (!\CP|Add0~145_combout\ & (!\CP|Add0~135_combout\ & (!\CP|Add0~150_combout\ & !\CP|Add0~140_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|Add0~145_combout\,
	datab => \CP|Add0~135_combout\,
	datac => \CP|Add0~150_combout\,
	datad => \CP|Add0~140_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Equal0~9_combout\);

-- Location: LC_X7_Y5_N5
\CP|Equal0~0\ : maxv_lcell
-- Equation(s):
-- \CP|Equal0~0_combout\ = (\CP|Add0~0_combout\ & (\CP|count_sig\(0) & (\CP|Add0~5_combout\ & !\CP|Add0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0080",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|Add0~0_combout\,
	datab => \CP|count_sig\(0),
	datac => \CP|Add0~5_combout\,
	datad => \CP|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Equal0~0_combout\);

-- Location: LC_X7_Y5_N0
\CP|Equal0~1\ : maxv_lcell
-- Equation(s):
-- \CP|Equal0~1_combout\ = (!\CP|Add0~25_combout\ & (!\CP|Add0~30_combout\ & (!\CP|Add0~20_combout\ & !\CP|Add0~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|Add0~25_combout\,
	datab => \CP|Add0~30_combout\,
	datac => \CP|Add0~20_combout\,
	datad => \CP|Add0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Equal0~1_combout\);

-- Location: LC_X7_Y5_N4
\CP|Equal0~2\ : maxv_lcell
-- Equation(s):
-- \CP|Equal0~2_combout\ = (!\CP|Add0~35_combout\ & (!\CP|Add0~40_combout\ & (!\CP|Add0~50_combout\ & !\CP|Add0~45_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|Add0~35_combout\,
	datab => \CP|Add0~40_combout\,
	datac => \CP|Add0~50_combout\,
	datad => \CP|Add0~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Equal0~2_combout\);

-- Location: LC_X7_Y5_N8
\CP|Equal0~3\ : maxv_lcell
-- Equation(s):
-- \CP|Equal0~3_combout\ = (!\CP|Add0~60_combout\ & (!\CP|Add0~55_combout\ & (!\CP|Add0~70_combout\ & !\CP|Add0~65_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|Add0~60_combout\,
	datab => \CP|Add0~55_combout\,
	datac => \CP|Add0~70_combout\,
	datad => \CP|Add0~65_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Equal0~3_combout\);

-- Location: LC_X7_Y5_N9
\CP|Equal0~4\ : maxv_lcell
-- Equation(s):
-- \CP|Equal0~4_combout\ = (\CP|Equal0~0_combout\ & (\CP|Equal0~1_combout\ & (\CP|Equal0~2_combout\ & \CP|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|Equal0~0_combout\,
	datab => \CP|Equal0~1_combout\,
	datac => \CP|Equal0~2_combout\,
	datad => \CP|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Equal0~4_combout\);

-- Location: LC_X8_Y5_N0
\CP|Equal0~5\ : maxv_lcell
-- Equation(s):
-- \CP|Equal0~5_combout\ = (!\CP|Add0~75_combout\ & (!\CP|Add0~90_combout\ & (!\CP|Add0~85_combout\ & !\CP|Add0~80_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|Add0~75_combout\,
	datab => \CP|Add0~90_combout\,
	datac => \CP|Add0~85_combout\,
	datad => \CP|Add0~80_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Equal0~5_combout\);

-- Location: LC_X8_Y5_N1
\CP|Equal0~6\ : maxv_lcell
-- Equation(s):
-- \CP|Equal0~6_combout\ = (((!\CP|Add0~95_combout\ & !\CP|Add0~100_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \CP|Add0~95_combout\,
	datad => \CP|Add0~100_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Equal0~6_combout\);

-- Location: LC_X8_Y5_N2
\CP|Equal0~7\ : maxv_lcell
-- Equation(s):
-- \CP|Equal0~7_combout\ = (!\CP|Add0~110_combout\ & (!\CP|Add0~105_combout\ & (\CP|Equal0~5_combout\ & \CP|Equal0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|Add0~110_combout\,
	datab => \CP|Add0~105_combout\,
	datac => \CP|Equal0~5_combout\,
	datad => \CP|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Equal0~7_combout\);

-- Location: LC_X8_Y5_N3
\CP|Equal0~10\ : maxv_lcell
-- Equation(s):
-- \CP|Equal0~10_combout\ = (\CP|Equal0~8_combout\ & (\CP|Equal0~9_combout\ & (\CP|Equal0~4_combout\ & \CP|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|Equal0~8_combout\,
	datab => \CP|Equal0~9_combout\,
	datac => \CP|Equal0~4_combout\,
	datad => \CP|Equal0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Equal0~10_combout\);

-- Location: LC_X8_Y5_N5
\CP|Selector2~0\ : maxv_lcell
-- Equation(s):
-- \CP|Selector2~0_combout\ = ((\data_in~combout\ & (\CP|state.S5~regout\ & \CP|Equal0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \data_in~combout\,
	datac => \CP|state.S5~regout\,
	datad => \CP|Equal0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Selector2~0_combout\);

-- Location: LC_X8_Y5_N6
\CP|state.S1\ : maxv_lcell
-- Equation(s):
-- \CP|state.S1~regout\ = DFFEAS(((\CP|state.S4~regout\) # ((\CP|Selector2~1_combout\) # (\CP|Selector2~0_combout\))) # (!\CP|state.S0~regout\), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fffd",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S0~regout\,
	datab => \CP|state.S4~regout\,
	datac => \CP|Selector2~1_combout\,
	datad => \CP|Selector2~0_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|state.S1~regout\);

-- Location: LC_X8_Y5_N4
\CP|state.S5\ : maxv_lcell
-- Equation(s):
-- \CP|state.S5~regout\ = DFFEAS((\CP|state.S5~regout\ & (((\CP|state.S1~regout\ & !\data_in~combout\)) # (!\CP|Equal0~10_combout\))) # (!\CP|state.S5~regout\ & (\CP|state.S1~regout\ & (!\data_in~combout\))), GLOBAL(\clk~combout\), VCC, , , , , 
-- \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0cae",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|state.S1~regout\,
	datac => \data_in~combout\,
	datad => \CP|Equal0~10_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|state.S5~regout\);

-- Location: LC_X8_Y5_N9
\CP|state.S2\ : maxv_lcell
-- Equation(s):
-- \CP|state.S2~regout\ = DFFEAS((\CP|Selector3~0_combout\) # ((\CP|state.S5~regout\ & (!\data_in~combout\ & \CP|Equal0~10_combout\))), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "cecc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S5~regout\,
	datab => \CP|Selector3~0_combout\,
	datac => \data_in~combout\,
	datad => \CP|Equal0~10_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|state.S2~regout\);

-- Location: LC_X9_Y4_N8
\CP|process_0~1\ : maxv_lcell
-- Equation(s):
-- \CP|process_0~1_combout\ = (((\CP|process_0~0_combout\ & \DP|tc|CP|tick~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \CP|process_0~0_combout\,
	datad => \DP|tc|CP|tick~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|process_0~1_combout\);

-- Location: LC_X9_Y4_N9
\CP|state.S3\ : maxv_lcell
-- Equation(s):
-- \CP|state.S3~regout\ = DFFEAS((\CP|state.S2~regout\ & ((\DP|tc|DP|Equal2~3_combout\) # ((\CP|state.S3~regout\ & !\CP|process_0~1_combout\)))) # (!\CP|state.S2~regout\ & (\CP|state.S3~regout\ & ((!\CP|process_0~1_combout\)))), GLOBAL(\clk~combout\), VCC, , 
-- , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a0ec",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S2~regout\,
	datab => \CP|state.S3~regout\,
	datac => \DP|tc|DP|Equal2~3_combout\,
	datad => \CP|process_0~1_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|state.S3~regout\);

-- Location: LC_X9_Y4_N7
\CP|Selector4~0\ : maxv_lcell
-- Equation(s):
-- \CP|Selector4~0_combout\ = (((\DP|tc|DP|Equal2~3_combout\ & \CP|state.S2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \DP|tc|DP|Equal2~3_combout\,
	datad => \CP|state.S2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Selector4~0_combout\);

-- Location: LC_X9_Y4_N5
\DP|shift_r|Dout~0\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout~0_combout\ = (\reset~combout\) # ((\CP|Selector4~0_combout\) # ((\CP|state.S3~regout\ & \DP|tc|CP|tick~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fefa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \CP|state.S3~regout\,
	datac => \CP|Selector4~0_combout\,
	datad => \DP|tc|CP|tick~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|shift_r|Dout~0_combout\);

-- Location: LC_X8_Y4_N7
\DP|shift_r|Dout[9]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(9) = DFFEAS((((\data_in~combout\ & !\reset~combout\))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00f0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \data_in~combout\,
	datad => \reset~combout\,
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(9));

-- Location: LC_X9_Y4_N0
\DP|shift_r|Dout[8]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(8) = DFFEAS((((!\reset~combout\ & \DP|shift_r|Dout\(9)))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \reset~combout\,
	datad => \DP|shift_r|Dout\(9),
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(8));

-- Location: LC_X10_Y5_N5
\DP|dout|Dout~1\ : maxv_lcell
-- Equation(s):
-- \DP|dout|Dout~1_combout\ = (((\reset~combout\) # (\CP|state.S4~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \reset~combout\,
	datad => \CP|state.S4~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|dout|Dout~1_combout\);

-- Location: LC_X10_Y4_N6
\DP|dout|Dout[7]\ : maxv_lcell
-- Equation(s):
-- \DP|dout|Dout~8\ = (((!\reset~combout\ & \DP|shift_r|Dout\(8))))
-- \DP|dout|Dout\(7) = DFFEAS(\DP|dout|Dout~8\, GLOBAL(\clk~combout\), VCC, , \DP|dout|Dout~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \reset~combout\,
	datad => \DP|shift_r|Dout\(8),
	aclr => GND,
	ena => \DP|dout|Dout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|dout|Dout~8\,
	regout => \DP|dout|Dout\(7));

-- Location: LC_X10_Y4_N5
\DP|shift_r|Dout[7]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(7) = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, \DP|dout|Dout~8\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \DP|dout|Dout~8\,
	aclr => GND,
	sload => VCC,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(7));

-- Location: LC_X10_Y5_N8
\DP|dout|Dout[6]\ : maxv_lcell
-- Equation(s):
-- \DP|dout|Dout~7\ = (((!\reset~combout\ & \DP|shift_r|Dout\(7))))
-- \DP|dout|Dout\(6) = DFFEAS(\DP|dout|Dout~7\, GLOBAL(\clk~combout\), VCC, , \DP|dout|Dout~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \reset~combout\,
	datad => \DP|shift_r|Dout\(7),
	aclr => GND,
	ena => \DP|dout|Dout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|dout|Dout~7\,
	regout => \DP|dout|Dout\(6));

-- Location: LC_X10_Y5_N2
\DP|shift_r|Dout[6]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(6) = DFFEAS((((\DP|dout|Dout~7\))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datad => \DP|dout|Dout~7\,
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(6));

-- Location: LC_X10_Y5_N4
\DP|dout|Dout[5]\ : maxv_lcell
-- Equation(s):
-- \DP|dout|Dout~6\ = (((!\reset~combout\ & \DP|shift_r|Dout\(6))))
-- \DP|dout|Dout\(5) = DFFEAS(\DP|dout|Dout~6\, GLOBAL(\clk~combout\), VCC, , \DP|dout|Dout~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \reset~combout\,
	datad => \DP|shift_r|Dout\(6),
	aclr => GND,
	ena => \DP|dout|Dout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|dout|Dout~6\,
	regout => \DP|dout|Dout\(5));

-- Location: LC_X10_Y5_N9
\DP|shift_r|Dout[5]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(5) = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, \DP|dout|Dout~6\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \DP|dout|Dout~6\,
	aclr => GND,
	sload => VCC,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(5));

-- Location: LC_X10_Y5_N6
\DP|dout|Dout[4]\ : maxv_lcell
-- Equation(s):
-- \DP|dout|Dout~5\ = (((!\reset~combout\ & \DP|shift_r|Dout\(5))))
-- \DP|dout|Dout\(4) = DFFEAS(\DP|dout|Dout~5\, GLOBAL(\clk~combout\), VCC, , \DP|dout|Dout~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \reset~combout\,
	datad => \DP|shift_r|Dout\(5),
	aclr => GND,
	ena => \DP|dout|Dout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|dout|Dout~5\,
	regout => \DP|dout|Dout\(4));

-- Location: LC_X10_Y4_N3
\DP|shift_r|Dout[4]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(4) = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, \DP|dout|Dout~5\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \DP|dout|Dout~5\,
	aclr => GND,
	sload => VCC,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(4));

-- Location: LC_X10_Y4_N4
\DP|dout|Dout[3]\ : maxv_lcell
-- Equation(s):
-- \DP|dout|Dout~4\ = (((!\reset~combout\ & \DP|shift_r|Dout\(4))))
-- \DP|dout|Dout\(3) = DFFEAS(\DP|dout|Dout~4\, GLOBAL(\clk~combout\), VCC, , \DP|dout|Dout~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \reset~combout\,
	datad => \DP|shift_r|Dout\(4),
	aclr => GND,
	ena => \DP|dout|Dout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|dout|Dout~4\,
	regout => \DP|dout|Dout\(3));

-- Location: LC_X10_Y4_N1
\DP|shift_r|Dout[3]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(3) = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, \DP|dout|Dout~4\, , , VCC)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \DP|dout|Dout~4\,
	aclr => GND,
	sload => VCC,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(3));

-- Location: LC_X10_Y4_N9
\DP|dout|Dout[2]\ : maxv_lcell
-- Equation(s):
-- \DP|dout|Dout~3\ = (((!\reset~combout\ & \DP|shift_r|Dout\(3))))
-- \DP|dout|Dout\(2) = DFFEAS(\DP|dout|Dout~3\, GLOBAL(\clk~combout\), VCC, , \DP|dout|Dout~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datac => \reset~combout\,
	datad => \DP|shift_r|Dout\(3),
	aclr => GND,
	ena => \DP|dout|Dout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|dout|Dout~3\,
	regout => \DP|dout|Dout\(2));

-- Location: LC_X10_Y4_N7
\DP|shift_r|Dout[2]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(2) = DFFEAS((((\DP|dout|Dout~3\))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datad => \DP|dout|Dout~3\,
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(2));

-- Location: LC_X10_Y4_N8
\DP|dout|Dout[1]\ : maxv_lcell
-- Equation(s):
-- \DP|dout|Dout~2\ = ((\DP|shift_r|Dout\(2) & (!\reset~combout\)))
-- \DP|dout|Dout\(1) = DFFEAS(\DP|dout|Dout~2\, GLOBAL(\clk~combout\), VCC, , \DP|dout|Dout~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c0c",
	operation_mode => "normal",
	output_mode => "reg_and_comb",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \DP|shift_r|Dout\(2),
	datac => \reset~combout\,
	aclr => GND,
	ena => \DP|dout|Dout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|dout|Dout~2\,
	regout => \DP|dout|Dout\(1));

-- Location: LC_X10_Y4_N0
\DP|shift_r|Dout[1]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(1) = DFFEAS((((\DP|dout|Dout~2\))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datad => \DP|dout|Dout~2\,
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(1));

-- Location: LC_X10_Y4_N2
\DP|dout|Dout[0]\ : maxv_lcell
-- Equation(s):
-- \DP|dout|Dout\(0) = DFFEAS(((\DP|shift_r|Dout\(1) & (!\reset~combout\))), GLOBAL(\clk~combout\), VCC, , \DP|dout|Dout~1_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c0c",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \DP|shift_r|Dout\(1),
	datac => \reset~combout\,
	aclr => GND,
	ena => \DP|dout|Dout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|dout|Dout\(0));

-- Location: LC_X10_Y5_N7
\CP|data_ready~0\ : maxv_lcell
-- Equation(s):
-- \CP|data_ready~0_combout\ = (((!\reset~combout\ & \CP|state.S4~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datac => \reset~combout\,
	datad => \CP|state.S4~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|data_ready~0_combout\);

-- Location: PIN_58,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\data_out[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|dout|Dout\(0),
	oe => VCC,
	padio => ww_data_out(0));

-- Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\data_out[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|dout|Dout\(1),
	oe => VCC,
	padio => ww_data_out(1));

-- Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\data_out[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|dout|Dout\(2),
	oe => VCC,
	padio => ww_data_out(2));

-- Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\data_out[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|dout|Dout\(3),
	oe => VCC,
	padio => ww_data_out(3));

-- Location: PIN_52,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\data_out[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|dout|Dout\(4),
	oe => VCC,
	padio => ww_data_out(4));

-- Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\data_out[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|dout|Dout\(5),
	oe => VCC,
	padio => ww_data_out(5));

-- Location: PIN_50,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\data_out[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|dout|Dout\(6),
	oe => VCC,
	padio => ww_data_out(6));

-- Location: PIN_49,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\data_out[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|dout|Dout\(7),
	oe => VCC,
	padio => ww_data_out(7));

-- Location: PIN_85,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(1),
	oe => VCC,
	padio => ww_debug(0));

-- Location: PIN_62,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(2),
	oe => VCC,
	padio => ww_debug(1));

-- Location: PIN_84,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(3),
	oe => VCC,
	padio => ww_debug(2));

-- Location: PIN_81,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(4),
	oe => VCC,
	padio => ww_debug(3));

-- Location: PIN_121,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(5),
	oe => VCC,
	padio => ww_debug(4));

-- Location: PIN_88,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(6),
	oe => VCC,
	padio => ww_debug(5));

-- Location: PIN_43,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(7),
	oe => VCC,
	padio => ww_debug(6));

-- Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(8),
	oe => VCC,
	padio => ww_debug(7));

-- Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\data_ready~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \CP|data_ready~0_combout\,
	oe => VCC,
	padio => ww_data_ready);
END structure;


