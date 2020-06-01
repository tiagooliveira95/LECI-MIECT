library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity ALU_Tb is 
end ALU_Tb;

architecture Stimulus of ALU_Tb is
	signal s_op1, s_op2, s_res : std_logic_vector(7 downto 0);
	signal s_ALUOp : std_logic_vector(3 downto 0);
begin 

	aluEntity: entity work.ALU(Behavioral)
		port map(
			op1 => s_op1,
			op2 => s_op2,
			res => s_res,
			ALUOp => s_ALUOp
 		);
		
		
	ALUOp_proc: process
	begin
	   -- ADD
		s_ALUOp <= "0000";
		wait for 40ns; 
		-- SUB
		s_ALUOp <= "0001";
		wait for 40ns; 
		-- AND
		s_ALUOp <= "0010";
		wait for 80ns; 
		-- OR
		s_ALUOp <= "0011";
		wait for 80ns; 
		-- XOR
		s_ALUOp <= "0100";
		wait for 80ns; 
		-- NOR
		s_ALUOp <= "0101";
		wait for 80ns; 
		-- MUU
		s_ALUOp <= "0110";
		wait for 40ns; 
		-- MUS
		s_ALUOp <= "0111";
		wait for 40ns; 
		-- SLL
		s_ALUOp <= "1000";
		wait for 40ns; 
		-- SRL
		s_ALUOp <= "1001";
		wait for 40ns; 
		-- SRA
		s_ALUOp <= "1010";
		wait for 40ns; 
		-- EQ
		s_ALUOp <= "1011";
		wait for 80ns; 
		-- SLS
		s_ALUOp <= "1100";
		wait for 80ns; 
		-- SLU
		s_ALUOp <= "1101";
		wait for 80ns; 
		-- SGS
		s_ALUOp <= "1110";
		wait for 80ns; 
		-- SGU
		s_ALUOp <= "1111";
		wait for 80ns;
	end process;
	
	
	stium_proc: process
	begin
	   -- Add 3 + 1
		s_op1 <= x"03";
		s_op2 <= x"01";
	   wait for 40ns;
		
		-- SUB 3 - 1
		s_op1 <= x"03";
		s_op2 <= x"01";
	   wait for 40ns;
		
		
		-- AND
		s_op1 <= x"AA";
		s_op2 <= x"AA";
	   wait for 40ns;
		s_op1 <= x"FF";
		s_op2 <= x"AA";
	   wait for 40ns;
		
		-- OR 
		s_op1 <= x"AA";
		s_op2 <= x"AA";
	   wait for 40ns;
		s_op1 <= x"FF";
		s_op2 <= x"AA";
	   wait for 40ns;
		
		
		-- XOR
		s_op1 <= x"AA";
		s_op2 <= x"AA";
	   wait for 40ns;
		s_op1 <= x"FF";
		s_op2 <= x"AA";
	   wait for 40ns;
		
		
		-- NOR
		s_op1 <= x"AA";
		s_op2 <= x"AA";
	   wait for 40ns;
		s_op1 <= x"FF";
		s_op2 <= x"AA";
	   wait for 40ns;
		
		
		
		-- MUU 2 * 3
		s_op1 <= x"02";
		s_op2 <= x"03";
	   wait for 40ns;
		
		-- MUS -1 * 6
		s_op1 <= x"FF";
		s_op2 <= x"06";
	   wait for 40ns;
		
		
		-- SLL Deslocamento por 3
		s_op1 <= x"AA";
		s_op2 <= x"03";
	   wait for 40ns;
		
		-- SRA Deslocamento por 3
		s_op1 <= x"AA";
		s_op2 <= x"03";
	   wait for 40ns;
		
		
		-- SLL Deslocamento por 3
		s_op1 <= x"FE";
		s_op2 <= x"03";
	   wait for 40ns;
		
		
		-- EQ
		s_op1 <= x"AA";
		s_op2 <= x"EF";
	   wait for 40ns;
		s_op1 <= x"EE";
		s_op2 <= x"EE";
	   wait for 40ns;
		
		
		-- SLS -1 < 6 e 6 < -1
		s_op1 <= x"FF";
		s_op2 <= x"06";
	   wait for 40ns;
		s_op1 <= x"06";
		s_op2 <= x"FF";
	   wait for 40ns;
		
		
		-- SLU 2 < 3 e 3 < 2
		s_op1 <= x"02";
		s_op2 <= x"03";
	   wait for 40ns;
		s_op1 <= x"03";
		s_op2 <= x"02";
	   wait for 40ns;
		
		-- SGS -1 > 6 e 6 > -1
		s_op1 <= x"FF";
		s_op2 <= x"06";
	   wait for 40ns;
		s_op1 <= x"06";
		s_op2 <= x"FF";
	   wait for 40ns;
		
		
		
		-- SGU 2 > 3 e 3 > 2
		s_op1 <= x"02";
		s_op2 <= x"03";
	   wait for 40ns;
		s_op1 <= x"03";
		s_op2 <= x"02";
	   wait for 40ns;
	
		
		
	end process;

end Stimulus;