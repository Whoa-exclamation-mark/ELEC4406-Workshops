library ieee;				
use ieee.std_logic_1164.all;


entity D_Pos_FlipFlop_tb is
end D_Pos_FlipFlop_tb;

architecture v1 of D_Pos_FlipFlop_tb is

	
	--Declare components
	component D_Pos_FlipFlop
          port( 	D:	in std_logic;
  	                CLK:	in std_logic;
	                 Q:	out std_logic );
          end component;
	
		--Declare signals

	signal D    : std_logic;
	signal CLK : std_logic;
	signal Q    : std_logic;
	constant T          :time := 50 ns;
	
begin
	--Instantiating devive under test (component of type Wk4_D_Pos_Latch) and connecting testbench signals with Wk4_D_Pos_Latch.vhd 

	DUT: D_Pos_FlipFlop PORT MAP (D  => D, CLK => CLK,  Q  => Q );

	main_process:

	process 
		-- Declarations here
	begin	
		-- Apply inputs once at a time	
		wait for T;

		--Initialise
		D     <= '0';
		CLK <= '0';
		
		wait for T;

		--Let's go
		D     <= '1';
		CLK <= '0';
		wait for T;

		D     <= '1';
		CLK <= '1';
		wait for T;

		D     <= '0';
		CLK <= '1';
		wait for T;

		D     <= '1';
		CLK <= '1';
		wait for T;

		D     <= '1';
		CLK <= '0';
		wait for T;

		D     <= '0';
		CLK <= '0';
		wait for T;

		D     <= '1';
		CLK <= '0';
		wait for T;

		D     <= '0';
		CLK <= '0';
		wait for T;

		D     <= '0';
		CLK <= '1';
		wait for T;

		D     <= '0';
		CLK <= '0';
		wait for T;

		D     <= '1';
		CLK <= '0';
		wait for T;

		D     <= '0';
		CLK <= '0';
		wait for T;

		--End of test is to wait forever
		wait;
	end process;
		
end v1;