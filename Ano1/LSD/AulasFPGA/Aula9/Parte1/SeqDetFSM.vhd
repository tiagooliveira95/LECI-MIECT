library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SeqDetFSM is
	port(Xin   : in  std_logic;
		  Yout  : out std_logic;
		  reset : in  std_logic;
		  state : out std_logic_vector(3 downto 0);
		  clk   : in  std_logic);
end SeqDetFSM;

architecture MealyArch of SeqDetFSM is
	type tState is (INIT, S1, S10, S100);
	signal pState, nState: tState;
begin

	syncProcess :process(clk)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				pState <= INIT;
			else
				pState <= nState;
			end if;
		end if;
	end process;
	
	
	detectProcess :process(pState, Xin)
	begin
		nState <= pState;
		
		case (pState) is
		when INIT =>
			state <= "0000";
			Yout <= '0';
			if (Xin = '1') then
				nState <= S1;
			end if;
			
		when S1 =>
			state <= "0001";
			Yout <= '0';
			if (Xin <= '0') then
				nState <= S10;
			end if;
			
		when S10 =>
			state <= "0010";
			Yout <= '0';
			if (Xin <= '1') then
				nState <= S1;
			elsif (Xin <= '0') then
				nState <= S100;
			end if;
		
		when S100 =>
			state <= "0100";
			if (Xin <= '1') then
				Yout <= '1';
				nState <= S1;
			elsif (Xin <= '0') then
				Yout <= '0';
				nState <= INIT;
			end if;
		end case;
	end process;
	
end MealyArch;