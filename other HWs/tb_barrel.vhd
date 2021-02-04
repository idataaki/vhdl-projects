LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_barrel IS
END tb_barrel;
 
ARCHITECTURE behavior OF tb_barrel IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT barrel_shifter_3operator
    PORT(
         data_in : IN  std_logic_vector(7 downto 0);
         ch : IN  std_logic_vector(1 downto 0);
         count : IN  std_logic_vector(3 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal ch : std_logic_vector(1 downto 0) := (others => '0');
   signal count : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: barrel_shifter_3operator PORT MAP (
          data_in => data_in,
          ch => ch,
          count => count,
          data_out => data_out
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		data_in <= "11001100";
		ch <= "00";
		count <= "0010";
      wait for 100 ns;	
		
		data_in <= "11001100";
		ch <= "01";
		count <= "0010";
      wait for 100 ns;
		
		data_in <= "11001100";
		ch <= "10";
		count <= "0010";
      wait for 100 ns;	
	

      wait;
   end process;

END;
