library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity multiplier is
	port(a, b : in std_logic_vector(3 downto 0);
			p : out  std_logic_vector(7 downto 0));
end multiplier;

architecture Behavioral of multiplier is
begin
	process(a, b) 
	variable pv, bp: std_logic_vector(7 downto 0);
	begin
	pv := "00000000";
	bp := "0000" & b;
	
	for i in 0 to 3 loop
		if(a(i) = '1') then
			pv := pv + bp;
		end if;
		bp := bp(6 downto 0) & '0';
	end loop;
	p <= pv;
	end process;

end Behavioral;

