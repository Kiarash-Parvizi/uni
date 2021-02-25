library ieee;
use ieee.std_logic_1164.all;

entity SevenSegment_test is
end entity;

architecture test of SevenSegment_test is
	component SevenSegment is
		port(
			n: in std_logic_vector(2 downto 0);
			o: out std_logic_vector(0 to 6)
		);
	end component;
	signal num: std_logic_vector(2 downto 0);
	signal o: std_logic_vector(0 to 6);
begin
	uut0: SevenSegment port map(num,o);
	process begin
		num <= "000";
		wait for 10 ns;
		num <= "001";
		wait for 10 ns;
		num <= "010";
		wait for 10 ns;
		num <= "011";
		wait for 10 ns;
		num <= "100";
		wait for 10 ns;
		num <= "101";
		wait for 10 ns;
		num <= "110";
		wait for 10 ns;
		num <= "111";
		wait for 10 ns;
		wait;
	end process;
end test;
