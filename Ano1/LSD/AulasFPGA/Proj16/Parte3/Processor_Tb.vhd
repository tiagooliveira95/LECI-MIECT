library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Processor_Tb is
end Processor_Tb;

architecture Stimulos of Processor_Tb is
	signal s_clk: std_logic;
	signal s_rst: std_logic;
begin 
	
	uut: entity work.Processor(Structural)
		port map(
			clk => s_clk,
			rst => s_rst
		);
		
	-- Clock 50 MHz
	clk: process
	begin
		s_clk <= '1';
		wait for 10 ns;
		s_clk <= '0';
		wait for 10ns;
	end process;

	
	stim: process
	begin
		s_rst <= '0';
		wait for 40ns;
		s_rst <= '0';
	end process;
	
end Stimulos;