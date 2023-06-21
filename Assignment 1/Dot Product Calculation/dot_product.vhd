library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

package myPackage is
    type array8 is array(0 TO 7) of integer;
end myPackage;

  
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.myPackage.all;

entity dot_product is
    port(
        A: in array8;
        B: in array8;
        product: out integer
    );
end entity;

architecture dot_product_architecture of dot_product is
begin
    process
        variable mul : integer := 0;
        begin
        for i in 0 to 7 loop
            mul := mul + A(i) * B(i);
        end loop;
        product <= mul;
    end process;
end architecture;