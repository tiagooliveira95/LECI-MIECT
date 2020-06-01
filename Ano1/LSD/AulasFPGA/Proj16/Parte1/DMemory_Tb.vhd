library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity DMemory_Tb is
end DMemory_Tb;

architecture Stimulus of DMemory_Tb is
	signal s_clk : std_logic;
	signal s_WE : std_logic;
	signal s_WD : std_logic_vector(7 downto 0);
	signal s_WA : std_logic_vector(7 downto 0);
	signal s_RD : std_logic_vector(7 downto 0);
begin

	utt: entity work.DMemory(Behavioral)
		port map(
			clk => s_clk,
			WE => s_WE,
			WD => s_RD,
			Addr => s_WA,
			RD => s_WD
		);
		
		-- clk 50MHz
		clk_proc: process
		begin
			s_clk <= '0';
			wait for 10 ns;
			s_clk <= '1';
			wait for 10 ns;
		end process;
		
		stim_proc: process
	begin
		-- Desativar write
		s_WE <= '0'; 
		
		s_WA <= x"00";  --Addr 0 deve ser igual a x00 de acordo com o projecto
		wait for 40 ns;
		
		s_WA <= x"01";  --Addr 1 deve ser igual a x0A de acordo com o projecto
		wait for 40 ns;
		
		s_WA <= x"02";  --Addr 2 deve ser igual a x05 de acordo com o projecto
		wait for 40 ns;
		
		s_WA <= x"03"; --Nos restantes deve ser igual a x00
		wait for 40 ns;

		s_WA <= x"06";   
		wait for 40 ns;
		
      -- Ativar write
		s_WE <= '1';  
		
		s_WD <= X"AA"; 
		s_WA<= x"00"; 
		wait for 40 ns; 
		s_WA <= x"01"; 
		wait for 40 ns; 
		
		s_WD <= X"FF"; 
		s_WA<= x"03"; 
		wait for 40 ns; 
		s_WA <= x"05"; 
		wait for 40 ns; 
		
		
		-- Desativar write
		s_WE <= '0';
		
		-- vaidar escrita
		s_WA <= x"00"; 
		wait for 40 ns; 
		
		s_WA <= x"01"; 
		wait for 40 ns;
		
		s_WA <= x"03"; 
		wait for 40 ns; 
		
		s_WA <= x"05"; 
		wait for 40 ns;
	
	end process;


end Stimulus;