# ###############################################################################
#     # Assignment Number: 2
#     # Problem Number: 2 
#     # Semester Number: 5
#     # Group Number: 1 
#     # Group Members: Animesh Jha(19CS10070), Nisarg Upadhyaya (19CS30031)
# ###############################################################################

# .globl  main
# .data

# # program output text constants
# prompt:
#     .asciiz "Please enter a positive integer: "
# result:
#     .asciiz "The gcd of the two numbers is: "
# neg_int_err:
#     .asciiz "Error: Negative integer entered, terminating the program."
# newline:
#     .asciiz "\n"

# .text

# # main program
# #
# # program variables
# #   a:   $s0
# #   b:   $s1
# #   g:   $s2

# main:
#     li      $v0, 4          # issue input prompt
#     la      $a0, prompt
#     syscall

#     li      $v0, 5          # get a from user
#     syscall
#     move    $s0, $v0

#     li      $v0, 4          # issue input prompt
#     la      $a0, prompt
#     syscall

#     li      $v0, 5          # get b from user
#     syscall
#     move    $s1, $v0

#     # check if a is positive
#     bltz    $s0, neg_inp
#     # check if b is positive
#     bltz    $s1, neg_inp

#     add $s2, $s1, $zero    # default value of gcd = b
#     beqz $s0, return_gcd    # if a=0 then return gcd as b

# gcd_loop:
    
#     move $s2, $s0   # set gcd = a 

#     beqz $s1, return_gcd    # check if b is 0

#     bgt $s0, $s1, a_gt_b    # check if a>b  then a = a-b
#     sub $s1, $s1, $s0   # else b = b-a
#     j gcd_loop
    
# a_gt_b:
#     sub $s0, $s0, $s1   # a = a-b
#     j gcd_loop

# return_gcd:
#     li      $v0, 4          # print result string
#     la      $a0, result
#     syscall
    
#     li      $v0, 1           # print gcd
#     move      $a0, $s2
#     syscall
#     j end

# neg_inp:
#     li      $v0, 4          # issue error prompt
#     la      $a0, neg_int_err
#     syscall
#     # will now go to end_program

# end:
#     li      $v0, 4          # add newline
#     la      $a0, newline
#     syscall
#     li      $v0, 10         # terminate program
#     syscall
# ###############################################################################

add $5, $6
comp $5, $6
addi $5, -15
compi $5, 15
and $5, $6
xor $5, $6
shll $5,9
shrl $5,9
shllv $5, $6
shrl $5, $6
shra $5, 9
shrav  $5, $6
lw $5, -9
sw $5, -9
b 14
br $5
bltz $5, 14
bz $5, 14
bnz $5, 14
bl 14
bcy 14
bncy 14