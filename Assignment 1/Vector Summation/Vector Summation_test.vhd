library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use work.matrix.all;

entity testbench is
end entity testbench;

architecture tb_arch of testbench is
    component matrixSum is
        port (
            matrix_i_j : in matrix3x3;
            matrix_sum : out integer
        );
    end component;

    signal matrix_i_j : matrix3x3;
    signal matrix_sum : integer;

begin
    uut: matrixSum port map (matrix_i_j => matrix_i_j, matrix_sum => matrix_sum);

    stimulus_proc: process
    begin
        matrix_i_j <= (
            ("0010","0010","0010"),
            ("0010","0010","0010"),
            ("0010","0001","0000")  
        );
        -- (
        --     2, 2, 2,
        --     2, 2, 2,
        --     2, 1, 0
        -- ) => 15

        wait for 10 ps;

        matrix_i_j <= (
            ("0001","0010","0001"),
            ("0010","0001","0010"),
            ("0001","0010","0001")  
        );
        -- (
        --     1, 2, 1,
        --     2, 1, 2,
        --     1, 2, 1,
        -- ) => 13
        wait for 10 ps;

        wait;

    end process stimulus_proc;

end architecture tb_arch;
