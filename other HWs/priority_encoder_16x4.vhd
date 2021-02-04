library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priority_encoder_16x4 is
	port(r: in std_logic_vector(15 downto 0);
		code :out std_logic_vector(3 downto 0);
		active: out std_logic);
end priority_encoder_16x4;

architecture Behavioral of priority_encoder_16x4 is

signal act0, act1, act2, act3 : std_logic;
signal code_g0, code_g1, code_g2, code_g3, code_msb : std_logic_vector(1 downto 0);
signal r_u4 : std_logic_vector(3 downto 0);

-------component
component priority_encoder_4x2
	port(r4 : in std_logic_vector(3 downto 0);
		code2 : out std_logic_vector(1 downto 0);
		act42 : out std_logic);
end component;

begin
	u0 : priority_encoder_4x2 port map(r(3 downto 0), code_g0, act0);
	u1 : priority_encoder_4x2 port map(r(7 downto 4), code_g1, act1);
	u2 : priority_encoder_4x2 port map(r(11 downto 8), code_g2, act2);
	u3 : priority_encoder_4x2 port map(r(15 downto 12), code_g3, act3);
	
	r_u4 <= act3 & act2 & act1 & act0;
	u4 : priority_encoder_4x2 port map(r_u4 , code_msb, active);
	
	with code_msb select
		code <= code_g3 & code_msb when "00",
				code_g2 & code_msb when "01",
				code_g1 & code_msb when "10",
				code_g0 & code_msb when others;

end Behavioral;

