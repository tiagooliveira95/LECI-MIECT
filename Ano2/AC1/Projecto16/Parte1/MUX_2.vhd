library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX_2 is
	generic(
		MUX_ZIZE : integer := 8
	);
	
	port(
		input0: in std_logic_vector(MUX_ZIZE -1 downto 0); -- entrada 1 do Multiplexer
		input1: in std_logic_vector(MUX_ZIZE - 1 downto 0); -- entrada 2 do Multiplexer
		selector: in std_logic; -- Selector, seleciona a entrada
		output: out std_logic_vector(MUX_ZIZE -1 downto 0) -- ouput é igual a uma das entradas, tendo em conta o selector.
	);

end MUX_2;

architecture Behavioral of MUX_2 is
begin
	process(all)
	begin
	   -- se o selector for 1 o ouput é igual ao input 1
		if(selector = '1') then
			output <= input1;
		else
		   -- se o selector  for 0 o output é igual ao input 0
			output <= input0;
		end if;
		
	end process;
end Behavioral;