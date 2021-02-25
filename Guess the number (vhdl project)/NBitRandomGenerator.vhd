library ieee;
use ieee.std_logic_1164.all;

entity NBitRandomGenerator is
	generic(N: integer; seed: std_logic_vector);
	port(
		clk: in std_logic;
		num: out std_logic_vector(N-1 downto 0)
	);
end entity;

architecture behave of NBitRandomGenerator is
	signal rBuffer: std_logic_vector(N+1 downto 0) := seed; -- generator buffer
begin
	assert (N > 0) report "N has to be > 0 in NBitRNG";
	num <= rBuffer(N-1 downto 0);
	process(clk) begin
		if (clk'event and clk = '1') then
			for i in 0 to N loop
				rBuffer(i) <= rBuffer(i+1);
			end loop;
			rBuffer(N+1) <= rBuffer(1) xor rBuffer(0);
		end if;
	end process;
end behave;
