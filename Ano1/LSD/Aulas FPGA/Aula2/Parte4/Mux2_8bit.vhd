library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux2 is
	port (
		inputsA : in std_logic_vector(6 downto 0);	
		inputsB : in std_logic_vector(6 downto 0);
		selector : in std_logic;
		output : out std_logic_vector(6 downto 0)
		);
end Mux2;

architecture Behavior of Mux2 is
begin
	process(all)
		begin
			if(selector = '1') then
				output <= inputsA;
			else
				output <= inputsB;
			end if;
		end process;
	
	
end Behavior;