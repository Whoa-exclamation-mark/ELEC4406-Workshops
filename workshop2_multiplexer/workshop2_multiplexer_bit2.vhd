library ieee;
use ieee.std_logic_1164.all;
entity workshop2_multiplexer_bit2 is
	port ( x, s, y : in std_logic;
	m : out std_logic);
end workshop2_multiplexer_bit2;

architecture workshop2_multiplexer_bit2_rtl of workshop2_multiplexer_bit2 is
begin
	m <= (x and not s) or (s and y);
end workshop2_multiplexer_bit2_rtl;