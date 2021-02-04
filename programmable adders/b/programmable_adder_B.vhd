library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

entity programmable_adder_B is
	port(clk: in std_logic;
		start: std_logic;
		count: in std_logic_vector(7 downto 0);
		data: in std_logic_vector(7 downto 0);
		end1: out std_logic;
		sum: out std_logic_vector(15 downto 0));
end programmable_adder_B;

architecture Behavioral of programmable_adder_B is
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
			pre <= nxt;
		end if;
		if (rising_edge(start)) then
			pre <= input;
		end if;
		
		--UPPER
		case pre is
			when input =>
				sum <= (others => '0');
				if (count = "00000000") then
					nxt <= adder;
				else
					temp_count <= conv_integer(count); -- SAVE COUNT
				end if;
				
			when adder =>
				sum <= (others => '0');
				if (i = temp_count)then
					nxt <= output;
				elsif (clk = '0') then -- so it doesnt sample each data twice
					temp_sum <= conv_integer(data) + temp_sum;
					i <=  i + 1;
				end if;
			when output =>
				end1 <= '1';
				sum <= conv_std_logic_vector(temp_sum, 16);
				temp_sum <= 0; -- when it goes back to input but start is still off => calculates the sum again
				i <= 0;
				temp_count <= 0;
				if (rising_edge(start)) then
					nxt <= input; --start adding again when on rising edge od start
				end if;
		end case;
		
	end process;
end Behavioral;

