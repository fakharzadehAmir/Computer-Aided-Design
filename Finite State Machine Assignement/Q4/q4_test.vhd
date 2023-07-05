library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity binary_to_unary_tb is
end binary_to_unary_tb;

architecture Behavioral of binary_to_unary_tb is
    component binary_to_unary is
        Port ( 
            input  : in STD_LOGIC_VECTOR(2 downto 0);
            output : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- Inputs
    signal input_signal : STD_LOGIC_VECTOR(2 downto 0);

    -- Outputs
    signal output_signal : STD_LOGIC_VECTOR(7 downto 0);
begin
    -- Instantiate the unit under test
    uut: binary_to_unary
        port map (
            input  => input_signal,
            output => output_signal
        );

    -- Stimulus process
    stimulus: process
    begin
        -- Test case 1
        input_signal <= "000";
        wait for 10 ps;

        -- Test case 2
        input_signal <= "001";
        wait for 10 ps;

        -- Test case 3
        input_signal <= "010";
        wait for 10 ps;

        -- Test case 4
        input_signal <= "011";
        wait for 10 ps;

        -- Test case 5
        input_signal <= "100";
        wait for 10 ps;

        -- Test case 6
        input_signal <= "101";
        wait for 10 ps;

        -- Test case 7
        input_signal <= "110";
        wait for 10 ps;

        -- Test case 8
        input_signal <= "111";
        wait for 10 ps;

        -- End simulation
        wait;
    end process;

end Behavioral;
