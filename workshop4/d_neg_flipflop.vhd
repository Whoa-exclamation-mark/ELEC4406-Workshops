library ieee;				
use ieee.std_logic_1164.all;


  entity D_Neg_FlipFlop is
  
       port(  	D:	in std_logic;
	          CLK:	in std_logic;
	            Q:	out std_logic   );
					
       end D_Neg_FlipFlop;

architecture v1 of D_Neg_FlipFlop is
begin
	process(D,CLK)
	begin
		if (CLK='0') and CLK'EVENT then
			Q <= D;
		end if;
		-- The absence of an else will result in a latching behviour
	end process;
end v1;