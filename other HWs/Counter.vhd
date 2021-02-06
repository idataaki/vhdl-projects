library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity Counter is
	--GENERIC(fclk : integer := 1_000_000); --1MHz
	GENERIC(fclk : integer := 4); --THIS IS JUST FOR SHOWING IN DIAGRAM
	PORT( ena, clk, rst : in std_logic;
			full_count : out std_logic;
			count1 : out std_logic_vector(3 downto 0); --0 to 10
			count2 : out std_logic_vector(2 downto 0)); --0 to 6
end Counter;

architecture Behavioral of Counter is
begin
	process--(clk, rst)
		variable fclk_counter : integer range 0 to fclk := 0;
		variable first_counter : integer range 0 to 10 := 0;
		variable sec_counter : integer range 0 to 6 := 0;
	begin
		
		if (rst = '1') then
				fclk_counter := 0;
				first_counter := 0;
				sec_counter := 0;
		end if;
		-----------------------------------------------------
		if (ena = '1') then
		-----------------------------------------------------
			if (clk'event and clk = '1')then
				
				--count1 <= conv_std_logic_vector(first_counter, 4);
				--count2 <= conv_std_logic_vector(sec_counter, 3);
				if (sec_counter < 6)then
					fclk_counter := fclk_counter +1;
					
					if (fclk_counter = fclk)then
						fclk_counter := 0;
						first_counter := first_counter +1;
						
						if (first_counter = 10)then
							first_counter := 0;
							sec_counter := sec_counter +1;
							
							if (sec_counter = 6 )then
								full_count <= '1';
							end if;
						end if;
					end if;
				end if;
				count1 <= conv_std_logic_vector(first_counter, 4);
				count2 <= conv_std_logic_vector(sec_counter, 3);
			end if;
		end if;
		
		wait on clk, rst, ena;
	end process;
end Behavioral;

