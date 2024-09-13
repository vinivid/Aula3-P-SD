library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity com_disp is
	port (
			key0 : in STD_LOGIC;
			sw0 : in STD_LOGIC;
			sw1 : in STD_LOGIC;
			t_out_disp : out STD_LOGIC_VECTOR(6 downto 0)
		 );
end entity;

architecture Behaviour of com_disp is 
	component counter is
		port (
        		Clock : in STD_LOGIC;
        		Enable : in STD_LOGIC;
        		Clear_all : in STD_LOGIC;
        		Counter : out STD_LOGIC_VECTOR(3 downto 0)
			 );
	end component;

	component display_7seg is
		port (
				input_disp : in STD_LOGIC_VECTOR (3 downto 0);
        		out_disp : out STD_LOGIC_VECTOR (6 downto 0)
			 );
	end component;
	
	signal armz_counter : STD_LOGIC_VECTOR (3 downto 0);
begin

	main_counter : counter
	port map (
				Clock => key0,
				Enable => sw0,
				Clear_all => sw1,
				Counter => armz_counter
			 );

	display : display_7seg
	port map(
				input_disp => armz_counter,
				out_disp => t_out_disp
			);
end architecture;
