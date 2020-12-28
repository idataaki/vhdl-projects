library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.mypack.all;

entity AdderTreeUnit_49to1 is
	port(pixles : in line;
		result : out std_logic_vector(15 downto 0));
end AdderTreeUnit_49to1;

architecture Behavioral of AdderTreeUnit_49to1 is

signal sum1: array_25;
signal sum2: array_13;		
signal sum3: array_7;		
signal sum4: array_4;		
signal sum5: array_2;
signal uCout, uCin : std_logic;

component adder16
	port(x, y: in std_logic_vector(15 downto 0);
		cin: in std_logic;
		s : out std_logic_vector(15 downto 0);
		cout : out std_logic);
end component;

begin
	--stage 1
	uCin <= '0';
	l1: for i in 0 to 23 generate
		u1: adder16 port map(pixles(2*i), pixles((2*i)+1), uCin, sum1(i), uCout);
		uCin <= uCout;
	end generate;
	sum1(24) <= pixles(48);
	
	--stage 2
	l2: for i in 0 to 11 generate
		u2: adder16 port map(sum1(2*i), sum1((2*i)+1), uCin, sum2(i), uCout);
		uCin <= uCout;
	end generate;
	sum2(12)<= sum1(24);
	
	--stage 3
	l3: for i in 0 to 5 generate
		u3: adder16 port map(sum2(2*i), sum2((2*i)+1), uCin, sum3(i), uCout);
	end generate;
	sum3(6) <= sum2(12);
	
	--stage 4
	l4: for i in 0 to 2 generate
		u4: adder16 port map(sum3(2*i), sum3((2*i)+1), uCin, sum4(i), uCout);
	end generate;
	sum4(3) <= sum3(6);
	
	--stage 5
	l5: for i in 0 to 1 generate
		u5: adder16 port map(sum4(2*i), sum4((2*i)+1), uCin, sum5(i), uCout);
	end generate;
	
	--stage 6
	u6: adder16 port map(sum5(0), sum5(1), uCin, result, uCout);
	
end Behavioral;	

