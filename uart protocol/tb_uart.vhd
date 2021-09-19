LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_uart IS
END tb_uart;
 
ARCHITECTURE behavior OF tb_uart IS 
 
    COMPONENT top
    PORT(
         clk : IN  std_logic;
         send_from_1_to_2 : IN  std_logic_vector(9 downto 0);
         send_from_2_to_1 : IN  std_logic_vector(9 downto 0);
         received_1 : OUT  std_logic_vector(7 downto 0);
         received_2 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal send_from_1_to_2 : std_logic_vector(9 downto 0) := (others => '0');
   signal send_from_2_to_1 : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal received_1 : std_logic_vector(7 downto 0);
   signal received_2 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          clk => clk,
          send_from_1_to_2 => send_from_1_to_2,
          send_from_2_to_1 => send_from_2_to_1,
          received_1 => received_1,
          received_2 => received_2
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
      send_from_1_to_2 <= "0111111100";
      send_from_2_to_1 <= "0101010101";
		wait;
   end process;

END;
