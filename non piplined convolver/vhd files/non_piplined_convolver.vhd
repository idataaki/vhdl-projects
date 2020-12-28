library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.mypack.all;

entity non_piplined_convolver is
	port(image : in matrix;
		coefficient : in matrix;
		convolved : out std_logic_vector(15 downto 0));
end non_piplined_convolver;

architecture Behavioral of non_piplined_convolver is
--signals
signal pixles : line;

--components
component MultiplierUnit_7x7_to_49
	port(image : in matrix;
		coefficient : in matrix;
		result : out line);
end component;
component AdderTreeUnit_49to1
	port(pixles : in line;
		result : out std_logic_vector(15 downto 0));
end component;

begin
	MultiplierUnit: MultiplierUnit_7x7_to_49 port map(image, coefficient, pixles);
	AdderTreeUnit: AdderTreeUnit_49to1 port map(pixles, convolved);

end Behavioral;

