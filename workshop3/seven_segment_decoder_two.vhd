
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment_decoder_two is
 port (SW: in std_logic_vector (7 downto 0);
 LEDR : out std_logic_vector (7 downto 0);
 HEX0 : out std_logic_vector (6 downto 0);
 HEX1 : out std_logic_vector (6 downto 0)
 );
end entity;

architecture seven_segment_decoder_two_rtl of seven_segment_decoder_two is
	COMPONENT seven_segment_decoder is
 port (SW: in std_logic_vector (3 downto 0);
 LEDR : out std_logic_vector (3 downto 0);
 HEX0 : out std_logic_vector (6 downto 0));
end COMPONENT;
--SIGNAL LEDR_ignore: std_logic_vector (3 downto 0);
BEGIN
	SEG1: seven_segment_decoder port map (SW => SW(3 downto 0), LEDR => LEDR(3 downto 0), HEX0 => HEX0);
	SEG2: seven_segment_decoder port map (SW => SW(7 downto 4), LEDR => LEDR(7 downto 4), HEX0 => HEX1);
end seven_segment_decoder_two_rtl;