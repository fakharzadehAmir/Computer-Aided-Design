library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;

entity Binary_Block_Analyzer_tb is
end Binary_Block_Analyzer_tb;

architecture Behavioral of Binary_Block_Analyzer_tb is
    -- Constants
    constant N : integer := 8;
    constant CLK_PERIOD : time := 100 ps;

    -- Signals
    signal clk    : std_logic := '0';
    signal reset  : std_logic := '0';
    signal input  : std_logic_vector(N - 1 downto 0);
    signal s1_idx : std_logic_vector(N / 2 downto 0);
    signal l1_idx : std_logic_vector(N / 2 downto 0);
    signal s2_idx : std_logic_vector(N / 2 downto 0);
    signal l2_idx : std_logic_vector(N / 2 downto 0);

    -- Component instantiation
    component Binary_Block_Analyzer is
        generic (
            n : integer := 8
        );
        port (
            clk        : in std_logic;
            reset      : in std_logic;
            s1_index   : out std_logic_vector(N / 2 downto 0);
            l1_index   : out std_logic_vector(N / 2 downto 0);
            s2_index   : out std_logic_vector(N / 2 downto 0);
            l2_index   : out std_logic_vector(N / 2 downto 0);
            input      : in std_logic_vector(N - 1 downto 0)
        );
    end component;

begin
    -- DUT (Design Under Test) instantiation
    uut: Binary_Block_Analyzer
        generic map (
            n => N
        )
        port map (
            clk        => clk,
            reset      => reset,
            s1_index   => s1_idx,
            l1_index   => l1_idx,
            s2_index   => s2_idx,
            l2_index   => l2_idx,
            input      => input
        );

    -- Clock process
    clk_process: process
    begin
        while now < 500 ns loop  -- Run the simulation for 500 ns
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        reset <= '1';  -- Reset initially
        input <= (others => '0');  -- Set input to all zeroes
        wait for 100 ps;
        
        reset <= '0';  -- De-assert reset
        input <= "11010110";  -- Set input to desired sequence
        
        -- Wait for the simulation to finish
        wait for 500 ns;
        wait;
    end process;

end Behavioral;
