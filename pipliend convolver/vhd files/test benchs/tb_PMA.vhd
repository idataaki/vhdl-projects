LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.mypack.all;
 
ENTITY tb_PMA IS
END tb_PMA;
 
ARCHITECTURE behavior OF tb_PMA IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PMA
    PORT(
         clk : IN  std_logic;
         coefficient : IN  row8;
         pixle : IN  std_logic_vector(7 downto 0);
         result : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal coefficient : row8;
   signal pixle : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PMA PORT MAP (
          clk => clk,
          coefficient => coefficient,
          pixle => pixle,
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
		coefficient <= ("00000001","00000001","00000001","00000001","00000001","00000001","00000001");
		pixle <= "00000010";
      wait for clk_period*10;

      

      wait;
   end process;

END;
