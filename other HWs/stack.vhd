--Empty descending stack implementation in VHDL.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity stack is
port(   --inputs
		  Clk : in std_logic;  --Clock for the stack.
        RstN : in std_logic; --active high reset.    
        Data_In : in std_logic_vector(3 downto 0);  --Data to be pushed to stack
        push : in std_logic;  --active low for POP and active high for PUSH.
		  pop : in std_logic;
		  
		  --output
		  Data_Out : out std_logic_vector(3 downto 0);  --Data popped from the stack.
        Full : out std_logic;  --Goes high when the stack is full.
        Empty : out std_logic  --Goes high when the stack is empty.
        );
end stack;


architecture Behavioral of stack is

type mem_type is array (0 to 7) of std_logic_vector(3 downto 0);
signal memory : mem_type := (others => (others => '0'));
signal full_sig: std_logic := '0';
signal empty_sig: std_logic := '1'; 

begin

	Full <= full_sig; 
	Empty <= empty_sig;

	--PUSH and POP process for the stack.
	process(Clk,rstN)
	variable pointer : integer := 7;
	begin
		  if(rstN = '1') then
				 pointer := 8;  --stack grows downwards.
				 full_sig <= '0';
				 empty_sig <= '1';
				 Data_out <= (others => '0');
		  elsif(rising_edge(Clk)) then
				 --push
				 if(push = '1')then
					if(full_sig = '0')then
						pointer := pointer - 1;
						memory(pointer) <= Data_In;
					end if;
				 end if;
				 
				 --pop
				 if(pop = '1')then
					if(pointer <= 7 or empty_sig = '1')then
						Data_Out <= memory(pointer);
						pointer := pointer + 1;
					end if;
				 end if;
				 
		  -- empty and full
		  end if;
		  if (pointer = 0) then
				full_sig <= '1';
		  elsif (pointer = 8) then
				empty_sig <= '0';
		  elsif (pointer <= 7)then
				empty_sig <= '1';
				full_sig <= '0';
		  end if;
	end process;

end Behavioral;