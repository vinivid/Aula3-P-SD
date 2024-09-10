library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity t_ff is
    port (
        T : in std_logic;
        Clk : in std_logic;
        Q : out std_logic;
        Qcon : out std_logic
    );
end entity t_ff;

architecture Behaviour of t_ff is
    
begin
    if (rising_edge(Clk)) then
        if (T = '0') then 
            T <= T;
        else
            T <= not T;
        end if;
    end if;

    Q <= T;
    Qcon <= not T;

end architecture Behaviour;