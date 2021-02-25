library ieee;
use ieee.std_logic_1164.all;

entity NBitNumberRegister is
	generic(N: integer);
	port(
		clk: in std_logic;
		D:   in std_logic_vector(N-1 downto 0);
		ld:  in std_logic;
		clr: in std_logic;
		num: out std_logic_vector(N-1 downto 0)
	);
end entity;

architecture behave of NBitNumberRegister is
begin
	process(clk, clr) begin
		if (clr = '1') then
			num <= (others => '0');
		elsif (ld = '1' and clk'event and clk = '1') then
			num <= D;
		end if;
	end process;
end behave;
