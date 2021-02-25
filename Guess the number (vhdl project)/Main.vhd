library ieee;
use ieee.std_logic_1164.all;

entity Main is
	generic (
		N: integer;
		seed: std_logic_vector;
		mxMoveCnt: integer
	);
	port(
		clk: in std_logic;
		input_num: in std_logic_vector(N-1 downto 0);
		--
		GameHistory_data: out std_logic_vector(mxMoveCnt-1 downto 0);
		gt_led, ls_led, eql_led, lock_led: out bit;
		SevenSeg_data: out std_logic_vector(0 to 6)
	);
end entity;

architecture circuit of Main is
	-- NBitRandomGenerator
	component NBitRandomGenerator is
		generic(N: integer; seed: std_logic_vector);
		port(
			clk: in std_logic;
			num: out std_logic_vector(N-1 downto 0)
		);
	end component;
	-- NBitNumberRegister
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
	-- NBitComparator
	component NBitComparator is
		generic(N: integer);
		port(
			a: in std_logic_vector(N-1 downto 0);
			b: in std_logic_vector(N-1 downto 0);
			a_gt_b: out std_logic;
			b_gt_a: out std_logic;
			eql:    out std_logic
		);
	end component;
	-- GameHistory
	component GameHistory is
		generic (N: integer);
		port(
			clk,data_in: in std_logic;
			data: out std_logic_vector(N-1 downto 0)
		);
	end component;
	-- Leds
	component Leds is
		port(
			gt,ls,eql,disabled: in std_logic;
			gt_led, ls_led, eql_led, lock_led: out bit := '0'
		);
	end component;
	-- NBitCounter
	component NBitCounter is
		Generic(N: integer; Max: integer);
		port(
			clr,clk : in std_logic;
			z : out std_logic_vector(N-1 downto 0);
			disabled: buffer std_logic := '0'
		);
	end component;
	-- SevenSegment 
	component SevenSegment is
		port(
			n: in std_logic_vector(2 downto 0);
			o: out std_logic_vector(0 to 6)
		);
	end component;
	--
	-- des signals
	signal high_end: std_logic := '1';
	signal low_end : std_logic := '0';
	signal NBitRandomOutput, NBitRandomNumber, NBitUserNumber:
		std_logic_vector(N-1 downto 0);
	signal gt, ls, eql, disabled: std_logic := '0';
	signal counterOutput: std_logic_vector(2 downto 0);
	signal clk_delay, clk_delay2: std_logic := '0';
begin
	-- NBitRandomGenerator
	NBitRandomGenerator_i0: NBitRandomGenerator
		generic map(N, seed)
		port map(
			clk, NBitRandomOutput
		);
	-- NBitNumberRegister
	NBitNumberRegister_i0_randomNumber: NBitNumberRegister
		generic map(N)
		port map(
			clk,
			NBitRandomOutput,
			high_end, low_end,
			NBitRandomNumber
		);
	NBitNumberRegister_i1_userNumber: NBitNumberRegister
		generic map(N)
		port map(
			clk,
			input_num,
			high_end, low_end,
			NBitUserNumber
		);
	-- NBitComparator
	NBitComparator_i0: NBitComparator
		generic map(N)
		port map(
			NBitUserNumber, NBitRandomNumber,
			gt, ls, eql
		);
	-- GameHistory
	GameHistory_i0: GameHistory
		generic map(mxMoveCnt)
		port map(
			clk_delay2, eql, GameHistory_data
		);
	-- Leds
	Leds_i0: Leds
		port map(
			gt, ls, eql, disabled,
			gt_led, ls_led, eql_led, lock_led
		);
	-- NBitCounter
	NBitCounter_i0: NBitCounter
		generic map(3, mxMoveCnt)
		port map(
			low_end, clk,
			counterOutput,
			disabled
		);
	-- SevenSegment
	SevenSegment_i0: SevenSegment
		port map(
			counterOutput,
			SevenSeg_data
		);
	-- process
	process (clk)
	begin
		if clk'event then
			clk_delay2 <= clk_delay;
			clk_delay  <= clk;
		end if;
	end process;
end circuit;






