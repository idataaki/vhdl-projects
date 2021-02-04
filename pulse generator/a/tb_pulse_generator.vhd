--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:25:51 01/05/2021
-- Design Name:   
-- Module Name:   D:/University Semesters/Term5/CAD/projects/project_2/tb_pulse_generator.vhd
-- Project Name:  project_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pulse_generator
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
 
ENTITY tb_pulse_generator IS
END tb_pulse_generator;
 
ARCHITECTURE behavior OF tb_pulse_generator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pulse_generator
    PORT(
         clk : IN  std_logic;
         ena : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ena : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pulse_generator PORT MAP (
          clk => clk,
          ena => ena,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      ena <= '1';
      wait;
   end process;

END;
