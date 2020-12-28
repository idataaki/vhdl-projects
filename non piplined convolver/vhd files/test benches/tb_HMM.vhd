LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.mypack.all;
 
ENTITY tb_HMM IS
END tb_HMM;
 
ARCHITECTURE behavior OF tb_HMM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HMM
    PORT(
         coefficients : IN  row8;
         pixles : IN  row8;
         result : OUT  row16
        );
    END COMPONENT;
    

   --Inputs
   signal coefficients : row8;
   signal pixles : row8;

 	--Outputs
   signal result : row16;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HMM PORT MAP (
          coefficients => coefficients,
          pixles => pixles,
          result => result
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		coefficients <= ("00000010","00000010","00000010","00000010","00000010","00000010","00000010");
		pixles <= ("00000010","00000010","00000010","00000010","00000010","00000010","00000010");
      wait;
   end process;

END;
