library ieee;				
use ieee.std_logic_1164.all;
use std.env.stop;
use std.env.finish;

entity Register_Parallel_Serial_tb is
end Register_Parallel_Serial_tb;

architecture v1 of Register_Parallel_Serial_tb is

	
	--Declare components
	component Register_Parallel_Serial
          port( 	
			 DATA : in STD_LOGIC_VECTOR (3 downto 0); 
	       reset : in STD_LOGIC; 
			 PLOAD: in STD_LOGIC;
			 S_RIGHT: in STD_LOGIC;
			 S_IN: in STD_LOGIC;
			 CLK: in STD_LOGIC;
			 Q: out STD_LOGIC_VECTOR (3 downto 0)
			 );
          end component;
	
		--Declare signals

		signal DATA :  STD_LOGIC_VECTOR (3 downto 0); 
	   signal reset :  STD_LOGIC; 
		signal PLOAD:  STD_LOGIC;
		signal S_RIGHT:  STD_LOGIC;
		signal S_IN:  STD_LOGIC;
		signal CLK:  STD_LOGIC := '0';
		signal Q:  STD_LOGIC_VECTOR (3 downto 0);
		constant T          :time := 100 ns;
	
begin
	
	DUT: Register_Parallel_Serial PORT MAP (DATA, reset, PLOAD, S_RIGHT, S_IN, CLK, Q);
	
	CLOCK:
		CLK <=  not CLK after 20 ns;
	
	process 
	begin
			DATA <= "0000";
			reset <= '0';
			PLOAD <= '0';
			S_RIGHT <= '0';
			S_IN <= '0';
			
			wait for T;
			
			DATA <= "0101";
			reset <= '1';
			PLOAD <= '1';
			S_RIGHT <= '0';
			S_IN <= '0';
			
			wait for T;
			
			DATA <= "0000";
			reset <= '1';
			PLOAD <= '0';
			S_RIGHT <= '0';
			S_IN <= '0';
			
			wait for T;
			
			DATA <= "1011";
			reset <= '1';
			PLOAD <= '1';
			S_RIGHT <= '0';
			S_IN <= '0';
			
			wait for T;
			
			DATA <= "0110";
			reset <= '1';
			PLOAD <= '0';
			S_RIGHT <= '0';
			S_IN <= '0';
			
			wait for T;
			
			DATA <= "0110";
			reset <= '0';
			PLOAD <= '1';
			S_RIGHT <= '0';
			S_IN <= '0';
			
			wait for T;
			
			DATA <= "0110";
			reset <= '1';
			PLOAD <= '1';
			S_RIGHT <= '0';
			S_IN <= '0';
			
			wait for T;
			
			DATA <= "0000";
			reset <= '1';
			PLOAD <= '0';
			S_RIGHT <= '0';
			S_IN <= '0';
			
			wait for T;
			
			DATA <= "0000";
			reset <= '1';
			PLOAD <= '0';
			S_RIGHT <= '0';
			S_IN <= '1';
			
			wait for T;
			
			DATA <= "0000";
			reset <= '1';
			PLOAD <= '0';
			S_RIGHT <= '1';
			S_IN <= '1';
			
			wait for T;
			
			DATA <= "0000";
			reset <= '1';
			PLOAD <= '0';
			S_RIGHT <= '1';
			S_IN <= '0';
			
			wait for T;
			
			DATA <= "0000";
			reset <= '1';
			PLOAD <= '0';
			S_RIGHT <= '1';
			S_IN <= '1';
			
			wait for T;
			
			DATA <= "1001";
			reset <= '1';
			PLOAD <= '1';
			S_RIGHT <= '1';
			S_IN <= '1';
			
			wait for T;
			
			DATA <= "1001";
			reset <= '0';
			PLOAD <= '1';
			S_RIGHT <= '1';
			S_IN <= '1';
			
			wait for T;
			
			DATA <= "1001";
			reset <= '1';
			PLOAD <= '0';
			S_RIGHT <= '0';
			S_IN <= '0';
			
			wait for T;
			
			--wait;
			stop;
			finish;
	end process;

end v1;