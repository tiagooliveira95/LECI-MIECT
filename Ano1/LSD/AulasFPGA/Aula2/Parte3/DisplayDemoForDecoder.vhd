library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DisplayDemoForDecoder is
	port(
		SW : in std_logic_vector(3 downto 0);
		HEX0 : out std_logic_vector(6 downto 0)
	);
	end DisplayDemoForDecoder;
	
	
architecture DemoDecoder of DisplayDemoForDecoder is
	begin 
		system_core : 
			entity work.Bin7SegDecoder(Behavioral)
				port map(
					input => SW(3 downto 0),
					output => HEX0(6 downto 0)
				);
	end DemoDecoder;