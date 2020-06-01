library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Dec2_4En is
	port(
		enable : in std_logic;
		-- Vector de portas logicas 1 a 0
		inputs : in std_logic_vector(1 downto 0);
		-- Vector de saidas logicas 3 a 0
		outputs : out std_logic_vector(3 downto 0)
	);
	end Dec2_4En;

-- Comportamento do Decoder
architecture BehavEquations of Dec2_4En is
begin
   -- output 0 fica ativo quando o input 1..0 = 00
	outputs(0) <= enable and  (not inputs(1)) and (not inputs(0));
	-- output 1 fica ativo quando o input 1..0 = 01
	outputs(1) <= enable and  (not inputs(1)) and (    inputs(0));
	-- output 2 fica ativo quando o input 1..0 = 10
	outputs(2) <= enable and  (    inputs(1)) and (not inputs(0));
	-- output 3 fica ativo quando o input 1..0 = 11
	outputs(3) <= enable and  (    inputs(1)) and (    inputs(0));
end BehavEquations;

architecture BehavAssign of Dec2_4En is
begin
	outputs <= "0000" when (enable = '0') else
		"0001" when (inputs = "00") else
		"0010" when (inputs = "01") else
		"0100" when (inputs = "10") else
		"1000";
end BehavAssign; 