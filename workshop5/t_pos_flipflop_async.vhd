library ieee;				
use ieee.std_logic_1164.all;


entity T_Pos_FlipFlop_Async is
  
       port(  	T:	in std_logic;
	          CLK:	in std_logic;
	            Q:	out std_logic;
					RESET: in std_logic);
					
       end T_Pos_FlipFlop_Async;

architecture T_Pos_FlipFlop_Async_rtl of T_Pos_FlipFlop_Async is
	component D_Pos_FlipFlop_Async 
		port(  	D:	in std_logic;
	          CLK:	in std_logic;
	            Q:	out std_logic;
					RESET: in std_logic);
	end component;
begin
	
	D_FlipFlop: D_Pos_FlipFlop_Async PORT MAP ( D => T XOR Q, CLK => CLK, Q=>Q, RESET => RESET);
	
	
end T_Pos_FlipFlop_Async_rtl;