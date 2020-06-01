library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
 
entity SeqDetFSM_Tb is 
end SeqDetFSM_Tb; 

architecture Stimulus of SeqDetFSM_Tb is
	signal s_clk, s_reset, s_Xin : std_logic;
	signal s_Yout : std_logic;
	signal s_state : std_logic_vector(3 downto 0);
	
begin

	uut: entity work.SeqDetFSM(MealyArch)
		  port map(Xin  => s_Xin,
					  clk  => s_clk,
					  reset=> s_reset,
					  state => s_state,
					  Yout => s_Yout);
					  
	clock_proc: process
		begin
			s_clk <= '0';
			wait for 50 ns;
			s_clk <= '1';
			wait for 50 ns;
		end process;
			
	stim_proc: process
		begin
			s_reset <= '1';
			s_Xin <= '0';
			wait for 100 ns;
			
			s_reset <= '0';
			s_Xin <= '1';
			wait for 100 ns;
			
			s_Xin <= '1';
			wait for 100 ns;
			
			s_Xin <= '0';
			wait for 100 ns;
			
			s_Xin <= '0';
			wait for 100 ns;
			
			s_Xin <= '1';
			wait for 100 ns;
			
			s_Xin <= '0';
			wait for 100 ns;
		end process;
end Stimulus;