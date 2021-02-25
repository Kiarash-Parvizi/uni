library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity NBitCounter_test is
end entity;

architecture test of NBitCounter_test is
	component NBitCounter is
		Generic(N: integer; Max: integer);
		port(
			clr,clk : in std_logic;
			z : out std_logic_vector(N-1 downto 0);
			disabled: buffer std_logic := '0'
		);
	end component;
	constant N: integer := 3;
	signal clr, clk,disabled: std_logic := '0';
	signal z: std_logic_vector(N-1 downto 0);
begin
	clk <= not clk after 10 ns;
	t0: NBitCounter generic map(N, 5) port map(clr,clk,z,disabled);
	clr <= '0', '1' after 35 ns, '0' after 45 ns;
	process begin
		wait;
	end process;
end test;
