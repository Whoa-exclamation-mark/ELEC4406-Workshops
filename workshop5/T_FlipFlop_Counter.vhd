library ieee;				
use ieee.std_logic_1164.all;


entity T_FlipFlop_Counter is
		generic(bit_length : integer := 8);
       port(  	ENABLE:	in std_logic;
					CLK:		in std_logic;
	            OUTPUT:	out STD_LOGIC_VECTOR(bit_length-1 downto 0);
					CLEAR: 	in std_logic);
					
       end T_FlipFlop_Counter;
		 

architecture T_FlipFlop_Counter_rtl of T_FlipFlop_Counter is

	component T_Pos_FlipFlop_Async 
		port(  	T:	in std_logic;
	          CLK:	in std_logic;
	            Q:	out std_logic;
					RESET: in std_logic);
	end component;
	
	signal state: STD_LOGIC_VECTOR(bit_length-1 downto 0) := (others => '0');
	signal output_internal: STD_LOGIC_VECTOR(bit_length-1 downto 0) := (others => '0');
	
begin
	
	state(0) <= ENABLE;
	
	T_Pos_FlipFlop_Async_comp: 
		T_Pos_FlipFlop_Async PORT MAP 
			(T => ENABLE, 
			CLK => CLK, 
			Q => output_internal(0), 
			RESET => CLEAR);
			
	GEN_REG: 
   for I in 1 to bit_length-1 generate
		state(I) <= state(I-1) AND output_internal(I-1);
		
		T_Pos_FlipFlop_Async_comp: 
		T_Pos_FlipFlop_Async PORT MAP 
			(T => state(I), 
			CLK => CLK, 
			Q => output_internal(I), 
			RESET => CLEAR);
	end generate GEN_REG;

	OUTPUT <= output_internal;

end T_FlipFlop_Counter_rtl;
