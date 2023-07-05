library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mealy_tb is
end mealy_tb;

architecture Behavioral of mealy_tb is

    -- Component declaration for the unit under test (UUT)
    component mealy
        Port ( 
            clk, reset, input : in std_logic;
            output        : out std_logic
        );
    end component;

    -- Clock period definitions
    constant clk_period : time := 10 ps;

    -- Signal declarations
    signal clk     : std_logic := '0';
    signal reset   : std_logic := '0';
    signal input   : std_logic := '0';
    signal output  : std_logic;

begin

    -- Instantiate the unit under test (UUT)
    uut : mealy
        port map (
            clk => clk,
            reset => reset,
            input => input,
            output => output
        );

    -- Clock process
    clk_process : process
    begin
        while now < 200 ps loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus : process
    begin
        reset <= '1';
        wait for 20 ps;
        reset <= '0';
        
        -- Test input values
        input <= '1';
        wait for 20 ps;
        input <= '0';
        wait for 20 ps;
        input <= '1';
        wait for 20 ps;
        input <= '0';
        wait for 20 ps;
        
        
        wait;
    end process;

end Behavioral;
