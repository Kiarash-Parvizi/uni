library ieee;
use ieee.std_logic_1164.all;

entity NBitNumberRegister_test is
end entity;

architecture behave of NBitNumberRegister_test is
	component NBitNumberRegister is
		generic(N: integer);
		port(
			clk: in std_logic;
			D:   in std_logic_vector(N-1 downto 0);
			ld:  in std_logic;
			clr: in std_logic;
			num: out std_logic_vector(N-1 downto 0)
		);
	end component;
	constant N: integer := 3;
	signal clk, ld, clr: std_logic := '0';
	signal D, num: std_logic_vector(N-1 downto 0) := (others => '0');
begin
	uu0: NBitNumberRegister generic map(N)
		port map(clk,D,ld,clr,num);
	clk <= not clk after 10 ns;
	process begin
		D <= (others => '1');
		wait for 9 ns;
		ld <= '1';
		wait for 20 ns;
		ld <= '0';
		D <= "101";
		wait for 20 ns;
		ld <= '1';
		wait for 10 ns;
		ld <= '0';
		wait;
	end process;
end behave;
