library ieee;
use ieee.std_logic_1164.all;

entity GameHistory_test is
end entity;

architecture test of GameHistory_test is
	-- stack
	component GameHistory is
		generic (N: integer);
		port(
			clk,data_in: in std_logic;
			data: out std_logic_vector(N-1 downto 0)
		);
	end component;
	constant N: integer := 5;
	signal clk, data_in: std_logic := '0';
	signal data: std_logic_vector(N-1 downto 0);
	--
	signal tb_dat: std_logic_vector(N-1 downto 0) := "10110";
begin
	t0: GameHistory generic map(N) port map(clk,data_in,data);
	process is begin
		for i in N-1 downto 0 loop
			clk <= '0'; wait for 10 ns;
			clk <= '1'; data_in <= tb_dat(i); wait for 10 ns;
		end loop;
		-- second stage: (just the clock)
		for i in 0 to 12 loop
			clk <= '0';	wait for 10 ns; 
			clk <= '1';	wait for 10 ns; 
		end loop;
		wait for 10 ns;
		wait;
	end process;
end test;
