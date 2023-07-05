library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;

entity q2 is
    generic (
        n : integer := 10
    );
    Port (
        clk, reset : in std_logic;
        input        : in std_logic_vector(n - 1 downto 0);
        output       : out std_logic_vector(n - 1 downto 0)
    );
end q2;

architecture Behavioral of q2 is
    TYPE state1 IS (S0, S1, S2, S3, S4, S5, S6, S7); 
    TYPE state2 IS (S0, S1, S2, S3, S4, S5);
    SIGNAL state_1: state1;
    SIGNAL state_2: state2;
    SIGNAL check_s1 : std_logic;
    SIGNAL check_s2 : std_logic;
begin
    PROCESS (clk, reset)
        variable i : integer := 0;
    begin
        IF (rising_edge(clk)) THEN
            IF (reset = '1' or i = n) THEN
                state_1 <= S0;
                state_2 <= S0;
                i := 0;
            ELSE
                CASE state_1 IS
                    WHEN S0 =>
                        IF input(i) = '1' THEN 
                            state_1 <= S1;
                        ELSE
                            state_1 <= S0;
                        END IF;
                    WHEN S1 =>
                        IF input(i) = '1' THEN 
                            state_1 <= S1;  
                        ELSE
                            state_1 <= S2;
                        END IF;
                    WHEN S2 =>
                        IF input(i) = '1' THEN
                            state_1 <= S2; 
                        ELSE 
                            state_1 <= S3; 
                        END IF;
                    WHEN S3 =>
                        IF input(i) = '1' THEN
                            state_1 <= S4; 
                        ELSE 
                            state_1 <= S3; 
                        END IF;
                    WHEN S4 =>
                        IF input(i) = '1' THEN
                            state_1 <= S4; 
                        ELSE 
                            state_1 <= S5; 
                        END IF;
                    WHEN S5 =>
                        IF input(i) = '1' THEN
                            state_1 <= S5; 
                        ELSE 
                            state_1 <= S6; 
                        END IF;
                    WHEN S6 =>
                        IF input(i) = '1' THEN
                            state_1 <= S7; 
                        ELSE 
                            state_1 <= S6; 
                        END IF;
                    WHEN S7 =>
                        state_1 <= S7;   
                END CASE;

                CASE state_2 IS
                    WHEN S0 =>
                        IF input(i) = '1' THEN 
                            state_2 <= S0;
                        ELSE
                            state_2 <= S1;
                        END IF;
                    WHEN S1 =>
                        IF input(i) = '1' THEN 
                            state_2 <= S1;  
                        ELSE
                            state_2 <= S2;
                        END IF;
                    WHEN S2 =>
                        IF input(i) = '1' THEN
                            state_2 <= S3; 
                        ELSE 
                            state_2 <= S2; 
                        END IF;
                    WHEN S3 =>
                        IF input(i) = '1' THEN
                            state_2 <= S3; 
                        ELSE 
                            state_2 <= S4; 
                        END IF;
                    WHEN S4 =>
                        IF input(i) = '1' THEN
                            state_2 <= S4; 
                        ELSE 
                            state_2 <= S5; 
                        END IF;
                    WHEN S5 =>
                        state_2 <= S5;   
                END CASE;

                i := i + 1;      
            END IF;
        END IF;
    END PROCESS;

    check_s1 <= '1' WHEN state_1 = S7 ELSE '0';
    check_s2 <= '1' WHEN state_2 = S5 ELSE '0';

    PROCESS (check_s1, check_s2)
    begin
        IF (check_s1 = '1') THEN
            output <= input;
            for j in 0 to (n - 1) loop
                if input(j) = '1' then
                    output(j) <= '0';
                else
                    output(j) <= '1';
                end if;
            end loop;
        ELSIF(check_s2 = '1') THEN 
            output <= input + 1;
        ELSE 
            output <= input;
        END IF;        
    END PROCESS;
end Behavioral;
