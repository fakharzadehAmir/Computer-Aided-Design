library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity unary_binary is
    port(
        input : in std_logic_vector(15 downto 0);
        output : out std_logic_vector(3 downto 0)
    );
end entity;

architecture un_bi_architecture of unary_binary is
begin
    output <= 
    "0000" when (input = "0000000000000000") else
    "0001" when (input = "0000000000000001") else
    "0010" when (input = "0000000000000011") else
    "0011" when (input = "0000000000000111") else
    "0100" when (input = "0000000000001111") else
    "0101" when (input = "0000000000011111") else
    "0110" when (input = "0000000000111111") else
    "0111" when (input = "0000000001111111") else
    "1000" when (input = "0000000011111111") else
    "1001" when (input = "0000000111111111") else
    "1010" when (input = "0000001111111111") else
    "1011" when (input = "0000011111111111") else
    "1100" when (input = "0000111111111111") else
    "1101" when (input = "0001111111111111") else
    "1110" when (input = "0011111111111111") else
    "1111" when (input = "0111111111111111");
end architecture;
