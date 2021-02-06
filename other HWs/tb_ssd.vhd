--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:56:13 12/08/2020
-- Design Name:   
-- Module Name:   D:/University Semesters/Term5/CADhw5/tb_ssd.vhd
-- Project Name:  CADhw5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SSD_Driver
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ssd IS
END tb_ssd;
 
ARCHITECTURE behavior OF tb_ssd IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SSD_Driver
    PORT(
         count : IN  std_logic_vector(3 downto 0);
         ssd : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal count : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ssd : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SSD_Driver PORT MAP (
          count => count,
          ssd => ssd
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		count <= "0000";
		wait for 100 ns;
		count <= "001";
      wait;
   end process;

END;
