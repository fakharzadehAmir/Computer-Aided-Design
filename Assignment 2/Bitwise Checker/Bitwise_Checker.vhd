library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity Odd_Even_Definer is
    port (
        input : in std_logic_vector(15 downto 0);
        output : out std_logic_vector(1 downto 0)
    );
end entity;

architecture Behavioral of Odd_Even_Definer is
begin
    process(input)
        variable oddCounter : unsigned(3 downto 0) := (others => '0');
        variable evenCounter : unsigned(3 downto 0) := (others => '0');
    begin
        for i in 0 to 7 loop
            if input(2*i+1) = '1' then
                oddCounter := oddCounter + "1";
            end if;

            if input(2*i) = '1' then
                evenCounter := evenCounter + "1";
            end if;
        end loop;

        output <= "00";
        if to_integer(oddCounter) mod 5 = 0 then
            output(0) <= '1';
        end if;
        if to_integer(evenCounter) mod 3 = 0 then
            output(1) <= '1';
        end if;
    end process;
end architecture Behavioral;