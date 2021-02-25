library ieee;
use ieee.std_logic_1164.all;

entity NBitComparator_test is
end entity;

architecture test of NBitComparator_test is
	component NBitComparator is
		generic(N: integer);
		port(
			a: in std_logic_vector(N-1 downto 0);
			b: in std_logic_vector(N-1 downto 0);
			a_gt_b: out std_logic;
			b_gt_a: out std_logic;
			eql:    out std_logic
		);
	end component;
	constant N : integer := 3;
	signal a, b: std_logic_vector(N-1 downto 0) := (others => '0');
	signal gt, ls, eql: std_logic;
begin
	uut0: NBitComparator generic map(N) port map(a, b, gt, ls, eql);
	test0: process is begin
		a <= "000"; b <= "000";
		wait for 10 ns;
		a <= "001"; b <= "001";
		wait for 10 ns;
		a <= "110"; b <= "110";
		wait for 10 ns;
		a <= "110"; b <= "111";
		wait for 10 ns;
		a <= "100"; b <= "000";
		wait for 10 ns;
		a <= "001"; b <= "000";
		wait for 10 ns;
		a <= "010"; b <= "100";
		wait for 10 ns;
		a <= "011"; b <= "101";
		wait for 10 ns;
		wait;
	end process;
end test;
