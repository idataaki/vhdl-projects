library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder is
port(x, y, cin: in std_logic;
		s, cout: out std_logic);
end fulladder;

architecture Behavioral of fulladder is

begin

	s <= x xor y xor cin;
	cout <= (x and y) or (cin and x) or (cin and y);

end Behavioral;

