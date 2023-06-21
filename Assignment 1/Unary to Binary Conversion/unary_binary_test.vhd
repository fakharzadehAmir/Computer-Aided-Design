library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unary_binary_tb is
end entity;

architecture testbench_architecture of unary_binary_tb is
    component unary_binary
        port (
            input : in std_logic_vector(15 downto 0);
            output : out std_logic_vector(3 downto 0)
        );
    end component;

    signal input_signal : std_logic_vector(15 downto 0);
    signal output_signal : std_logic_vector(3 downto 0);
begin
    dut: unary_binary
        port map (
            input => input_signal,
            output => output_signal
        );

    process
    begin
        -- Test case 1
        input_signal <= "0000000000000000";
        wait for 10 ns;
        
        -- Test case 2
        input_signal <= "0000000000000001";
        wait for 10 ns;
        
        -- Test case 3
        input_signal <= "0000000000000011";
        wait for 10 ns;
        
        -- Test case 4
        input_signal <= "0000000000000111";
        wait for 10 ns;
        
        -- Test case 5
        input_signal <= "0000000000001111";
        wait for 10 ns;
        
        -- Test case 6
        input_signal <= "0000000000011111";
        wait for 10 ns;
        
        -- Test case 7
        input_signal <= "0000000000111111";
        wait for 10 ns;
        
        -- Test case 8
        input_signal <= "0000000001111111";
        wait for 10 ns;
        
        -- Test case 9
        input_signal <= "0000000011111111";
        wait for 10 ns;
        
        -- Test case 10
        input_signal <= "0000000111111111";
        wait for 10 ns;
        
        -- Test case 11
        input_signal <= "0000001111111111";
        wait for 10 ns;
        
        -- Test case 12
        input_signal <= "0000011111111111";
        wait for 10 ns;
        
        -- Test case 13
        input_signal <= "0000111111111111";
        wait for 10 ns;
        
        -- Test case 14
        input_signal <= "0001111111111111";
        wait for 10 ns;
        
        -- Test case 15
        input_signal <= "0011111111111111";
        wait for 10 ns;

        -- Test case 16
        input_signal <= "0111111111111111";
        wait for 10 ns;
        
        wait;
    end process;
end architecture;
