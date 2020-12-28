library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity mul_8x8 is
	port(a, b : in std_logic_vector(7 downto 0);
			p : out  std_logic_vector(15 downto 0));
end mul_8x8;

architecture Behavioral of mul_8x8 is
begin
	process(a, b) 
	variable pv, bp: std_logic_vector(15 downto 0);
	begin
		pv := "0000000000000000";
		bp := "00000000" & b;
		
		for i in 0 to 7 loop
			if(a(i) = '1') then
				pv := pv + bp;
			end if;
			bp := bp(14 downto 0) & '0';
		end loop;
		p <= pv;
	end process;
end Behavioral;

