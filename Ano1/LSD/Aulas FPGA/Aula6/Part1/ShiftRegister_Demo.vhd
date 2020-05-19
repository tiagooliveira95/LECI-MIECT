library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ShiftRegister_Demo is
	generic(size : positive := 8);
	port (SW : in std_logic_vector(0 downto 0);
	      CLOCK_50 : in std_logic;
			LEDG		: out std_logic_vector(size-1 downto 0));
	end ShiftRegister_Demo;
	
architecture Structural of ShiftRegister_Demo is
	signal s_clkOut : std_logic;
	
begin
	shiftR : entity work.ShiftRegisterN(Behavioral)
							generic map (size => 8)
							port map (
							clk => s_clkOut,
							sin => SW(0),
							dataOut => LEDG(size-1 downto 0)
							);
							
	ClkDividerN : entity work.ClkDividerN (Behavioral)
	generic map(divFactor => 10)
	port map (clkIn => CLOCK_50,
				clkOut => s_clkOut);

end Structural;