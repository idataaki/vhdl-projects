library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pulse_generator_b is
	port(clk : in std_logic;
		ena: in std_logic;
		output: out std_logic);
end pulse_generator_b;

architecture Behavioral of pulse_generator_b is
type state is (one, two, three, four);
signal pre: state := one;
signal nxt: state;
begin

	p1: process(clk, ena) 
	variable count: integer range 0 to 100;
	begin
		
		--UPPER
		if (rising_edge(clk))then
			pre <= nxt;
		end if;
		
		-- LOWER
		case pre is
			when one =>
				output <= '0';
				count := count+1;
				if (count = 12)then
					nxt <= two;
					count := 0;
				else nxt <= one;
				end if;
			when two =>
				output <= '1';
				count := count+1;
				if (count = 16)then
					nxt <= three;
					count := 0;
				else nxt <= two;
				end if;
			when three =>
				output <= '0';
				count := count+1;
				if (count = 20)then
					nxt <= four;
					count := 0;
				else nxt <= three;
				end if;
			when four =>
				output <= '1';
				count := count+1;
				if (count = 8)then
					nxt <= one;
					count := 0;
				else nxt <= four;
				end if;
		end case;
	end process p1;

end Behavioral;

