library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.DataTypes.all;

entity blockram is
port (clk : in std_logic;
        in_ram : in ram;
        mode : in std_logic_vector (1 downto 0); -- swap : 00 | sum : 01 | find_values : 10
        out_ram : out ram);
end blockram;

architecture Behavioral of blockram is

type state is (start, swap, sum, check_values, done);
signal present_state : state := start;
signal next_state : state;
signal temp_ram : ram;

signal counter : integer range 0 to 1024 := 0;
signal checked_counter : integer range 0 to 255 := 0;
signal sum_value : integer := 0;
begin
    -- lower section of state machine
    process (clk)
    begin
        if (clk'event and clk = '0') then
            present_state <= next_state;
        end if;
    
    -- upper section of state machine
		 case present_state is
				when start =>
					 if (mode = "00") then
						  next_state <= swap;
					 elsif (mode = "01") then
						  next_state <= sum;
					 else
						  next_state <= check_values;
					 end if;
				when swap =>
					 if (counter >= 1024) then
						  --counter <= 0;
						  next_state <= done;
					 else --if (clk = '1') then --so it swap it once a clk
						  temp_ram(counter) <= in_ram(counter + 1);
						  temp_ram(counter + 1) <= in_ram(counter);
						  counter <= counter + 2;
					 end if;
				when sum =>
					 if (counter >= 1024) then
						  temp_ram(0) <= std_logic_vector(to_unsigned(sum_value, 8));
						  next_state <= done;
					 else
						  sum_value <= sum_value + to_integer(unsigned(in_ram(counter)));
						  counter <= counter + 1;
					 end if;
				when check_values =>
					 if (counter >= 1024) then
						  temp_ram(1023) <= std_logic_vector(to_unsigned(checked_counter, 8));
						  next_state <= done;
					 elsif (in_ram(0) = in_ram(counter)) then
								checked_counter <= checked_counter + 1;
					 end if;
					 counter <= counter + 1;
				when done => 
					out_ram <= temp_ram;
					counter <= 0;
					next_state <= start;
       end case;
    end process;

end Behavioral;