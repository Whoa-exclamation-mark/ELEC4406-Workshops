library ieee;				
use ieee.std_logic_1164.all;


  entity D_Pos_FlipFlop_Sync is
  
       port(  	D:	in std_logic;
	          CLK:	in std_logic;
	            Q:	out std_logic;
					RESET: in std_logic);
					
       end D_Pos_FlipFlop_Sync;

architecture v1 of D_Pos_FlipFlop_Sync is
begin
	process(D,CLK,RESET)
	begin
		if (CLK='1') and CLK'EVENT then
			Q <= D;
			if RESET = '1' then
				Q <= '0';
			end if;
		end if;
		
		-- The absence of an else will result in a latching behviour
	end process;
end v1;