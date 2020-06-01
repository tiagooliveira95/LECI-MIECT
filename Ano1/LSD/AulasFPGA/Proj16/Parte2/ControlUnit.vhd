library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ControlUnit is
	port (
		clk: in std_logic;
		opcode: in std_logic_vector(2 downto 0);
		func: in std_logic_vector(3 downto 0);
		EnPC: out std_logic;
		RI: out std_logic;
		RegDst: out std_logic;		
		RegWr: out std_logic; 
		ALUSrc: out std_logic;          
		ALUOp: out std_logic_vector(3 downto 0);  
		MemWr: out std_logic;           
		MemToReg: out std_logic;
		rst: out std_logic
	);
end ControlUnit;

architecture Behavioral of ControlUnit is
	type TState is (Reset, Fetch, Decode, Execute, RegUpdate, WriteMem);
	signal s_state: TState := Reset;
	signal n_state: TState;
begin

	sync: process(clk)
	begin
		if(rising_edge(clk)) then
			s_state <= n_state;
		end if;
	end process;
	
	ctrlu: process(n_state,s_state, opcode, func)
	begin
	
		-- s_state <= Reset;
		case(s_state) is
			when Reset =>
				rst <= '1';
				n_state <= Fetch;
			when Fetch =>
				RI <= '1';
				EnPC <= '1';
				n_state <= Decode;
			when Decode =>
				if opcode = "000" then -- caso NOP
					n_state <= Fetch;
				elsif opcode = "001" then -- se for tipo 1
					RegDst <= '0'; -- defenir a entrada do mux para 0 uma vez que se trata de uma op de tipo 1 o WA esta localizado entre 6..4
					ALUSrc <= '0'; -- defenir o mux para entrada 0 uma vez que queremos ler o RD2
					MemToReg <= '0'; -- define o mux para a entrada 0 pois queremos obter o res da alu e envialo para a register
					ALUOp <= func; -- enviar a função para a ALU
					n_state <= Execute;
				elsif opcode = "111" then --LW
					RegDst <= '1'; -- selecionar a saida da mux para entrada 1 uma vez que para op de tipo 2 o WA esta entre 9..7
					ALUSrc <= '1'; -- selecionar a saida da mux para entrada 1 para converter o Addr de 7 para 8 bits, para mais tarde ser somado ao registo x
					MemToReg <= '0'; -- define o mux para a entrada 0 pois queremos obter o res da alu e envialo para a register
					ALUOp <= x"0"; -- soma os dados do registo
					n_state <= Execute;
				elsif opcode = "110" then --SW
					RegDst <= '1';
				   ALUSrc <= '0';
					MemToReg <= '1';
					ALUOp <= x"0"; -- soma os dados do registo
					n_state <= Execute;
				else if opcode = "100" then -- ADDI (realizar a operação registo5 = registo4 + 1)
					RegDst <= '1'; -- selecionar a saida da mux para entrada 1 uma vez que para op de tipo 2 o WA esta entre 9..7
					ALUSrc <= '1'; -- selecionar a saida da mux para entrada 1 para converter o Addr de 7 para 8 bits, para mais tarde ser somado ao registo x
					ALUOp <= x"0"; -- soma os dados do registo
					MemToReg <= '0'; -- define o mux para a entrada 0 pois queremos obter o res da alu e envialo para a register
					n_state <= Execute;
				end if;
			
			when Execute =>
				if opcode = "001" OR opcode = "100" OR opcode = "111" then -- operações do tipo 1 do tipo ADDI e LW são para atualizar o registo
					n_state <= RegUpdate;
				else
					n_state <= WriteMem;
				end if;
			
			when RegUpdate =>
				RegWr  <= '1'; -- ativar write no bloco de registos
				n_state <= Fetch;

				
			when WriteMem =>
				MemWr <= '1'; -- ativar write no DMemory
				n_state <= Fetch;
		end case;

	end process;
	


end Behavioral;