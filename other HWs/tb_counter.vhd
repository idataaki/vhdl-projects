LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_counter IS
END tb_counter;
 
ARCHITECTURE behavior OF tb_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter
    PORT(
         ena : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         full_count : OUT  std_logic;
         count1 : OUT  std_logic_vector(3 downto 0);
         count2 : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ena : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal full_count : std_logic;
   signal count1 : std_logic_vector(3 downto 0);
   signal count2 : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter PORT MAP (
          ena => ena,
          clk => clk,
          rst => rst,
          full_count => full_count,
          count1 => count1,
          count2 => count2
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
      -- hold reset state for 100 ns.
		ena <= '1';
      wait for 8000 ns;
		ena <= '0';
		wait for 1000 ns;
		ena <= '1';

      --wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
