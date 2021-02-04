LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_mul IS
END tb_mul;
 
ARCHITECTURE behavior OF tb_mul IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplier
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         p : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal p : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplier PORT MAP (
          a => a,
          b => b,
          p => p
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		a <= "0001";
		b <= "0001";
		for i in 0 to 4 loop
			for j in 0 to 4 loop
				wait for 100 ns;
				b <= b(2 downto 0) & '0';
			end loop;
			a <= a(2 downto 0) & '0';
			b <= "0001";
		end loop;	
      -- insert stimulus here 

      wait;
   end process;

END;
