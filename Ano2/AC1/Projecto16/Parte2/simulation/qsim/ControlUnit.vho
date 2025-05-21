-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "06/02/2020 03:42:12"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ControlUnit IS
    PORT (
	clk : IN std_logic;
	opcode : IN std_logic_vector(2 DOWNTO 0);
	func : IN std_logic_vector(3 DOWNTO 0);
	EnPC : OUT std_logic;
	RI : OUT std_logic;
	RegDst : OUT std_logic;
	RegWr : OUT std_logic;
	ALUSrc : OUT std_logic;
	ALUOp : OUT std_logic_vector(3 DOWNTO 0);
	MemWr : OUT std_logic;
	MemToReg : OUT std_logic;
	rst : OUT std_logic
	);
END ControlUnit;

ARCHITECTURE structure OF ControlUnit IS
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
SIGNAL ww_opcode : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_func : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_EnPC : std_logic;
SIGNAL ww_RI : std_logic;
SIGNAL ww_RegDst : std_logic;
SIGNAL ww_RegWr : std_logic;
SIGNAL ww_ALUSrc : std_logic;
SIGNAL ww_ALUOp : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_MemWr : std_logic;
SIGNAL ww_MemToReg : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL \EnPC~output_o\ : std_logic;
SIGNAL \RI~output_o\ : std_logic;
SIGNAL \RegDst~output_o\ : std_logic;
SIGNAL \RegWr~output_o\ : std_logic;
SIGNAL \ALUSrc~output_o\ : std_logic;
SIGNAL \ALUOp[0]~output_o\ : std_logic;
SIGNAL \ALUOp[1]~output_o\ : std_logic;
SIGNAL \ALUOp[2]~output_o\ : std_logic;
SIGNAL \ALUOp[3]~output_o\ : std_logic;
SIGNAL \MemWr~output_o\ : std_logic;
SIGNAL \MemToReg~output_o\ : std_logic;
SIGNAL \rst~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \opcode[2]~input_o\ : std_logic;
SIGNAL \opcode[1]~input_o\ : std_logic;
SIGNAL \opcode[0]~input_o\ : std_logic;
SIGNAL \RegDst~1_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \n_state.Decode_329~combout\ : std_logic;
SIGNAL \s_state.Decode~q\ : std_logic;
SIGNAL \Selector15~2_combout\ : std_logic;
SIGNAL \n_state.Execute_312~combout\ : std_logic;
SIGNAL \s_state.Execute~q\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \n_state.RegUpdate_298~combout\ : std_logic;
SIGNAL \s_state.RegUpdate~q\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \n_state.WriteMem_281~combout\ : std_logic;
SIGNAL \s_state.WriteMem~q\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \s_state.Reset~q\ : std_logic;
SIGNAL \Selector10~1_combout\ : std_logic;
SIGNAL \n_state.Fetch_346~combout\ : std_logic;
SIGNAL \s_state.Fetch~q\ : std_logic;
SIGNAL \WideOr0~combout\ : std_logic;
SIGNAL \EnPC~2_combout\ : std_logic;
SIGNAL \EnPC$latch~combout\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \Selector15~1_combout\ : std_logic;
SIGNAL \RegDst$latch~combout\ : std_logic;
SIGNAL \WideOr1~combout\ : std_logic;
SIGNAL \RegWr$latch~combout\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \ALUSrc$latch~combout\ : std_logic;
SIGNAL \func[0]~input_o\ : std_logic;
SIGNAL \ALUOp[0]~0_combout\ : std_logic;
SIGNAL \ALUOp[0]$latch~combout\ : std_logic;
SIGNAL \func[1]~input_o\ : std_logic;
SIGNAL \ALUOp[1]~1_combout\ : std_logic;
SIGNAL \ALUOp[1]$latch~combout\ : std_logic;
SIGNAL \func[2]~input_o\ : std_logic;
SIGNAL \ALUOp[2]~2_combout\ : std_logic;
SIGNAL \ALUOp[2]$latch~combout\ : std_logic;
SIGNAL \func[3]~input_o\ : std_logic;
SIGNAL \ALUOp[3]~3_combout\ : std_logic;
SIGNAL \ALUOp[3]$latch~combout\ : std_logic;
SIGNAL \WideOr4~combout\ : std_logic;
SIGNAL \MemWr$latch~combout\ : std_logic;
SIGNAL \ALT_INV_s_state.Reset~q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_opcode <= opcode;
ww_func <= func;
EnPC <= ww_EnPC;
RI <= ww_RI;
RegDst <= ww_RegDst;
RegWr <= ww_RegWr;
ALUSrc <= ww_ALUSrc;
ALUOp <= ww_ALUOp;
MemWr <= ww_MemWr;
MemToReg <= ww_MemToReg;
rst <= ww_rst;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_s_state.Reset~q\ <= NOT \s_state.Reset~q\;

