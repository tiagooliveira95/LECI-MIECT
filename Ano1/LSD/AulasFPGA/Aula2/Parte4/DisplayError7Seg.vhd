library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Error7SegDisplay is 
	port(
		input : in std_logic;
		outputE : out std_logic_vector(6 downto 0);
		outputR : out std_logic_vector(6 downto 0);
		outputO : out std_logic_vector(6 downto 0)
	);
	end Error7SegDisplay;

architecture Behavioral of Error7SegDisplay is
	begin
		process (all)
		begin
		
		if(input = '0') then
			outputE <= "0000110"; -- E
			outputO <= "0100011"; -- o
			outputR <= "0101111"; -- R
		else
			outputE <= "1111111";
			outputO <= "1111111";
			outputR <= "1111111";
		end if;
		
		end process;
		
	end Behavioral;