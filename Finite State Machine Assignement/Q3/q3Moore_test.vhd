
library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity moore_tb is
end moore_tb;

architecture testbench of moore_tb is  
    component moore is
        Port ( 
            clk, reset, input : in std_logic;
            output        : out std_logic
        );
    end component;

    signal clk, reset, input : std_logic;
    signal output        : std_logic;
    constant CLK_PERIOD    : time := 10 ps;
begin
    cal : moore port map (clk => clk, reset => reset, input => input, output => output);

    clk_process : process
    begin
        while now < 200 ps loop 
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    process is
    begin
        reset <= '1';
        wait for CLK_PERIOD;
        reset <= '0';

        input <= '1';
        wait for CLK_PERIOD;
        input <= '1';
        wait for CLK_PERIOD;
        input <= '1';
        wait for CLK_PERIOD;
        input <= '0';
        wait for CLK_PERIOD;
        input <= '1';
        wait for CLK_PERIOD;
        input <= '1';
        wait for CLK_PERIOD;
        input <= '1';
        wait for CLK_PERIOD;
        input <= '1';
        wait for CLK_PERIOD;
        input <= '0';
        wait for CLK_PERIOD;

        wait;

    end process;
end testbench;