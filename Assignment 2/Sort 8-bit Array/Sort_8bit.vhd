library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package myPackage is
    type array10 is array(0 to 9) of std_logic_vector(7 downto 0);
end package;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.myPackage.all;

entity SortNumbers is
    port (
        input_array : in array10;
        sorted_array : out array10
    );
end entity SortNumbers;

architecture Behavioral of SortNumbers is
    signal numbers : array10;
    
begin
    process(input_array) is
        variable temp : std_logic_vector(7 downto 0);
        variable array_temp : array10;
    begin
        array_temp := input_array;
        for i in 0 to 8 loop
            for j in i+1 to 9 loop
                if array_temp(i) > array_temp(j) then
                    temp := array_temp(i);
                    array_temp(i) := array_temp(j);
                    array_temp(j) := temp;
                end if;
            end loop;
        end loop;
        sorted_array <= array_temp;
    
    end process;
    
end architecture Behavioral;
