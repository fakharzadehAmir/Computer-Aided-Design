
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity binary_to_unary is
    Port ( 
        input  : in STD_LOGIC_VECTOR(2 downto 0);
        output : out STD_LOGIC_VECTOR(7 downto 0)
    );
end binary_to_unary;

architecture Behavioral of binary_to_unary is
    signal output_temp : STD_LOGIC_VECTOR(7 downto 0);
begin
    process(input)
    begin
        case input is
            when "000" =>
                output_temp <= "00000000";
            when "001" =>
                output_temp <= "00000001";
            when "010" =>
                output_temp <= "00000011";
            when "011" =>
                output_temp <= "00000111";
            when "100" =>
                output_temp <= "00001111";
            when "101" =>
                output_temp <= "00011111";
            when "110" =>
                output_temp <= "00111111";
            when "111" =>
                output_temp <= "01111111";
            when others =>
                output_temp <= (others => '0');
        end case;
    end process;

    output <= output_temp;
end Behavioral;
