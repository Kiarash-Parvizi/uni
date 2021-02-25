library ieee;
use ieee.std_logic_1164.all;

entity Leds_test is
end entity;

architecture test of Leds_test is
	component Leds is
		port(
			gt,ls,eql,disabled: in std_logic;
			gt_led, ls_led, eql_led, lock_led: out bit := '0'
		);
	end component;
	signal gt,ls,eql,disabled: std_logic := '0';
	signal gt_led, ls_led, eql_led, lock_led: bit;
begin
	t0: Leds port map(gt,ls,eql,disabled,gt_led,ls_led,eql_led,lock_led);
	process is begin
		wait for 10 ns;
		gt <= '1';
		wait for 10 ns;
		gt <= '0'; ls <= '1';
		wait for 10 ns;
		ls <= '0'; eql <= '1';
		wait for 10 ns;
		disabled <= '1';
		wait for 10 ns;
		wait;
	end process;
end test;
