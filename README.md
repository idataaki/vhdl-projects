# VHDL-projects
it contains all projects of VHDL course of the university (5 projets)
* The two first projects are structural
* the third, fourth and fifth projects are written with state machine approach
## Non-pipelined Convolver
![image](https://user-images.githubusercontent.com/47431356/106899375-88f4a380-670a-11eb-97c0-e16a582639f3.png)\
it convolves two matrices which are 7x7 array of 8-bit vectors. the output is a single 16-bit vector. the HMM unit multiplies the array with length 7 of 8-bit vectors to another array with the same format. each HMM outputs an array length 7 of 16-bit vectors. since we have seven HMMs, we have a big array length 49. in adderTree unit, we add them each 2 of them.\
you can use [mypack](https://github.com/idataaki/vhdl-projects/blob/main/non%20piplined%20convolver/vhd%20files/mypack.vhd) file to customize your datatype.

## Pipelined Convolver
![image](https://user-images.githubusercontent.com/47431356/106900900-5350ba00-670c-11eb-9a2e-8eec23216d90.png)\
It does the same thing, with the 7x7 matrix and a 7x1 array instead.\
it also has a register which works with the rising edge of the clock after each unit, to work pipeline.
## Pulse Generator
generates the pulse shown in the picture with the machine state approach.\
![image](https://user-images.githubusercontent.com/47431356/106901559-2c46b800-670d-11eb-9014-1d6f03c3857a.png)
* pulse generator A works with 100 Mhz clock rate
* pulse generator B works with 20 Mhz clock rate
## Programable Adder
![image](https://user-images.githubusercontent.com/47431356/106902195-ca3a8280-670d-11eb-9d46-ca822de11afd.png)\
* ### Programable Adder A
start in ON for a clock pulse and the number of data in on count port, simultaneously. the start will go OFF and the data will be on port data, in turn. when adder is finished summarizing, end port will go ON for a clock pulse and the output is on sum port.
* ### Programable Adder B
this adder works on the rising edge of the start pulse. so it doesn't matter how many pulses it is ON.
* ### Programable Adder C
It works the same as B part, but in falling edge instead.
* ### FILE and RANDOM test bench 
for part A, we had to write two test bench. one of them generates the random numbers with **IEEE.math_real.all**\
other one reads inputs from **input.txt** and writes on **output.txt**
## Block Ram
block ram is a matrix of length 1024 of 8-bit vectors. this block ram has the following modes:
1. **swap mode** if you set the mode port to "00" then it swaps the content of odd blocks with even ones.
2. **sum mode** if you set the mode port to "01" then it summarizes the nimbers in all blocks and write the result in the first block.
3. **check value mode** if you set the mode port to "10" then it counts all the numbers in all blocks which is equal to the content of the first block and write it in the last block of the memory.
