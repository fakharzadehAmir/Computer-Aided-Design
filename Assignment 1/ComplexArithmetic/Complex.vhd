library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
package myPackage is
    type complexNumber is record
        realNumber : integer;
        imaginaryNumber : integer;
    end record;
end myPackage;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.myPackage.all;

entity complex is
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
        result_real: inout integer);
end entity;


architecture complex_architecture of complex is
    begin
        result_real <= 
            A.realNumber + B.realNumber when(operation = "00") else
            A.realNumber - B.realNumber when(operation = "01") else
            A.realNumber * B.realNumber - A.imaginaryNumber * B.imaginaryNumber when(operation ="10");

        result_imaginary <= 
            A.imaginaryNumber + B.imaginaryNumber when(operation = "00") else
            A.imaginaryNumber - B.imaginaryNumber when(operation = "01") else
            A.realNumber * B.imaginaryNumber + A.imaginaryNumber * B.realNumber when(operation ="10");
        
        A_real <= A.realNumber;
        B_real <= B.realNumber;
        A_imaginary <= A.imaginaryNumber;
        B_imaginary <= B.imaginaryNumber;
        result.realNumber <= result_real;
        result.imaginaryNumber <= result_imaginary;
    end architecture;