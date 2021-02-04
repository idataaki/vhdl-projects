library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySelectAdder is
		port (a, b: in std_logic_vector(15 downto 0);
				cin: in std_logic;
				s: out std_logic_vector(15 downto 0);
				cout: out std_logic);
end CarrySelectAdder;

architecture Behavioral of CarrySelectAdder is
--signal
signal sum0, sum1: std_logic_vector(15 downto 0);
signal c0, c1: std_logic_vector(16 downto 0);

--components
component fulladder
port(x, y, cin: in std_logic;
		s, cout: out std_logic);
end component;

component mux2_1
	port(a, b, sel : in std_logic;
	z: out std_logic);
end component;

begin
	c0(0) <= '0';
	c1(0) <= '1';
	
	-- with carry 0
	g1: for i in 0 to 15 generate
		u_FA: fulladder port map(a(i), b(i), c0(i), sum0(i), c0(i+1));
	end generate;
	
	-- with carry 1
	g2: for i in 0 to 15 generate
		u_FA: fulladder port map(a(i), b(i), c1(i), sum1(i), c1(i+1));
	end generate;
	
	g3: for i in 0 to 15 generate
		u_mux: mux2_1 port map(sum0(i), sum1(i), cin, s(i));
	end generate;
	
	u_carry_mux: mux2_1 port map(c0(16), c1(16), cin, cout);
	
end Behavioral;

