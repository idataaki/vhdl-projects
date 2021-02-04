library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priority_encoder_4x2 is
	port(r4 : in std_logic_vector(3 downto 0);
		code2 : out std_logic_vector(1 downto 0);
		act42 : out std_logic);
end priority_encoder_4x2;

architecture Behavioral of priority_encoder_4x2 is
begin
		code2 <= "00" when r4 = "0000" else
					"00" when r4 = "0001" else 
					"01" when r4(3 downto 1) = "001" else
					"10" when r4(3 downto 2) = "01" else
					"11" when r4(3) = '1';
					
		act42 <= '0' when r4 = "0000" else '1';


end Behavioral;

