library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.myPackage.all;

entity complex_tb is
end entity;

architecture tb_architecture of complex_tb is
    component complex is
        port(
            A: in complexNumber;
            B: in complexNumber;
            operation: in std_logic_vector(1 downto 0);
            A_real: out integer;
            B_real: out integer;
            A_imaginary: out integer;
            B_imaginary: out integer;
            result: out complexNumber;
            result_imaginary: inout integer;
            result_real: inout integer
        );
    end component;
    
    signal A_tb : complexNumber;
    signal B_tb : complexNumber;
    signal operation_tb : std_logic_vector(1 downto 0);
    signal A_real_tb : integer;
    signal B_real_tb : integer;
    signal A_imaginary_tb : integer;
    signal B_imaginary_tb : integer;
    signal result_tb : complexNumber;
    signal result_imaginary_tb : integer;
    signal result_real_tb : integer;
    
begin
    cal: complex
        port map(
            A => A_tb,
            B => B_tb,
            operation => operation_tb,
            A_real => A_real_tb,
            B_real => B_real_tb, 
            A_imaginary => A_imaginary_tb,
            B_imaginary => B_imaginary_tb,
            result => result_tb,
            result_imaginary => result_imaginary_tb,
            result_real => result_real_tb
        );
    
    process
    begin
        A_tb.realNumber <= 3;
        A_tb.imaginaryNumber <= 2;
        B_tb.realNumber <= 1;
        B_tb.imaginaryNumber <= 4;
        operation_tb <= "00";
        
        wait for 10 ns;
        
        assert result_tb.realNumber = 4 report "Mismatch for realNumber when operation is '00'" severity error;
        assert result_tb.imaginaryNumber = 6 report "Mismatch for imaginaryNumber when operation is '00'" severity error;
        assert result_real_tb = 4 report "Mismatch for result_real when operation is '00'" severity error;
        assert result_imaginary_tb = 6 report "Mismatch for result_imaginary when operation is '00'" severity error;
        
        A_tb.realNumber <= 5;
        A_tb.imaginaryNumber <= 3;
        B_tb.realNumber <= 2;
        B_tb.imaginaryNumber <= 1;
        operation_tb <= "01";
        
        wait for 10 ns;
        
        assert result_tb.realNumber = 3 report "Mismatch for realNumber when operation is '01'" severity error;
        assert result_tb.imaginaryNumber = 2 report "Mismatch for imaginaryNumber when operation is '01'" severity error;
        assert result_real_tb = 3 report "Mismatch for result_real when operation is '01'" severity error;
        assert result_imaginary_tb = 2 report "Mismatch for result_imaginary when operation is '01'" severity error;
        
        A_tb.realNumber <= 4;
        A_tb.imaginaryNumber <= 3;
        B_tb.realNumber <= 2;
        B_tb.imaginaryNumber <= 1;
        operation_tb <= "10";
        
        wait for 10 ns;
        
        assert result_tb.realNumber = 5 report "Mismatch for realNumber when operation is '10'" severity error;
        assert result_tb.imaginaryNumber = 10 report "Mismatch for imaginaryNumber when operation is '10'" severity error;
        assert result_real_tb = 5 report "Mismatch for result_real when operation is '10'" severity error;
        assert result_imaginary_tb = 10 report "Mismatch for result_imaginary when operation is '10'" severity error;
        
        wait;
    end process;
end architecture;
