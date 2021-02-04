LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_pulse_generator_b IS
END tb_pulse_generator_b;
 
ARCHITECTURE behavior OF tb_pulse_generator_b IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pulse_generator_b
    PORT(
         clk : IN  std_logic;
         ena : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ena : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pulse_generator_b PORT MAP (
          clk => clk,
          ena => ena,
          output => output
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
      ena <= '1';
      wait;
   end process;

END;
