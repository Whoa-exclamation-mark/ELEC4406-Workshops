library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
  
  
entity Clk_divider_to_1Hz is
  generic(Freq_in : integer := 50000000); -- 50MHz clock on DE-10 Lite FPGA board
	 Port ( 
	       clk_in : in STD_LOGIC; 
	        reset : in STD_LOGIC; 
			 clk_out: out STD_LOGIC
			  
        );
end Clk_divider_to_1Hz;
	
	
architecture Behav of Clk_divider_to_1Hz is 
	    signal temp: STD_LOGIC := '0';
     signal counter : integer := 0; 
		 constant N : integer:=512;  
begin 
	frequency_divider: process (reset, clk_in) 
		begin 
			if (reset = '1') then
				temp <= '0';
            counter <= 0;
         elsif rising_edge(clk_in) then
				if (counter = Freq_in/N) then 
					temp <= NOT(temp); 
					counter <= 0;
            else
					counter <= counter + 1; 
            end if;
         end if; 
		end process;
	clk_out <= temp; 
end Behav;