\EnPC~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \EnPC$latch~combout\,
	devoe => ww_devoe,
	o => \EnPC~output_o\);

\RI~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \EnPC$latch~combout\,
	devoe => ww_devoe,
	o => \RI~output_o\);

\RegDst~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegDst$latch~combout\,
	devoe => ww_devoe,
	o => \RegDst~output_o\);

\RegWr~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegWr$latch~combout\,
	devoe => ww_devoe,
	o => \RegWr~output_o\);

\ALUSrc~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUSrc$latch~combout\,
	devoe => ww_devoe,
	o => \ALUSrc~output_o\);

\ALUOp[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUOp[0]$latch~combout\,
	devoe => ww_devoe,
	o => \ALUOp[0]~output_o\);

\ALUOp[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUOp[1]$latch~combout\,
	devoe => ww_devoe,
	o => \ALUOp[1]~output_o\);

\ALUOp[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUOp[2]$latch~combout\,
	devoe => ww_devoe,
	o => \ALUOp[2]~output_o\);

\ALUOp[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALUOp[3]$latch~combout\,
	devoe => ww_devoe,
	o => \ALUOp[3]~output_o\);

\MemWr~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MemWr$latch~combout\,
	devoe => ww_devoe,
	o => \MemWr~output_o\);

\MemToReg~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \MemToReg~output_o\);

\rst~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_s_state.Reset~q\,
	devoe => ww_devoe,
	o => \rst~output_o\);

\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\opcode[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(2),
	o => \opcode[2]~input_o\);

\opcode[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(1),
	o => \opcode[1]~input_o\);

\opcode[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(0),
	o => \opcode[0]~input_o\);

