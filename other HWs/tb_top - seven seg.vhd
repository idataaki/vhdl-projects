LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_top IS
END tb_top;
 
ARCHITECTURE behavior OF tb_top IS 
 
    COMPONENT Top
    PORT(
         ena : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         full_count : OUT  std_logic;
         ssd1 : OUT  std_logic_vector(6 downto 0);
         ssd2 : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ena : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal full_count : std_logic;
   signal ssd1 : std_logic_vector(6 downto 0);
   signal ssd2 : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top PORT MAP (
          ena => ena,
          clk => clk,
          rst => rst,
          full_count => full_count,
          ssd1 => ssd1,
          ssd2 => ssd2
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
      wait for 100 ns;
			
		ena <= '1';
		wait for 80 ns;
		ena <= '0';
		wait for 40 ns;
		ena <= '1';
		rst <= '1';
		wait for 40 ns;
		ena <= '1';
		rst <= '0';
      wait for clk_period*10;
		
      -- insert stimulus here 

      wait;
   end process;

END;
