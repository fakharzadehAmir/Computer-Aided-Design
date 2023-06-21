library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
entity alu_tb is
end alu_tb;

architecture test_bench of alu_tb is
    component alu is
        port(
            A : in std_logic_vector(1 downto 0);
            B : in std_logic_vector(1 downto 0);
            operation : in std_logic_vector(1 downto 0);
            output : out integer
        );
    end component;

    signal A : std_logic_vector(1 downto 0);
    signal B : std_logic_vector(1 downto 0);
    signal operation : std_logic_vector(1 downto 0);
    signal output: integer;

begin
    cal : alu port map (A => A, B => B, operation => operation, output => output);
    process is
    begin
        -- test case 1
        A <= "01";
        B <= "01";
        operation <= "00";

        wait for 10 ps;

        A <= "01";
        B <= "01";
        operation <= "01";

        wait for 10 ps;

        A <= "01";
        B <= "01";
        operation <= "10";

        wait for 10 ps;

        A <= "01";
        B <= "01";
        operation <= "11";

        wait for 10 ps;
        -- test case 2

        A <= "01";
        B <= "10";
        operation <= "00";

        wait for 10 ps;

        A <= "01";
        B <= "10";
        operation <= "01";

        wait for 10 ps;

        A <= "01";
        B <= "10";
        operation <= "10";

        wait for 10 ps;

        A <= "01";
        B <= "10";
        operation <= "11";

        wait for 10 ps;
        wait;

    end process;

end test_bench;