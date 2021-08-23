library ieee;				
use ieee.std_logic_1164.all;


entity D_FlipFlop_Circuit_tb is
end D_FlipFlop_Circuit_tb;

architecture v1 of D_FlipFlop_Circuit_tb is

	
	--Declare components
	component D_FlipFlop_Circuit is
  
       port(  	D:	in std_logic;
	          CLK:	in std_logic;
	            Qa:out std_logic; 
					Qb:out std_logic;
					Qc:out std_logic );
					
       end component;
	
		--Declare signals

	signal D    			: std_logic;
	signal CLK 				: std_logic;
	signal Qa    			: std_logic;
	signal Qb    			: std_logic;
	signal Qc    			: std_logic;
	constant T         	: time := 50 ns;
	
begin
	--Instantiating devive under test (component of type Wk4_D_Pos_Latch) and connecting testbench signals with Wk4_D_Pos_Latch.vhd 

	DUT: D_FlipFlop_Circuit PORT MAP (D  => D, CLK => CLK,  Qa  => Qa,	Qb  => Qb,	Qc  => Qc  );

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

configuration conf of D_FlipFlop_Circuit_tb is
	for v1
		for DUT: D_FlipFlop_Circuit
			use entity work.D_FlipFlop_Circuit(D_FlipFlop_Circuit_str);
		end for;
	end for;
end conf;