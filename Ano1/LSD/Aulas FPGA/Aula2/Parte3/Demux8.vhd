library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Demux8 is
	port (s: std_logic_vector(2 downto 0);
		d0 :out std_logic_vector(6 downto 0);
		d1 :out std_logic_vector(6 downto 0);
		d2 :out std_logic_vector(6 downto 0);
		d3 :out std_logic_vector(6 downto 0);
		d4 :out std_logic_vector(6 downto 0);
		d5 :out std_logic_vector(6 downto 0);
		d6 :out std_logic_vector(6 downto 0);
		d7 :out std_logic_vector(6 downto 0);
		O :in std_logic_vector(6 downto 0)
		);
end Demux8 ;

architecture behavioral_demux8 of Demux8 is
begin
	   d0 <= O when (s = "000") else "1111111";
		d1 <= O when (s = "001") else "1111111";             
	   d2 <= O when (s = "010") else "1111111";
		d3 <= O when (s = "011") else "1111111";
		d4 <= O when (s = "100") else "1111111";
		d5 <= O when (s = "101") else "1111111";
		d6 <= O when (s = "110") else "1111111";
	   d7 <= O when (s = "111") else "1111111";
end behavioral_demux8;