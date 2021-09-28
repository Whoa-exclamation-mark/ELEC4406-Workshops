library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
  
  
entity blank_top is
	port 
		( 
			SW : IN STD_LOGIC_VECTOR(9 downto 0);
			KEY: IN STD_LOGIC_VECTOR(1 downto 0);
			MAX10_CLK1_50 : IN STD_LOGIC;
			HEX0: OUT STD_LOGIC_VECTOR(6 downto 0);
			LEDR : out STD_LOGIC_VECTOR(9 downto 0)
       );
end blank_top;
	
architecture blank_top_rtl of blank_top is
	component Clk_divider is
   generic(Freq_in : integer := 50000000); -- 50MHz clock on DE-10 Lite FPGA board
	Port ( 
	       clk_in : in STD_LOGIC := '0'; 
	        reset : in STD_LOGIC := '0'; 
			 clk_out: out STD_LOGIC := '0';
			  N: in integer := 1
        );
	end component;
	
	component seven_segment_decoder is
	port (SW: in std_logic_vector (3 downto 0);
			HEX : out std_logic_vector (6 downto 0));
	end component;
	
	signal internal_clock: std_logic;
begin
	
	clock_div: Clk_divider 
		port map ( 	clk_in => MAX10_CLK1_50,
						reset => '0',
						clk_out => internal_clock,
						N => 2); -- N = Hz*2
	
	display: seven_segment_decoder 
		port map ( 	sw => (others => '0'),
						HEX => HEX0);
	
end blank_top_rtl;