LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_mul IS
END tb_mul;
 
ARCHITECTURE behavior OF tb_mul IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mul_8x8
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         p : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal p : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mul_8x8 PORT MAP (
          a => a,
          b => b,
          p => p
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		a <= "10000000";
		b <= "10000000";
      wait for 100 ns;	

      wait;
   end process;

END;
