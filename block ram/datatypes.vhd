library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package datatypes is
	type ram is array (1023 downto 0) of std_logic_vector (7 downto 0);
end datatypes;