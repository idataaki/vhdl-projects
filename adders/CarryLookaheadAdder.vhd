-- source : https://www.nandland.com/vhdl/modules/carry-lookahead-adder-vhdl.html
library ieee;
use ieee.std_logic_1164.all;
 
entity CarryLookaheadAdder is
  port (a, b: in std_logic_vector(15 downto 0);
		cin: in std_logic;
      s: out std_logic_vector(15 downto 0);
		cout: out std_logic);
end CarryLookaheadAdder;
 
 
architecture Behavioral of CarryLookaheadAdder is
 
component fulladder
port(x, y, cin: in std_logic;
		s, cout: out std_logic);
end component;
 
signal g : std_logic_vector(15 downto 0); -- Generate
signal p : std_logic_vector(15 downto 0); -- Propagate
signal c : std_logic_vector(16 downto 0);   -- Carry
 
signal sum  : std_logic_vector(15 downto 0);
 
begin
	
	c(0) <= cin;
	
	g1 : for i in 0 to 15 generate
		 u : fulladder port map ( x => a(i),
										  y => b(i),
										  cin => c(i),        
										  s => sum(i),
										  cout => open);
	end generate g1;
 
  -- Create the Generate (G) Terms:  Gi=Ai*Bi
  -- Create the Propagate Terms: Pi=Ai+Bi
  -- Create the Carry Terms:  
  g2 : for j in 0 to 15 generate
    g(j) <= a(j) and b(j);
    p(j) <= a(j) or b(j);
    c(j+1) <= g(j) or (p(j) and c(j));
  end generate g2;
 
  s <= sum;
  cout <= c(16);
   
end Behavioral;

