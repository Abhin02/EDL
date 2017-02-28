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

-- DATE "02/28/2017 23:30:40"

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
	debug : OUT std_logic_vector(7 DOWNTO 0)
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
-- debug[0]	=>  Location: PIN_60,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[1]	=>  Location: PIN_132,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[2]	=>  Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[3]	=>  Location: PIN_134,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[4]	=>  Location: PIN_61,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[5]	=>  Location: PIN_31,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[6]	=>  Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- debug[7]	=>  Location: PIN_21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA


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
SIGNAL \clk~combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \data_in~combout\ : std_logic;
SIGNAL \DP|incr|Add0~1_combout\ : std_logic;
SIGNAL \DP|incr|Add0~0_combout\ : std_logic;
SIGNAL \CP|process_0~0_combout\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[0]~5\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[1]~7\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[1]~7COUT1_37\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[2]~1\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[2]~1COUT1_39\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[3]~3\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[3]~3COUT1_41\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[4]~15\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[4]~15COUT1_43\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[5]~9\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[6]~19\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[6]~19COUT1_45\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[7]~11\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[7]~11COUT1_47\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[8]~13\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[8]~13COUT1_49\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[9]~17\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[9]~17COUT1_51\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[10]~25\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[11]~21\ : std_logic;
SIGNAL \DP|tc|DP|count_reg|Dout[11]~21COUT1_53\ : std_logic;
SIGNAL \DP|tc|DP|Equal0~0_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal0~3_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal0~1_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal0~4_combout\ : std_logic;
SIGNAL \DP|tc|CP|state~7_combout\ : std_logic;
SIGNAL \DP|tc|CP|state.S1~regout\ : std_logic;
SIGNAL \DP|tc|CP|state.S2~regout\ : std_logic;
SIGNAL \DP|tc|CP|tick~1_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal0~2_combout\ : std_logic;
SIGNAL \DP|tc|CP|increment~2_combout\ : std_logic;
SIGNAL \DP|tc|CP|state.S3~regout\ : std_logic;
SIGNAL \DP|tc|CP|tick~0_combout\ : std_logic;
SIGNAL \DP|tc|CP|tick~2_combout\ : std_logic;
SIGNAL \CP|state.S4~regout\ : std_logic;
SIGNAL \CP|state.S0~regout\ : std_logic;
SIGNAL \CP|state.S1~regout\ : std_logic;
SIGNAL \CP|Selector1~1_combout\ : std_logic;
SIGNAL \DP|tc|CP|state.S4~regout\ : std_logic;
SIGNAL \CP|Selector1~2_combout\ : std_logic;
SIGNAL \DP|tc|CP|state.S0~regout\ : std_logic;
SIGNAL \DP|tc|CP|increment~4_combout\ : std_logic;
SIGNAL \DP|tc|CP|increment~3_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal1~0_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal2~0_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal2~1_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal2~2_combout\ : std_logic;
SIGNAL \DP|tc|DP|Equal2~3_combout\ : std_logic;
SIGNAL \CP|state.S2~regout\ : std_logic;
SIGNAL \CP|process_0~1_combout\ : std_logic;
SIGNAL \CP|state.S3~regout\ : std_logic;
SIGNAL \CP|Selector1~0_combout\ : std_logic;
SIGNAL \DP|shift_r|Dout~0_combout\ : std_logic;
SIGNAL \DP|dout|Dout~1_combout\ : std_logic;
SIGNAL \DP|dout|Dout~8\ : std_logic;
SIGNAL \DP|dout|Dout~7\ : std_logic;
SIGNAL \DP|dout|Dout~6\ : std_logic;
SIGNAL \DP|dout|Dout~5\ : std_logic;
SIGNAL \DP|dout|Dout~4\ : std_logic;
SIGNAL \DP|dout|Dout~3\ : std_logic;
SIGNAL \DP|dout|Dout~2\ : std_logic;
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

-- Location: LC_X7_Y5_N2
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

