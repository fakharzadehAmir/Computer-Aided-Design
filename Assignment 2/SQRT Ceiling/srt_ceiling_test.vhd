
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity max_sqrt_tb is
end entity max_sqrt_tb;

architecture Behavioral of max_sqrt_tb is
    signal input_signal: std_logic_vector(9 downto 0);
    signal output_signal: std_logic_vector(5 downto 0);
    
    component max_sqrt is 
        port (
            input: in std_logic_vector(9 downto 0);
            output: out std_logic_vector(5 downto 0)
        );
    end component;
    
begin
    DUT: max_sqrt port map (input_signal, output_signal);
    
    process
    begin
        -- Stimulus generation
        input_signal <= "0000000000";
        wait for 10 ns;
        
        input_signal <= "0000000111";
        wait for 10 ns;
        
        input_signal <= "0000010000";
        wait for 10 ns;
        
        -- End simulation
        wait;
    end process;
    
end architecture Behavioral;
