library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
  
  
entity blank_fsm is
	port 
		( 
			CLK : IN STD_LOGIC;
			RESET: IN STD_LOGIC;
			Z1, Z2 : IN STD_LOGIC;
			Y1, Y2: OUT STD_LOGIC;
			state_out : out STD_LOGIC(1 downto 0)
       );
end blank_fsm;
	
	
architecture blank_fsm_rtl of blank_fsm is 
	type state is (state1, state2, state3, state4);
	-- attribute ENUM_ENCODING: STRING;
	-- attribute ENUM_ENCODING of state: type is "00 01 10 11";
	signal LS, NS : state := state1;
	
	attribute syn_encoding: string;
	attribute syn_encoding of state: type is "one-hot"; -- default sequential gray johnson safe (user defined)
begin 

	sync_proc: process (CLK, RESET)
	begin
		if(CLK'event and CLK = '1') then -- and CLK = '0'
			-- sync reset
			if (RESET = '1') then
				NS <= state1;
			end if;
			NS <= LS;
		end if;
		-- async reset
		--if (RESET = '1') then
		--		NS <= state1;
		--end if;
	end process;
	
	comb_proc: process (LS, NS)
	begin
		Y1 <= '0';
		Y2 <= '0';
		case (LS) is
			when state1 =>
				-- moore
				Y2 <= '1';
				if(X1 = '0') then
					NS <= state3;
					-- mealy
					Y1 <= '1';
				elsif (X2 = '1') then
					NS <= state2;
					Y1 <= '0';
				else
					NS <= state3;
					Y1 <= '1';
				end if;
			when state2 =>
				Y2 <= '0';
			when state3 =>
				Y2 <= '1';
			when state4 =>
				Y2 <= '1';
			when others =>
				NS <= state1;
		end case;
	end process;
	
	with LS select state_out <=
		"00" when state1,
		"01" when state2,
		"10" when state3,
		"11" when state4,
		"00" when others;
	
end blank_fsm_rtl;
