library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
 
entity JK_FF is
	port( J,K,clk, rst: in std_logic;
	Q, QB: out std_logic);
end JK_FF;
 
Architecture behavioral of JK_FF is
begin
	PROCESS(clk, rst)
	variable tmp: std_logic := '0';
	begin
		if (rst = '0') then
			Q <= '0';
			QB <= '0';
		end if;
		
		if(clk='1' and clk'event) then
			if(J='0' and K='0')then
				tmp := tmp;
				elsif(J='1' and K='1') then
					tmp := not tmp;
				elsif(J='0' and K='1') then
					tmp := '0';
				else
					tmp := '1';
			end if;
		end if;
		Q <= tmp;
		QB <= not tmp;
	end PROCESS;
end behavioral;
