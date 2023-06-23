library IEEE;
use IEEE.std_logic_1164.all;

entity AlarmClock_TB is
end entity AlarmClock_TB;

architecture Behavioral of AlarmClock_TB is
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal set_clock : std_logic := '0';
    signal set_alarm : std_logic := '0';
    signal stop_alarm : std_logic := '0';
    signal alarm_on : std_logic;
    signal minutes : std_logic_vector(7 downto 0) := "00000000";
    signal hours : std_logic_vector(5 downto 0) := "000000";
    
    constant CLOCK_PERIOD : time := 10 ns;
    
begin
    -- Instantiate the DUT (Design Under Test)
    DUT : entity work.AlarmClock
        port map (
            clk => clk,
            reset => reset,
            set_clock => set_clock,
            set_alarm => set_alarm,
            stop_alarm => stop_alarm,
            alarm_on => alarm_on,
            minutes => minutes,
            hours => hours
        );
        
    -- Clock process
    clk_process : process
    begin
        while now < 1000 ns loop
            clk <= '1';
            wait for CLOCK_PERIOD / 2;
            clk <= '0';
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;
    
    -- Stimulus process
    stim_process : process
    begin
        -- Reset
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        
        -- Set clock
        set_clock <= '1';
        hours <= "001100";
        minutes <= "00101010";
        wait for 20 ns;
        set_clock <= '0';
        
        -- Set alarm
        set_alarm <= '1';
        hours <= "001000";
        minutes <= "00011001";
        wait for 20 ns;
        set_alarm <= '0';
        
        -- Stop alarm
        stop_alarm <= '1';
        wait for 50 ns;
        stop_alarm <= '0';
        
        wait;
    end process;
    
    -- Assertion process
    assert_process : process
    begin
        wait for 1000 ns;
        
        -- Add your assertions here
        
        wait;
    end process;
    
end architecture Behavioral;
