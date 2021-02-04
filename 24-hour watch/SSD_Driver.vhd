library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SSD_Driver is
	PORT( count : in std_logic_vector(3 downto 0);
			ssd : out std_logic_vector(6 downto 0));
end SSD_Driver;

architecture Behavioral of SSD_Driver is
begin
		with count select
			ssd <= "0000001" when "0000",
					 "1001111" when "0001", 
					 "0010010" when "0010",
					 "0000110" when "0011",
					 "1001100" when "0100",
					 "0100100" when "0101",
					 "0100000" when "0110",
					 "0001111" when "0111",
					 "0000000" when "1000",
					 "0000100" when "1001",
					 "0110000" when others; --"E"
end Behavioral;