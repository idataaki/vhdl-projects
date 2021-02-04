library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gray4bit is
port(b: in std_logic_vector(3 downto 0);
		g: out std_logic_vector(3 downto 0));
end gray4bit;

architecture Behavioral of gray4bit is

begin
	with b select
	g <=  "0000" when "0000",
			"0001" when "0001",
			"0011" when "0010",
			"0010" when "0011",
			"0110" when "0100",
			"0111" when "0101",
			"0101" when "0110",
			"0100" when "0111",
			"1100" when "1000",
			"1101" when "1001",
			"1111" when "1010",
			"1110" when "1011",
			"1010" when "1100",
			"1011" when "1101",
			"1001" when "1110",
			"1000" when "1111";

end Behavioral;

