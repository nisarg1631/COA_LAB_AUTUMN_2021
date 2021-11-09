xor $11,$11             
xor $12,$12
addi $11, 7
addi $12, 9
xor $13,$13
add $13,$12
bz $11, 23          
xor $13,$13
add $13,$11
bz $12, 23          
xor $14,$14
add $14,$11
comp $15,$12
add $14,$15        
comp $14,$14
bltz $14, 20         
comp $15,$11
add $12,$15 
b 8
comp $15,$12
add $11,$15
b 8
xor $1,$1
add $1,$13