LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.mypack.all;
 
ENTITY tb_top IS
END tb_top;
 
ARCHITECTURE behavior OF tb_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT non_piplined_convolver
    PORT(
         image : IN  matrix;
         coefficient : IN  matrix;
         convolved : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal image : matrix;
   signal coefficient : matrix;

 	--Outputs
   signal convolved : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: non_piplined_convolver PORT MAP (
          image => image,
          coefficient => coefficient,
          convolved => convolved
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		for i in 0 to 6 loop
			for j in 0 to 6 loop
			image(i)(j) <= "00000001";
			coefficient(i)(j) <= "00000001";
			end loop;
		end loop;
		wait for 1000 ns;
		
		for i in 0 to 6 loop
			for j in 0 to 6 loop
			image(i)(j) <= "00000001";
			coefficient(i)(j) <= "00000010";
			end loop;
		end loop;
		wait for 1000 ns;
		
		
		for i in 0 to 6 loop
			for j in 0 to 6 loop
			image(i)(j) <= "10000000";
			coefficient(i)(j) <= "10000000";
			end loop;
		end loop;
		wait for 1000 ns;
		
      wait;
   end process;

END;
