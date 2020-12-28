library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
	port(input: in std_logic_vector(15 downto 0);
		clk: in std_logic;
		output: out std_logic_vector(15 downto 0));
end reg;

architecture Behavioral of reg is

begin
	process(clk) begin
		if(rising_edge(clk))then
			output <= input;
		end if;
	end process;

end Behavioral;

