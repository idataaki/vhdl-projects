library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_mod10 is
 port(clk: in std_logic;
		count: out std_logic_vector(3 downto 0));
end counter_mod10;

architecture Behavioral of counter_mod10 is
signal qbar, a, b, c, d, and_1, and_2, nand_gate : std_logic;
signal count2 : std_logic_vector(3 downto 0);

component JK_FF
	port( J,K,clk, rst: in std_logic;
	Q, QB: out std_logic);
end component;

begin
	 -- -- next state logic
	 and_1 <= a and b;
	 and_2 <= a and b and c;
	 nand_gate <= not(b and d);
	 
	FF1 : JK_FF port map('1', '1', clk, nand_gate, a, qbar);
	FF2 : JK_FF port map(a, a, clk, nand_gate, b, qbar);
	FF3 : JK_FF port map(and_1, and_1, clk, nand_gate, c, qbar);
	FF4 : JK_FF port map(and_2, and_2, clk, nand_gate, d, qbar);
	 
	 -- -- sequential
	
	 -- --Moore output logic
	 count <= d & c & b & a;


end Behavioral;

