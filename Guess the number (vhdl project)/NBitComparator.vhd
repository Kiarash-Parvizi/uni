library ieee;
use ieee.std_logic_1164.all;

entity NBitComparator is
	generic(N: integer);
	port(
		a: in std_logic_vector(N-1 downto 0);
		b: in std_logic_vector(N-1 downto 0);
		a_gt_b: out std_logic;
		b_gt_a: out std_logic;
		eql:    out std_logic
	);
end entity;

architecture struct of NBitComparator is
	component BitComparator is
		port(
			a: in std_logic;
			b: in std_logic;
			a_gt_b: out std_logic;
			b_gt_a: out std_logic;
			eql:    out std_logic
		);
	end component;
	signal gt_v : std_logic_vector(N-1 downto 0) := (others => '0');
	signal ls_v : std_logic_vector(N-1 downto 0) := (others => '0');
	signal eql_v: std_logic_vector(N-1 downto 0) := (others => '0');
	---
	signal private_gt_v : std_logic_vector(N-2 downto 0) := (others => '0');
	signal private_ls_v : std_logic_vector(N-2 downto 0) := (others => '0');
	signal private_eql_v: std_logic_vector(N-2 downto 0) := (others => '0');
begin
	gen_BComps: for i in N-1 downto 0 generate
		high_bit: if i = N-1 generate
			UH: BitComparator port map(a(i), b(i), gt_v(i), ls_v(i), eql_v(i));
		end generate high_bit;
		--
		otherBits: if i /= N-1 generate
			UR_st0: BitComparator port map(a(i), b(i),
				private_gt_v(i),
				private_ls_v(i),
				private_eql_v(i)
			);
			gt_v(i) <= gt_v(i+1) or (private_gt_v(i) and eql_v(i+1));
			ls_v(i) <= ls_v(i+1) or (private_ls_v(i) and eql_v(i+1));
			eql_v(i) <= eql_v(i+1) and private_eql_v(i);
		end generate otherBits;
	end generate gen_BComps;
	-- link to output
	a_gt_b <= gt_v(0);
	b_gt_a <= ls_v(0);
	eql <= eql_v(0);
end struct;
