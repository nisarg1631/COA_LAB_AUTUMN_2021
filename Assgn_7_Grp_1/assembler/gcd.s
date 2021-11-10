b 26
xor $11,$11             
xor $12,$12
add $11, $2
add $12, $3
xor $13,$13
add $13,$12
bz $11, 24          
xor $13,$13
add $13,$11
bz $12, 24          
xor $14,$14
add $14,$11
comp $15,$12
add $14,$15        
comp $14,$14
bltz $14, 21         
comp $15,$11
add $12,$15 
b 8
comp $15,$12
add $11,$15
b 8
add $1,$13
br $31
xor $1,$1
xor $2,$2
xor $3,$3
addi $2, 7
addi $3, 9
bl 2
xor $1,$1
xor $2,$2
xor $3,$3
addi $2, 12
addi $3, 18
bl 2
xor $1,$1
xor $2,$2
xor $3,$3
addi $2, 1
addi $3, 30
bl 2
xor $1,$1
xor $2,$2
xor $3,$3
addi $2, 15
addi $3, 25
bl 2
xor $1,$1
xor $2,$2
xor $3,$3
addi $2, 29
addi $3, 30
bl 2
xor $1,$1
xor $2,$2
xor $3,$3
addi $2, 0
addi $3, 16
bl 2