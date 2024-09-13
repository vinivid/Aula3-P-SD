library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity display_7seg is
    port (
        input_disp_one  : in STD_LOGIC_VECTOR (3 downto 0);
        input_disp_two : in STD_LOGIC_VECTOR (3 downto 0);
        input_disp_three : in STD_LOGIC_VECTOR (3 downto 0);
        out_disp_one : out STD_LOGIC_VECTOR (6 downto 0);
        out_disp_two : out STD_LOGIC_VECTOR (6 downto 0);
        out_disp_three : out STD_LOGIC_VECTOR (6 downto 0)
    );
end entity display_7seg;

architecture Behaviour of display_7seg is

begin
    process (input_disp_one)
    begin
        case input_disp_one is
            when "0000" => out_disp_one <= "0000001";     
            when "0001" => out_disp_one <= "1001111";  
            when "0010" => out_disp_one <= "0010010";  
            when "0011" => out_disp_one <= "0000110";  
            when "0100" => out_disp_one <= "1001100";  
            when "0101" => out_disp_one <= "0100100"; 
            when "0110" => out_disp_one <= "0100000"; 
            when "0111" => out_disp_one <= "0001111";  
            when "1000" => out_disp_one <= "0000000";      
            when "1001" => out_disp_one <= "0000100"; 
            when "1010" => out_disp_one <= "0000010"; 
            when "1011" => out_disp_one <= "1100000"; 
            when "1100" => out_disp_one <= "0110001"; 
            when "1101" => out_disp_one <= "1000010"; 
            when "1110" => out_disp_one <= "0110000"; 
            when "1111" => out_disp_one <= "0111000";
	        when others => out_disp_one <= "0000001";
            end case;
    end process;

    process (input_disp_two)
    begin
        case input_disp_two is
            when "0000" => out_disp_two <= "0000001";     
            when "0001" => out_disp_two <= "1001111";  
            when "0010" => out_disp_two <= "0010010";  
            when "0011" => out_disp_two <= "0000110";  
            when "0100" => out_disp_two <= "1001100";  
            when "0101" => out_disp_two <= "0100100"; 
            when "0110" => out_disp_two <= "0100000"; 
            when "0111" => out_disp_two <= "0001111";  
            when "1000" => out_disp_two <= "0000000";      
            when "1001" => out_disp_two <= "0000100"; 
            when "1010" => out_disp_two <= "0000010"; 
            when "1011" => out_disp_two <= "1100000"; 
            when "1100" => out_disp_two <= "0110001"; 
            when "1101" => out_disp_two <= "1000010"; 
            when "1110" => out_disp_two <= "0110000"; 
            when "1111" => out_disp_two <= "0111000";
	        when others => out_disp_two <= "0000001";  
            end case;
    end process;

    process (input_disp_three)
    begin
        case input_disp_three is
            when "0000" => out_disp_three <= "0000001";     
            when "0001" => out_disp_three <= "1001111";  
            when "0010" => out_disp_three <= "0010010";  
            when "0011" => out_disp_three <= "0000110";  
            when "0100" => out_disp_three <= "1001100";  
            when "0101" => out_disp_three <= "0100100"; 
            when "0110" => out_disp_three <= "0100000"; 
            when "0111" => out_disp_three <= "0001111";  
            when "1000" => out_disp_three <= "0000000";      
            when "1001" => out_disp_three <= "0000100"; 
            when "1010" => out_disp_three <= "0000010"; 
            when "1011" => out_disp_three <= "1100000"; 
            when "1100" => out_disp_three <= "0110001"; 
            when "1101" => out_disp_three <= "1000010"; 
            when "1110" => out_disp_three <= "0110000"; 
            when "1111" => out_disp_three <= "0111000";
	        when others => out_disp_two <= "0000001";   
        end case;
    end process;
end architecture;