library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity AlarmClock is
    port (
        clk : in std_logic;        -- Clock signal
        reset : in std_logic;      -- Reset signal
        set_clock : in std_logic;  -- Set clock signal
        set_alarm : in std_logic;  -- Set alarm signal
        stop_alarm : in std_logic; -- Stop alarm signal
        alarm_on : out std_logic;  -- Alarm on signal
        minutes : inout std_logic_vector(7 downto 0);  -- Minutes output
        hours : inout std_logic_vector(5 downto 0)     -- Hours output
    );
end entity AlarmClock;

architecture Behavioral of AlarmClock is
    signal internal_minutes : std_logic_vector(7 downto 0);
    signal internal_hours : std_logic_vector(5 downto 0);
    signal internal_seconds : std_logic_vector(7 downto 0);
    signal internal_alarm_hours : std_logic_vector(5 downto 0);
    signal internal_alarm_minutes : std_logic_vector(7 downto 0);
    
begin
    -- Clock divider process
    process (clk, reset)
    begin
        if reset = '1' then
            alarm_on <= '0';
            internal_seconds <= "00000000";
            internal_minutes <= "00000000";
            internal_hours <= "000000";
        elsif rising_edge(clk) then
            if set_alarm = '1' then
                internal_alarm_hours <= hours;
                internal_alarm_minutes <= minutes;
            elsif set_clock = '1' then
                internal_hours <= hours;
                internal_minutes <= minutes;
            else
                internal_seconds <= std_logic_vector(unsigned(internal_seconds) + 1);
                if to_integer(unsigned(internal_seconds)) = 60 then
                    internal_seconds <= "00000000";
                    internal_minutes <= std_logic_vector(unsigned(internal_minutes) + 1);
                end if;
                if to_integer(unsigned(internal_minutes)) = 60 then
                    internal_minutes <= "00000000";
                    internal_hours <= std_logic_vector(unsigned(internal_hours) + 1);
                end if;
                if to_integer(unsigned(internal_hours)) = 24 then
                    internal_hours <= "000000";
                end if;
                if (internal_hours = internal_alarm_hours) and (internal_minutes = internal_alarm_minutes) then
                    alarm_on <= '1';
                elsif stop_alarm = '1' then
                    alarm_on <= '0';
                end if;
            end if;
        end if;
    end process;
end architecture Behavioral;
