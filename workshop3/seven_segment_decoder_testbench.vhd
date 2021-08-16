library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment_decoder_testbench is

end seven_segment_decoder_testbench;

architecture seven_segment_decoder_testbench_rdl of seven_segment_decoder_testbench is
	COMPONENT seven_segment_decoder is
 port (SW: in std_logic_vector (3 downto 0);
 LEDR : out std_logic_vector (3 downto 0);
 HEX0 : out std_logic_vector (6 downto 0));
end COMPONENT;

signal SW: std_logic_vector (3 downto 0);
SIGNAL LEDR: std_logic_vector (3 downto 0);
SIGNAL HEX0: std_logic_vector (6 downto 0);

begin
	UUT: seven_segment_decoder port map (SW => SW, LEDR => LEDR, HEX0 => HEX0);
	
	process begin
		SW <= "0000"; WAIT FOR 10ns;
		SW <= "0001"; WAIT FOR 10ns;
		SW <= "0010"; WAIT FOR 10ns;
		SW <= "0011"; WAIT FOR 10ns;
		SW <= "0100"; WAIT FOR 10ns;
		SW <= "0101"; WAIT FOR 10ns;
		SW <= "0110"; WAIT FOR 10ns;
		SW <= "0111"; WAIT FOR 10ns;
		SW <= "1000"; WAIT FOR 10ns;
		SW <= "1001"; WAIT FOR 10ns;
		SW <= "1010"; WAIT FOR 10ns;
		SW <= "1011"; WAIT FOR 10ns;
		SW <= "1100"; WAIT FOR 10ns;
		SW <= "1101"; WAIT FOR 10ns;
		SW <= "1111"; WAIT FOR 10ns;
		wait;
	end process;
end seven_segment_decoder_testbench_rdl;
