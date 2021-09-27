-- Copyright Campbell Millar 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment_decoder is
 port (SW: in std_logic_vector (3 downto 0);
 HEX : out std_logic_vector (6 downto 0));
end entity;

architecture seven_segment_decoder_rtl of seven_segment_decoder is
	SIGNAL DISPLAY: std_logic_vector (6 downto 0);
begin
		PROCESS (SW) BEGIN 
			CASE SW IS
				WHEN "0000" => DISPLAY <= "0111111"; -- 0
				WHEN "0001" => DISPLAY <= "0000110"; -- 1
				WHEN "0010" => DISPLAY <= "1011011"; -- 2
				WHEN "0011" => DISPLAY <= "1001111"; -- 3
				WHEN "0100" => DISPLAY <= "1100110"; -- 4
				WHEN "0101" => DISPLAY <= "1101101"; -- 5
				WHEN "0110" => DISPLAY <= "1111101"; -- 6
				WHEN "0111" => DISPLAY <= "0000111"; -- 7
				WHEN "1000" => DISPLAY <= "1111111"; -- 8
				WHEN "1001" => DISPLAY <= "1101111"; -- 9
				WHEN "1010" => DISPLAY <= "1110111"; -- A
				WHEN "1011" => DISPLAY <= "1111100"; -- B
				WHEN "1100" => DISPLAY <= "0111001"; -- C
				WHEN "1101" => DISPLAY <= "1011110"; -- D
				WHEN "1110" => DISPLAY <= "1111001"; -- E
				WHEN "1111" => DISPLAY <= "1110001"; -- F
				WHEN OTHERS => DISPLAY <= "UUUUUUU";
			END CASE;
			HEX <= NOT DISPLAY;
		END PROCESS;
END seven_segment_decoder_rtl;
