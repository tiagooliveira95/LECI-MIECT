library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Fase1_Tb is 
end Fase1_Tb;

architecture Stimulus of Fase1_Tb is
	signal s_clk: std_logic;
   signal s_rst: std_logic;
	signal s_EnPC: std_logic;
   signal s_RI: std_logic;
	signal s_RegDst: std_logic;
   signal s_RegWr: std_logic;
   signal s_ALUSrc: std_logic;
   signal s_MemWr: std_logic;
   signal s_MemToReg: std_logic;
   signal s_ALUOp:  std_logic_vector(3 downto 0);
begin

	uut: entity work.Fase1(Structural)
		port map(
			clk 	   => s_clk,
			rst      => s_rst, 
			EnPC     => s_EnPC,
			RI       => s_RI,
			RegDst   => s_RegDst,
			RegWr    => s_RegWr,
			ALUSrc   => s_ALUSrc,
			MemWr    => s_MemWr,
			MemToReg => s_MemToReg,
			ALUOp    => s_ALUOp
		);
		
	-- clock de 50mhz
	clk_proc: process
	begin
		s_clk <= '1';
		wait for 10 ns;
		s_clk <= '0';
		wait for 10 ns;
	end process;
	
	
	stim_proc:process
	begin
	   s_rst <= '1';
	   wait for 100 ns;
		s_rst <= '0';
		wait for 100ns;
		
		
	   -- tipo 1
		s_rst 		<= '0';
		s_EnPC 		<= '1';
		s_RI 			<= '1';
		s_RegWr 		<= '0';
		s_RegDst 	<= '0';
		s_ALUSrc 	<= '0';
		s_MemWr 		<= '0';
		s_MemToReg  <= '0';
		s_ALUOp 		<= "0000";
		wait for 500 ns;
		
		-- lw
		s_rst 		<= '0';
		s_EnPC 		<= '1';
		s_RI 			<= '1';
		s_RegWr 		<= '0';
		s_RegDst 	<= '1';
		s_ALUSrc 	<= '1';
		s_MemWr 		<= '0';
		s_MemToReg  <= '1';
		s_ALUOp 		<= "0000";
		wait for 500 ns;
		
		
		-- sw
		s_rst 		<= '0';
		s_EnPC 		<= '1';
		s_RI 			<= '1';
		s_RegWr 		<= '0';
		s_RegDst 	<= '1';
		s_ALUSrc 	<= '1';
		s_MemWr 		<= '0';
		s_MemToReg  <= '0';
		s_ALUOp 		<= "0000";
		wait for 500 ns;
		
		
	end process;

end Stimulus;