library IEEE;
use IEEE.std_logic_1164.all;

entity t_ff is
    port (
        Enable : in std_logic;
        Clk : in std_logic;
	Clear : in std_logic;
        Q : out std_logic
    );
end entity t_ff;

architecture Behaviour of t_ff is
	signal temp : std_logic;
begin
process (Clk)
begin
    if (rising_edge(Clk)) then
	if (Clear = '1') then
		temp <= '0';	
        elsif (Enable = '1') then 
                temp <= not temp;
	else
		temp <= temp;
        end if;
    end if;
end process;
    
Q <= temp;

end architecture Behaviour;