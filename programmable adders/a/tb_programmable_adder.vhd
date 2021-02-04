LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_programmable_adder_A IS
END tb_programmable_adder_A;
 
ARCHITECTURE behavior OF tb_programmable_adder_A IS 
 
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
   constant clk_period : time := 100 ns;
 
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
   begin	
		-- 1 - I did not turn the count off when start is zero cuz it did not work that way
		-- 2 - I did not send data exactly after start goes off cuz it did not get the fisrt data that way
		start <= '1';
		count <= "00000100";
		wait for clk_period; --100
		start <= '0';
		wait for clk_period;
						--data--
		data <= "00001010";
		wait for clk_period; --200
		data <= "00001011";
		wait for clk_period; --300
		data <= "00001100";
		wait for clk_period; --400
		data <= "00001101";
		wait for clk_period; --500
		
		data <= (others => '0');
		count <= (others => '0');
		
		wait;
   end process;

END;
