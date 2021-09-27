library ieee;				
use ieee.std_logic_1164.all;

entity counter is
	port ( 	UP: in std_logic;
				RST: in std_logic;
				CLK: in std_logic;
				NUM: out std_logic_vector(1 downto 0));
	
end counter;

architecture counter_rtl of counter is 
	type state is (NUM0, NUM1, NUM2, NUM3);
	SIGNAL LS, NS: state := NUM0;
begin
	clk_proc: process (CLK, RST) begin
		if (CLK'event and CLK = '1') then
			LS <= NS;
		end if;
		if (RST = '1') then
			LS <= NUM0;
		end if;
	end process;
	
	comb_proc: process(NS, LS, UP) begin
		case (LS) is
			when NUM0 =>
				if (UP = '1') then
					NS <= NUM1;
				else
					NS <= NUM3;
				end if;
			when NUM1 =>
				if (UP = '1') then
					NS <= NUM2;
				else
					NS <= NUM0;
				end if;
			when NUM2 =>
				if (UP = '1') then
					NS <= NUM3;
				else
					NS <= NUM1;
				end if;
			when NUM3 =>
				if (UP = '1') then
					NS <= NUM0;
				else
					NS <= NUM2;
				end if;
			end case;
	end process;
	
	with LS select NUM <= 	"00" when NUM0,
									"01" when NUM1,
									"10" when NUM2,
									"11" when NUM3,
									"00" when others;
end counter_rtl;