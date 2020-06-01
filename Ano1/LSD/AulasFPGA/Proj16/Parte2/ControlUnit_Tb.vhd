library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity of ControlUnit_Tb is
end ControlUnit_Tb;

architecture Stimulus of ControlUnit_Tb is
	signal s_clk,s_EnPC,s_RI,s_RegDst,s_RegWr,s_ALUSrc,s_MemToReg,s_rst: std_logic;
	signal s_func,s_ALUOp: std_logic_vector(3 downto 0);
	signal s_opcode: std_logic_vector(2 downto 0);

begin
	
	utt: entity work.ControlUnit(Behavioral)
		port map( 
				clk       => s_clk,               
				opcode    => s_opcode,         
				func      => s_func,                 
				EnPC      => s_EnPC,                      
				RI        => s_RI,               
				RegDst	 => s_RegDst,	         
				RegWr     => s_RegWr,                             
				ALUSrc    => s_ALUSrc,                                       
				ALUOp     => s_ALUOp,                  
				MemWr     => s_MemWr,                              
				MemToReg  => s_MemToReg,                        
				rst       => s_rst                        
		);
		
		-- clock 50 mhz
		clk_proc: process
		begin
			s_clk <= '1';
			wait for 10 ns;
			s_clk <= '0';
			wait for 10 ns;
		end process;
		
		stim_proc: process
		begin
			
		end process;

end Stimulus;

--    clk: in std_logic;
--		opcode: in std_logic_vector(2 downto 0);
--		func: in std_logic_vector(3 downto 0);
--		EnPC: out std_logic;
--		RI: out std_logic;
--		RegDst: out std_logic;		
--		RegWr: out std_logic; 
--		ALUSrc: out std_logic;          
--		ALUOp: out std_logic_vector(3 downto 0);  
--		MemWr: out std_logic;           
--		MemToReg: out std_logic;
--		rst: out std_logic