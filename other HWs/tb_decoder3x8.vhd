LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_decoder3x8 IS
END tb_decoder3x8;
 
ARCHITECTURE behavior OF tb_decoder3x8 IS 
  
    COMPONENT decoder3x8
    PORT(
         e : IN  std_logic;
         s : IN  std_logic_vector(2 downto 0);
         q : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal e : std_logic := '0';
   signal s : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic_vector(7 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder3x8 PORT MAP (
          e => e,
          s => s,
          q => q
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		e<='1';
		s<="000";
		wait for 100 ns;	
		e<='1';
		s<="001";
		wait for 100 ns;	
		e<='1';
		s<="010";
		wait for 100 ns;	
		e<='1';
		s<="011";
		wait for 100 ns;	
		e<='1';
		s<="100";
		wait for 100 ns;	
		e<='1';
		s<="101";
		wait for 100 ns;	
		e<='1';
		s<="110";
		wait for 100 ns;	
		e<='1';
		s<="111";
      wait;
   end process;

END;
