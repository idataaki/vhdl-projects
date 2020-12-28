library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work. mypack.all;

entity AdderTree_7to1 is
	port(clk: in std_logic;
		input: row16;
		result : out std_logic_vector(15 downto 0));
end AdderTree_7to1;

architecture Behavioral of AdderTree_7to1 is
--signals
signal s1, sr1:array_4;
signal s2, sr2:array_2;
signal uCin, uCout: std_logic;

--component
component adder16
	port(x, y: in std_logic_vector(15 downto 0);
		cin: in std_logic;
		s : out std_logic_vector(15 downto 0);
		cout : out std_logic);
end component;
component reg
	port(input: in std_logic_vector(15 downto 0);
		clk: in std_logic;
		output: out std_logic_vector(15 downto 0));
end component;

begin
	--stage 7 to 4
	uCin <= '0';
	g1: for i in 0 to 2 generate
		a1: adder16 port map(input(2*i), input((2*i)+1), uCin, s1(i), uCout);
		r1: reg port map(s1(i), clk, sr1(i));
		uCin <= uCout;
	end generate;
	s1(3) <= input(6);
	rf : reg port map(s1(3), clk, sr1(3));
	
	--stage 4 to 2
	g2: for i in 0 to 1 generate
		a2: adder16 port map(sr1(2*i), sr1((2*i)+1), uCin, s2(i), uCout);
		r2: reg port map(s2(i), clk, sr2(i));
	end generate;
	
	--stage 2 to 1
	a3: adder16 port map(sr2(0), sr2(1), uCin, result, uCout);
	
end Behavioral;

