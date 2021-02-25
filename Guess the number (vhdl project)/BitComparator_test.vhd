library ieee;
use ieee.std_logic_1164.all;

entity BitComparator_test is
end entity;

architecture test of BitComparator_test is
	component BitComparator is
		port(
			a: in std_logic;
			b: in std_logic;
			a_gt_b: out std_logic;
			b_gt_a: out std_logic;
			eql:    out std_logic
		);
	end component;
	signal a, b, gt, ls, eql: std_logic;
begin
	uut: BitComparator port map(a,b,gt,ls,eql);
	process is begin
		a <= '0';
		b <= '0';
		wait for 10 ns;
		a <= '1';
		b <= '0';
		wait for 10 ns;
		a <= '0';
		b <= '1';
		wait for 10 ns;
		a <= '1';
		b <= '1';
		wait for 10 ns;
		wait;
	end process;
end test;
