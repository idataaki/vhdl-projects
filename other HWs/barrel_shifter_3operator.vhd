library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity barrel_shifter_3operator is
	port(data_in : in std_logic_vector(7 downto 0);
		ch : in std_logic_vector(1 downto 0);
		count : in std_logic_vector(3 downto 0); --0 to 8, the time wi will shift
		data_out : out std_logic_vector(7 downto 0));
end barrel_shifter_3operator;


architecture Behavioral of barrel_shifter_3operator is
signal lsr, asr, r : std_logic_vector(7 downto 0);
signal u : std_logic;
begin
	-----------------logic shift right-----------------
	with count select
		lsr <= 		'0' & data_in(7 downto 1) when "0001",
						"00" & data_in(7 downto 2) when "0010",
						"000" & data_in(7 downto 3) when "0011",
						"0000" & data_in(7 downto 4) when "0100",
						"00000" & data_in(7 downto 5) when "0101",
						"000000" & data_in(7 downto 6) when "0110",
						"0000000" & data_in(7) when "0111",
						"00000000" when "1000",
						data_in when others;
						
	-----------------arithmatic shift right-------------
	u <= data_in(7);
	with count select
		asr <= 		u & data_in(7 downto 1) when "0001",
						u&u & data_in(7 downto 2) when "0010",
						u&u&u & data_in(7 downto 3) when "0011",
						u&u&u&u & data_in(7 downto 4) when "0100",
						u&u&u&u&u & data_in(7 downto 5) when "0101",
						u&u&u&u&u&u & data_in(7 downto 6) when "0110",
						u&u&u&u&u&u&u & data_in(7) when "0111",
						u&u&u&u&u&u&u&u when "1000",
						data_in when others;
						
	-----------------rotate-----------------------------
	with count select
		r <= 			data_in(0) & data_in(7 downto 1) when "0001",
						data_in(1 downto 0) & data_in(7 downto 2) when "0010",
						data_in(2 downto 0) & data_in(7 downto 3) when "0011",
						data_in(3 downto 0) & data_in(7 downto 4) when "0100",
						data_in(4 downto 0) & data_in(7 downto 5) when "0101",
						data_in(5 downto 0) & data_in(7 downto 6) when "0110",
						data_in(6 downto 0) & data_in(7) when "0111",
						data_in when others;
						
	with ch select
		data_out <= lsr when "00",
						asr when "01",
						r when "10",
						data_in when others;
	
end Behavioral;

