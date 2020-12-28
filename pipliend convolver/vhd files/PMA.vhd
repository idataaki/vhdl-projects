library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.mypack.all;

entity PMA is
	port(clk: in std_logic;
		coefficient : in row8;
		pixle: in std_logic_vector(7 downto 0);
		result : out std_logic_vector(15 downto 0));
end PMA;

architecture Behavioral of PMA is
--signal
signal mul_result, reg_up_out, reg_down_out, adder_out : row16;
signal uCin, uCout: std_logic;
--signal adder_out : std_logic_vector(15 downto 0);
--components
component reg
	port(input: in std_logic_vector(15 downto 0);
		clk: in std_logic;
		output: out std_logic_vector(15 downto 0));
end component;

component mul_8x8
	port(a, b : in std_logic_vector(7 downto 0);
			p : out  std_logic_vector(15 downto 0));
end component;

component adder16
	port(x, y: in std_logic_vector(15 downto 0);
		cin: in std_logic;
		s : out std_logic_vector(15 downto 0);
		cout : out std_logic);
end component;

begin

	--multiplier
	g1: for i in 0 to 6 generate
		m: mul_8x8 port map(pixle, coefficient(i), mul_result(i));
		rup: reg port map(mul_result(i), clk, reg_up_out(i));
	end generate;
	rf: reg port map(reg_up_out(0), clk, reg_down_out(0));
	
	uCin <= '0';
	g2: for i in 0 to 5 generate
		a: adder16 port map(reg_down_out(i), reg_up_out(i+1),uCin, adder_out(i), uCout);
		rdown: reg port map(adder_out(i), clk, reg_down_out(i+1));
		uCin <= uCout;
	end generate;
	
	result <= reg_down_out(6);

end Behavioral;

