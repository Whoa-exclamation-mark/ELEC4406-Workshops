library ieee;
use ieee.std_logic_1164.all;

entity four_bit_pattern_recognizer is
	PORT(	
			w: 		in 	STD_LOGIC;
			z:	 		OUT 	STD_LOGIC;
			CLOCK:	in		STD_LOGIC;
			RESET:	in 	STD_LOGIC;
			state_out: out std_logic_vector(8 downto 0));
end four_bit_pattern_recognizer;

architecture flipflop_rtl of four_bit_pattern_recognizer is
	component D_Pos_FlipFlop_Reset port (  D:	in std_logic;
	          CLK:	in std_logic;
	            Q:	out std_logic := '0';
					RESET: in std_logic); end component;
	signal state: std_logic_vector(8 downto 0) := (others => '0');
begin
	
	flip_a: D_Pos_FlipFlop_Reset PORT MAP (D=>RESET, 
														CLK=>CLOCK, 
														Q=>state(0), 
														RESET=>'0');
	flip_b: D_Pos_FlipFlop_Reset PORT MAP (D=>(state(0) or state(5) or state(7) or state(8)) AND NOT W, 
														CLK=>CLOCK, 
														Q=>state(1), 
														RESET=>RESET);
	flip_c: D_Pos_FlipFlop_Reset PORT MAP (D=>NOT W AND state(1), 
														CLK=>CLOCK, 
														Q=>state(2), 
														RESET=>RESET);
	flip_d: D_Pos_FlipFlop_Reset PORT MAP (D=>NOT W AND state(2), 
														CLK=>CLOCK, 
														Q=>state(3), 
														RESET=>RESET);
	flip_e: D_Pos_FlipFlop_Reset PORT MAP (D=>NOT W AND (state(3) or state(4)), 
														CLK=>CLOCK, 
														Q=>state(4), 
														RESET=>RESET);
	flip_f: D_Pos_FlipFlop_Reset PORT MAP (D=>(state(0) or state(1) or state(2) or state(3) or state(4)) and W, 
														CLK=>CLOCK, 
														Q=>state(5), 
														RESET=>RESET);
	flip_g: D_Pos_FlipFlop_Reset PORT MAP (D=>W AND state(5), 
														CLK=>CLOCK, 
														Q=>state(6), 
														RESET=>RESET);
	flip_h: D_Pos_FlipFlop_Reset PORT MAP (D=>W AND state(6), 
														CLK=>CLOCK, 
														Q=>state(7), 
														RESET=>RESET);
	flip_i: D_Pos_FlipFlop_Reset PORT MAP (D=>W AND (state(7) or state(8)), 
														CLK=>CLOCK, 
														Q=>state(8), 
														RESET=>RESET);
	
	z <= state(4) OR state(8);
	
	state_out <= state;
	
end flipflop_rtl;

architecture fsm_rtl of four_bit_pattern_recognizer is
	type state is (A, B, C, D, E, F, G, H, I);
	signal LS, NS : state;
	
	attribute syn_encoding: string;
	attribute syn_encoding of state : type is "0000 0001 0010 0011 0100 0101 0110 0111 1000";
begin
	drive_proc: process (CLOCK)
	begin
		if(CLOCK'event and CLOCK = '1') then
			if(RESET = '1') then 
				LS <= A;
			else
				LS <= NS;
			end if;
		end if;
	end process;
	
	comb_proc: process (LS, NS)
	begin
		z <= '0';
		case (LS) is
			when A =>
				if (w = '1') then
					NS <= F;
				else 
					NS <= B;
				end if;
			when B =>
				if (w = '1') then
					NS <= F;
				else 
					NS <= C;
				end if;
			when C =>
				if (w = '1') then
					NS <= F;
				else 
					NS <= D;
				end if;
			when D =>
				if (w = '1') then
					NS <= F;
				else 
					NS <= E;
				end if;
			when E =>
				z <= '1';
				if (w = '1') then
					NS <= F;
				else 
					NS <= E;
				end if;
			when F =>
				if (w = '1') then
					NS <= G;
				else 
					NS <= B;
				end if;
			when G =>
				if (w = '1') then
					NS <= H;
				else 
					NS <= B;
				end if;
			when H =>
				if (w = '1') then
					NS <= I;
				else 
					NS <= B;
				end if;
			when I =>
				z <= '1';
				if (w = '1') then
					NS <= I;
				else 
					NS <= B;
				end if;
		end case;
	end process;
	
	WITH LS SELECT state_out <=	"000000001" when A,
											"000000010" when B,
											"000000100" when C,
											"000001000" when D,
											"000010000" when E,
											"000100000" when F,
											"001000000" when G,
											"010000000" when H,
											"100000000" when I,
											"000000000" when others;
	
end fsm_rtl;
