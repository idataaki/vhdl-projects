library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
port(  clk: in std_logic;
		 send_from_1_to_2: in std_logic_vector(9 downto 0);
		 send_from_2_to_1: in std_logic_vector(9 downto 0);
		 received_1: out std_logic_vector(7 downto 0);
		 received_2: out std_logic_vector(7 downto 0));
end top;

architecture Behavioral of top is

signal tx1_to_rx2: std_logic;
signal tx2_to_rx1: std_logic;


component uart
port(clk: in std_logic;
	data_to_send: in std_logic_vector(9 downto 0);
	tx: out std_logic;
	rx: in std_logic;
	received_data: out std_logic_vector(7 downto 0)); 
end component;


begin
	uart1: uart port map (clk, send_from_1_to_2, tx1_to_rx2, tx2_to_rx1, received_1);
	uart2: uart port map (clk, send_from_2_to_1, tx2_to_rx1, tx1_to_rx2, received_2);

end Behavioral;

