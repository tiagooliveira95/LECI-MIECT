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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "06/02/2020 03:42:10"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ControlUnit
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ControlUnit_vhd_vec_tst IS
END ControlUnit_vhd_vec_tst;
ARCHITECTURE ControlUnit_arch OF ControlUnit_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ALUOp : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ALUSrc : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL EnPC : STD_LOGIC;
SIGNAL func : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL MemToReg : STD_LOGIC;
SIGNAL MemWr : STD_LOGIC;
SIGNAL opcode : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL RegDst : STD_LOGIC;
SIGNAL RegWr : STD_LOGIC;
SIGNAL RI : STD_LOGIC;
SIGNAL rst : STD_LOGIC;
COMPONENT ControlUnit
	PORT (
	ALUOp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	ALUSrc : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	EnPC : OUT STD_LOGIC;
	func : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	MemToReg : OUT STD_LOGIC;
	MemWr : OUT STD_LOGIC;
	opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	RegDst : OUT STD_LOGIC;
	RegWr : OUT STD_LOGIC;
	RI : OUT STD_LOGIC;
	rst : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ControlUnit
	PORT MAP (
-- list connections between master ports and signals
	ALUOp => ALUOp,
	ALUSrc => ALUSrc,
	clk => clk,
	EnPC => EnPC,
	func => func,
	MemToReg => MemToReg,
	MemWr => MemWr,
	opcode => opcode,
	RegDst => RegDst,
	RegWr => RegWr,
	RI => RI,
	rst => rst
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 20000 ps;
	clk <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
-- func[3]
t_prcs_func_3: PROCESS
BEGIN
	func(3) <= '0';
WAIT;
END PROCESS t_prcs_func_3;
-- func[2]
t_prcs_func_2: PROCESS
BEGIN
	func(2) <= '0';
	WAIT FOR 700000 ps;
	func(2) <= '1';
WAIT;
END PROCESS t_prcs_func_2;
-- func[1]
t_prcs_func_1: PROCESS
BEGIN
	func(1) <= '0';
WAIT;
END PROCESS t_prcs_func_1;
-- func[0]
t_prcs_func_0: PROCESS
BEGIN
	func(0) <= '0';
	WAIT FOR 90000 ps;
	func(0) <= '1';
	WAIT FOR 90000 ps;
	func(0) <= '0';
	WAIT FOR 670000 ps;
	func(0) <= '1';
WAIT;
END PROCESS t_prcs_func_0;
-- opcode[2]
t_prcs_opcode_2: PROCESS
BEGIN
	opcode(2) <= '0';
	WAIT FOR 180000 ps;
	opcode(2) <= '1';
	WAIT FOR 520000 ps;
	opcode(2) <= '0';
WAIT;
END PROCESS t_prcs_opcode_2;
-- opcode[1]
t_prcs_opcode_1: PROCESS
BEGIN
	opcode(1) <= '0';
	WAIT FOR 360000 ps;
	opcode(1) <= '1';
	WAIT FOR 340000 ps;
	opcode(1) <= '0';
WAIT;
END PROCESS t_prcs_opcode_1;
-- opcode[0]
t_prcs_opcode_0: PROCESS
BEGIN
	opcode(0) <= '1';
	WAIT FOR 180000 ps;
	opcode(0) <= '0';
	WAIT FOR 330000 ps;
	opcode(0) <= '1';
WAIT;
END PROCESS t_prcs_opcode_0;
END ControlUnit_arch;
