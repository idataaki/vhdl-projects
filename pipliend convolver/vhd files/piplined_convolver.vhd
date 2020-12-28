library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.mypack.all;

entity piplined_convolver is
	port(clk: in std_logic;
		image : in row8;
		coefficient: in matrix;
		convolved: out std_logic_vector(15 downto 0));
end piplined_convolver;

architecture Behavioral of piplined_convolver is
--signals
signal PMA_result : row16;

---component
component PMA
	port(clk: in std_logic;
		coefficient : in row8;
		pixle: in std_logic_vector(7 downto 0);
		result : out std_logic_vector(15 downto 0));
end component;

component AdderTree_7to1
	port(clk: in std_logic;
		input: row16;
		result : out std_logic_vector(15 downto 0));
end component;

begin
	g: for i in 0 to 6 generate
		Upma : PMA port map(clk, coefficient(i), image(i), PMA_result(i));
	end generate;
	
	UadderTree : AdderTree_7to1 port map(clk, PMA_result, convolved);

end Behavioral;

