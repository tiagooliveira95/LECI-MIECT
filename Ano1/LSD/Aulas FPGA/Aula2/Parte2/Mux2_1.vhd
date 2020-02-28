library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux2 is
	port (
		inputs : in std_logic_vector(1 downto 0);
		selector : in std_logic;
		output : out std_logic
		);
end Mux2;

architecture Behavior of Mux2 is
begin
	process(all)
		begin
			if(selector = '0') then
				output <= inputs(0);
			else
				output <= inputs(1);
			end if;
		end process;
	
	
end Behavior;