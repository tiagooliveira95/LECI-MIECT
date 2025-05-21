library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Fase1 is 
	port(
		clk: in std_logic;
		rst: in std_logic;
		EnPC: in std_logic;
		RI: in std_logic;
		RegDst:in std_logic;
		RegWr: in std_logic;
		ALUSrc: in std_logic;
		ALUOp: in std_logic_vector(3 downto 0);
		MemWr: in std_logic;
		MemToReg: in std_logic;
		IntructionBus: out std_logic_vector(15 downto 0)
	);
end Fase1;


architecture Structural of Fase1 is
   -- Bus que liga o PC Cnt ao IMemory RA
	signal COUNTER_BUS: std_logic_vector(3 downto 0);
	-- Saida da IMemory
	signal INTRUCTION_BUS: std_logic_vector(15 downto 0);
	
	--  Endereço de escrita da Register
	signal REGISTER_WRITE_ADDR: std_logic_vector(2 downto 0);
	
	-- Endereços 1 e 2 da Register
	signal REGISTER_DATA1_BUS: std_logic_vector(7 downto 0);
	signal REGISTER_DATA2_BUS: std_logic_vector(7 downto 0);
	
	--Entrada 2 da ALU
	signal ALU_OP2_BUS: std_logic_vector(7 downto 0);
	
	-- Saida da ALU
	signal ALU_RES_BUS: std_logic_vector(7 downto 0);
	
	-- Informação lida da DMemory RD
	signal DMEMEMORY_READ_DATA_BUS: std_logic_vector(7 downto 0);
	
	-- Data a escrever na Dmemory
	signal REGISTER_WRITE_DATA_BUS: std_logic_vector(7 downto 0);
	signal SIGN_EXTENDED_BUS: std_logic_vector(7 downto 0);

begin

   -- Counter
	PC : entity work.ProgramCounter(Behavioral)
		generic map(
			COUNTER_BIT_SIZE => 4,
			END_COUNT_AT => 7
			)
		port map(
		   En => EnPC,
 			clk => clk,
			rst => rst,
			Cnt => COUNTER_BUS -- cont ligado ao RA do IMemory
		);
	
   -- Memoria de intruções	
	IMemory: entity work.IMemory(Behavioral)
		port map (
			clk => clk,
			En => RI,
			RA => COUNTER_BUS, -- RA ligado ao Cnt do counter
			RD => INTRUCTION_BUS -- Bus de instruções
		);
	
	-- Multiplexer 2 por 1 3 bits
	MUX2_1_3: entity work.MUX_2(Behavioral)
		generic map(
			MUX_ZIZE => 3
		)
		port map(
			input0 => INTRUCTION_BUS(6 downto 4),
			input1 => INTRUCTION_BUS(9 downto 7),
			output => REGISTER_WRITE_ADDR, -- Output ligado ao WA da registers
			selector => RegDst
		);

	-- Registers 256*8
	Registers: entity work.Registers(Behavioral)
		port map (
			rst => rst,
			clk => clk,
			RA1 => INTRUCTION_BUS(12 downto 10),
			RA2 => INTRUCTION_BUS(9 downto 7),
			WA => REGISTER_WRITE_ADDR, -- ligado ou output da Multiplexer
			WE => RegWr,
			WD => REGISTER_WRITE_DATA_BUS, 
			RD1 => REGISTER_DATA1_BUS,
			RD2 => REGISTER_DATA2_BUS
  		);
		
	MUX2_1_8: entity work.MUX_2(Behavioral)
		generic map(
			MUX_ZIZE => 8
		)
		port map(
			input0 => REGISTER_DATA2_BUS, -- Ligado ao RD2 da register
			input1 => SIGN_EXTENDED_BUS, -- ligado ao output da SignExtend
			output => ALU_OP2_BUS, -- ligado ao OP2 da ALU
			selector => ALUSrc
		);
		
		
	ALU: entity work.ALU(Behavioral)
		port map(
			ALUOp => ALUOp,
 			op1 => REGISTER_DATA1_BUS,
			op2 => ALU_OP2_BUS,
			res => ALU_RES_BUS -- Ligado ao Addr da DMemory e ao input 0 do multiplexer
		);
		
	DMemory: entity work.DMemory(Behavioral)
		port map (
			clk => clk,
			WE => MemWr,
			Addr => ALU_RES_BUS,
			WD => REGISTER_DATA2_BUS,
			RD => DMEMEMORY_READ_DATA_BUS -- Data lida no endereço x, ligado ao multiplexer input1
 		);
	
	MUX2_1_8_2: entity work.MUX_2(Behavioral)
		generic map(
			MUX_ZIZE => 8
		)
		port map(
			input0 => ALU_RES_BUS,
			input1 => DMEMEMORY_READ_DATA_BUS,
			output => REGISTER_WRITE_DATA_BUS,
			selector => MemToReg
 		);
		
		
	SignExtend: entity work.SignExtend(Behavioral)
		port map(
			input => INTRUCTION_BUS(6 downto 0),
			output => SIGN_EXTENDED_BUS
		);
	
	IntructionBus <= INTRUCTION_BUS;
end Structural;