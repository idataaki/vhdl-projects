library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder16 is
	port(x, y: in std_logic_vector(15 downto 0);
		cin: in std_logic;
		s : out std_logic_vector(15 downto 0);
		cout : out std_logic);
end adder16;

architecture Behavioral of adder16 is

signal tmp_cout : std_logic_vector(0 to 16);

component fulladder
port(x, y, cin: in std_logic;
		s, cout: out std_logic);
end component;

begin
	
	tmp_cout(0) <= '0';
	
	l: for i in 0 to 15 generate
		u: fulladder port map(x(i), y(i), tmp_cout(i), s(i), tmp_cout(i+1));
	end generate;
	
	cout <= tmp_cout(16);

end Behavioral;

