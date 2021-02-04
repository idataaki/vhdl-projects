LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
 
ENTITY tb_RippleAdder IS
END tb_RippleAdder;
 
ARCHITECTURE behavior OF tb_RippleAdder IS 
 
    COMPONENT CarryRippleAdder
    PORT(
         x : IN  std_logic_vector(15 downto 0);
         y : IN  std_logic_vector(15 downto 0);
         cin : IN  std_logic;
         s : OUT  std_logic_vector(15 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(15 downto 0) := (others => '0');
   signal y : std_logic_vector(15 downto 0) := (0 => '1', others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal s : std_logic_vector(15 downto 0);
   signal cout : std_logic;
	
	--temp
	signal step: std_logic_vector(15 downto 0) := "0001100110011001"; --6553 decimal
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarryRippleAdder PORT MAP (
          x => x,
          y => y,
          cin => cin,
          s => s,
          cout => cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      for i in 0 to 10 loop
			x <= x + step;
			y <= y + step;
			wait for 100 ns;
		end loop;
		
      wait;
   end process;

END;
