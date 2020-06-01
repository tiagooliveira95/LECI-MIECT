library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ControlUnit is
	port (
		clk: in std_logic;
		opcode: in std_logic_vector(2 downto 0);
		func: in std_logic_vector(3 downto 0);
		EnPC      : out std_logic;
		RI        : out std_logic;   
		RegWr     : out std_logic; 
		ALUSrc    : out std_logic;          
		ALUOp     : out std_logic_vector(3 downto 0);  
		MemWr     : out std_logic;           
		MemToReg  : out std_logic          
	);
end ControlUnit;

architecture Behavioral of ControlUnit is
begin


end Behavioral;