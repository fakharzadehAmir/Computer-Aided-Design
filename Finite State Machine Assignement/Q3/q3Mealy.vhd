library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mealy is
    Port ( 
        clk, reset, input : in std_logic;
        output        : out std_logic
    );
end mealy;

architecture Behavioral of mealy is
    type state is (S0, S1, S2, S3); 
    signal mealy_state: state := S0;
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            mealy_state <= S0;
        elsif rising_edge(clk) then
            case mealy_state is
                when S0 =>
                    if input = '1' then 
                        mealy_state <= S1; 
                    else
                        mealy_state <= S0;
                    end if;
                when S1 =>
                    if input = '1' then 
                        mealy_state <= S2; 
                    else
                        mealy_state <= S0; 
                    end if;
                when S2 =>
                    if input = '1' then
                        mealy_state <= S3; 
                    else 
                        mealy_state <= S0; 
                    end if;
                when S3 =>
                    if input = '1' then
                        mealy_state <= S3; 
                    else 
                        mealy_state <= S0; 
                    end if;
            end case;
        end if;
    end process;

    output <= '1' when (mealy_state = S3 and input = '0') else '0';
end Behavioral;
