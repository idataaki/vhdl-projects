LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_stack IS
END tb_stack;
 
ARCHITECTURE behavior OF tb_stack IS 
 
 
    COMPONENT stack
    PORT(
         Clk : IN  std_logic;
         RstN : IN  std_logic;
         Data_In : IN  std_logic_vector(3 downto 0);
         push : IN  std_logic;
         pop : IN  std_logic;
         Data_Out : OUT  std_logic_vector(3 downto 0);
         Full : OUT  std_logic;
         Empty : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal RstN : std_logic := '0';
   signal Data_In : std_logic_vector(3 downto 0) := (others => '0');
   signal push : std_logic := '0';
   signal pop : std_logic := '0';

 	--Outputs
   signal Data_Out : std_logic_vector(3 downto 0);
   signal Full : std_logic;
   signal Empty : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: stack PORT MAP (
          Clk => Clk,
          RstN => RstN,
          Data_In => Data_In,
          push => push,
          pop => pop,
          Data_Out => Data_Out,
          Full => Full,
          Empty => Empty
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
       RstN <= '1';
		 wait for 100 ns;
		 
		 RstN <='0';
		 Data_In <= "0001";
		 push <= '1';
		 pop <= '0';
		 wait for 100 ns;
		 
		 Data_In <= "0010";
		 push <= '1';
		 pop <= '0';
		 wait for 100 ns;
		 
		 Data_In <= "0011";
		 push <= '1';
		 pop <='0';
		 wait for 100 ns;
		 
		 Data_In <= "0100";
		 push <= '1';
		 pop <= '0';
		 wait for 100 ns;
		 
		 Data_In <= "0101";
		 push <= '1';
		 pop <= '0';
		 wait for 100 ns;
		 
		 Data_In<= "0110";
		 push<= '1';
		 pop <= '0';
		 wait for 100 ns;
		 
		 Data_In <= "0111";
		 push <= '1';
		 pop <= '0';
		 wait for 100 ns;
		 
		 Data_In <= "1000";
		 push <= '1';
		 pop <= '0';
		 wait for 100 ns;
		 
		 push <= '0';
		 pop <= '1';
		 wait for 400 ns;
		 
      wait;
   end process;

END;
