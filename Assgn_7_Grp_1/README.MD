# COA_LAB_AUTUMN_2021
This repository contains the code for Assignment 7 for Computer Organization and Architecture Laboratory.

## Group Information
1. Nisarg Upadhyaya (19CS30031)
2. Animesh Jha (19CS10070)

# How to run the code
1. Write code example `test.s` and save it in the `/assembler` folder
1. Run the command `python assembler.py test.s`, the assembler would produce `output`
1. Copy the contents of `output` to `instructions.coe`
1. Load files with _tb.v as the simulation files and the rest as implementation files
1. Load and initialise bram modules `datastore` (single port RAM) and `instructions` (single port ROM), initialise `instructions` with the .coe file generated.
1. Simulate `KGP-RISC_tb.v`
