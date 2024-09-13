library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity n_disp is
    port (
        input_disp : in STD_LOGIC_VECTOR (2 downto 0);
        out_disp : out STD_LOGIC_VECTOR (41 downto 0)
    );
end entity n_disp;

architecture Behaviour of n_disp is

begin
    process (input_disp)
    begin
        case input_disp is
            --"0000001" e zero 0
            --"0110000" e E 
            --"1000010" e D  
            --"1111111" e Nada
            --"100001001100000000001" dEo
            --"10000100110000" dE
            --"01100000000001" Eo
            when "000" => out_disp <= "111111111111111111111100001001100000000001";     
            when "001" => out_disp <= "111111111111111000010011000000000011111111";
            when "010" => out_disp <= "111111110000100110000000000111111111111111";
            when "011" => out_disp <= "100001001100000000001111111111111111111111";
            when "100" => out_disp <= "011000000000011111111111111111111111000010";
            when "101" => out_disp <= "000000111111111111111111111110000100110000";
            when others => out_disp <= "000000000000000000000000000000000000000000";
            end case;
    end process;
end architecture;
