library ieee;
use ieee.std_logic_1164.all;

entity Main_test is
end entity;

architecture test of Main_test is
	component Main is
		generic (
			N: integer;
			seed: std_logic_vector;
			mxMoveCnt: integer
		);
		port(
			clk: in std_logic;
			input_num: in std_logic_vector(N-1 downto 0);
			--
			GameHistory_data: out std_logic_vector(mxMoveCnt-1 downto 0);
			gt_led, ls_led, eql_led, lock_led: out bit;
			SevenSeg_data: out std_logic_vector(0 to 6)
		);
	end component;
	--
	-- des helpers
	constant N: integer := 4;
	constant seed: std_logic_vector(N+1 downto 0) := "001101";
	constant mxMoveCnt: integer := 5;
	-- des signals
	signal clk: std_logic := '0';
	signal input_num: std_logic_vector(N-1 downto 0);
	signal GameHistory_data: std_logic_vector(mxMoveCnt-1 downto 0);
	signal gt_led, ls_led, eql_led, lock_led: bit;
	signal SevenSeg_data: std_logic_vector(0 to 6);
begin
	t0: Main
		generic map(N, seed, mxMoveCnt)
		port map(
			clk, input_num,
			GameHistory_data,
			gt_led, ls_led, eql_led, lock_led,
			SevenSeg_data
		);
	clk <= not clk after 10 ns;
	input_num <= "0000",
		"1101" after 10 ns,
		"1010" after 30 ns,
		"0011" after 50 ns,
		"1101" after 70 ns,
		"0101" after 90 ns;
end test;