-- Location: LC_X7_Y6_N8
\DP|count1|Dout[1]\ : maxv_lcell
-- Equation(s):
-- \DP|count1|Dout\(1) = DFFEAS((!\reset~combout\ & (!\CP|process_0~0_combout\ & (\DP|count1|Dout\(0) $ (\DP|count1|Dout\(1))))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

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
	dataa => \reset~combout\,
	datab => \CP|process_0~0_combout\,
	datac => \DP|count1|Dout\(0),
	datad => \DP|count1|Dout\(1),
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|count1|Dout\(1));

-- Location: LC_X7_Y6_N4
\DP|incr|Add0~1\ : maxv_lcell
-- Equation(s):
-- \DP|incr|Add0~1_combout\ = (((\DP|count1|Dout\(0) & \DP|count1|Dout\(1))))

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
	datac => \DP|count1|Dout\(0),
	datad => \DP|count1|Dout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|incr|Add0~1_combout\);

-- Location: LC_X7_Y6_N2
\DP|count1|Dout[2]\ : maxv_lcell
-- Equation(s):
-- \DP|count1|Dout\(2) = DFFEAS((!\reset~combout\ & (!\CP|process_0~0_combout\ & (\DP|incr|Add0~1_combout\ $ (\DP|count1|Dout\(2))))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0006",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|incr|Add0~1_combout\,
	datab => \DP|count1|Dout\(2),
	datac => \reset~combout\,
	datad => \CP|process_0~0_combout\,
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|count1|Dout\(2));

-- Location: LC_X7_Y6_N3
\DP|incr|Add0~0\ : maxv_lcell
-- Equation(s):
-- \DP|incr|Add0~0_combout\ = ((\DP|count1|Dout\(2) & (\DP|count1|Dout\(0) & \DP|count1|Dout\(1))))

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
	datab => \DP|count1|Dout\(2),
	datac => \DP|count1|Dout\(0),
	datad => \DP|count1|Dout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|incr|Add0~0_combout\);

-- Location: LC_X7_Y5_N5
\DP|count1|Dout[3]\ : maxv_lcell
-- Equation(s):
-- \DP|count1|Dout\(3) = DFFEAS((!\CP|process_0~0_combout\ & (!\reset~combout\ & (\DP|incr|Add0~0_combout\ $ (\DP|count1|Dout\(3))))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0012",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|incr|Add0~0_combout\,
	datab => \CP|process_0~0_combout\,
	datac => \DP|count1|Dout\(3),
	datad => \reset~combout\,
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|count1|Dout\(3));

-- Location: LC_X7_Y6_N6
\CP|process_0~0\ : maxv_lcell
-- Equation(s):
-- \CP|process_0~0_combout\ = (!\DP|count1|Dout\(1) & (!\DP|count1|Dout\(2) & (\DP|count1|Dout\(0) & \DP|count1|Dout\(3))))

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
	dataa => \DP|count1|Dout\(1),
	datab => \DP|count1|Dout\(2),
	datac => \DP|count1|Dout\(0),
	datad => \DP|count1|Dout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|process_0~0_combout\);

-- Location: LC_X8_Y5_N4
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

-- Location: LC_X8_Y5_N5
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

