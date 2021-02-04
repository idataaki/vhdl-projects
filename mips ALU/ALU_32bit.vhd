library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_32bit is
	port(a, b: in std_logic_vector(31 downto 0);
	ALUctnrl: in std_logic_vector(2 downto 0);
	sub: in std_logic;
	R: out std_logic_vector(31 downto 0);
	zero: out std_logic);
end ALU_32bit;

architecture Behavioral of ALU_32bit is

signal carry, t_z: std_logic_vector(32 downto 0);
signal tempR: std_logic_vector(31 downto 0);

component ALU_1bit
	port(a, b, cin, sub: in std_logic;
	ctrl: in std_logic_vector(2 downto 0);
	R, cout: out std_logic);
end component;

begin
	carry(0) <= sub;
	g: for i in 0 to 31 generate
		u: ALU_1bit port map(a(i), b(i), carry(i), sub, ALUctnrl, tempR(i), carry(i+1));
		t_z(i+1) <= not (t_z(i) or tempR(i));
	end generate;
	R <= tempR;
	zero <= t_z(32);
--	zero <= tempR(0) nor tempR(1) nor tempR(2) nor tempR(3) nor tempR(4) nor tempR(5) nor 
--	tempR(6) nor tempR(7) nor tempR(8) nor tempR(9) nor tempR(10) nor
--	tempR(20) nor tempR(11) nor tempR(12) nor tempR(13) nor tempR(14) nor tempR(15) nor 
--	tempR(16) nor tempR(17) nor tempR(18) nor tempR(19) nor tempR(21) nor
--	tempR(30) nor tempR(31) nor tempR(22) nor tempR(23) nor tempR(24) nor 
--	tempR(25) nor tempR(26) nor tempR(27) nor tempR(28) nor tempR(29);
end Behavioral;

