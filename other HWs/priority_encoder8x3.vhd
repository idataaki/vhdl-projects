library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priority_encoder8x3 is
port( d : in STD_LOGIC_VECTOR(7 DOWNTO 0);
		q : out STD_LOGIC_VECTOR(2 DOWNTO 0));
end priority_encoder8x3;

architecture Behavioral of priority_encoder8x3 is
begin
	process(d) begin
		if (d = "00000001") then
			q <= "000";
		elsif(d(7) = '0' and d(6) = '0' and d(5) = '0' and d(4) = '0' and d(3) = '0' and d(2) = '0' and d(1) = '1') then
			q <= "001";
		elsif(d(7) = '0' and d(6) = '0' and d(5) = '0' and d(4) = '0' and d(3) = '0' and d(2) = '1') then
			q <= "010";
		elsif(d(7) = '0' and d(6) = '0' and d(5) = '0' and d(4) = '0' and d(3) = '1') then
			q <= "011";
		elsif(d(7) = '0' and d(6) = '0' and d(5) = '0' and d(4) = '1') then
			q <= "100";
		elsif(d(7) = '0' and d(6) = '0' and d(5) = '1') then
			q <= "101";
		elsif(d(7) = '0' and d(6) = '1') then
			q <= "110";
		elsif(d(7) = '1') then
			q <= "111";
		end if;
	end process;

end Behavioral;

