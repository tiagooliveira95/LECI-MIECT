library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux4_1 is
	port (
		inputs : in std_logic_vector(3 downto 0);
		selector : in std_logic_vector(1 downto 0);
		output : out std_logic
		);
end Mux4_1;

architecture Mux4_Behavior of Mux4_1 is
begin
	output <= inputs(0) when selector = "00" else
				 inputs(1) when selector = "01" else
			 	 inputs(2) when selector = "10" else
				 inputs(3) when selector = "11";
	
	
end Mux4_Behavior;