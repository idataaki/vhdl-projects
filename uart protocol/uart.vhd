library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uart is
port(clk: in std_logic;
	data_to_send: in std_logic_vector(9 downto 0);
	tx: out std_logic; --serial transmit
	rx: in std_logic; --serial receive
	received_data: out std_logic_vector(7 downto 0)); 
end uart;

architecture Behavioral of uart is

--register
signal reg: std_logic_vector(7 downto 0) := (others => '0');
signal t_reg: std_logic_vector(9 downto 0);

signal t_start, t_parity, t_stop : std_logic;
signal r_start, r_parity, r_stop : std_logic;

begin
	tranmit: process(clk)
	variable count: integer range 0 to 9 := 0; --0 is start | 1 is parity | 2 to 8 is data | 9 is stop
	begin
		if (rising_edge(clk))then
			if (count = 0)then
				t_start <= data_to_send(0);
				tx <= t_start;
				count := count +1;
			else if (count =1) then
					t_parity <= data_to_send(1);
					tx <= t_parity;
					count := count +1;
					else if(count = 9) then
								t_stop <= data_to_send(9);
								tx <= t_stop;
								count := 0;
							else
								tx <= data_to_send(count);
								count := count +1;
							end if;
					end if;
			end if;
		end if;
	end process;
	
	receive: process(clk)
	variable count: integer range 0 to 10 := 0; --0 is start | 1 is parity | 2 to 8 is data | 9 is stop
	begin
		if (rising_edge(clk))then
			--t_reg
			if (count = 0) then
				count := count + 1;
				else if (count = 1)then
					r_start <= rx;
					count := count +1;
				else if (count =2) then
						r_parity <= rx;
						--reg(0) <= r_parity;
						count := count +1;
						else if(count = 10) then
									r_stop <= rx;
									--count := 0;
								else
									reg(count - 2) <= rx;
									count := count +1;
								end if;
						end if;
				end if;
				received_data <= reg;
				--report "count " & integer'image(count);
			end if;
		end if;
	end process;
	
end Behavioral;

