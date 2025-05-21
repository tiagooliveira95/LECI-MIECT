library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Processor_Tb is
end Processor_Tb;

architecture Stimulus of Processor_Tb is
	signal s_clk: std_logic;
	signal s_rst: std_logic;
begin 
	
	uut: entity work.Processor(Structural)
		port map(
			clk => s_clk
		);
		
	-- Clock 50 MHz
	clk: process
	begin
		s_clk <= '1';
		wait for 10ns;
		s_clk <= '0';
		wait for 10ns;
	end process;
	
end Stimulus;