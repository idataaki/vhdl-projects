library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity mux2_1 is
	port(a, b, sel : in STD_LOGIC;
	z: out STD_LOGIC);
end mux2_1;
 
architecture Behavioral of mux2_1 is
begin
--	with sel select
--		z <= a when '0',
--			  b when '1';
	process(A,B,Sel)
	begin
		if sel = '0' then
			z <= a;
		else
			z <= b;
		end if;
	end process;

end Behavioral;
