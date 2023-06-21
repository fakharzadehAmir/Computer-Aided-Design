library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity alu is
    port(
        A: in std_logic_vector(1 downto 0);
        B: in std_logic_vector(1 downto 0);
        operation: in std_logic_vector(1 downto 0);
        output: out integer);
end entity;


architecture alu_architecture of alu is
begin
    process(A, B, operation)
    begin
        case operation is
            when "00" =>
            output <= to_integer(unsigned(A and B)); 
            when "01" =>
            output <= to_integer(unsigned(A or B));
            when "10" =>
            output <= to_integer(unsigned(A + B));
            when "11" =>
            output <= to_integer(unsigned(A - B));
            when others =>
            output <= 0;
        end case;
    end process;
end architecture;