\RegDst~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegDst~1_combout\ = \opcode[2]~input_o\ $ (((!\opcode[1]~input_o\ & \opcode[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[2]~input_o\,
	datab => \opcode[1]~input_o\,
	datad => \opcode[0]~input_o\,
	combout => \RegDst~1_combout\);

\Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = ((\opcode[2]~input_o\ & ((\opcode[1]~input_o\) # (!\opcode[0]~input_o\))) # (!\opcode[2]~input_o\ & (!\opcode[1]~input_o\))) # (!\s_state.Decode~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[2]~input_o\,
	datab => \opcode[1]~input_o\,
	datac => \opcode[0]~input_o\,
	datad => \s_state.Decode~q\,
	combout => \Selector11~0_combout\);

\n_state.Decode_329\ : cycloneive_lcell_comb
-- Equation(s):
-- \n_state.Decode_329~combout\ = (\Selector11~0_combout\ & (\s_state.Fetch~q\)) # (!\Selector11~0_combout\ & ((\n_state.Decode_329~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s_state.Fetch~q\,
	datac => \n_state.Decode_329~combout\,
	datad => \Selector11~0_combout\,
	combout => \n_state.Decode_329~combout\);

\s_state.Decode\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \n_state.Decode_329~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_state.Decode~q\);

\Selector15~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector15~2_combout\ = (\s_state.Decode~q\ & ((\opcode[2]~input_o\) # ((\opcode[0]~input_o\) # (\opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_state.Decode~q\,
	datab => \opcode[2]~input_o\,
	datac => \opcode[0]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \Selector15~2_combout\);

\n_state.Execute_312\ : cycloneive_lcell_comb
-- Equation(s):
-- \n_state.Execute_312~combout\ = (\Selector15~2_combout\ & ((\n_state.Execute_312~combout\) # (\RegDst~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \n_state.Execute_312~combout\,
	datac => \RegDst~1_combout\,
	datad => \Selector15~2_combout\,
	combout => \n_state.Execute_312~combout\);

\s_state.Execute\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \n_state.Execute_312~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_state.Execute~q\);

\Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\s_state.Execute~q\ & ((\opcode[2]~input_o\ & (\opcode[0]~input_o\ $ (!\opcode[1]~input_o\))) # (!\opcode[2]~input_o\ & (\opcode[0]~input_o\ & !\opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_state.Execute~q\,
	datab => \opcode[2]~input_o\,
	datac => \opcode[0]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \Selector7~0_combout\);

\n_state.RegUpdate_298\ : cycloneive_lcell_comb
-- Equation(s):
-- \n_state.RegUpdate_298~combout\ = (\Selector11~0_combout\ & (\Selector7~0_combout\)) # (!\Selector11~0_combout\ & ((\n_state.RegUpdate_298~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector7~0_combout\,
	datac => \n_state.RegUpdate_298~combout\,
	datad => \Selector11~0_combout\,
	combout => \n_state.RegUpdate_298~combout\);

\s_state.RegUpdate\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \n_state.RegUpdate_298~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_state.RegUpdate~q\);

\Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\s_state.Execute~q\ & ((\opcode[1]~input_o\ & ((!\opcode[0]~input_o\) # (!\opcode[2]~input_o\))) # (!\opcode[1]~input_o\ & (\opcode[2]~input_o\ $ (!\opcode[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_state.Execute~q\,
	datab => \opcode[1]~input_o\,
	datac => \opcode[2]~input_o\,
	datad => \opcode[0]~input_o\,
	combout => \Selector5~0_combout\);

\n_state.WriteMem_281\ : cycloneive_lcell_comb
-- Equation(s):
-- \n_state.WriteMem_281~combout\ = (\Selector11~0_combout\ & (\Selector5~0_combout\)) # (!\Selector11~0_combout\ & ((\n_state.WriteMem_281~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector5~0_combout\,
	datac => \n_state.WriteMem_281~combout\,
	datad => \Selector11~0_combout\,
	combout => \n_state.WriteMem_281~combout\);

\s_state.WriteMem\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \n_state.WriteMem_281~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_state.WriteMem~q\);

\Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = (\s_state.Decode~q\ & (!\opcode[2]~input_o\ & (!\opcode[0]~input_o\ & !\opcode[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_state.Decode~q\,
	datab => \opcode[2]~input_o\,
	datac => \opcode[0]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \Selector10~0_combout\);

\s_state.Reset\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_state.Reset~q\);

\Selector10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector10~1_combout\ = (\s_state.RegUpdate~q\) # ((\s_state.WriteMem~q\) # ((\Selector10~0_combout\) # (!\s_state.Reset~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_state.RegUpdate~q\,
	datab => \s_state.WriteMem~q\,
	datac => \Selector10~0_combout\,
	datad => \s_state.Reset~q\,
	combout => \Selector10~1_combout\);

\n_state.Fetch_346\ : cycloneive_lcell_comb
-- Equation(s):
-- \n_state.Fetch_346~combout\ = (\Selector11~0_combout\ & (\Selector10~1_combout\)) # (!\Selector11~0_combout\ & ((\n_state.Fetch_346~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector10~1_combout\,
	datac => \n_state.Fetch_346~combout\,
	datad => \Selector11~0_combout\,
	combout => \n_state.Fetch_346~combout\);

\s_state.Fetch\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \n_state.Fetch_346~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_state.Fetch~q\);

WideOr0 : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr0~combout\ = (\s_state.Fetch~q\) # ((\s_state.Decode~q\) # (\s_state.Execute~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_state.Fetch~q\,
	datab => \s_state.Decode~q\,
	datac => \s_state.Execute~q\,
	combout => \WideOr0~combout\);

