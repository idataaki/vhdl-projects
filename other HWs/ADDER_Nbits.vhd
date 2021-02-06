--ZAHRA TAAKI 983663001
--HW4
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADDER_Nbits is
	generic (N: integer := 1024);
	port(a, b: in STD_LOGIC_VECTOR (N-1 downto 0);
			cin: in STD_LOGIC; 								--its standard value must be driven 0
			  s: out STD_LOGIC_VECTOR (N-1 downto 0);
		  cout: out STD_LOGIC);								--carry out
end ADDER_Nbits;

architecture Behavioral of ADDER_Nbits is
	signal carry: STD_LOGIC_VECTOR(N downto 0);
	--it is 1025 bits vector. due to ISE error when I defined carry as STD_LOGIC
	--and drive it in the FOR GENERATE LOOP, I changed its data type to STD_LIGIC_VECTOR
	--to save all the carry out values
begin
	carry(0) <= cin;
	gen: for i in 0 to N-1 generate
		s(i) <= carry(i) xor(a(i) xor b(i));
		carry(i+1) <= (carry(i) and (a(i) xor b(i)))  or  (a(i) and b(i));
	end generate;
	cout <= carry(N);

end Behavioral;

