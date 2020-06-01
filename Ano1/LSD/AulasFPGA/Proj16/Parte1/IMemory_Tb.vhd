library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IMemory_Tb is 
end IMemory_Tb;

architecture Stimulus of IMemory_Tb is
	signal s_En: std_logic;
	signal s_clk: std_logic;
	signal s_RA: std_logic_vector(3 downto 0);
	signal s_RD: std_logic_vector(15 downto 0);
begin 

	uut: entity work.IMemory(Behavioral)
		port map(
			clk => s_clk,
			En => s_En,
			RA => s_RA,
			RD => s_RD	
		);
		
		
	clk_process: process
		begin
			s_clk <= '1';
			wait for 10ns;
			s_clk <= '0';
			wait for 10ns;
		end process;
		
	
	stim_proc: process
	begin
		s_En <= '1';

	
		s_En <= '1';
		s_RA <= "0000";
		wait for 50 ns;
		
		s_RA <= "0001";
		wait for 50 ns;
		
		s_RA <= "0010";
		wait for 50 ns;
		
		s_RA <= "0011";
		wait for 50 ns;
		
		s_RA <= "0100";
		wait for 50 ns;
		
		s_RA <= "0101";
		wait for 50 ns;
		
		s_RA <= "0110";
		wait for 50 ns;
		
		s_RA <= "1000";
		wait for 50 ns;
		
		s_RA <= "1001";
		wait for 50 ns;
		
		s_RA <= "1010";
		wait for 50 ns;
		
		s_RA <= "1011";
		wait for 50 ns;
		
		s_RA <= "1100";
		wait for 50 ns;
		
		s_RA <= "1101";
		wait for 50 ns;
		
		s_RA <= "1110";
		wait for 50 ns;
		
		s_RA <= "1111";
		wait for 50 ns;
	end process;
		
		

end Stimulus;