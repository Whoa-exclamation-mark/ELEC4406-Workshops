library ieee;				
use ieee.std_logic_1164.all;

entity counter_top is
	port (
			SW: 			in std_logic_vector(1 downto 0);
			MAX10_CLK1_50:	in std_logic;
			KEY0:			in std_logic;
			HEX0:			out std_logic_vector(6 downto 0)
			);
end counter_top;

architecture counter_top_rtl of counter_top is
	component counter
		port ( 	UP: in std_logic;
					RST: in std_logic;
					CLK: in std_logic;
					NUM: out std_logic_vector(1 downto 0));
	end component;
	
	component Clk_divider
		port ( 
	       clk_in : in STD_LOGIC; 
	        reset : in STD_LOGIC; 
			 clk_out: out STD_LOGIC;
			  N : in integer
        );
	end component;
	
	component seven_segment_decoder
	port (	SW: in std_logic_vector (3 downto 0);
				HEX : out std_logic_vector (6 downto 0));
	end component;
	
	signal internal_clk: std_logic := '0';
	signal output_num: std_logic_vector(1 downto 0);
	signal frequency: integer;
	signal reset_int: std_logic;
	signal sw_int: std_logic_vector(3 downto 0);
begin 
		with SW(1) select frequency <= 	25000000 when '1',
						12500000 when '0',
						12500000 when others;

	
	clock_div: Clk_divider 
		port map (	clk_in => MAX10_CLK1_50,
						reset => '0',
						clk_out => internal_clk, 
						N=>frequency);
	
	reset_int <= NOT KEY0;

	counter_comp: counter 
		port map (	UP => SW(0), 
						RST=> reset_int, 
						CLK=>internal_clk,
						NUM=>output_num);
	sw_int <= "00" & output_num;

	seven_seg: seven_segment_decoder
		port map (	SW => sw_int,
						HEX => HEX0);
	
end counter_top_rtl;