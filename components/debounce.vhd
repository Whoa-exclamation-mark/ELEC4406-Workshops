library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity debounce is port(
	clock : in std_logic;
	button : in std_logic;
	debounced : buffer std_logic);
end debounce;

architecture behaviour of debounce is
	signal count : std_logic_vector(4 downto 0);
	signal done, counting : std_logic;
begin
	process begin
		wait until rising_edge(clock);
		if (done = '1' and button = '1') then
			debounced <= '0';
		elsif (button ='0') then
			debounced <= '1';
		end if;
	end process;
	
	process begin
		wait until rising_edge(clock);
		if (done = '1') then
			count <= "000";
		elsif (debounced = '1') then
			count <= count + 1;
		end if;
	end process;
	
	done <= '1' when count = "111" else '0';
end behaviour;
