library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity DMemory is
	generic(
		bit_size : integer := 8; -- tamanho de 8 bits como default
		WORD_COUNT: integer := 256 -- default 256 palavras
	);
	port(
		clk: in std_logic; -- clock
		WE: in std_logic; -- writeEnable
		Addr: in std_logic_vector(7 downto 0); -- addreass
		WD: in std_logic_vector(7 downto 0); -- writeData
		RD: out std_logic_vector(7 downto 0) -- readData
	);

end DMemory;

architecture Behavioral of DMemory is
	subtype TDataWord is std_logic_vector(bit_size -1 downto 0);
	type TMemory is array (0 to WORD_COUNT - 1 ) of TDataWord;
	-- Array iniciada com os valores fornecidos no projecto.
	signal s_memory : TMemory := (x"00",x"0A",x"05", others => x"00");
	
begin
	
	process(clk)
	begin
		if(rising_edge(clk) AND WE = '1') then 
		   -- escreve no array a informação em WD
			s_memory(to_integer(unsigned(Addr))) <= WD;
		end if;
	end process;
	-- Define a RD (read data) do Addr
	RD <= s_memory(to_integer(unsigned(Addr)));


end Behavioral; 

