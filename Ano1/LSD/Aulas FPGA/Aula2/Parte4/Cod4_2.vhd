library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity Cod4_2 is 
	port(
		decodedIn : in std_logic_vector(3 downto 0);
		encodedOut : out std_logic_vector(1 downto 0);
		validOut : out std_logic
	);
end Cod4_2;


architecture Behavioral of Cod4_2 is 
	begin
		process(all)
		begin
			if(decodedIn = "0000") then
				validOut <= '0';
			else 
				validOut <= '1';
			end if;
			
			if(decodedIn(3) = '1') then
				encodedOut <= "11";
			elsif(decodedIn(2) = '1') then
				encodedOut <= "10";
			elsif(decodedIn(1) = '1') then
				encodedOut <= "01";
			elsif(decodedIn(0) = '1') then
				encodedOut <= "00";
			else
				encodedOut <= "00";
			end if;
			
		end process;
	
	end Behavioral;