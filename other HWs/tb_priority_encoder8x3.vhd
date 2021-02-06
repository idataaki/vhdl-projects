LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_priority_encoder8x3 IS
END tb_priority_encoder8x3;
 
ARCHITECTURE behavior OF tb_priority_encoder8x3 IS 
 
 
    COMPONENT priority_encoder8x3
    PORT(
         d : IN  std_logic_vector(7 downto 0);
         q : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic_vector(2 downto 0);
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: priority_encoder8x3 PORT MAP (
          d => d,
          q => q
        );

   -- Stimulus process
   stim_proc: process
   begin		
		d <= "00000001";
		
		wait for 100 ns;	
		d <= "00000010";
		wait for 100 ns;	
		d <= "00000011";
		
		wait for 100 ns;	
		d <= "00000100";
		wait for 100 ns;	
		d <= "00000101";
		
		wait for 100 ns;	
		d <= "00001000";
		wait for 100 ns;	
		d <= "00001010";
		
		wait for 100 ns;	
		d <= "00010000";
		wait for 100 ns;	
		d <= "00010101";
		
		wait for 100 ns;	
		d <= "00100000";
		wait for 100 ns;	
		d <= "00101010";
		
		wait for 100 ns;	
		d <= "01000000";
		wait for 100 ns;	
		d <= "01010101";
		
		wait for 100 ns;	
		d <= "10000000";
		wait for 100 ns;	
		d <= "10101010";
		
		wait for 100 ns;	
      wait;
   end process;

END;
