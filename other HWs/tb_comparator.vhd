LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_comparator IS
END tb_comparator;
 
ARCHITECTURE behavior OF tb_comparator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT coparator16
    PORT(
         a : IN  std_logic_vector(15 downto 0);
         b : IN  std_logic_vector(15 downto 0);
         a_greater : OUT  std_logic;
         a_less : OUT  std_logic;
         ab_equal : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal a_greater : std_logic;
   signal a_less : std_logic;
   signal ab_equal : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: coparator16 PORT MAP (
          a => a,
          b => b,
          a_greater => a_greater,
          a_less => a_less,
          ab_equal => ab_equal
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		a <= "0101010101010101";
		b <= "0101010101010101";
      wait for 100 ns;
		
		a <= "1000000000000000";
		b <= "0100000000000000";
      wait for 100 ns;
		
		a <= "0100000000000000";
		b <= "1000000000000000";
      wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
