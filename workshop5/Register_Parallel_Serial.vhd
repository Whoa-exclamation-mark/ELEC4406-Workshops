library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
  
entity Register_Parallel_Serial is
  generic(bit_length : integer := 4);
	 Port ( 
	       DATA : in STD_LOGIC_VECTOR (bit_length-1 downto 0); 
	       reset : in STD_LOGIC; 
			 PLOAD: in STD_LOGIC;
			 S_RIGHT: in STD_LOGIC;
			 S_IN: in STD_LOGIC;
			 CLK: in STD_LOGIC;
			 Q: out STD_LOGIC_VECTOR (bit_length-1 downto 0)
        );
end Register_Parallel_Serial;

architecture Register_Parallel_Serial_rtl of Register_Parallel_Serial is 
	signal state: STD_LOGIC_VECTOR (bit_length-1 downto 0);
begin 
	process (reset, CLK) begin
		if rising_edge(CLK) then
			if (reset = '1') then 
				state <= (others => '0');
			else
				if (PLOAD = '1') then
					state <= DATA;
				elsif (S_RIGHT = '1') then
					state <= '0' & state(bit_length-1 downto 1);
					state(bit_length-1) <= S_IN;
				end if;
			end if;
		end if;
	end process;
	
	Q <= state;

end Register_Parallel_Serial_rtl;