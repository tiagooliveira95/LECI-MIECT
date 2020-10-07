library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RAM_1P_Demo is
	port(
		KEY: in std_logic_vector(1 downto 0);
		SW: in std_logic_vector(11 downto 0);
		LEDR: out std_logic_vector(7 downto 0)
	);
	
end RAM_1P_Demo;


architecture Structural of RAM_1P_Demo is 
begin 
	ram: entity work.RAM_1P_16_8(Behavioral)
					port map (clk => KEY(1), 
								 address => SW(3 downto 0),
								 writeData => SW(11 downto 4),
								 writeEnable => KEY(0),
								 readData => LEDR
								 );
					
end Structural;
