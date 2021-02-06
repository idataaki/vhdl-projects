library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder3x8 is
Port (e : in STD_LOGIC; 
		s : in STD_LOGIC_VECTOR (2 downto 0);
		q : out STD_LOGIC_VECTOR (7 downto 0));
end decoder3x8;

architecture Behavioral of decoder3x8 is
begin
	process(s)
	begin
		if(e='1') then
			if (s="000")then
				q<="00000001";
			elsif (s="001")then
				q<="00000010";
			elsif (s="010")then
				q<="00000100";
			elsif (s="011")then
				q<="00001000";
			elsif (s="100")then
				q<="00010000";
			elsif (s="101")then
				q<="00100000";
			elsif (s="110")then
				q<="01000000";
			elsif (s="111")then
				q<="10000000";
			else q<="00000000";
			end if;
		else q<= "00000000";
		end if;
	end process;
end Behavioral;
