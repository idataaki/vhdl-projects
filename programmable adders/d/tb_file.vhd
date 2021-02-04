--there is a file named "input.txt" contains:
--one line the 8bit binary count wich is the number of data
--the next count lines contains 8bit binary data

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;
USE ieee.numeric_std.ALL;

-- file library
use ieee.std_logic_textio.all;
use std.textio.all;
 
ENTITY tb_file IS
END tb_file;
 
ARCHITECTURE behavior OF tb_file IS
 
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
	
	-- PROBLEM: IT IS NOT READING!!!!
	
	-- read var
	file my_input: text open read_mode is "input.txt";
	variable my_line: line;
	--variable my_input_line: line;
	
	variable c: std_logic_vector(7 downto 0);
	variable d: std_logic_vector(7 downto 0);
	
	-- write var
	file my_output: text open write_mode is "output.txt";
	variable my_line_w: line;
	--variable s: std_logic_vector(7 downto 0);
	
   begin	
	
		start <= '1';
		
		-- reading count
		readline(my_input, my_line);
		hread(my_line, c);
		count <= c;
		wait for clk_period;
		
		start <= '0';
		
		-- reading data
		for i in 0 to count'high loop
			readline(my_input, my_line);
			hread(my_line, d);
			data <= d;
			wait for clk_period;
		end loop;
		
		data <= "00000000";
		
		-- writing data
		if (sum > "00000000")then
			hwrite(my_line_w, sum);
			writeline(my_output, my_line_w);
		end if;
		
      wait;
   end process;

END;