\EnPC~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \EnPC~2_combout\ = (!\s_state.RegUpdate~q\ & !\s_state.WriteMem~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \s_state.RegUpdate~q\,
	datad => \s_state.WriteMem~q\,
	combout => \EnPC~2_combout\);

\EnPC$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \EnPC$latch~combout\ = (\EnPC~2_combout\ & (\WideOr0~combout\)) # (!\EnPC~2_combout\ & ((\EnPC$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WideOr0~combout\,
	datac => \EnPC$latch~combout\,
	datad => \EnPC~2_combout\,
	combout => \EnPC$latch~combout\);

\Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = (\s_state.Decode~q\ & ((\opcode[0]~input_o\ & ((\opcode[2]~input_o\) # (\opcode[1]~input_o\))) # (!\opcode[0]~input_o\ & ((!\opcode[1]~input_o\) # (!\opcode[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_state.Decode~q\,
	datab => \opcode[0]~input_o\,
	datac => \opcode[2]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \Selector14~0_combout\);

\Selector15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = (\s_state.Decode~q\ & (\opcode[2]~input_o\ $ (((!\opcode[1]~input_o\ & \opcode[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_state.Decode~q\,
	datab => \opcode[2]~input_o\,
	datac => \opcode[1]~input_o\,
	datad => \opcode[0]~input_o\,
	combout => \Selector15~0_combout\);

\Selector15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector15~1_combout\ = (\s_state.Fetch~q\) # ((\Selector15~0_combout\) # (!\s_state.Reset~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_state.Fetch~q\,
	datab => \Selector15~0_combout\,
	datad => \s_state.Reset~q\,
	combout => \Selector15~1_combout\);

\RegDst$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegDst$latch~combout\ = (\Selector15~1_combout\ & (\Selector14~0_combout\)) # (!\Selector15~1_combout\ & ((\RegDst$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector14~0_combout\,
	datac => \RegDst$latch~combout\,
	datad => \Selector15~1_combout\,
	combout => \RegDst$latch~combout\);

WideOr1 : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr1~combout\ = (\s_state.Decode~q\) # ((\s_state.Execute~q\) # (\s_state.WriteMem~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_state.Decode~q\,
	datab => \s_state.Execute~q\,
	datac => \s_state.WriteMem~q\,
	combout => \WideOr1~combout\);

\RegWr$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegWr$latch~combout\ = (\WideOr1~combout\ & ((\RegWr$latch~combout\))) # (!\WideOr1~combout\ & (\s_state.RegUpdate~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s_state.RegUpdate~q\,
	datac => \RegWr$latch~combout\,
	datad => \WideOr1~combout\,
	combout => \RegWr$latch~combout\);

\Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = (\s_state.Reset~q\ & !\Selector15~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_state.Reset~q\,
	datad => \Selector15~0_combout\,
	combout => \Selector13~0_combout\);

\ALUSrc$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUSrc$latch~combout\ = (\Selector13~0_combout\ & ((\ALUSrc$latch~combout\))) # (!\Selector13~0_combout\ & (\Selector14~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector14~0_combout\,
	datac => \ALUSrc$latch~combout\,
	datad => \Selector13~0_combout\,
	combout => \ALUSrc$latch~combout\);

\func[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(0),
	o => \func[0]~input_o\);

\ALUOp[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUOp[0]~0_combout\ = (\opcode[0]~input_o\ & (\func[0]~input_o\ & (!\opcode[2]~input_o\ & !\opcode[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[0]~input_o\,
	datab => \func[0]~input_o\,
	datac => \opcode[2]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \ALUOp[0]~0_combout\);

\ALUOp[0]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUOp[0]$latch~combout\ = (\Selector15~0_combout\ & (\ALUOp[0]~0_combout\)) # (!\Selector15~0_combout\ & ((\ALUOp[0]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUOp[0]~0_combout\,
	datac => \ALUOp[0]$latch~combout\,
	datad => \Selector15~0_combout\,
	combout => \ALUOp[0]$latch~combout\);

\func[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(1),
	o => \func[1]~input_o\);

\ALUOp[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUOp[1]~1_combout\ = (\opcode[0]~input_o\ & (\func[1]~input_o\ & (!\opcode[2]~input_o\ & !\opcode[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[0]~input_o\,
	datab => \func[1]~input_o\,
	datac => \opcode[2]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \ALUOp[1]~1_combout\);

\ALUOp[1]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUOp[1]$latch~combout\ = (\Selector15~0_combout\ & (\ALUOp[1]~1_combout\)) # (!\Selector15~0_combout\ & ((\ALUOp[1]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUOp[1]~1_combout\,
	datac => \ALUOp[1]$latch~combout\,
	datad => \Selector15~0_combout\,
	combout => \ALUOp[1]$latch~combout\);

\func[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(2),
	o => \func[2]~input_o\);

\ALUOp[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUOp[2]~2_combout\ = (\opcode[0]~input_o\ & (\func[2]~input_o\ & (!\opcode[2]~input_o\ & !\opcode[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[0]~input_o\,
	datab => \func[2]~input_o\,
	datac => \opcode[2]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \ALUOp[2]~2_combout\);

\ALUOp[2]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUOp[2]$latch~combout\ = (\Selector15~0_combout\ & (\ALUOp[2]~2_combout\)) # (!\Selector15~0_combout\ & ((\ALUOp[2]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUOp[2]~2_combout\,
	datac => \ALUOp[2]$latch~combout\,
	datad => \Selector15~0_combout\,
	combout => \ALUOp[2]$latch~combout\);

\func[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(3),
	o => \func[3]~input_o\);

\ALUOp[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUOp[3]~3_combout\ = (\opcode[0]~input_o\ & (\func[3]~input_o\ & (!\opcode[2]~input_o\ & !\opcode[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[0]~input_o\,
	datab => \func[3]~input_o\,
	datac => \opcode[2]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \ALUOp[3]~3_combout\);

\ALUOp[3]$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUOp[3]$latch~combout\ = (\Selector15~0_combout\ & (\ALUOp[3]~3_combout\)) # (!\Selector15~0_combout\ & ((\ALUOp[3]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUOp[3]~3_combout\,
	datac => \ALUOp[3]$latch~combout\,
	datad => \Selector15~0_combout\,
	combout => \ALUOp[3]$latch~combout\);

WideOr4 : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr4~combout\ = (\s_state.Decode~q\) # ((\s_state.Execute~q\) # (\s_state.RegUpdate~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_state.Decode~q\,
	datab => \s_state.Execute~q\,
	datac => \s_state.RegUpdate~q\,
	combout => \WideOr4~combout\);

\MemWr$latch\ : cycloneive_lcell_comb
-- Equation(s):
-- \MemWr$latch~combout\ = (\WideOr4~combout\ & ((\MemWr$latch~combout\))) # (!\WideOr4~combout\ & (\s_state.WriteMem~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s_state.WriteMem~q\,
	datac => \MemWr$latch~combout\,
	datad => \WideOr4~combout\,
	combout => \MemWr$latch~combout\);

ww_EnPC <= \EnPC~output_o\;

ww_RI <= \RI~output_o\;

ww_RegDst <= \RegDst~output_o\;

ww_RegWr <= \RegWr~output_o\;

ww_ALUSrc <= \ALUSrc~output_o\;

ww_ALUOp(0) <= \ALUOp[0]~output_o\;

ww_ALUOp(1) <= \ALUOp[1]~output_o\;

ww_ALUOp(2) <= \ALUOp[2]~output_o\;

ww_ALUOp(3) <= \ALUOp[3]~output_o\;

ww_MemWr <= \MemWr~output_o\;

ww_MemToReg <= \MemToReg~output_o\;

ww_rst <= \rst~output_o\;
END structure;


