# Bitwise Checker

This program takes a 16-bit input and produces a 2-bit output. The output bits are determined as follows:

- If the sum of the even-indexed bits of the input is divisible by 3, the most significant bit of the output is set to 1; otherwise, it is set to 0.
- If the sum of the odd-indexed bits of the input is divisible by 5, the least significant bit of the output is set to 1; otherwise, it is set to 0.
- The indexing starts from 1.

**Example**

**Input:**  
"1100110000111111"  
Sum of odd-indexed bits: 5 = 1+0+1+0+0+1+1+1  
Sum of even-indexed bits: 5 = 1+0+1+0+0+1+1+1  
**Output:**  
"01" - The sum of even-indexed bits is not divisible by 3, and the sum of odd-indexed bits is divisible by 5.  