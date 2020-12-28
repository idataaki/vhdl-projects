LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.mypack.all;
 
ENTITY tb_adderTree IS
END tb_adderTree;
 
ARCHITECTURE behavior OF tb_adderTree IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AdderTreeUnit_49to1
    PORT(
         pixles : IN  line;
         result : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pixles : line;

 	--Outputs
   signal result : std_logic_vector(15 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AdderTreeUnit_49to1 PORT MAP (
          pixles => pixles,
          result => result
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
      wait for 100 ns;
		for i in 0 to 48 loop
			pixles(i) <= "0000000000000001";
		end loop;
--		pixles <= ("0000000000000001","00000001","00000001","00000001","00000001","00000001","00000001",
--		"00000001","00000001","00000001","00000001","00000001","00000001","00000001",
--		"00000001","00000001","00000001","00000001","00000001","00000001","00000001",
--		"00000001","00000001","00000001","00000001","00000001","00000001","00000001",
--		"00000001","00000001","00000001","00000001","00000001","00000001","00000001",
--		"00000001","00000001","00000001","00000001","00000001","00000001","00000001",
--		"00000001","00000001","00000001","00000001","00000001","00000001","00000001");

      -- insert stimulus here 

      wait;
   end process;

END;
