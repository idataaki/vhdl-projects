LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_ADDER_Nbits IS
END tb_ADDER_Nbits;
 
ARCHITECTURE behavior OF tb_ADDER_Nbits IS 
 
    COMPONENT ADDER_Nbits
    PORT(
         a : IN  std_logic_vector(1023 downto 0);
         b : IN  std_logic_vector(1023 downto 0);
         cin : IN  std_logic;
         s : OUT  std_logic_vector(1023 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(1023 downto 0) := (others => '0');
   signal b : std_logic_vector(1023 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal s : std_logic_vector(1023 downto 0);
   signal cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ADDER_Nbits PORT MAP (
          a => a,
          b => b,
          cin => cin,
          s => s,
          cout => cout
        );


   stim_proc: process
   begin
		a <= (0=>'1', others=>'0'); --1
		b <= (0=>'1', others=>'0'); --1
		cin <= '0';
      wait for 100 ns;
		--cout = 0 and s = 2
		
		a <= (1=>'1', others=>'0'); --2
		b <= (1=>'1', others=>'0'); --2
		cin <= '0';
      wait for 100 ns;
		--cout = 0 and s = 4
		
		a <= (others=>'1'); --2**1024-1
		b <= (others=>'1'); --2**1024-1
		cin <= '0';
      wait for 100 ns;
		--cout = 1 and s = 2**1024-2
		
		a <= (1023=>'1', others=>'0'); --2**1023
		b <= (1023=>'1', others=>'0'); --2**1023
		cin <= '0';
      wait for 100 ns;	
		--cout = 1 and s = 0

      wait;
   end process;

END;
