library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity FreqDivider is
	port(clkIn  : in  std_logic;
		  k      : in  std_logic_vector(31 downto 0);
		  clkOut : out std_logic);
end FreqDivider;
 
architecture Behavioral of FreqDivider is

	signal s_counter : unsigned(31 downto 0);
	signal s_halfWay : 
	
begin
	s_halfWay <= (unsigned(k) / 2);
	process(clkIn)
		begin
		if (rising_edge(clkIn)) then
			if (s_counter = unsigned(k) -1) then
				clkOut <= '0';
				s_counter <= (others => '0');
			else
				if (s_counter = s_halfWay-1) then
					clkOut <= '1';
				end if;
				s_counter <= s_counter + 1;
			end if;
		end if;
	end process;
	
end Behavioral;



--entity FreqDivider is
--    generic(K : natural := 2);
--    port (clkIn    : in std_logic;
--          clkOut	 : out std_logic);
--end FreqDivider;
--
-- 
--architecture Behavioral of FreqDivider is
--    signal s_counter: natural;
--    constant halfWay: natural := K/2-1;
--begin
--    process(clkIn)
--    begin
--        if(rising_edge(clkIn)) then
--            if(s_counter = halfWay) then
--                clkOut <= '1';
--                s_counter <= s_counter+1;
--            elsif(s_counter=K-1) then
--                clkOut <= '0';
--                s_counter<=0;
--            else
--                s_counter <= s_counter+1;
--            end if;
--        end if;
--    end process;
--end Behavioral; 



