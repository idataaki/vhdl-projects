LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.mypack.all;
 
ENTITY tb_adderTree IS
END tb_adderTree;
 
ARCHITECTURE behavior OF tb_adderTree IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AdderTree_7to1
    PORT(
         clk : IN  std_logic;
         input : IN  row16;
         result : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal input : row16;

 	--Outputs
   signal result : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AdderTree_7to1 PORT MAP (
          clk => clk,
          input => input,
          result => result
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
		input <= ("0000000000000001","0000000000000001","0000000000000001","0000000000000001","0000000000000001",
		"0000000000000001","0000000000000001");
		
      wait;
   end process;

END;
