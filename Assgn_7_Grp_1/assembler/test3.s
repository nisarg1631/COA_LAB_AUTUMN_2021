# Test File 3
# Load/Store and Branch

addi $1, 16
addi $2, 30
addi $3, 22
sw $1, 8, $3
sw $2, -6, $3
lw $2, 8, $3
lw $1, -6, $3

# Test branch instructions, store -1 in $1 on failure and 1 on success

xor $1, $1
xor $2, $2
xor $3, $3
b 13
addi $1, -1
addi $1, 1
xor $1, $1
addi $2, 18
br $2
addi $1, -1
addi $1, 1
xor $1, $1
addi $2, -19
bltz $2, 23
addi $1, -1
addi $1, 1
xor $1, $1
xor $2, $2
bltz $2, 29
addi $1, 1
b 30
addi $1, -1
xor $1, $1
bz $2,33
addi $1, -1
addi $1, 1
xor $1, $1
bnz $2, 38
addi $1, 1
b 39
addi $1, -1
xor $1, $1
addi $2, 1
bnz $2, 43
addi $1, -1
addi $1, 1
xor $1, $1
bl 48
addi $1, 1
b 50
addi $1, 1
br $31
xor $1, $1
xor $2, $2
addi $2, -1
xor $3, $3
addi $3, -1
add $2, $3
bcy 58
addi $1, -1
addi $1, 1
xor $1, $1
addi $2, 0
bncy 63
addi $1, -1
addi $1, 1
