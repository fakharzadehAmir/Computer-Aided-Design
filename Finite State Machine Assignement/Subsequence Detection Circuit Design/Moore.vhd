library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity moore is
    Port ( 
        clk, reset, input : in std_logic;
        output        : out std_logic
    );
end moore;

architecture Behavioral of moore is
    type state is (S0, S1, S2, S3, S4); 
    signal moore_state: state := S0;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            moore_state <= S0;
        elsif rising_edge(clk) then
            case moore_state is
                when S0 =>
                    if input = '1' then 
                        moore_state <= S1; 
                    else
                        moore_state <= S0;
                    end if;
                when S1 =>
                    if input = '1' then 
                        moore_state <= S2; 
                    else
                        moore_state <= S0; 
                    end if;
                when S2 =>
                    if input = '1' then
                        moore_state <= S3; 
                    else 
                        moore_state <= S0; 
                    end if;
                when S3 =>
                    if input = '1' then
                        moore_state <= S3; 
                    else 
                        moore_state <= S4; 
                    end if;
                when S4 =>
                    if input = '1' then
                        moore_state <= S1; 
                    else 
                        moore_state <= S0; 
                    end if;
            end case;
        end if;
    end process;

    output <= '1' when moore_state = S4 else '0';
end Behavioral;
