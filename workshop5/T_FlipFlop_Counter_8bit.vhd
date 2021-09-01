library ieee;				
use ieee.std_logic_1164.all;


entity T_FlipFlop_Counter_8bit is
  
       port(  	ENABLE:	in std_logic;
					CLK:		in std_logic;
	            OUTPUT:	out STD_LOGIC_VECTOR(7 downto 0);
					CLEAR: 	in std_logic);
					
       end T_FlipFlop_Counter_8bit;
		 

architecture T_FlipFlop_Counter_8bit_rtl of T_FlipFlop_Counter_8bit is

	component T_Pos_FlipFlop_Async 
		port(  	T:	in std_logic;
	          CLK:	in std_logic;
	            Q:	out std_logic;
					RESET: in std_logic);
	end component;
	
	signal state: STD_LOGIC_VECTOR(7 downto 0) := "00000000";
	signal output_internal: STD_LOGIC_VECTOR(7 downto 0) := "00000000";
	
begin

	state(0) <= ENABLE;
	
	T_Pos_FlipFlop_Async_0: 
		T_Pos_FlipFlop_Async PORT MAP 
			(T => ENABLE, 
			CLK => CLK, 
			Q => output_internal(0), 
			RESET => CLEAR);
	
	state(1) <= state(0) AND output_internal(0);
	
	T_Pos_FlipFlop_Async_1: 
		T_Pos_FlipFlop_Async PORT MAP 
			(T => state(1), 
			CLK => CLK, 
			Q => output_internal(1), 
			RESET => CLEAR);
	
	state(2) <= state(1) AND output_internal(1);
	
	T_Pos_FlipFlop_Async_2: 
		T_Pos_FlipFlop_Async PORT MAP 
			(T => state(2), 
			CLK => CLK, 
			Q => output_internal(2), 
			RESET => CLEAR);
			
	state(3) <= state(2) AND output_internal(2);
	
	T_Pos_FlipFlop_Async_3: 
		T_Pos_FlipFlop_Async PORT MAP 
			(T => state(3), 
			CLK => CLK, 
			Q => output_internal(3), 
			RESET => CLEAR);
	
	state(4) <= state(3) AND output_internal(3);
	
	T_Pos_FlipFlop_Async_4: 
		T_Pos_FlipFlop_Async PORT MAP 
			(T => state(4), 
			CLK => CLK, 
			Q => output_internal(4), 
			RESET => CLEAR);
			
	state(5) <= state(4) AND output_internal(4);
			
	T_Pos_FlipFlop_Async_5: 
		T_Pos_FlipFlop_Async PORT MAP 
			(T => state(5), 
			CLK => CLK, 
			Q => output_internal(5), 
			RESET => CLEAR);
			
	state(6) <= state(5) AND output_internal(5);
			
	T_Pos_FlipFlop_Async_6: 
		T_Pos_FlipFlop_Async PORT MAP 
			(T => state(6), 
			CLK => CLK, 
			Q => output_internal(6), 
			RESET => CLEAR);
	
	state(7) <= state(6) AND output_internal(6);
			
	T_Pos_FlipFlop_Async_7: 
		T_Pos_FlipFlop_Async PORT MAP 
			(T => state(7), 
			CLK => CLK, 
			Q => output_internal(7), 
			RESET => CLEAR);
	
	OUTPUT <= output_internal;

end T_FlipFlop_Counter_8bit_rtl;
