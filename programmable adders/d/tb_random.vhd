LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;

-- LIBRARY FOR RANDOM NUMBER
use ieee.math_real.all;
 
ENTITY tb_random IS
END tb_random;
 
ARCHITECTURE behavior OF tb_random IS 
 
    COMPONENT programmable_adder_A
    PORT(
         clk : IN  std_logic;
         start : IN  std_logic;
         count : IN  std_logic_vector(7 downto 0);
         data : IN  std_logic_vector(7 downto 0);
         end1 : OUT  std_logic;
         sum : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal count : std_logic_vector(7 downto 0) := (others => '0');
   signal data : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal end1 : std_logic;
   signal sum : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: programmable_adder_A PORT MAP (
          clk => clk,
          start => start,
          count => count,
          data => data,
          end1 => end1,
          sum => sum
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
		-- count rand var
		variable rand_c : real;
		variable int_rand_c: integer range 0 to 255;
		variable seed1_c, seed2_c: positive;
		
		-- data rand var
		variable rand_d : real;
		variable int_rand_d: integer range 0 to 255;
		variable seed1_d, seed2_d: positive;
   begin
		start <= '1';
		
		-- generating random count
		uniform(seed1_c, seed2_c, rand_c);
		int_rand_c := integer(trunc(rand_c*255.0));
		count <= conv_std_logic_vector(int_rand_c,8);
		wait for clk_period;
		
		start <= '0';
		
		-- generating random data
		for i in 1 to int_rand_c loop
			uniform(seed1_d, seed2_d, rand_d);
			int_rand_d := integer(trunc(rand_d*255.0));
			data <= conv_std_logic_vector(int_rand_d,8);
			wait for clk_period;
		end loop;
		
		data <= (others => '0');
     
	wait;
   end process;

END;
