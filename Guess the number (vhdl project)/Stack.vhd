library ieee;
use ieee.std_logic_1164.all;

entity Stack is
	generic (N: integer);
	port(
		clk,data_in : in std_logic;
		push,pop: in std_logic := '0';
		data_out: out std_logic := 'U';
		empty: out std_logic := '1';
		full:  out std_logic := '0'
	);
end entity;


architecture behave of Stack is
	signal loc_data: std_logic_vector(0 to N-1) := (others => 'U');
	signal idx: integer := 0;
begin
	assert (N > 0) report "Stack max_length should be greater than one";
	process(clk) is begin
		if (clk'event and clk = '1') then
			if (push = '1' and pop = '0' and idx /= N) then
				loc_data(idx) <= data_in;
				idx <= idx + 1;
				if (idx = N-1) then
					full <= '1';
				end if;
				empty <= '0';
				data_out <= 'U';
			elsif (push = '0' and pop = '1' and idx /= 0) then
				--
				idx <= idx - 1;
				loc_data(idx-1) <= 'U';
				data_out <= loc_data(idx-1);
				--
				if (idx = 1) then
					empty <= '1';
				end if;
				full <= '0';
			elsif (push = '1' and pop = '1' and idx /= 0) then
				loc_data(idx-1) <= data_in;
				data_out <= loc_data(idx-1);
			else
				data_out <= 'U';
			end if;
		end if;
	end process;
end behave;
