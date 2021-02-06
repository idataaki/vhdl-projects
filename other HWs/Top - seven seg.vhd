library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top is
	PORT( ena, clk, rst : in std_logic;
			full_count : out std_logic;
			ssd1, ssd2 : out std_logic_vector(6 downto 0));
end Top;
---------------------------------------------------------
architecture Behavioral of Top is
---------------------------------------------------------
signal count2      : std_logic_vector(2 downto 0);
signal count2_4bit : std_logic_vector(3 downto 0);
signal count1      : std_logic_vector(3 downto 0);
---------------------------------------------------------
component SSD_Driver 
	PORT( count : in std_logic_vector(3 downto 0);
			ssd : out std_logic_vector(6 downto 0));
end component;

component Counter
	--GENERIC(fclk : integer := 1_000_000); --1MHz
	GENERIC(fclk : integer := 4); --THIS IS JUST FOR SHOWING IN DIAGRAM
	PORT( ena, clk, rst : in std_logic;
			full_count : out std_logic;
			count1 : out std_logic_vector(3 downto 0); --0 to 10
			count2 : out std_logic_vector(2 downto 0)); --0 to 6
end component;
---------------------------------------------------------
begin

	counter_unit : Counter port map(ena, clk, rst, full_count, count1, count2);
	ssd_driver_1: SSD_Driver port map(count1, ssd1);
	count2_4bit <= ('0'&count2);
	ssd_driver_2: SSD_Driver port map(count2_4bit, ssd2);

end Behavioral;

