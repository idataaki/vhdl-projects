LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.mypack.all;
 
ENTITY tb_top IS
END tb_top;
 
ARCHITECTURE behavior OF tb_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT piplined_convolver
    PORT(
         clk : IN  std_logic;
         image : IN  row8;
         coefficient : IN  matrix;
         convolved : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal image : row8;
   signal coefficient : matrix;

 	--Outputs
   signal convolved : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: piplined_convolver PORT MAP (
          clk => clk,
          image => image,
          coefficient => coefficient,
          convolved => convolved
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		for i in 0 to 6 loop
			image(i) <= "00000001";
			for j in 0 to 6 loop
				coefficient(i)(j) <= "00000001";
			end loop;
		end loop;
		wait for 1000 ns;
		
		for i in 0 to 6 loop
			image(i) <= "00000010";
			for j in 0 to 6 loop
				coefficient(i)(j) <= "00000001";
			end loop;
		end loop;
		wait for 1000 ns;
		
		for i in 0 to 6 loop
			image(i) <= "10000000";
			for j in 0 to 6 loop
				coefficient(i)(j) <= "10000000";
			end loop;
		end loop;
		wait for 1000 ns;
		
		for i in 0 to 6 loop
			image(i) <= "11111111";
			for j in 0 to 6 loop
				coefficient(i)(j) <= "00000001";
			end loop;
		end loop;
		wait for 1000 ns;

      wait;
   end process;

END;
