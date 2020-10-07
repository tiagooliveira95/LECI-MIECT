library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity FreqDivider_Demo is
	port(CLK: in std_logic;
			LEDR: out std_logic_vector(0 downto 0));
end FreqDivider_Demo;

architecture Structural of FreqDivider_Demo is 
begin 
	freqDivider: entity work.FreqDivider(Behavioral)
					port map (clkIn => CLK, 
								 clkout => LEDR(0),
								 k=> x"017D7840"
								 );
					
end Structural;
