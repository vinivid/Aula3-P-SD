library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity com_disp is
    port (
        Key0 : in STD_LOGIC;
        sw0 : in STD_LOGIC;
        sw1 : in STD_LOGIC;
        t_out_display0 : out STD_LOGIC_VECTOR(6 downto 0);
        t_out_display1 : out STD_LOGIC_VECTOR(6 downto 0);
        t_out_display2 : out STD_LOGIC_VECTOR(6 downto 0)
    );
end entity com_disp;

architecture Behaviour of com_disp is

    component counter is
        port (
            Clock : in STD_LOGIC;
            Enable : in STD_LOGIC;
            Clear_all : in STD_LOGIC;
            Counter : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    component n_disp is
        port (
            input_disp : in STD_LOGIC_VECTOR (1 downto 0);
            out_disp : out STD_LOGIC_VECTOR (20 downto 0)
        );
    end component;

    signal counter_exit : STD_LOGIC_VECTOR(1 downto 0);
    signal disp_choice : STD_LOGIC_VECTOR(20 downto 0);
    alias disp_choice0 : STD_LOGIC_VECTOR(6 downto 0) is disp_choice(6 downto 0);
    alias disp_choice1 : STD_LOGIC_VECTOR(6 downto 0) is disp_choice(13 downto 7);
    alias disp_choice2 : STD_LOGIC_VECTOR(6 downto 0) is disp_choice(20 downto 14);
begin

    main_count : counter
     port map(
        Clock => Key0,
        Enable => sw0,
        Clear_all => sw1,
        Counter => counter_exit
    );

    n_disp_inst: n_disp
     port map(
        input_disp => counter_exit,
        out_disp => disp_choice
    );

    t_out_display0 <= disp_choice0;
    t_out_display1 <= disp_choice1;
    t_out_display2 <= disp_choice2;
end architecture;