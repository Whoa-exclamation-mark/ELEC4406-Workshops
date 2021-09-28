
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

use std.env.stop;
use std.env.finish;

ENTITY blank_tb IS
END blank_tb;

ARCHITECTURE blank_tb_rtl OF blank_tb IS
	
	signal CLK : std_logic;
	
	constant T: time := 50 ns;
	
BEGIN
	CLOCK:
		CLK <=  not CLK after T/2;

		
	--DUT:
	
	tb_proc: PROCESS
	BEGIN
		WAIT FOR T;
		
		-- do tests
		
		
		--automated testing (if needed) 
		-- ASSERT DATA_OUT /= (BIT_LENGTH-1 DOWNTO 3 => '0') & "011" REPORT "TEST 1 FAILED" SEVERITY FAILURE; -- note, warning, error
		
		
		stop;
		finish;
	END PROCESS;
END blank_tb_rtl;