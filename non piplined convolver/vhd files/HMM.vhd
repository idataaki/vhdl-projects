library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.mypack.all;

entity HMM is
	port(coefficients : in row8; -- array of std_logic_Vector 8 bit
		pixles : in row8;
		result : out row16);
end HMM;

architecture Behavioral of HMM is

component mul_8x8
	port(a, b : in std_logic_vector(7 downto 0);
			p : out  std_logic_vector(15 downto 0));
end component;

begin
	l: for i in 0 to 6 generate
		u: mul_8x8 port map (coefficients(i), pixles(i), result(i));
	end generate;
end Behavioral;

