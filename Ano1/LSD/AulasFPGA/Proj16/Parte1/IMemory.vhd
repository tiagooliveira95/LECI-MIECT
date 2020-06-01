library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity IMemory is 
   generic(
		N: integer := 16;
		addrLength: integer := 4 -- 7 instruções dadas, máximo 16 instruções logo 4 bits são utilizados como default.	
	);
	port(
		clk: in std_logic; --clock
		En: in std_logic; -- enable
		RA: in std_logic_vector(addrLength - 1 downto 0); --readAddr
		RD: out std_logic_vector(N - 1 downto 0) -- readData
	);
end IMemory;

architecture Behavioral of IMemory is 
	constant WORD_NUM : integer := 16;
	subtype TDataWord is std_logic_vector(N-1 downto 0);
	type T_ROM is array (0 to WORD_NUM - 1) of TDataWord;
	-- inicia a rom com os valores dados no projecto.
   
	--	Type 2																																-> OP.RS.RT.ADDR
	--	LW $0, $1, 0,carregar no registo1 dados que se encontram no endereço [registo0+0] da memória de dados -> 111.000.001.0000000
	--	LW $0, $2, 1,carregar no registo2 dados que se encontram no endereço [registo0+1] da memória de dados -> 111.000.010.0000001
	--	LW $0, $3, 2,carregar no registo3 dados que se encontram no endereço [registo0+2] da memória de dados -> 111.000.111.0000010
	
	-- Type 1                                                                                                -> OP.RS.RT.RD.FUNC
	--	XOR $1, $2, $4,realizar a operação registo4 = registo1 XOR registo2												-> 001.001.010.100.0100
	
	--	Type 2																																-> OP.RS.RT.ADDR
	--	ADDI $4, $5, 1, realizar a operação registo5 = registo4 + 1															-> 111.100.101.0000001
	
	-- Type 1                                                                                                -> OP.RS.RT.RD.FUNC
	--	ADD $5, $3, $1, realizar a operação registo1 = registo5 + registo3												-> 001.101.011.001.0000
	
	--	Type 2																																-> OP.RS.RT.ADDR
	--	SW $0, $1, 0, escrever no endereço [registo0+0] na memória de dados o conteúdo do registo1            -> 110.000.001.0000000

	constant c_memory: T_ROM := ("1110000010000000", "1110000100000001", "1110001110000010", "0010010101000100","1111001010000001","0011010110010000","1100000010000000",  others => x"0000");

begin
	process(clk, En)
		begin
			if(rising_edge(clk) AND En = '1') then
				--associa os dados da array na posição x a saida, obtevos este valor x convertendo address para um integer pósitivo uma vez que não existem endereços negativos.
				RD <= c_memory(to_integer(unsigned(RA))); 
			end if;
	end process;
	
end Behavioral;