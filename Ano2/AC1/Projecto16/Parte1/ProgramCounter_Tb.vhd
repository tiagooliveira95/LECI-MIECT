library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity ProgramCounter_Tb is
end ProgramCounter_Tb;

architecture Stimulus of ProgramCounter_Tb is
	signal s_clk: std_logic;
	signal s_rst: std_logic;
	signal s_En: std_logic;
	signal s_Cnt: std_logic_vector(3 downto 0);
begin

	uut: entity work.ProgramCounter(Behavioral)
		port map(clk => s_clk,
				   rst => s_rst,
					En => s_En,
					Cnt => s_Cnt
		);
		
	-- clock 50 MHz
	clk_proc: process
	begin
		s_clk <= '1';
		wait for 10 ns;
		s_clk <= '0';
		wait for 10 ns;
	end process;
		
		
	stim_proc: process
	begin
		s_rst <= '1';
		wait for 20 ns;
		
		s_En <= '1';
		s_rst <= '0';
		wait for 320 ns;
		
		s_En <= '0';
		s_rst <= '0';
		wait for 80 ns;
	end process;


end Stimulus;