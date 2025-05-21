library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Processor is
	port(
		clk: in std_logic
	);
	
end Processor;

architecture Structural of Processor is	
	signal s_EnPC: std_logic;
	signal s_RI: std_logic;
	signal s_RegDst: std_logic;
	signal s_RegWr: std_logic;
	signal s_ALUSrc: std_logic;
	signal s_ALUOp: std_logic_vector(3 downto 0);
	signal s_MemWr: std_logic;
	signal s_MemToReg: std_logic;
	signal s_IntructionBus: std_logic_vector(15 downto 0); -- Bus que contem a instrução vinda da IMemory
	signal s_rst: std_logic; -- sinal reset
begin

	-- Ligar o DataPath ao Control Unit
	DataPath: entity work.Fase1(Structural)
		port map(
			clk => clk,
			rst => s_rst,
			EnPC => s_EnPC,
			RI => s_RI,
			RegDst => s_RegDst,
			RegWr => s_RegWr,
			ALUSrc => s_ALUSrc,
			ALUOp => s_ALUOp,
			MemWr => s_MemWr,
			MemToReg => s_MemToReg,
			IntructionBus => s_IntructionBus
  		);
		
	ControllUnit: entity work.ControlUnit(Behavioral)
		port map(
			clk => clk,
			opcode => s_IntructionBus(15 downto 13),
			func => s_IntructionBus(3 downto 0),
			EnPC => s_EnPC,  
			RI => s_RI,      
			RegWr => s_RegWr,
			RegDst => s_RegDst,			
			ALUSrc => s_ALUSrc,  
			ALUOp => s_ALUOp,     
			MemWr => s_MemWr,   
			MemToReg =>	s_MemToReg,
			rst => s_rst
		);

end Structural;