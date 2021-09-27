library ieee;				
use ieee.std_logic_1164.all;
use std.env.stop;
use std.env.finish;

entity counter_top_tb is

end counter_top_tb;

architecture counter_top_tb_rtl of counter_top_tb is
	component counter_top 
	port (
			SW: 			in std_logic_vector(1 downto 0);
			MAX10_CLK1_50:	in std_logic;
			KEY0:			in std_logic;
			HEX0:			out std_logic_vector(6 downto 0)
			);
	end component;
	
	signal SW: std_logic_vector(1 downto 0);
	signal MAX10_CLK1_50: std_logic := '0';
	signal KEY0: std_logic;
	signal HEX0: std_logic_vector(6 downto 0) := "0000000";
begin
	DUT: counter_top PORT MAP (
		SW => SW, 
		MAX10_CLK1_50 => MAX10_CLK1_50, 
		KEY0 => KEY0, 
		HEX0 => HEX0);
	
	CLOCK:
		MAX10_CLK1_50 <=  not MAX10_CLK1_50 after 10 ns;

	process begin
		SW <= "00";
		KEY0 <= '0';
		
		wait for 100 ns;
		
		KEY0 <= '1';
		
		wait for 40 ns;
		
		KEY0 <= '0';

		wait for 80 ns;
		
		SW <= "10";

		wait for 100 ns;

		SW <= "01";
		
		wait for 60 ns;
		
		SW <= "11";

		wait for 100 ns;

		KEY0 <= '1';

		wait for 100 ns;

		KEY0 <= '0';

		stop;
		finish;
	end process;
end counter_top_tb_rtl;
