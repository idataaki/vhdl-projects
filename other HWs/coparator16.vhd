library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity coparator16 is
port(a : in std_logic_vector(15 downto 0);
	b : in std_logic_vector(15 downto 0);
	a_greater : out std_logic;
	a_less : out std_logic;
	ab_equal :out std_logic);
end coparator16;


architecture Behavioral of coparator16 is
signal equal: std_logic_vector(15 downto 0);
begin
	--a_greater <= '1' when a > b else '0';
	--a_less <= '1' when a< b else '0';
	--equal <= '1' when a = b else '0';
	
	a_greater <= '1' when a(15) > b(15) else '0';
	a_less <= '1' when a(15) < b(15) else '0';
	equal(15) <= '1' when a(15) = b(15) else '0';
	
	a_greater <= '1' when equal(15) = '1' and a(14) > b(14) else '0';
	a_less <= '1' when equal(15) = '1' and a(14) < b(14) else '0';
	equal(14) <= '1' when equal(15) = '1' and a(14) = b(14) else '0';
	
	a_greater <= '1' when equal(14) = '1' and a(13) > b(13) else '0';
	a_less <= '1' when equal(14) = '1' and a(13) < b(13) else '0';
	equal(13) <= '1' when equal(14) = '1' and a(13) = b(13) else '0';
	
	a_greater <= '1' when equal(13) = '1' and a(12) > b(12) else '0';
	a_less <= '1' when equal(13) = '1' and a(12) < b(12) else '0';
	equal(12) <= '1' when equal(13) = '1' and a(12) = b(12) else '0';
	
	a_greater <= '1' when equal(12) = '1' and a(11) > b(11) else '0';
	a_less <= '1' when equal(12) = '1' and a(11) < b(11) else '0';
	equal(11) <= '1' when equal(12) = '1' and a(11) = b(11) else '0';
	
	a_greater <= '1' when equal(11) = '1' and a(10) > b(10) else '0';
	a_less <= '1' when equal(11) = '1' and a(10) < b(10) else '0';
	equal(10) <= '1' when equal(11) = '1' and a(10) = b(10) else '0';
	
	a_greater <= '1' when equal(10) = '1' and a(9) > b(9) else '0';
	a_less <= '1' when equal(10) = '1' and a(9) < b(9) else '0';
	equal(9) <= '1' when equal(10) = '1' and a(9) = b(9) else '0';
	
	a_greater <= '1' when equal(9) = '1' and a(8) > b(8) else '0';
	a_less <= '1' when equal(9) = '1' and a(8) < b(8) else '0';
	equal(8) <= '1' when equal(9) = '1' and a(8) = b(8) else '0';
	
	a_greater <= '1' when equal(8) = '1' and a(7) > b(7) else '0';
	a_less <= '1' when equal(8) = '1' and a(7) < b(7) else '0';
	equal(7) <= '1' when equal(8) = '1' and a(7) = b(7) else '0';
	
	a_greater <= '1' when equal(7) = '1' and a(6) > b(6) else '0';
	a_less <= '1' when equal(7) = '1' and a(6) < b(6) else '0';
	equal(6) <= '1' when equal(7) = '1' and a(6) = b(6) else '0';
	
	a_greater <= '1' when equal(6) = '1' and a(5) > b(5) else '0';
	a_less <= '1' when equal(6) = '1' and a(5) < b(5) else '0';
	equal(5) <= '1' when equal(6) = '1' and a(5) = b(5) else '0';
	
	a_greater <= '1' when equal(5) = '1' and a(4) > b(4) else '0';
	a_less <= '1' when equal(5) = '1' and a(4) < b(4) else '0';
	equal(4) <= '1' when equal(5) = '1' and a(4) = b(4) else '0';
	
	a_greater <= '1' when equal(4) = '1' and a(3) > b(3) else '0';
	a_less <= '1' when equal(4) = '1' and a(3) < b(3) else '0';
	equal(3) <= '1' when equal(4) = '1' and a(3) = b(3) else '0';
	
	a_greater <= '1' when equal(3) = '1' and a(2) > b(2) else '0';
	a_less <= '1' when equal(3) = '1' and a(2) < b(2) else '0';
	equal(2) <= '1' when equal(3) = '1' and a(2) = b(2) else '0';
	
	a_greater <= '1' when equal(2) = '1' and a(1) > b(1) else '0';
	a_less <= '1' when equal(2) = '1' and a(1) < b(1) else '0';
	equal(1) <= '1' when equal(2) = '1' and a(1) = b(1) else '0';
	
	a_greater <= '1' when equal(1) = '1' and a(0) > b(0) else '0';
	a_less <= '1' when equal(1) = '1' and a(0) < b(0) else '0';
	equal(0) <= '1' when equal(1) = '1' and a(0) = b(0) else '0';
	
	ab_equal <= equal(0);
	
end Behavioral;

