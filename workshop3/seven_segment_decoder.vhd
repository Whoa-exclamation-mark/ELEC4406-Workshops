library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment_decoder is
 port (SW: in std_logic_vector (3 downto 0);
 LEDR : out std_logic_vector (3 downto 0);
 HEX0 : out std_logic_vector (6 downto 0));
end entity;

architecture seven_segment_decoder_rtl of seven_segment_decoder is
	begin
		LEDR <= SW;
		PROCESS (SW) BEGIN 
			CASE SW IS
				WHEN "0000" => HEX0 <= NOT "0111111"; -- 0
				WHEN "0001" => HEX0 <= NOT "0000110"; -- 1
				WHEN "0010" => HEX0 <= NOT "1011011"; -- 2
				WHEN "0011" => HEX0 <= NOT "1001111"; -- 3
				WHEN "0100" => HEX0 <= NOT "1100110"; -- 4
				WHEN "0101" => HEX0 <= NOT "1101101"; -- 5
				WHEN "0110" => HEX0 <= NOT "1111100"; -- 6
				WHEN "0111" => HEX0 <= NOT "0000111"; -- 7
				WHEN "1000" => HEX0 <= NOT "1111111"; -- 8
				WHEN "1001" => HEX0 <= NOT "1100111"; -- 9
				WHEN "1010" => HEX0 <= NOT "1110111"; -- A
				WHEN "1011" => HEX0 <= NOT "1111100"; -- B
				WHEN "1100" => HEX0 <= NOT "0111001"; -- C
				WHEN "1101" => HEX0 <= NOT "1011110"; -- D
				WHEN "1111" => HEX0 <= NOT "1111001"; -- E
				WHEN OTHERS => HEX0 <= "UUUUUUU";
			END CASE;
			END PROCESS;
		END seven_segment_decoder_rtl;
