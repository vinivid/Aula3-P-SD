library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
    port (
        Clock : in STD_LOGIC;
        Enable : in STD_LOGIC;
        Clear_all : in STD_LOGIC;
        Counter : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture Behaviour of counter is

signal save_counter : STD_LOGIC_VECTOR (15 downto 0);

begin
    process (Clock)
    begin
        if (rising_edge(Clock)) then
            if (Clear_all = '1') then
                save_counter <= "0000000000000000";
            elsif (Enable = '1') then
                --é necessario usar std logic unsigned para somar
                save_counter <= save_counter + 1;
            else
                save_counter <= save_counter;
        end if;
    end if;
    end process;

    Counter <= save_counter;

end architecture;