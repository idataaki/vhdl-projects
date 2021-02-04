LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_watch_24h IS
END tb_watch_24h;
 
ARCHITECTURE behavior OF tb_watch_24h IS 
  
    COMPONENT Watch_24h
    PORT(
         clk : IN  std_logic;
         second_7seg_1 : OUT  std_logic_vector(6 downto 0);
         second_7seg_2 : OUT  std_logic_vector(6 downto 0);
         minute_7seg_1 : OUT  std_logic_vector(6 downto 0);
         minute_7seg_2 : OUT  std_logic_vector(6 downto 0);
         hour_7seg_1 : OUT  std_logic_vector(6 downto 0);
         hour_7seg_2 : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal second_7seg_1 : std_logic_vector(6 downto 0);
   signal second_7seg_2 : std_logic_vector(6 downto 0);
   signal minute_7seg_1 : std_logic_vector(6 downto 0);
   signal minute_7seg_2 : std_logic_vector(6 downto 0);
   signal hour_7seg_1 : std_logic_vector(6 downto 0);
   signal hour_7seg_2 : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Watch_24h PORT MAP (
          clk => clk,
          second_7seg_1 => second_7seg_1,
          second_7seg_2 => second_7seg_2,
          minute_7seg_1 => minute_7seg_1,
          minute_7seg_2 => minute_7seg_2,
          hour_7seg_1 => hour_7seg_1,
          hour_7seg_2 => hour_7seg_2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait;
   end process;

END;
