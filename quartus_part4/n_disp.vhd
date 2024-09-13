library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity n_disp is
    port (
        input_disp : in STD_LOGIC_VECTOR (1 downto 0);
        out_disp : out STD_LOGIC_VECTOR (20 downto 0)
    );
end entity n_disp;

architecture Behaviour of n_disp is

begin
    process (input_disp)
    begin
        case input_disp is
            --"0000001" e zero 0
            --"0110000" e E 
            --"1000010" e D                  -e      -0
            when "00" => out_disp <= "100001001100000000001";     
            when "01" => out_disp <= "011000000000011000010";
            when "10" => out_disp <= "000000110000100110000";
            when "11" => out_disp <= "100001001100000000001";
            when others => out_disp <= "000000000000000000000";
            end case;
    end process;
end architecture;
