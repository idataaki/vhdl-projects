library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity Watch_24h is
	port(clk: in std_logic;
		  second_7seg_1: out std_logic_Vector(6 downto 0);
		  second_7seg_2: out std_logic_Vector(6 downto 0);
		  minute_7seg_1: out std_logic_Vector(6 downto 0);
		  minute_7seg_2: out std_logic_Vector(6 downto 0);
		  hour_7seg_1: out std_logic_Vector(6 downto 0);
		  hour_7seg_2: out std_logic_Vector(6 downto 0)); --1hz
end Watch_24h;

architecture Behavioral of Watch_24h is
--signal
signal s1, s2, m1, m2, h1, h2: std_logic_vector(3 downto 0);

--component
component SSD_Driver
	PORT( count : in std_logic_vector(3 downto 0);
			ssd : out std_logic_vector(6 downto 0));
end component;
begin

	-- 7 segment drivers
	sec_driver1: SSD_Driver port map(s1, second_7seg_1);
	sec_driver2: SSD_Driver port map(s2, second_7seg_2);
	
	min_driver1: SSD_Driver port map(m1, minute_7seg_1);
	min_driver2: SSD_Driver port map(m2, minute_7seg_2);
	
	h_driver1: SSD_Driver port map(h1, hour_7seg_1);
	h_driver2: SSD_Driver port map(h2, hour_7seg_2);

	process(clk)
	variable sec_counter, min_counter: integer range 0 to 60 := 0;
	variable hour_counter: integer range 0 to 24 := 0;
	
	variable r, q: integer range 0 to 9 := 0;
	begin
		if(rising_edge(clk))then
			sec_counter := sec_counter + 1;
			if(sec_counter = 60)then
				sec_counter := 0;
				min_counter := min_counter + 1;
				if(min_counter = 60)then
					min_counter := 0;
					hour_counter := hour_counter + 1;
					if(hour_counter = 24)then
						hour_counter := 0;
					end if;
				end if;
			end if;
		end if;
		
		-- calculating the digits to show on 7seg
		q := sec_counter / 10;
		r := sec_counter mod 10;
		s1 <= conv_std_logic_vector(q, 4);
		s2 <= conv_std_logic_vector(r, 4);
		
		q := min_counter / 10;
		r := min_counter mod 10;
		m1 <= conv_std_logic_vector(q, 4);
		m2 <= conv_std_logic_vector(r, 4);
		
		q := hour_counter / 10;
		r := hour_counter mod 10;
		h1 <= conv_std_logic_vector(q, 4);
		h2 <= conv_std_logic_vector(r, 4);
		
	end process;
end Behavioral;

