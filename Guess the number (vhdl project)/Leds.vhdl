library ieee;
use ieee.std_logic_1164.all;

entity Leds is
	port(
		gt,ls,eql,disabled: in std_logic;
		gt_led, ls_led, eql_led, lock_led: out bit := '0'
	);
end entity;

architecture circuit of Leds is
begin
	assert
		(gt = 'U' and ls = 'U' and eql = 'U')
		or (
			(not gt and not ls and not eql)
			or
			(gt and not ls and not eql)
			or
			(not gt and ls and not eql)
			or
			(not gt and not ls and eql)
		) = '1' report "invalid input for Led component";
	gt_led   <= to_bit(gt and not disabled);
	ls_led   <= to_bit(ls and not disabled);
	eql_led  <= to_bit(eql and not disabled);
	lock_led <= to_bit(disabled);
end circuit;
