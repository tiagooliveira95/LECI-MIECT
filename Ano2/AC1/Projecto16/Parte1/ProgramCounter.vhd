library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ProgramCounter is
   generic(
	   -- Tamanho do counter em bits, nesta caso o default fica a 4 uma vez que podemos ter no máximo 16 intruções.
		COUNTER_BIT_SIZE : integer := 4;
		-- Parar em. No projecto temos apénas 7 intruções contudo o projecto diz que Imemory pode guardar um máximo de 16 instruções
		-- o END_COUNT define quantas instruções queremos ler, como só temos 7 o default fica definido a 7.
		END_COUNT_AT : integer := 7
	);
	
	port(
		clk: in std_logic;
		rst: in std_logic;
		En: in std_logic;
		Cnt: out std_logic_vector(COUNTER_BIT_SIZE - 1 downto 0)
	);

end ProgramCounter;

architecture Behavioral of ProgramCounter is
	signal s_count: unsigned(COUNTER_BIT_SIZE - 1 downto 0);
begin 
	process(clk,rst,En)
	begin
		-- quando o rst fica ativo o s_count passa a 0 
		if(rst = '1') then
				s_count <= (others => '0');
		elsif(rising_edge(clk) AND En = '1') then
			-- Se o En for igual a um, e já tivemos atingido o valor máximo para o counter fazer reset
			if(s_count = to_unsigned(END_COUNT_AT, COUNTER_BIT_SIZE)) then
				s_count <= (others => '0');
			else
				-- incrementa o count por 1
				s_count <= s_count + 1;
			end if;
		end if;
	end process;
	Cnt <= std_logic_vector(s_count);
	
end Behavioral;