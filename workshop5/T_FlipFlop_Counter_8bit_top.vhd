library ieee;				
use ieee.std_logic_1164.all;


entity T_FlipFlop_Counter_8bit_top is
  
       port(  	ENABLE:	in std_logic;
					CLOCK:	in std_logic := '0';
	            HEX0:		out STD_LOGIC_VECTOR(6 downto 0);
					HEX1:		out STD_LOGIC_VECTOR(6 downto 0);
					CLEAR: 	in std_logic;
					HEARTBEAT: OUT STD_LOGIC);
					
       end T_FlipFlop_Counter_8bit_top;
		 
architecture T_FlipFlop_Counter_8bit_top_rtl of T_FlipFlop_Counter_8bit_top is	

	component T_FlipFlop_Counter_8bit 
		port(  	ENABLE:	in std_logic;
					CLK:		in std_logic;
	            OUTPUT:	out STD_LOGIC_VECTOR(7 downto 0);
					CLEAR: 	in std_logic);
	end component;
	
	component Clk_divider_to_1Hz
		Port ( 
	       clk_in : in STD_LOGIC; 
	        reset : in STD_LOGIC; 
			 clk_out: out STD_LOGIC 
        );
	end component;
	
	component seven_segment_decoder 	
		port (SW: in std_logic_vector (3 downto 0);
				HEX : out std_logic_vector (6 downto 0)
		);
	end component;
	
	signal OUTPUT: STD_LOGIC_VECTOR(7 downto 0);
	signal CLK: STD_LOGIC := '0';
	
begin
	
	Base_Clock: Clk_divider_to_1Hz PORT MAP (clk_in => CLOCK, reset => '0', clk_out => CLK); 
	
	HEARTBEAT <= CLK;
	
	T_FlipFlop_Counter_8bit_init: T_FlipFlop_Counter_8bit PORT MAP (ENABLE => ENABLE, CLK => CLK, OUTPUT => OUTPUT, CLEAR => NOT CLEAR);
	
	seven_segment_decoder_1: seven_segment_decoder PORT MAP (SW => OUTPUT(3 downto 0), HEX => HEX0);
	
	seven_segment_decoder_2: seven_segment_decoder PORT MAP (SW => OUTPUT(7 downto 4), HEX => HEX1);

end T_FlipFlop_Counter_8bit_top_rtl;
