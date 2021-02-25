library ieee;
use ieee.std_logic_1164.all;

entity NBitRandomGenerator_test is
end entity;


architecture test of NBitRandomGenerator_test is
	component NBitRandomGenerator is
		generic(N: integer; seed: std_logic_vector);
		port(
			clk: in std_logic;
			num: out std_logic_vector(N-1 downto 0)
		);
	end component;
	constant N : integer := 3;
	signal rNum: std_logic_vector(N-1 downto 0);
	signal clk : std_logic := '0';
begin
	ut0: NBitRandomGenerator generic map(N, "00110") port map(clk, rNum);
	clk <= not clk after 10 ns;
	test_process: process begin
		wait for 10 ns;
	end process;
end test;
