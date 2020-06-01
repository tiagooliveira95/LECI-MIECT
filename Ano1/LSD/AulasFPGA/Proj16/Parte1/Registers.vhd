library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Registers is
	port(
	   clk: in std_logic;
		RA1: in std_logic_vector(2 downto 0); -- Read register1 Addr
		RA2: in std_logic_vector(2 downto 0); -- Read register2 Addr
		WA: in std_logic_vector(2 downto 0);  -- Write Addr
		WD: in std_logic_vector(7 downto 0); -- Write Enable
		WE: in std_logic;  -- Write Enable
		RD1: out std_logic_vector(7 downto 0); -- Read Register 1 Data
		RD2: out std_logic_vector(7 downto 0); -- Read Register 2 Data
		rst : in std_logic
	);

end Registers;

architecture Behavioral of Registers is
	constant REGISTER_SIZE: integer := 8;
	subtype REG is std_logic_vector(7 downto 0);
	type Registers is array(0 to REGISTER_SIZE - 1) of REG;
	signal s_reg : Registers := (others => x"00");
begin
	process(all)
	begin
	   
		if(rst = '1') then 
			s_reg <= (others => x"00");
		elsif(rising_edge(clk) AND WE = '1' AND WA /= "000") then
			s_reg(to_integer(unsigned(WA))) <= WD;
		end if;
		
	end process;
	RD1 <= s_reg(to_integer(unsigned(RA1)));
	RD2 <= s_reg(to_integer(unsigned(RA2)));
end Behavioral;