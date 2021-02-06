library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder4x2 is
port( d : in STD_LOGIC_VECTOR(3 DOWNTO 0);
		q : out STD_LOGIC_VECTOR(1 DOWNTO 0));
end encoder4x2;

architecture Behavioral of encoder4x2 is

begin

process(d)
begin
 if (d="1000") then
	q <= "11";
 elsif (d="0100") then
	q <= "10";
 elsif (d="0010") then
	q <= "01";
 elsif (d="0001") then
	q <= "00";
 elsif (d="0000") then
	q <= "ZZ";
 end if;
end process;


end Behavioral;

