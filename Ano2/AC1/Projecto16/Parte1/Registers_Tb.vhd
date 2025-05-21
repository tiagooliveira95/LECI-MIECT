library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Registers_Tb is
end Registers_Tb;

architecture Stimulus of Registers_Tb is

	signal s_clk: std_logic;
	signal s_WE: std_logic;
	signal s_rst: std_logic;
	signal s_RA1: std_logic_vector(2 downto 0);
	signal s_RA2: std_logic_vector(2 downto 0);
	signal s_WA: std_logic_vector(2 downto 0);
	signal s_WD: std_logic_vector(7 downto 0);
	signal s_RD1: std_logic_vector(7 downto 0);
	signal s_RD2 : std_logic_vector(7 downto 0);
begin

	uut: entity work.Registers(Behavioral)
		port map(
			clk => s_clk,
			WE => s_WE,
			rst => s_rst,      
			RA1 => s_RA1,
			RA2 => s_RA2,
			WA => s_WA,
			WD => s_WD,  
			RD1 => s_RD1, -- duvida
			RD2 => s_RD2 -- duvida
		);
		
	-- clock 50MHz
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
			wait for 40 ns;
			s_rst <= '0';
			
			-- desactivar write
			s_WE <= '0';
			
			s_RA1 <= "001";
			s_RA2 <= "001";
			wait for 40 ns;
			
			s_RA1 <= "010";
			s_RA2 <= "010";
			wait for 40 ns;
			
			-- Ativar write
			s_WE <= '1';
			
			s_WA <= "001";
			s_WD   <= x"DA";
			wait for 40 ns;
			
			s_WA <= "010";
			s_WD   <= x"EE";
			wait for 40 ns;
			
		   -- desactivar write
			s_WE <= '0';
			
			s_RA1 <= "001";
			s_RA2 <= "001";
			wait for 40 ns;
			
			s_RA1 <= "010"; 
			s_RA2 <= "010";
			wait for 40 ns;
		end process;
end Stimulus;