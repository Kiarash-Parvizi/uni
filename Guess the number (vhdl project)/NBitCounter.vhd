library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity NBitCounter is
	Generic(N: integer; Max: integer);
	port(
		clr,clk : in std_logic;
		z : out std_logic_vector(N-1 downto 0);
		disabled: buffer std_logic := '0'
	);
end entity;

architecture behave of NBitCounter is
	signal zu: unsigned(N-1 downto 0) := (others => '0');
begin
	z <= std_logic_vector(zu);
	process(clk, clr) begin
		if (clr = '1') then
			zu <= (others => '0');
			disabled <= '0';
		elsif (clk'event and clk = '1' and disabled = '0') then
			zu <= zu+1;
			if (zu = Max) then
				disabled <= '1';
			end if;
		end if;
	end process;
end behave;
