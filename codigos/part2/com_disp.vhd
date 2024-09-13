library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity com_disp is
    port (
        Key0 : in STD_LOGIC;
        Sw0 : in STD_LOGIC;
        Sw1 : in STD_LOGIC;
        t_out_disp_one : out STD_LOGIC_VECTOR (6 downto 0);
        t_out_disp_two : out STD_LOGIC_VECTOR (6 downto 0);
        t_out_disp_three : out STD_LOGIC_VECTOR (6 downto 0);
        t_out_disp_four : out STD_LOGIC_VECTOR (6 downto 0)
    );
end entity com_disp;

architecture Behaviour of com_disp is

    component counter is
        port (
            Clock : in STD_LOGIC;
            Enable : in STD_LOGIC;
            Clear_all : in STD_LOGIC;
            Counter : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component display_7seg is
        port (
            input_disp : in STD_LOGIC_VECTOR (3 downto 0);
            out_disp : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    signal save_couter : STD_LOGIC_VECTOR(15 downto 0);
    alias sv_counter0 : STD_LOGIC_VECTOR(3 downto 0) is save_couter(3 downto 0);
    alias sv_counter1 : STD_LOGIC_VECTOR(3 downto 0) is save_couter(7 downto 4);
    alias sv_counter2 : STD_LOGIC_VECTOR(3 downto 0) is save_couter(11 downto 8);
    alias sv_counter3 : STD_LOGIC_VECTOR(3 downto 0) is save_couter(15 downto 12);
begin
    
    count: counter
     port map(
        Clock => Key0,
        Enable => Sw0,
        Clear_all => Sw1,
        Counter => save_couter
    );

    display0: display_7seg
     port map(
        input_disp => sv_counter0,
        out_disp => t_out_disp_one
    );

    display1: display_7seg
     port map(
        input_disp => sv_counter1,
        out_disp => t_out_disp_two
    );

    display2: display_7seg
     port map(
        input_disp => sv_counter2,
        out_disp => t_out_disp_three
    );

    display3: display_7seg
     port map(
        input_disp => sv_counter3,
        out_disp => t_out_disp_four
    );

end architecture;