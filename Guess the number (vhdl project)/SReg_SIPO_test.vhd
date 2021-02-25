library ieee;
use ieee.std_logic_1164.all;

entity SReg_SIPO_test is
end entity;

architecture test of SReg_SIPO_test is
	component SReg_SIPO is
		generic (N: integer);
		port(
			clk,enable,inp: in std_logic;
			data: out std_logic_vector(N-1 downto 0)
		);
	end component;
	constant N: integer := 4;
	signal clk,enable,inp: std_logic := '0';
	signal data: std_logic_vector(N-1 downto 0);
begin
	t0: SReg_SIPO generic map(N) port map(clk,enable,inp,data);
	process is begin
		enable <= '1'; wait for 10 ns;
		clk <= '1'; inp <= '0'; wait for 10 ns;
		clk <= '0'; wait for 10 ns;
		clk <= '1'; inp <= '0'; wait for 10 ns;
		clk <= '0'; wait for 10 ns;
		clk <= '1'; inp <= '1'; wait for 10 ns;
		clk <= '0'; wait for 10 ns;
		clk <= '1'; inp <= '0'; wait for 10 ns;
		clk <= '0'; wait for 10 ns;
		clk <= '1'; inp <= '1'; wait for 10 ns;
		clk <= '0'; enable <= '0'; wait for 10 ns;
		clk <= '1'; inp <= '1';
		wait for 20 ns;
		wait;
	end process;
end test;
