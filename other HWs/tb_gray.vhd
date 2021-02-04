LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_gray IS
END tb_gray;
 
ARCHITECTURE behavior OF tb_gray IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gray4bit
    PORT(
         b : IN  std_logic_vector(3 downto 0);
         g : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal g : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gray4bit PORT MAP (
          b => b,
          g => g
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		b <= "0000";
		
		wait for 100 ns;	
		b <= "0100";
		
		wait for 100 ns;	
		b <= "0010";
		
		wait for 100 ns;	
		b <= "0110";
		
		wait for 100 ns;	
		b <= "1000";
		
		wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
