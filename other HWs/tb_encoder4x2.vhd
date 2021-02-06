LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_encoder4x2 IS
END tb_encoder4x2;
 
ARCHITECTURE behavior OF tb_encoder4x2 IS 
 
 
    COMPONENT encoder4x2
    PORT(
         d : IN  std_logic_vector(3 downto 0);
         q : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: encoder4x2 PORT MAP (
          d => d,
          q => q
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		d<="1000";
		wait for 100 ns;	
		d<="0100";
		wait for 100 ns;	
      d<="0010";
		wait for 100 ns;	
		d<="0001";
		wait for 100 ns;	
		d<="0000";

      wait;
   end process;

END;
