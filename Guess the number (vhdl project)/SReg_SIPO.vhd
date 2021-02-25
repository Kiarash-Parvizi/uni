library ieee;
use ieee.std_logic_1164.all;

entity SReg_SIPO is
	generic (N: integer);
	port(
		clk,enable,inp: in std_logic;
		data: out std_logic_vector(N-1 downto 0)
	);
end entity;


architecture behave of SReg_SIPO is
	signal loc_data: std_logic_vector(N-1 downto 0) := (others => 'U');
begin
	data <= loc_data;
	process(clk) begin
		if (clk'event and clk = '1' and enable = '1') then
			loc_data <= inp & loc_data(loc_data'high downto loc_data'low+1);
		end if;
	end process;
end behave;
