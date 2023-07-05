# Binary Subsequence Transformer  

Design a circuit that takes an n-bit binary input and performs the following operations:

- If the input contains the subsequence "1001001", reverse the n-bit binary input (i.e., replace all 1s with 0s and all 0s with 1s).
- If the input does not contain the subsequence "1001001" but contains the subsequence "00100", append a unit (1-bit) to the n-bit binary input.
- Otherwise, output the original n-bit binary input.

**Definition:**
A subsequence of the original n-bit binary input is defined as a potentially infinite sequence obtained by removing some of the bits (it is possible to have no bits removed).

**Example:**
For the input 011101110011001110011, it contains the subsequence "1001001".


### **Example 1**
**Input:**  
00111100011110001  
**Output:**  
11000011100001110


### **Example 2**
**Input:**  
1100011100  
**Output:**  
1100011101


### **Example 3**
**Input:**  
1100011  
**Output:**  
1100011