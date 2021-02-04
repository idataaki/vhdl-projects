LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_programmable_adder_C IS
END tb_programmable_adder_C;
 
ARCHITECTURE behavior OF tb_programmable_adder_C IS 
 
    COMPONENT programmable_adder_C
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
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: programmable_adder_C PORT MAP (
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
   begin
		start <= '1';
		wait for 10*clk_period;
		start <= '0';
		count <= "00000100";
		wait for 2*clk_period;
		count <= "00000000";
		--data--
		data <= "00001010";
		wait for clk_period; 	--200 (2)
		data <= "00001011";
		wait for clk_period; 	--300 (3)
		data <= "00001100";
		wait for clk_period; 	--400 (4)
		data <= "00001101";
		wait for clk_period; 	--500 (5)
		data <= (others => '0');
		count <= (others => '0');
      wait;
   end process;

END;
