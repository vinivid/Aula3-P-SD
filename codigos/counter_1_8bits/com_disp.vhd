library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity com_disp is
    port (
        Key0 : in STD_LOGIC;
        Sw0 : in STD_LOGIC;
        Sw1 : in STD_LOGIC;
        t_out_disp_one : out STD_LOGIC_VECTOR (6 downto 0);
        t_out_disp_two : out STD_LOGIC_VECTOR (6 downto 0)
    );
end entity com_disp;

architecture Behaviour of com_disp is

    component display_7seg is
        port (
            input_disp_one  : in STD_LOGIC_VECTOR (3 downto 0);
            input_disp_two : in STD_LOGIC_VECTOR (3 downto 0);
            out_disp_one : out STD_LOGIC_VECTOR (6 downto 0);
            out_disp_two : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    component part1 is
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
	end component;

    signal count_one : STD_LOGIC_VECTOR (3 downto 0);
    signal count_two : STD_LOGIC_VECTOR (3 downto 0);
begin

    entry_point : part1 
    port map(
        Entry => Sw0,
        Clock => Key0,
        Clear_all => Sw1,
        Q0 => count_one(0),
        Q1 => count_one(1),
        Q2 => count_one(2),
        Q3 => count_one(3),
        Q4 => count_two(4),
        Q5 => count_two(5),
        Q6 => count_two(6),
        Q7 => count_two(7)
    );

    deisplay_exit : display_7seg
    port map(
        input_disp_one => count_one,
        input_disp_two => count_two,
        out_disp_one => t_out_disp_one,
        out_disp_two => t_out_disp_two
    );

end architecture;
