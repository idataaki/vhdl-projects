library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_1bit is
	port(a, b, cin, sub: in std_logic;
	ctrl: in std_logic_vector(2 downto 0);
	R, cout: out std_logic);
end ALU_1bit;

architecture Behavioral of ALU_1bit is

signal sum, b_sign: std_logic;

component fulladder
port(x, y, cin: in std_logic;
		s, cout: out std_logic);
end component;

begin
	b_sign <= sub xor b;
	u: fulladder port map(a, b_sign, cin, sum, cout);
	with ctrl select
		R <=  a and b when "000",
				a or b when "001",
				a xor b when "010",
				a nor b when "100",
				sum when "101",
				'0' when others;

end Behavioral;