-- Location: LC_X8_Y5_N6
\DP|tc|DP|count_reg|Dout[2]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(2) = DFFEAS((\DP|tc|DP|count_reg|Dout\(2) $ ((!(!\DP|tc|DP|count_reg|Dout[0]~5\ & \DP|tc|DP|count_reg|Dout[1]~7\) # (\DP|tc|DP|count_reg|Dout[0]~5\ & \DP|tc|DP|count_reg|Dout[1]~7COUT1_37\)))), GLOBAL(\clk~combout\), VCC, , , , , 
-- \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[2]~1\ = CARRY(((\DP|tc|DP|count_reg|Dout\(2) & !\DP|tc|DP|count_reg|Dout[1]~7\)))
-- \DP|tc|DP|count_reg|Dout[2]~1COUT1_39\ = CARRY(((\DP|tc|DP|count_reg|Dout\(2) & !\DP|tc|DP|count_reg|Dout[1]~7COUT1_37\)))

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
	datab => \DP|tc|DP|count_reg|Dout\(2),
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

-- Location: LC_X8_Y5_N7
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

-- Location: LC_X8_Y5_N8
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

-- Location: LC_X8_Y5_N9
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

-- Location: LC_X9_Y5_N0
\DP|tc|DP|count_reg|Dout[6]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(6) = DFFEAS((\DP|tc|DP|count_reg|Dout\(6) $ ((!\DP|tc|DP|count_reg|Dout[5]~9\))), GLOBAL(\clk~combout\), VCC, , , , , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[6]~19\ = CARRY(((\DP|tc|DP|count_reg|Dout\(6) & !\DP|tc|DP|count_reg|Dout[5]~9\)))
-- \DP|tc|DP|count_reg|Dout[6]~19COUT1_45\ = CARRY(((\DP|tc|DP|count_reg|Dout\(6) & !\DP|tc|DP|count_reg|Dout[5]~9\)))

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
	cout0 => \DP|tc|DP|count_reg|Dout[6]~19\,
	cout1 => \DP|tc|DP|count_reg|Dout[6]~19COUT1_45\);

-- Location: LC_X9_Y5_N1
\DP|tc|DP|count_reg|Dout[7]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(7) = DFFEAS((\DP|tc|DP|count_reg|Dout\(7) $ (((!\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[6]~19\) # (\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[6]~19COUT1_45\)))), GLOBAL(\clk~combout\), VCC, , , , 
-- , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[7]~11\ = CARRY(((!\DP|tc|DP|count_reg|Dout[6]~19\) # (!\DP|tc|DP|count_reg|Dout\(7))))
-- \DP|tc|DP|count_reg|Dout[7]~11COUT1_47\ = CARRY(((!\DP|tc|DP|count_reg|Dout[6]~19COUT1_45\) # (!\DP|tc|DP|count_reg|Dout\(7))))

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
	cin0 => \DP|tc|DP|count_reg|Dout[6]~19\,
	cin1 => \DP|tc|DP|count_reg|Dout[6]~19COUT1_45\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(7),
	cout0 => \DP|tc|DP|count_reg|Dout[7]~11\,
	cout1 => \DP|tc|DP|count_reg|Dout[7]~11COUT1_47\);

-- Location: LC_X9_Y5_N2
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

-- Location: LC_X9_Y5_N3
\DP|tc|DP|count_reg|Dout[9]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(9) = DFFEAS(\DP|tc|DP|count_reg|Dout\(9) $ (((((!\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[8]~13\) # (\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[8]~13COUT1_49\))))), GLOBAL(\clk~combout\), VCC, , , 
-- , , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[9]~17\ = CARRY(((!\DP|tc|DP|count_reg|Dout[8]~13\)) # (!\DP|tc|DP|count_reg|Dout\(9)))
-- \DP|tc|DP|count_reg|Dout[9]~17COUT1_51\ = CARRY(((!\DP|tc|DP|count_reg|Dout[8]~13COUT1_49\)) # (!\DP|tc|DP|count_reg|Dout\(9)))

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
	cout0 => \DP|tc|DP|count_reg|Dout[9]~17\,
	cout1 => \DP|tc|DP|count_reg|Dout[9]~17COUT1_51\);

-- Location: LC_X9_Y5_N4
\DP|tc|DP|count_reg|Dout[10]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(10) = DFFEAS(\DP|tc|DP|count_reg|Dout\(10) $ ((((!(!\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[9]~17\) # (\DP|tc|DP|count_reg|Dout[5]~9\ & \DP|tc|DP|count_reg|Dout[9]~17COUT1_51\))))), GLOBAL(\clk~combout\), VCC, , 
-- , , , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[10]~25\ = CARRY((\DP|tc|DP|count_reg|Dout\(10) & ((!\DP|tc|DP|count_reg|Dout[9]~17COUT1_51\))))

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
	cin0 => \DP|tc|DP|count_reg|Dout[9]~17\,
	cin1 => \DP|tc|DP|count_reg|Dout[9]~17COUT1_51\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(10),
	cout => \DP|tc|DP|count_reg|Dout[10]~25\);

-- Location: LC_X9_Y5_N5
\DP|tc|DP|count_reg|Dout[11]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(11) = DFFEAS(\DP|tc|DP|count_reg|Dout\(11) $ ((((\DP|tc|DP|count_reg|Dout[10]~25\)))), GLOBAL(\clk~combout\), VCC, , , , , \DP|tc|CP|increment~3_combout\, )
-- \DP|tc|DP|count_reg|Dout[11]~21\ = CARRY(((!\DP|tc|DP|count_reg|Dout[10]~25\)) # (!\DP|tc|DP|count_reg|Dout\(11)))
-- \DP|tc|DP|count_reg|Dout[11]~21COUT1_53\ = CARRY(((!\DP|tc|DP|count_reg|Dout[10]~25\)) # (!\DP|tc|DP|count_reg|Dout\(11)))

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
	cout0 => \DP|tc|DP|count_reg|Dout[11]~21\,
	cout1 => \DP|tc|DP|count_reg|Dout[11]~21COUT1_53\);

-- Location: LC_X9_Y5_N6
\DP|tc|DP|count_reg|Dout[12]\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|count_reg|Dout\(12) = DFFEAS(\DP|tc|DP|count_reg|Dout\(12) $ ((((!(!\DP|tc|DP|count_reg|Dout[10]~25\ & \DP|tc|DP|count_reg|Dout[11]~21\) # (\DP|tc|DP|count_reg|Dout[10]~25\ & \DP|tc|DP|count_reg|Dout[11]~21COUT1_53\))))), GLOBAL(\clk~combout\), 
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
	cin0 => \DP|tc|DP|count_reg|Dout[11]~21\,
	cin1 => \DP|tc|DP|count_reg|Dout[11]~21COUT1_53\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|DP|count_reg|Dout\(12));

-- Location: LC_X8_Y5_N2
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

-- Location: LC_X7_Y5_N6
\DP|tc|DP|Equal0~3\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal0~3_combout\ = (!\DP|tc|DP|count_reg|Dout\(3) & (\DP|tc|DP|count_reg|Dout\(0) & (\DP|tc|DP|count_reg|Dout\(2) & \DP|tc|DP|count_reg|Dout\(1))))

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
	datab => \DP|tc|DP|count_reg|Dout\(0),
	datac => \DP|tc|DP|count_reg|Dout\(2),
	datad => \DP|tc|DP|count_reg|Dout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal0~3_combout\);

-- Location: LC_X9_Y5_N9
\DP|tc|DP|Equal0~1\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal0~1_combout\ = (!\DP|tc|DP|count_reg|Dout\(11) & (\DP|tc|DP|count_reg|Dout\(6) & (\DP|tc|DP|count_reg|Dout\(10) & !\DP|tc|DP|count_reg|Dout\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0040",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|DP|count_reg|Dout\(11),
	datab => \DP|tc|DP|count_reg|Dout\(6),
	datac => \DP|tc|DP|count_reg|Dout\(10),
	datad => \DP|tc|DP|count_reg|Dout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal0~1_combout\);

-- Location: LC_X7_Y5_N4
\DP|tc|DP|Equal0~4\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal0~4_combout\ = (\DP|tc|DP|count_reg|Dout\(12) & (\DP|tc|DP|Equal0~0_combout\ & (\DP|tc|DP|Equal0~3_combout\ & \DP|tc|DP|Equal0~1_combout\)))

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
	dataa => \DP|tc|DP|count_reg|Dout\(12),
	datab => \DP|tc|DP|Equal0~0_combout\,
	datac => \DP|tc|DP|Equal0~3_combout\,
	datad => \DP|tc|DP|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal0~4_combout\);

-- Location: LC_X6_Y5_N2
\DP|tc|CP|state~7\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|state~7_combout\ = ((!\reset~combout\ & (\CP|Selector1~0_combout\ & !\CP|Selector1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0030",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \reset~combout\,
	datac => \CP|Selector1~0_combout\,
	datad => \CP|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|state~7_combout\);

-- Location: LC_X6_Y5_N4
\DP|tc|CP|state.S1\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|state.S1~regout\ = DFFEAS((\DP|tc|CP|state~7_combout\ & (((!\DP|tc|DP|Equal0~4_combout\ & \DP|tc|CP|state.S1~regout\)) # (!\DP|tc|CP|state.S0~regout\))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "7300",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|DP|Equal0~4_combout\,
	datab => \DP|tc|CP|state.S0~regout\,
	datac => \DP|tc|CP|state.S1~regout\,
	datad => \DP|tc|CP|state~7_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|CP|state.S1~regout\);

-- Location: LC_X6_Y5_N1
\DP|tc|CP|state.S2\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|state.S2~regout\ = DFFEAS((\DP|tc|CP|state~7_combout\ & ((\DP|tc|DP|Equal0~4_combout\ & ((\DP|tc|CP|state.S1~regout\))) # (!\DP|tc|DP|Equal0~4_combout\ & (\DP|tc|CP|state.S2~regout\)))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "e400",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|DP|Equal0~4_combout\,
	datab => \DP|tc|CP|state.S2~regout\,
	datac => \DP|tc|CP|state.S1~regout\,
	datad => \DP|tc|CP|state~7_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|CP|state.S2~regout\);

-- Location: LC_X6_Y5_N5
\DP|tc|CP|tick~1\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|tick~1_combout\ = (((\DP|tc|CP|state.S1~regout\) # (\DP|tc|CP|state.S2~regout\)))

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
	datac => \DP|tc|CP|state.S1~regout\,
	datad => \DP|tc|CP|state.S2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|tick~1_combout\);

-- Location: LC_X7_Y5_N1
\DP|tc|DP|Equal0~2\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal0~2_combout\ = ((\DP|tc|DP|count_reg|Dout\(12) & (\DP|tc|DP|Equal0~0_combout\ & \DP|tc|DP|Equal0~1_combout\)))

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
	datab => \DP|tc|DP|count_reg|Dout\(12),
	datac => \DP|tc|DP|Equal0~0_combout\,
	datad => \DP|tc|DP|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal0~2_combout\);

-- Location: LC_X6_Y5_N7
\DP|tc|CP|increment~2\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|increment~2_combout\ = (\DP|tc|CP|state.S3~regout\ & ((\DP|tc|DP|count_reg|Dout\(2)) # ((!\DP|tc|DP|Equal0~2_combout\) # (!\DP|tc|DP|Equal1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8aaa",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|CP|state.S3~regout\,
	datab => \DP|tc|DP|count_reg|Dout\(2),
	datac => \DP|tc|DP|Equal1~0_combout\,
	datad => \DP|tc|DP|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|increment~2_combout\);

-- Location: LC_X6_Y5_N3
\DP|tc|CP|state.S3\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|state.S3~regout\ = DFFEAS((\DP|tc|CP|state~7_combout\ & ((\DP|tc|CP|increment~2_combout\) # ((\DP|tc|DP|Equal0~4_combout\ & \DP|tc|CP|state.S2~regout\)))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "f800",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|DP|Equal0~4_combout\,
	datab => \DP|tc|CP|state.S2~regout\,
	datac => \DP|tc|CP|increment~2_combout\,
	datad => \DP|tc|CP|state~7_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|CP|state.S3~regout\);

-- Location: LC_X7_Y5_N7
\DP|tc|CP|tick~0\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|tick~0_combout\ = (!\DP|tc|DP|count_reg|Dout\(2) & (\DP|tc|CP|state.S3~regout\ & (\DP|tc|DP|Equal1~0_combout\ & \DP|tc|DP|Equal0~2_combout\)))

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
	dataa => \DP|tc|DP|count_reg|Dout\(2),
	datab => \DP|tc|CP|state.S3~regout\,
	datac => \DP|tc|DP|Equal1~0_combout\,
	datad => \DP|tc|DP|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|tick~0_combout\);

-- Location: LC_X7_Y5_N8
\DP|tc|CP|tick~2\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|tick~2_combout\ = (!\reset~combout\ & ((\DP|tc|CP|tick~0_combout\) # ((\DP|tc|CP|tick~1_combout\ & \DP|tc|DP|Equal0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3320",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DP|tc|CP|tick~1_combout\,
	datab => \reset~combout\,
	datac => \DP|tc|DP|Equal0~4_combout\,
	datad => \DP|tc|CP|tick~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|tick~2_combout\);

-- Location: LC_X6_Y4_N3
\CP|state.S4\ : maxv_lcell
-- Equation(s):
-- \CP|state.S4~regout\ = DFFEAS((\CP|state.S3~regout\ & (\CP|process_0~0_combout\ & ((\DP|tc|CP|tick~2_combout\)))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "8800",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S3~regout\,
	datab => \CP|process_0~0_combout\,
	datad => \DP|tc|CP|tick~2_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|state.S4~regout\);

-- Location: LC_X6_Y4_N9
\CP|state.S0\ : maxv_lcell
-- Equation(s):
-- \CP|state.S0~regout\ = DFFEAS((((!\reset~combout\))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datad => \reset~combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|state.S0~regout\);

-- Location: LC_X6_Y4_N1
\CP|state.S1\ : maxv_lcell
-- Equation(s):
-- \CP|state.S1~regout\ = DFFEAS((\CP|state.S4~regout\) # (((\data_in~combout\ & \CP|state.S1~regout\)) # (!\CP|state.S0~regout\)), GLOBAL(\clk~combout\), VCC, , , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "fbbb",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S4~regout\,
	datab => \CP|state.S0~regout\,
	datac => \data_in~combout\,
	datad => \CP|state.S1~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|state.S1~regout\);

-- Location: LC_X6_Y4_N2
\CP|Selector1~1\ : maxv_lcell
-- Equation(s):
-- \CP|Selector1~1_combout\ = ((\CP|state.S4~regout\) # ((\CP|state.S1~regout\ & \data_in~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ffc0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \CP|state.S1~regout\,
	datac => \data_in~combout\,
	datad => \CP|state.S4~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Selector1~1_combout\);

-- Location: LC_X6_Y4_N8
\DP|tc|CP|state.S4\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|state.S4~regout\ = DFFEAS(((!\reset~combout\ & ((\CP|Selector1~1_combout\) # (!\CP|Selector1~0_combout\)))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0c0f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	datab => \CP|Selector1~1_combout\,
	datac => \reset~combout\,
	datad => \CP|Selector1~0_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|CP|state.S4~regout\);

-- Location: LC_X6_Y4_N6
\CP|Selector1~2\ : maxv_lcell
-- Equation(s):
-- \CP|Selector1~2_combout\ = (\CP|state.S4~regout\) # (((\CP|state.S1~regout\ & \data_in~combout\)) # (!\CP|Selector1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "eaff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|state.S4~regout\,
	datab => \CP|state.S1~regout\,
	datac => \data_in~combout\,
	datad => \CP|Selector1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Selector1~2_combout\);

-- Location: LC_X6_Y4_N7
\DP|tc|CP|state.S0\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|state.S0~regout\ = DFFEAS((!\reset~combout\ & ((\CP|Selector1~2_combout\) # ((!\DP|tc|CP|state.S4~regout\ & !\DP|tc|CP|tick~0_combout\)))), GLOBAL(\clk~combout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3301",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|CP|state.S4~regout\,
	datab => \reset~combout\,
	datac => \DP|tc|CP|tick~0_combout\,
	datad => \CP|Selector1~2_combout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|tc|CP|state.S0~regout\);

-- Location: LC_X6_Y5_N6
\DP|tc|CP|increment~4\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|increment~4_combout\ = ((!\DP|tc|DP|Equal0~4_combout\ & ((\DP|tc|CP|state.S2~regout\) # (\DP|tc|CP|state.S1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00fc",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \DP|tc|CP|state.S2~regout\,
	datac => \DP|tc|CP|state.S1~regout\,
	datad => \DP|tc|DP|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|increment~4_combout\);

-- Location: LC_X6_Y5_N8
\DP|tc|CP|increment~3\ : maxv_lcell
-- Equation(s):
-- \DP|tc|CP|increment~3_combout\ = (\reset~combout\) # ((\DP|tc|CP|state.S0~regout\ & (!\DP|tc|CP|increment~4_combout\ & !\DP|tc|CP|increment~2_combout\)))

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
	datac => \DP|tc|CP|increment~4_combout\,
	datad => \DP|tc|CP|increment~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|CP|increment~3_combout\);

-- Location: LC_X8_Y5_N3
\DP|tc|DP|Equal1~0\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal1~0_combout\ = ((\DP|tc|DP|count_reg|Dout\(3) & (!\DP|tc|DP|count_reg|Dout\(0) & !\DP|tc|DP|count_reg|Dout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "000c",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \DP|tc|DP|count_reg|Dout\(3),
	datac => \DP|tc|DP|count_reg|Dout\(0),
	datad => \DP|tc|DP|count_reg|Dout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal1~0_combout\);

-- Location: LC_X8_Y5_N1
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

-- Location: LC_X9_Y5_N7
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

-- Location: LC_X9_Y5_N8
\DP|tc|DP|Equal2~2\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal2~2_combout\ = (\DP|tc|DP|count_reg|Dout\(11) & (!\DP|tc|DP|count_reg|Dout\(12) & (!\DP|tc|DP|count_reg|Dout\(10) & \DP|tc|DP|Equal2~1_combout\)))

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
	dataa => \DP|tc|DP|count_reg|Dout\(11),
	datab => \DP|tc|DP|count_reg|Dout\(12),
	datac => \DP|tc|DP|count_reg|Dout\(10),
	datad => \DP|tc|DP|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal2~2_combout\);

-- Location: LC_X8_Y5_N0
\DP|tc|DP|Equal2~3\ : maxv_lcell
-- Equation(s):
-- \DP|tc|DP|Equal2~3_combout\ = (\DP|tc|DP|Equal1~0_combout\ & (\DP|tc|DP|count_reg|Dout\(2) & (\DP|tc|DP|Equal2~0_combout\ & \DP|tc|DP|Equal2~2_combout\)))

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
	dataa => \DP|tc|DP|Equal1~0_combout\,
	datab => \DP|tc|DP|count_reg|Dout\(2),
	datac => \DP|tc|DP|Equal2~0_combout\,
	datad => \DP|tc|DP|Equal2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|tc|DP|Equal2~3_combout\);

-- Location: LC_X6_Y4_N0
\CP|state.S2\ : maxv_lcell
-- Equation(s):
-- \CP|state.S2~regout\ = DFFEAS((\DP|tc|DP|Equal2~3_combout\ & (((!\data_in~combout\ & \CP|state.S1~regout\)))) # (!\DP|tc|DP|Equal2~3_combout\ & ((\CP|state.S2~regout\) # ((!\data_in~combout\ & \CP|state.S1~regout\)))), GLOBAL(\clk~combout\), VCC, , , , , 
-- \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "4f44",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \DP|tc|DP|Equal2~3_combout\,
	datab => \CP|state.S2~regout\,
	datac => \data_in~combout\,
	datad => \CP|state.S1~regout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|state.S2~regout\);

-- Location: LC_X6_Y4_N4
\CP|process_0~1\ : maxv_lcell
-- Equation(s):
-- \CP|process_0~1_combout\ = ((\CP|process_0~0_combout\ & ((\DP|tc|CP|tick~2_combout\))))

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
	datab => \CP|process_0~0_combout\,
	datad => \DP|tc|CP|tick~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|process_0~1_combout\);

-- Location: LC_X6_Y4_N5
\CP|state.S3\ : maxv_lcell
-- Equation(s):
-- \CP|state.S3~regout\ = DFFEAS((\CP|state.S3~regout\ & (((\CP|state.S2~regout\ & \DP|tc|DP|Equal2~3_combout\)) # (!\CP|process_0~1_combout\))) # (!\CP|state.S3~regout\ & (\CP|state.S2~regout\ & (\DP|tc|DP|Equal2~3_combout\))), GLOBAL(\clk~combout\), VCC, , 
-- , , , \reset~combout\, )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "c0ea",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "on")
-- pragma translate_on
PORT MAP (
	clk => \clk~combout\,
	dataa => \CP|state.S3~regout\,
	datab => \CP|state.S2~regout\,
	datac => \DP|tc|DP|Equal2~3_combout\,
	datad => \CP|process_0~1_combout\,
	aclr => GND,
	sclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CP|state.S3~regout\);

-- Location: LC_X7_Y5_N9
\CP|Selector1~0\ : maxv_lcell
-- Equation(s):
-- \CP|Selector1~0_combout\ = (\CP|state.S3~regout\ & (!\DP|tc|CP|tick~2_combout\ & ((!\DP|tc|DP|Equal2~3_combout\) # (!\CP|state.S2~regout\)))) # (!\CP|state.S3~regout\ & (((!\DP|tc|DP|Equal2~3_combout\)) # (!\CP|state.S2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "153f",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CP|state.S3~regout\,
	datab => \CP|state.S2~regout\,
	datac => \DP|tc|DP|Equal2~3_combout\,
	datad => \DP|tc|CP|tick~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \CP|Selector1~0_combout\);

-- Location: LC_X7_Y5_N0
\DP|shift_r|Dout~0\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout~0_combout\ = ((\reset~combout\) # ((!\CP|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "ccff",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	datab => \reset~combout\,
	datad => \CP|Selector1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|shift_r|Dout~0_combout\);

-- Location: LC_X6_Y5_N0
\DP|shift_r|Dout[9]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(9) = DFFEAS(((\data_in~combout\ & (!\reset~combout\))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

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
	datab => \data_in~combout\,
	datac => \reset~combout\,
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(9));

-- Location: LC_X6_Y5_N9
\DP|shift_r|Dout[8]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(8) = DFFEAS(((\DP|shift_r|Dout\(9) & (!\reset~combout\))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

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
	datab => \DP|shift_r|Dout\(9),
	datac => \reset~combout\,
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(8));

-- Location: LC_X8_Y4_N8
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

-- Location: LC_X7_Y6_N9
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

-- Location: LC_X7_Y6_N7
\DP|shift_r|Dout[7]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(7) = DFFEAS((((\DP|dout|Dout~8\))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

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
	datad => \DP|dout|Dout~8\,
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(7));

-- Location: LC_X7_Y4_N6
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

-- Location: LC_X7_Y4_N3
\DP|shift_r|Dout[6]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(6) = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, \DP|dout|Dout~7\, , , VCC)

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
	datac => \DP|dout|Dout~7\,
	aclr => GND,
	sload => VCC,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(6));

-- Location: LC_X7_Y4_N5
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

-- Location: LC_X7_Y4_N9
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

-- Location: LC_X7_Y4_N7
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

-- Location: LC_X7_Y4_N8
\DP|shift_r|Dout[4]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(4) = DFFEAS((((\DP|dout|Dout~5\))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

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
	datad => \DP|dout|Dout~5\,
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(4));

-- Location: LC_X7_Y4_N1
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

-- Location: LC_X7_Y4_N4
\DP|shift_r|Dout[3]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(3) = DFFEAS((((\DP|dout|Dout~4\))), GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, , , , )

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
	datad => \DP|dout|Dout~4\,
	aclr => GND,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(3));

-- Location: LC_X8_Y4_N6
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

-- Location: LC_X7_Y5_N3
\DP|shift_r|Dout[2]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(2) = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, \DP|dout|Dout~3\, , , VCC)

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
	datac => \DP|dout|Dout~3\,
	aclr => GND,
	sload => VCC,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(2));

-- Location: LC_X7_Y4_N0
\DP|dout|Dout[1]\ : maxv_lcell
-- Equation(s):
-- \DP|dout|Dout~2\ = (((!\reset~combout\ & \DP|shift_r|Dout\(2))))
-- \DP|dout|Dout\(1) = DFFEAS(\DP|dout|Dout~2\, GLOBAL(\clk~combout\), VCC, , \DP|dout|Dout~1_combout\, , , , )

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
	datad => \DP|shift_r|Dout\(2),
	aclr => GND,
	ena => \DP|dout|Dout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DP|dout|Dout~2\,
	regout => \DP|dout|Dout\(1));

-- Location: LC_X7_Y4_N2
\DP|shift_r|Dout[1]\ : maxv_lcell
-- Equation(s):
-- \DP|shift_r|Dout\(1) = DFFEAS(GND, GLOBAL(\clk~combout\), VCC, , \DP|shift_r|Dout~0_combout\, \DP|dout|Dout~2\, , , VCC)

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
	datac => \DP|dout|Dout~2\,
	aclr => GND,
	sload => VCC,
	ena => \DP|shift_r|Dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|shift_r|Dout\(1));

-- Location: LC_X8_Y4_N0
\DP|dout|Dout[0]\ : maxv_lcell
-- Equation(s):
-- \DP|dout|Dout\(0) = DFFEAS((((!\reset~combout\ & \DP|shift_r|Dout\(1)))), GLOBAL(\clk~combout\), VCC, , \DP|dout|Dout~1_combout\, , , , )

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
	datad => \DP|shift_r|Dout\(1),
	aclr => GND,
	ena => \DP|dout|Dout~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DP|dout|Dout\(0));

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

-- Location: PIN_60,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(1),
	oe => VCC,
	padio => ww_debug(0));

-- Location: PIN_132,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(2),
	oe => VCC,
	padio => ww_debug(1));

-- Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(3),
	oe => VCC,
	padio => ww_debug(2));

-- Location: PIN_134,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(4),
	oe => VCC,
	padio => ww_debug(3));

-- Location: PIN_61,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(5),
	oe => VCC,
	padio => ww_debug(4));

-- Location: PIN_31,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(6),
	oe => VCC,
	padio => ww_debug(5));

-- Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[6]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(7),
	oe => VCC,
	padio => ww_debug(6));

-- Location: PIN_21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\debug[7]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \DP|shift_r|Dout\(8),
	oe => VCC,
	padio => ww_debug(7));
END structure;


