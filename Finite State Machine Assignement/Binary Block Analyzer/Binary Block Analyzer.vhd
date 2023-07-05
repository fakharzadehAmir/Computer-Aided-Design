library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity Binary_Block_Analyzer is
    generic (
        n : integer := 8 
    );
    Port (
        clk, reset        : in std_logic;
        s1_index : out std_logic_vector(n / 2 downto 0);
        l1_index  : out std_logic_vector(n / 2 downto 0);
        s2_index   : out std_logic_vector(n / 2 downto 0);
        l2_index    : out std_logic_vector(n / 2 downto 0);
        input : in std_logic_vector(n - 1 downto 0)
    );
end q1;

architecture Behavioral of Binary_Block_Analyzer is
    TYPE state IS (S0, S1, S2, S3, S4); 
    SIGNAL current_state: state;
    SIGNAL count        : integer := 0;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            current_state <= S0;
            count <= 0;
        elsif rising_edge(clk) then
            case current_state is
                when S0 =>
                    if input(count) = '1' then 
                        current_state <= S1;
                    else
                        current_state <= S0;
                    end if;
                when S1 =>
                    if input(count) = '1' then 
                        current_state <= S1;
                    else
                        current_state <= S2;
                        s1_index <= std_logic_vector(to_unsigned(count + 1, n / 2 + 1)); 
                        l1_index <= std_logic_vector(to_unsigned(count + 1, n / 2 + 1)); 
                    end if;
                when S2 =>
                    if input(count) = '1' then
                        current_state <= S3; 
                    else 
                        current_state <= S2; 
                        l1_index <= std_logic_vector(to_unsigned(count + 1, n / 2 + 1)); 
                    end if;
                when S3 =>
                    if input(count) = '1' then
                        current_state <= S3; 
                    else 
                        current_state <= S4; 
                        s2_index <= std_logic_vector(to_unsigned(count + 1, n / 2 + 1)); 
                        l2_index <= std_logic_vector(to_unsigned(count + 1, n / 2 + 1)); 
                    end if;
                when S4 =>
                    if input(count) = '1' then
                        current_state <= S3; 
                    else 
                        current_state <= S4; 
                        l2_index <= std_logic_vector(to_unsigned(count + 1, n / 2 + 1)); 
                    end if;
            end case;
            count <= count + 1;
        end if;
    end process;
end Behavioral;
