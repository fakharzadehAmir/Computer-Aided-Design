library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.myPackage.all;

entity dot_product_tb is
end entity;

architecture tb_architecture of dot_product_tb is
    component dot_product is
        port(
            A: in array8;
            B: in array8;
            product: out integer
        );
    end component;
    signal A_tb : array8;
    signal B_tb : array8;
    signal product_tb : integer;
begin
    cal: dot_product
        port map(
            A => A_tb,
            B => B_tb,
            product => product_tb
        );
    process is
    begin
        
        A_tb <= (
            (0, 1, 2, 3, 4, 5, 6, 7)
        );
        B_tb <= (
            (1, 1, 1, 1, 1, 1, 1, 1)
        );

        wait for 10 ps;

        A_tb <= (
            (2, 2, 2, 2, 2, 2, 2, 2)
        );
        B_tb <= (
            (10, 10, 1, 1, 1, 1, 1, 1)
        );

        wait for 10 ps;
        wait;
    end process;
end architecture;
