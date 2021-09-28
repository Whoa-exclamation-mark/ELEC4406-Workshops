library ieee;
use ieee.std_logic_1164.all;

entity four_bit_pattern_recognizer_top is
	PORT(	
			KEY0: in std_logic;
			LEDR: out std_logic_vector(9 downto 0);
			SW: in std_logic_vector(1 downto 0));
end four_bit_pattern_recognizer_top;

architecture four_bit_pattern_recognizer_top_rtl of four_bit_pattern_recognizer_top is
	
	component four_bit_pattern_recognizer
	PORT(	
			w: 		in 	STD_LOGIC;
			z:	 		OUT 	STD_LOGIC;
			CLOCK:	in		STD_LOGIC;
			RESET:	in 	STD_LOGIC;
			state_out: out std_logic_vector(8 downto 0));
	end component;
	
begin
	four_bit_pattern_recognizer_comp : four_bit_pattern_recognizer 
		PORT MAP (w 			=> SW(1),
					 z				=> LEDR(9),
					 CLOCK		=> NOT(KEY0),
					 RESET		=> NOT(SW(0)),
					 state_out	=> LEDR(8 downto 0));

end four_bit_pattern_recognizer_top_rtl;


configuration conf of four_bit_pattern_recognizer_top is
	for four_bit_pattern_recognizer_top_rtl
		for four_bit_pattern_recognizer_comp: four_bit_pattern_recognizer
			use entity work.four_bit_pattern_recognizer(flipflop_rtl);
			--use entity work.four_bit_pattern_recognizer(fsm_rtl);
		end for;
	end for;
end conf;