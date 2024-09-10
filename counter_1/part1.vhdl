library IEEE;
use IEEE.std_logic_1164.all;

entity part1 is
    port (
        Entry : in std_logic;
        Clock : in std_logic;
	Clear_all : in std_logic;
        Q0: out std_logic;
	Q1: out std_logic;
	Q2: out std_logic;
	Q3: out std_logic;
	Q4: out std_logic;
	Q5: out std_logic;
	Q6: out std_logic;
	Q7: out std_logic
    );
end entity part1;

architecture Behaviour of part1 is
	signal out0 : std_logic;
	signal and0 : std_logic;

	signal out1 : std_logic;
	signal and1 : std_logic;

	signal out2 : std_logic;
	signal and2 : std_logic;

	signal out3 : std_logic;
	signal and3 : std_logic;

	signal out4 : std_logic;
	signal and4 : std_logic;

	signal out5 : std_logic;
	signal and5 : std_logic;

	signal out6 : std_logic;
	signal and6 : std_logic;

	signal out7 : std_logic;

	component t_ff is
		port (
		   Enable : in std_logic;
		   Clk : in std_logic;
		   Clear : in std_logic;
        	   Q : out std_logic
		);
	end component;
begin

	t0 : t_ff port map(
		Enable => Entry,
		Clk => Clock,
		Clear => Clear_all,
		Q => out0
	);
	
	and0 <= out0 and Entry;
	
	t1 : t_ff port map(
		Enable => and0,
		Clk => Clock,
		Clear => Clear_all,
		Q => out1
	);
	
	and1 <= out1 and and0;

	t2 : t_ff port map(
		Enable => and1,
		Clk => Clock,
		Clear => Clear_all,
		Q => out2
	);

	and2 <= out2 and and1;


	t3 : t_ff port map(
		Enable => and2,
		Clk => Clock,
		Clear => Clear_all,
		Q => out3
	);

	and3 <= out3 and and2;

	t4 : t_ff port map(
		Enable => and3,
		Clk => Clock,
		Clear => Clear_all,
		Q => out4
	);

	and4 <= out4 and and3;

	t5 : t_ff port map(
		Enable => and4,
		Clk => Clock,
		Clear => Clear_all,
		Q => out5
	);

	and5 <= out5 and and4;

	t6 : t_ff port map(
		Enable => and5,
		Clk => Clock,
		Clear => Clear_all,
		Q => out6
	);

	and6 <= out6 and and5;

	t7 : t_ff port map(
		Enable => and6,
		Clk => Clock,
		Clear => Clear_all,
		Q => out7
	);
	
Q0 <= out0;
Q1 <= out1;
Q2 <= out2;
Q3 <= out3;
Q4 <= out4;
Q5 <= out5;
Q6 <= out6;
Q7 <= out7;

end architecture Behaviour;