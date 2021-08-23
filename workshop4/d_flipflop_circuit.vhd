library ieee;				
use ieee.std_logic_1164.all;


entity D_FlipFlop_Circuit is
  
       port(  	D:	in std_logic;
	          CLK:	in std_logic;
	            Qa:out std_logic; 
					Qb:out std_logic;
					Qc:out std_logic );
					
end D_FlipFlop_Circuit;
  

architecture D_FlipFlop_Circuit_str of D_FlipFlop_Circuit is

	--Declare components
	component D_Pos_FlipFlop
          port( 	D:	in std_logic;
  	                CLK:	in std_logic;
	                 Q:	out std_logic );
          end component;
	
	component D_Pos_Latch
          port( 	D:	in std_logic;
  	                CLK:	in std_logic;
	                 Q:	out std_logic );
          end component;
	
	component D_Neg_FlipFlop
          port( 	D:	in std_logic;
  	                CLK:	in std_logic;
	                 Q:	out std_logic );
          end component;

begin
	DUT1: D_Pos_FlipFlop PORT MAP (D  => D, CLK => CLK,  Q  => Qb );
	DUT2: D_Pos_Latch PORT MAP 	(D  => D, CLK => CLK,  Q  => Qa );
	DUT3: D_Neg_FlipFlop PORT MAP (D  => D, CLK => CLK,  Q  => Qc );

end D_FlipFlop_Circuit_str;

architecture D_FlipFlop_Circuit_beh of D_FlipFlop_Circuit is

begin
	process(D,CLK)
	begin
		if (CLK='0') and CLK'EVENT then
			Qc <= D;
		end if;
		
		if (CLK='1') and CLK'EVENT then
			Qb <= D;
		end if;
		
		if (CLK='1') then
			Qa <= D;
		end if;
		
	end process;

end D_FlipFlop_Circuit_beh;