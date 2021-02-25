library ieee;
use ieee.std_logic_1164.all;

entity SevenSegment is
	port(
		n: in std_logic_vector(2 downto 0);
		o: out std_logic_vector(0 to 6)
	);
end entity;

architecture struct of SevenSegment is
begin
	o(0) <= n(1) or (not n(2) and not n(0)) or (n(2) and n(0));
	o(1) <= not n(2) or (not n(1) and not n(0)) or (n(1) and n(0));
	o(2) <= not n(1) or n(0) or n(2);
	o(3) <= (not n(2) and not n(0)) or (not n(2) and n(1)) or
		 (n(1) and not n(0)) or (n(2) and not n(1) and n(0));
	o(4) <= (not n(2) and not n(0)) or (n(1) and not n(0));
	o(5) <= (not n(1) and not n(0)) or (n(2) and not n(1)) or (n(2) and not n(0));
	o(6) <= (not n(2) and n(1)) or (n(1) and not n(0)) or (n(2) and not n(1));
end struct;
