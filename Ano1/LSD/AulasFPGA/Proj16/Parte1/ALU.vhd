library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ALU is
	generic(
		N: integer:=8
	);
	port(
		op1: in std_logic_vector(N-1 downto 0);
		op2: in std_logic_vector(N-1 downto 0);
		ALUOp: in std_logic_vector(3 downto 0);
		res: out std_logic_vector(N-1 downto 0)
		);
end ALU;

architecture Behavioral of ALU is
	signal TRUE, FALSE : std_logic_vector(N-1 downto 0);
	signal op1_unsigned,op2_unsigned : unsigned (N-1 downto 0);
	signal op1_signed,op2_signed : signed(N-1 downto 0);
	signal op_multiplied_unsigned,op_multiplied_signed: std_logic_vector((2*N)-1 downto 0);
begin 
   
	-- estado "verdadeiro" representa o valor 1 com numero de bytes N
	TRUE <= std_logic_vector(to_unsigned(1, N)); 
	-- estado "falso" representa o valor 0 com numero de bytes N
	FALSE <= std_logic_vector(to_unsigned(0, N)); 
	
	op1_unsigned <= unsigned(op1);
	op2_unsigned <= unsigned(op2);
	op1_signed <= signed(op1);
	op2_signed <= signed(op2);
	op_multiplied_unsigned <= std_logic_vector(op1_unsigned * op2_unsigned);
	op_multiplied_signed <= std_logic_vector(op1_signed * op2_signed);
	
	process(all)
	begin
		-- Operations switch statement
		case ALUOp is
		   -- ADD
			when "0000" =>
				res <= std_logic_vector(op1_unsigned + op2_unsigned);
			-- SUB
			when "0001" =>
				res <= std_logic_vector(op1_unsigned - op2_unsigned);
			-- AND
			when "0010" =>
				res <= op1 AND op2;
			-- OR
			when "0011" =>
				res <= op1 OR op2;
		   -- XOR
			when "0100" =>
				res <= op1 XOR op2;
			-- NOR
			when "0101" =>
				res <= op1 NOR op2;
			-- MUU
			when "0110" =>
				res <= op_multiplied_unsigned(N-1 downto 0);
			-- MUS
			when "0111" =>
				res <= op_multiplied_signed(N-1 downto 0);
			-- SLL
			when "1000" =>
				res <= std_logic_vector(SHIFT_LEFT(op1_unsigned, to_integer(op2_unsigned))); -- TODO
			--SRL
			when "1001" =>
				res <= std_logic_vector(SHIFT_RIGHT(op1_unsigned,to_integer(op2_unsigned))); -- TODO
			-- SRA
			when "1010" =>
				res <= std_logic_vector(SHIFT_RIGHT(op1_signed,to_integer(op2_unsigned))); -- TODO
			-- EQ
			when "1011" =>
				if(op1 = op2) then
					res <= TRUE;
				else
					res <= FALSE;
				end if;
			-- SLS
			when "1100" =>
				if(op1_signed < op2_signed) then
					res <= TRUE;
				else
					res <= FALSE;
				end if;
			-- SLU
		   when "1101" =>
				if(op1_unsigned < op2_unsigned) then
					res <= TRUE;
				else
					res <= FALSE;
				end if;
			-- SGS
			when "1110" =>
				if(op1_signed > op2_signed) then
					res <= TRUE;
				else
					res <= FALSE;
				end if;
			-- SGU
			when others =>
				if(op1_unsigned > op2_unsigned) then
					res <= TRUE;
				else
					res <= FALSE;
				end if;
		end case;
	end process;

end Behavioral; 