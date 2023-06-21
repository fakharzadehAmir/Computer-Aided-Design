library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

PACKAGE matrix IS
    TYPE matrix3x3 IS ARRAY(0 TO 2, 0 TO 2) OF STD_LOGIC_VECTOR(3 DOWNTO 0);
END matrix;


library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use work.matrix.all;
entity matrixSum is
    port(
        matrix_i_j : in matrix3x3;
        matrix_sum : out integer
    );
end entity;

architecture matrixSum_Arch of matrixSum is
    begin
            matrix_sum <= to_integer(unsigned(
                matrix_i_j(0, 0) + matrix_i_j(0, 1) + matrix_i_j(0, 2)+
                matrix_i_j(1, 0) + matrix_i_j(1, 1) + matrix_i_j(1, 2)+
                matrix_i_j(2, 0) + matrix_i_j(2, 1) + matrix_i_j(2, 2)
            ));
end architecture matrixSum_Arch;