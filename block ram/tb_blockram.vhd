LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.DataTypes.all;
 
ENTITY tb_blockram IS
END tb_blockram;
 
ARCHITECTURE behavior OF tb_blockram IS
 
    COMPONENT blockram
    PORT(
         clk : IN  std_logic;
         in_ram : IN ram;
         mode : IN  std_logic_vector(1 downto 0);
         out_ram : OUT  ram
        );
    END COMPONENT;

   --Inputs
   signal clk : std_logic := '0';
   signal in_ram : ram;
   signal mode : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal out_ram : ram;
	
	--others
	signal lastBlock: std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: blockram PORT MAP (
          clk => clk,
          in_ram => in_ram,
          mode => mode,
          out_ram => out_ram
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
	-----------------------------initializing ram
      for i in 0 to 1023 loop
			if((i mod 2) = 0)then --even
				in_ram(i) <= "00000001"; --1
			else --odd
				in_ram(i) <= "00000010"; --2
			end if;
		end loop;
	----------------------------------------------
		mode <= "00"; --swap
		wait for 256*clk_period; -- even blocks = 1 and odd block = 2
		-- 256 = 1024/4 cuz it swaps 2 blocks twice a clk
		wait for clk_period;
		
		mode <= "10"; --check_value
		wait for 512*clk_period; -- ram(0) = 1 so ram(1032) = 512
		wait for clk_period;
		lastBlock <= in_ram(1023);
		
		mode <= "01"; --sum
		wait for 512*clk_period; -- sum is 2046 since ram blocks are 8bit ram(1023) = 11111110
		wait for clk_period;
		lastBlock <= in_ram(0);
	
      wait;
   end process;
END;