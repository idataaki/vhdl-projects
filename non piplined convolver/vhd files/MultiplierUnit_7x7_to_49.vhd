library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.mypack.all;

entity MultiplierUnit_7x7_to_49 is
	port(image : in matrix;
		coefficient : in matrix;
		result : out line);
end MultiplierUnit_7x7_to_49;

architecture Behavioral of MultiplierUnit_7x7_to_49 is
-- signals
signal row : row16;
signal tmp_result : seven_row;
--component
component HMM
	port(coefficients : in row8;
		pixles : in row8;
		result : out row16);
end component;
--behave
begin

	l : for i in 0 to 6 generate
		u : HMM port map(coefficient(i), image(i), row);
		tmp_result(i) <= row;
	end generate;
	
	g1: for i in 0 to 6 generate
		g2: for j in 0 to 6 generate
			result((7*i)+j) <= tmp_result(i)(j);
		end generate;
	end generate;

end Behavioral;

