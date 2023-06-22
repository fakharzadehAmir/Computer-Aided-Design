library IEEE;
use IEEE.std_logic_1164.all;

entity Odd_Even_Definer_TB is
end entity Odd_Even_Definer_TB;

architecture Behavioral of Odd_Even_Definer_TB is
    signal input_signal : std_logic_vector(15 downto 0);
    signal output_signal : std_logic_vector(1 downto 0);
    
    component Odd_Even_Definer is
        port (
            input : in std_logic_vector(15 downto 0);
            output : out std_logic_vector(1 downto 0)
        );
    end component;
    
begin
    DUT: Odd_Even_Definer port map (input_signal, output_signal);
    
    process
    begin
        -- Test case 1
        input_signal <= "1010101010010101";
        wait for 10 ps;
        assert output_signal = "11" report "Test case 1 failed" severity error;
        
        -- Test case 2
        input_signal <= "1010101010011111";
        wait for 10 ps;
        assert output_signal = "10" report "Test case 2 failed" severity error;
        
        -- End simulation
        wait;
    end process;
    
end architecture Behavioral;
