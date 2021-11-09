# Test File 2
# SHLL, SHRL, SHRA, SHLLV, SHRLV, SHRAV

addi $1, 30
compi $2, 16
shll $1, 3
shrl $1, 2
shra $1, 1
shll $2, 3
shra $2, 1
shrl $2, 2
xor $1, $1
xor $2, $2
addi $1, 30
compi $2, 16
addi $3, 1
addi $4, 2
addi $5, 3
shllv $1, $5
shrlv $1, $4
shrav $1, $3
shllv $2, $5
shrav $2, $3
shrlv $2, $4
