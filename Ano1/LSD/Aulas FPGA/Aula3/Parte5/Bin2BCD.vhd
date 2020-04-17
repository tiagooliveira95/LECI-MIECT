library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Bin2BCD is
	port(
		bin : in std_logic_vector(3 downto 0);
		bcd0 : out std_logic_vector(3 downto 0);
		bcd1 : out std_logic_vector(3 downto 0)
	);
end Bin2BCD;

architecture Behav of Bin2BCD is
	signal s_in, s_dez, s_out0, s_out1 : unsigned(3 downto 0);
	
begin

	s_in <= unsigned(bin);
	s_dez <= to_unsigned(10,4);
	
	s_out0 <= s_in rem s_dez;
	s_out1 <= s_in / s_dez;
	
	
	bcd0 <= std_logic_vector(s_out0);
	bcd1 <= std_logic_vector(s_out1);

end Behav;