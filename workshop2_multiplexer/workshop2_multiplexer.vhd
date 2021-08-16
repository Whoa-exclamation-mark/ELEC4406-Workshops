library ieee;
use ieee.std_logic_1164.all;
entity workshop2_multiplexer is
	port ( x1, x2, y1, y2, s1, s2 : in std_logic;
	m : out std_logic);
end workshop2_multiplexer;

architecture workshop2_multiplexer_rtl of workshop2_multiplexer is

	signal o1 : std_logic;
	signal o2 : std_logic;
	signal s3 : std_logic;
	
	component workshop2_multiplexer_bit2
		port ( x, s, y : in std_logic;
		m : out std_logic);
	end component;
	
begin
	multiplex_1 : workshop2_multiplexer_bit2 port map(x1, s1, y1,o1);
	multiplex_2 : workshop2_multiplexer_bit2 port map(x2, s2, y2,o2);
	
	s3 <= not s2;
	
	multiplex_3 : workshop2_multiplexer_bit2 port map(o1, s3, o2,m);
	
	
end workshop2_multiplexer_rtl;