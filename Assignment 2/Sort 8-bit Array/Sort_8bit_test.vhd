library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.myPackage.all;

entity SortNumbers_TB is
end entity SortNumbers_TB;

architecture Behavioral of SortNumbers_TB is
    signal input_array : array10;
    signal sorted_array : array10;
    
    component SortNumbers is
        port (
            input_array : in array10;
            sorted_array : out array10
        );
    end component;

begin
    cal : SortNumbers port map (input_array => input_array, sorted_array => sorted_array);
    
    process
    begin
        
        -- Set array values for sorting
        input_array <= 
                ( "00010000","01000010","00000001","00010000","00011000",
                  "00011000","00010000","00100000","11000000","00011100" );
        wait for 10 ns;
        
        -- Wait for sorting to complete
        wait for 10 ns;
        
        -- Display the sorted sorted_array
        
        wait;
    end process;
    
end architecture Behavioral;
