library ieee;
use ieee.std_logic_1164.all;

entity GameHistory is
	generic (N: integer);
	port(
		clk,data_in: in std_logic;
		data: out std_logic_vector(N-1 downto 0)
	);
end entity;

architecture state_machine of GameHistory is
	-- stack
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
	-- ShiftRegister of type SIPO
	component SReg_SIPO is
		generic (N: integer);
		port(
			clk,enable,inp: in std_logic;
			data: out std_logic_vector(N-1 downto 0)
		);
	end component;
	signal pop,data_out,empty,full: std_logic := '0';
	signal push: std_logic := '1';
	signal enable,inp: std_logic := '0';
	--
	signal counter: integer := 0;
begin
	link0: Stack generic map(N)
		port map(
			clk,data_in,push,pop,data_out,empty,full
		);
	link1: SReg_SIPO generic map(N)
		port map(
			clk,enable,inp,data
		);
	inp <= data_out;
	process(clk) is begin
		if (clk'event and clk = '1') then
			report "GH : "&std_logic'image(data_in);
			if (full = '1') then
				enable <= '1';
				pop <= '1'; push <= '0';
			end if;
			if (enable = '1') then
				if (counter = N) then
					enable <= '0';
					pop <= '0'; push <= '0';
				else
					counter <= counter + 1;
				end if;
			end if;
		end if;
	end process;
end state_machine;
