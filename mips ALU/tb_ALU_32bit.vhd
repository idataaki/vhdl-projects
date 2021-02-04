LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_ALU_32bit IS
END tb_ALU_32bit;
 
ARCHITECTURE behavior OF tb_ALU_32bit IS 
 
    COMPONENT ALU_32bit
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         ALUctnrl : IN  std_logic_vector(2 downto 0);
         sub : IN  std_logic;
         R : OUT  std_logic_vector(31 downto 0);
         zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUctnrl : std_logic_vector(2 downto 0) := (others => '0');
   signal sub : std_logic := '0';

 	--Outputs
   signal R : std_logic_vector(31 downto 0);
   signal zero : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_32bit PORT MAP (
          a => a,
          b => b,
          ALUctnrl => ALUctnrl,
          sub => sub,
          R => R,
          zero => zero
        );

   -- Stimulus process
   stim_proc: process
   begin		
		ALUctnrl <= "101"; -- sub
		sub <= '1';
		a <= (0 to 7 => '1', others => '0'); --0x000000ff
		b <= (4 to 7 => '1', others => '0'); --0x000000f0
		wait for 100 ns; --0x0000000f
		
		ALUctnrl <= "101"; -- sub
		sub <= '1';
		a <= (0 to 7 => '1', others => '0'); --0x000000ff
		b <= (0 to 7 => '1', others => '0'); --0x000000ff
		wait for 100 ns; --0x00000000 zero = on
		
		ALUctnrl <= "000"; -- and
		sub <= '0'; 
		a <= (0 to 3 => '1', others => '0'); --0x0000000f
		b <= (4 to 7 => '1', others => '0'); --0x000000f0
		wait for 100 ns; --0x00000000 zero = on
		
		ALUctnrl <= "001"; -- or
		sub <= '0';
		a <= (0 to 3 => '1', others => '0'); --0x0000000f
		b <= (4 to 7 => '1', others => '0'); --0x000000f0
		wait for 100 ns; --0x000000ff
		
		ALUctnrl <= "010"; -- xor
		sub <= '0';
		a <= (0 to 7 => '1', others => '0'); --0x000000ff
		b <= (4 to 7 => '1', others => '0'); --0x000000f0
		wait for 100 ns; --0x0000000f
      wait;
   end process;

END;
