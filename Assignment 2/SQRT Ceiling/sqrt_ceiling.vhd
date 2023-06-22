library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity max_sqrt is 
    port(
        input: in std_logic_vector(9 downto 0);
        output: out std_logic_vector(5 downto 0)
    );
end entity;

architecture Behavioral of max_sqrt is
begin
    process(input) is
        variable temp : unsigned(11 downto 0);
        variable result : unsigned(5 downto 0) := "000000";
    begin
        temp := ("00" & unsigned(input));
        while result * result < temp loop
            result := result + "1";
        end loop;
        output <= std_logic_vector(result);
    end process;
end architecture Behavioral;
