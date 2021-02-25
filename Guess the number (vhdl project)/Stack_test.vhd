library ieee;
use ieee.std_logic_1164.all;

entity Stack_test is
end entity;

architecture test of Stack_test is
	component Stack is
		generic (N: integer);
		port(
			clk,data_in : in std_logic;
			push,pop: in std_logic := '0';
			data_out: out std_logic := 'U';
			empty: out std_logic := '1';
			full:  out std_logic := '0'
		);
	end component;
	signal clk,data_in,push,pop,data_out,empty,full: std_logic;
begin
	t0: Stack generic map(4)
		port map(
			clk,data_in,push,pop,data_out,empty,full
		);
	process is begin
		-- test push
		clk <= '0'    ; push <= '1'; pop <= '0'; wait for 10 ns;
		data_in <= '0'; clk <= '1'; wait for 10 ns;
		clk <= '0'; wait for 10 ns;
		data_in <= '1'; clk <= '1'; wait for 10 ns;
		clk <= '0'    ; wait for 10 ns;
		data_in <= '1'; clk <= '1'; wait for 10 ns;
		-- test replace
		push <= '1'   ; pop <= '1'; clk <= '0'; wait for 10 ns;
		data_in <= '0'; clk <= '1'; wait for 10 ns;
		-- end test replace -> back to push
		push <= '1'   ; pop <= '0'; clk <= '0'; wait for 10 ns;
		data_in <= '0'; clk <= '1'; wait for 10 ns;
		-- test pop
		pop <= '1'; push <= '0'; clk <= '0'; wait for 10 ns;
		clk <= '1'; wait for 10 ns;
		clk <= '0'; wait for 10 ns;
		clk <= '1'; wait for 10 ns;
		clk <= '0'; wait for 10 ns;
		clk <= '1'; wait for 10 ns;
		clk <= '0'; wait for 10 ns;
		clk <= '1'; wait for 10 ns;
		clk <= '0'; wait for 10 ns;
		clk <= '1'; wait for 10 ns;
		wait;
	end process;
end test;
