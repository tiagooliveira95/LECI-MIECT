library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ROM_16_8 is
	port(addr : in std_logic_vector(3 downto 0);
			dataOut : out std_logic_vector(7 downto 0));
end ROM_16_8;

architecture Behavioral of ROM_16_8 is
	type t_rom_memory is array (0 to 15) of std_logic_vector(7 downto 0);
	
	-- memória na rom
	constant rom_memory: t_rom_memory := 
	(
		"00010000",	-- 0
		"00000001",	-- 1
		"00000010",	-- 2
		"00000011",	-- 3
		"00000100",	-- 4
		"00000101",	-- 5
		"00000110",	-- 6
		"00000111",	-- 7
		"00001000",	-- 8
		"00001001",	-- 9
		"00001010",	-- 10 
		"00001011",	-- 11 
		"00001100",	-- 12 
		"00001101",	-- 13 
		"00001110",	-- 14 
		"00001111" 	-- 15 			
	);

begin
	dataOut <= rom_memory(to_integer(unsigned(addr)));
end Behavioral;

