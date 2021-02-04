library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

entity programmable_adder_A is
	port(clk: in std_logic;
		start: std_logic;
		count: in std_logic_vector(7 downto 0);
		data: in std_logic_vector(7 downto 0);
		end1: out std_logic;
		sum: out std_logic_vector(15 downto 0));
end programmable_adder_A;

architecture Behavioral of programmable_adder_A is
type state is (input, adder, output);
signal pre:state := input;
signal nxt: state;

signal temp_count: integer range 0 to 255 := 0;
signal i: integer range 0 to 255 := 0;
signal temp_sum: integer range 0 to 65535 := 0;

begin
	process(clk)
	begin
		--LOWER
		end1 <= '0';
		if(rising_edge(clk))then
			
			if (start = '1') then
				pre <= input;
			else
				pre <= nxt;
			end if;
		end if;
		
		--UPPER
		case pre is
			when input =>
				sum <= (others => '0');
				temp_count <= conv_integer(count); -- SAVE COUNT
				if (start'event and start = '0')then
					nxt <= adder; -- NEXT STATE WHEN SRART IS OFF
				end if;
			when adder =>
				sum <= (others => '0');
				if (i = temp_count)then
					nxt <= output;
				elsif (clk = '0') then -- to increas i once a clk
					temp_sum <= conv_integer(data) + temp_sum; -- CAST TO INTEGER
					i <=  i + 1;
				end if;
			when output =>
				end1 <= '1';
				sum <= conv_std_logic_vector(temp_sum, 16); -- CAST TO VECTOR
				nxt <= input;
		end case;
		
	end process;

end Behavioral;

