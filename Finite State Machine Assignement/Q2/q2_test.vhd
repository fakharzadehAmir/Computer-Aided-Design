library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity q2_tb is
end q2_tb;

architecture Behavioral of q2_tb is
    constant CLK_PERIOD : time := 20 ps;  -- Define the clock period
    
    -- Component declaration
    component q2
        generic (
            n : integer := 10
        );
        port (
            clk, reset : in std_logic;
            input      : in std_logic_vector(n - 1 downto 0);
            output     : out std_logic_vector(n - 1 downto 0)
        );
    end component;

    -- Signal declarations
    signal clk_tb   : std_logic := '0';
    signal reset_tb : std_logic := '1';
    signal input_tb : std_logic_vector(9 downto 0) := (others => '0');
    signal output_tb: std_logic_vector(9 downto 0);
begin
    -- Instantiate the q2 component
    uut: q2
        generic map (
            n => 10
        )
        port map (
            clk   => clk_tb,
            reset => reset_tb,
            input => input_tb,
            output => output_tb
        );

    -- Clock process
    clk_process: process
    begin
        while now < 250 ps loop  -- Run the simulation for 1000 ns
            clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        reset_tb <= '1';
        wait for 40 ps;
        reset_tb <= '0';

        input_tb <= "1100110011";  -- Example input

        wait for 100 ps;

        -- Add more test cases here if needed

        wait;
    end process;
end Behavioral;
