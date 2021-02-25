library ieee;
use ieee.std_logic_1164.all;

entity BitComparator is
	port(
		a: in std_logic;
		b: in std_logic;
		a_gt_b: out std_logic;
		b_gt_a: out std_logic;
		eql:    out std_logic
	);
end entity;

architecture struct of BitComparator is
begin
	a_gt_b <= a and (not b);
	b_gt_a <= b and (not a);
	eql <= a xnor b;
end struct;
