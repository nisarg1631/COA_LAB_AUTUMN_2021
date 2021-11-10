# COA_LAB_AUTUMN_2021
This repository contains the code for Assignment 7 for Computer Organization and Architecture Laboratory. The `assembler` folder includes some test `.s` files and their corresponding `.coe` files to test the architecture. The `testbenches` folder includes the verilog test fixtures for some of the modules developed. The design documentation is available in the `docs` folder.

## Group Information
Group 1
1. Nisarg Upadhyaya (19CS30031)
2. Animesh Jha (19CS10070)

# How to run the code
1. Write code example `test.s` and save it in the `/assembler` folder
2. Run the command `python assembler.py test.s`, the assembler would produce `output`
3. Copy the contents of `output` to `instructions.coe`. For the provided test files `coe` files have already been generated. One can directly use the already generated `coe` files.
4. Load files with `_tb.v` as the simulation files and the `.v` files as implementation files
5. Load and initialise bram modules `datastore` (single port RAM) and `instructions` (single port ROM), initialise `instructions` with the `instructions.coe` file. Set width to 32 and depth to 4096 in both of them.
6. Simulate `KGP-RISC_tb.v`. For some test files all the tests may not complete in 1000ns. Hence, it is recommended to set the simulation time to 10000ns.

# A note on the test files
In the test bench of the KGP-RISC module registers 0-6 and 11-12 are being monitored. These have been used in the test files for getting the output and displaying values for debugging purposes. There is also a return register ($1) which is expected to hold the final output and is also being monitored. If no debugging is needed comment out the former and only keep the return register monitor. Here we provide the output format for the 2 main test files which are `gcd.s` and `binary_search.s`.

1. For `gcd.s` the inputs are loaded in registers $2 and $3, after which the GCD algorithm runs. Meanwhile $1 is set to 0. Once the result is available the value will be set in $1, till that time $1 remains 0. This is repeated for the following set of values:
        
        a. 7, 9 [Expected output: 1]
        b. 12, 18 [Expected output: 6]
        c. 1, 30 [Expected output: 1]
        d. 15, 25 [Expected output: 5]
        e. 29, 30 [Expected output: 1]
        f. 0, 16 [Expected output: 16]

2. For `binary_search.s` 10 numbers are loaded into memory at locations 1-10 using the register $1, after which $1 is used to store the output of binary search, if number is found it is set to 1 else -1. The loaded array is 

        1 3 6 10 15 21 28 36 45 55

    For `binary_search.s` the input (number to find) is loaded in register $2 , after which the binary search algorithm runs. Meanwhile $1 is set to 0. Once the result is available the value will be set in $1, till that time $1 remains 0. This is repeated for the following set of values:

        a. 1 [Expected output: 1]
        b. 2 [Expected output: -1]
        c. 3 [Expected output: 1]
        d. 15 [Expected output: 1]
        e. 47 [Expected output: -1]
        f. 55 [Expected output: 1]
        g. 0 [Expected output: -1]

3. `test1.s`, `test2.s`, and `test3.s` are unit test files which check individual functionalities.
