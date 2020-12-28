library IEEE;
use IEEE.STD_LOGIC_1164.all;

package mypack is
	--sum
	type array_25 is array(0 to 24) of std_logic_vector(15 downto 0);
	type array_13 is array(0 to 12) of std_logic_vector(15 downto 0);
	type array_7 is array(0 to 6) of std_logic_vector(15 downto 0);
	type array_4 is array(0 to 3) of std_logic_vector(15 downto 0);
	type array_2 is array(0 to 1) of std_logic_vector(15 downto 0);
	
	type row8 is array (0 to 6) of std_logic_vector(7 downto 0);
	type row16 is array (0 to 6) of std_logic_vector(15 downto 0);
	type seven_row is array (0 to 6) of row16;
	type line is array (0 to 48) of std_logic_vector(15 downto 0);
	type matrix is array (0 to 6) of row8;
end mypack;

--package body mypack is
 
--end mypack;
