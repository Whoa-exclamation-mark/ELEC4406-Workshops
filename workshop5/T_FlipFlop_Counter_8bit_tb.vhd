library ieee;				
use ieee.std_logic_1164.all;
use std.env.stop;
use std.env.finish;

entity T_FlipFlop_Counter_8bit_tb is
end T_FlipFlop_Counter_8bit_tb;

architecture v1 of T_FlipFlop_Counter_8bit_tb is

	component T_FlipFlop_Counter_8bit
  
       port(  	ENABLE:	in std_logic;
					CLK:		in std_logic;
	            OUTPUT:	out STD_LOGIC_VECTOR(7 downto 0);
					CLEAR: 	in std_logic);
					
       end component;
		 
	
	signal ENABLE: std_logic := '0';
	signal CLK:		std_logic := '0';
	signal OUTPUT:	STD_LOGIC_VECTOR(7 downto 0) := "00000000";
	signal CLEAR: 	std_logic := '0';

begin
	
	DUT: T_FlipFlop_Counter_8bit PORT MAP (ENABLE => ENABLE, CLK => CLK, OUTPUT => OUTPUT, CLEAR => CLEAR);
	
	CLOCK:
		CLK <=  not CLK after 20 ns;
	
	process begin
		
		ENABLE <= '0';
		CLEAR <= '0';
		
		wait for 20ns;
		
		ENABLE <= '1';
		CLEAR <= '0';
		
		wait for 1000ns;
		
		ENABLE <= '0';
		CLEAR <= '1';
		
		wait for 20ns;
		
		ENABLE <= '1';
		CLEAR <= '1';
		
		wait for 60ns;
		
		stop;
		finish;
		
	end process;

end v1;