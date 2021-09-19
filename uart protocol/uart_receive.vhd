library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uart_receive is
port(clk: in std_logic;
	  rx: in std_logic; --serial receive
	  received_data: out std_logic_vector(7 downto 0));
end uart_receive;

architecture Behavioral of uart_receive is

signal reg: std_logic_vector(7 downto 0);
signal r_start, r_parity, r_stop : std_logic;

begin

	receive: process(clk)
	variable count: integer range 0 to 9 := 0; --0 is start | 1 is parity | 2 to 8 is data | 9 is stop
	begin
		if (rising_edge(clk))then
			if (count = 0)then
				r_start <= rx;
				count := count +1;
			else if (count =1) then
					r_parity <= rx;
					reg(0) <= t_parity;
					count := count +1;
					else if(count = 9) then
								r_stop <= rx;
								count := 0;
							else
								reg(count - 1) <= rx;
								count := count +1;
							end if;
					end if;
			end if;
			received_data <= reg;
		end if;
	end process;

end Behavioral;

