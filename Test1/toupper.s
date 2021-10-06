####################### Data segment ######################################
 .data
str: .asciiz "rajatsubhrachakraborty"
msg_input:   .asciiz "The lower-case string is: "
msg_output:   .asciiz "The converted upper-case string is: "
newline:   .asciiz "\n"
####################### Data segment ######################################

####################### Text segment ######################################
.text
.globl main
     main:
          la $a0, msg_input # message string in $a0, pseudoinstruction
          li $v0, 4 # Prepare to print the message
          syscall  # print the message
          
          # Print the input string 
          la $a0, str # input string in $a0, pseudoinstruction
          syscall  # print the input string
          # Print a newline
          la  $a0, newline # preparing to print the newline
          syscall  # print the newline
          
         # Get the pointer to the character array in $a0 again
         la $a0, str
     	 # Procedure call
         jal toupper
         
         # Have returned from procedure
         # Print the converted string
         # Print a message
         la $a0, msg_output # message string in $a0, pseudoinstruction
         li $v0, 4 # Prepare to print the message
         syscall  # print the message
         
         # Print the converted string
         la $a0, str
         li $v0, 4
         syscall
         # Print a newline
         la  $a0, newline # preparing to print the newline
         syscall  # print the newline
         
         # Finally, exit
     Exit:
          li $v0, 10
          syscall # exit

     # Procedure body, address of string in $a0
     toupper:
          li $t0, 0 # loop-index counter
     
     # Start the main loop
     loop:
          # Make a copy of the pointer in $t2
          move $t2, $a0
          add $t2, $t2, $t0
          lbu $t1, 0($t2) # get one byte in $t1
          # Check whether the null-character has been reached
          beq $t1, $zero, done # reached null-character, nothing more to be done
          # Else, convert to upper case
          addi $t1, $t1, -32
          # Overwrite the original character
          sb $t1, 0($t2)
          #Increment loop-index counter
          addi $t0, $t0, 1
          # Jump back to the beginning of the loop
          j loop
     
     # Return 
     done:
          jr $ra   

           
####################### Text segment ######################################
