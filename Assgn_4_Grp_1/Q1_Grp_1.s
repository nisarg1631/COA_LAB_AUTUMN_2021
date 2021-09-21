###############################################################################
    # Assignment Number: 4
    # Problem Number: 1
    # Semester Number: 5
    # Group Number: 1 
    # Group Members: Animesh Jha(19CS10070), Nisarg Upadhyaya (19CS30031)
###############################################################################

.globl  main
.data

# program output text constants
prompt1:
    .asciiz "Enter four positive integers n, a, r and m:\n"
prompt2:
    .asciiz "Matrix A:\n\n"
prompt3:
    .asciiz "Final determinant of the matrix A is "
not_positive_prompt:
    .asciiz "Please enter positive integers only.\n"
newline:
    .asciiz "\n"
space:
    .asciiz " "

.text

# main program
#
# program variables
#
#  n: $s0
#  a: $s1
#  r: $s2
#  m: $s5
#  matrix A base address: $s3
#  determinant: $s4

main:
    jal     initStack

    li      $v0, 4          # issue input prompt
    la      $a0, prompt1
    syscall

    li      $v0, 5          # get n from user
    syscall
    move    $s0, $v0
    blez    $s0, not_positive_error     # check n is positive

    li      $v0, 5          # get a from user
    syscall
    move    $s1, $v0
    blez    $s1, not_positive_error     # check a is positive

    li      $v0, 5          # get r from user
    syscall
    move    $s2, $v0
    blez    $s2, not_positive_error     # check r is positive

    li      $v0, 5          # get m from user
    syscall
    move    $s5, $v0
    blez    $s5, not_positive_error     # check m is positive

    # allocate memory for A
    mul     $a0, $s0, $s0   # $a0 = n*n
    jal     mallocInStack   # call mallocInStack with argument n*n
    move    $s3, $v0        # store return value, i.e. base address of A

    # fill A
    li      $t0, 0          # offset = 0
    li      $t1, 1          # multiplier = 1

fillA:
    mul     $t2, $s1, $t1   # $t2 = a*multiplier
    div		$t2, $s5		# a*multiplier / m
    mfhi	$t2				# $t2 = a*multiplier mod m 
    
    mul     $t3, $t0, 4     # $t3 = 4*offset
    add     $t3, $s3, $t3   # $t3 = base address of A + 4*offset
    sw      $t2, 0($t3)     # store a*multiplier mod m to the location A + 4*offset
    addi    $t0, $t0, 1     # offset++

    mul     $t1, $t1, $s2   # multiplier = multiplier*r
    div		$t1, $s5		# multiplier / m
    mfhi	$t1				# multiplier = multiplier mod m 
    
    mul     $t2, $s0, $s0   # $t2 = n*n
    blt		$t0, $t2, fillA	# if offset < n*n then loop

    li      $v0, 4          # issue matrix A print prompt
    la      $a0, prompt2
    syscall

    # print A
    move    $a0, $s0
    move    $a1, $s3
    jal     printMatrix     # call print matrix with parameters n and A

    # calculate determinant of A
    move    $a0, $s0
    move    $a1, $s3        
    jal     recursive_det   # call recursive determinant with parameters n and A

    move    $s4, $v0        # store determinant value in $s4

    li      $v0, 4          # issue determinant print prompt
    la      $a0, prompt3
    syscall

    li      $v0, 1          # print determinant value
    move    $a0, $s4
    syscall

    li      $v0, 4          # print newline
    la      $a0, newline
    syscall

    # deallocate memory stored for matrix A
    mul     $t0, $s0, $s0
    mul     $t0, $t0, 4
    add     $sp, $sp, $t0   # deallocate A

    b       end

not_positive_error:
    li      $v0, 4          # issue not positive prompt
    la      $a0, not_positive_prompt
    syscall

end:
    lw      $fp, 0($sp)     # restore frame pointer
    addi    $sp, $sp, 4     # restore stack pointer
    li      $v0, 10         # terminate program
    syscall

# determinant function (note that we have followed 0-based indexing everywhere)
#
# function variables
#
# n: $a0 (stored in $s0)
# matrix A (base address): $a1 (stored in $s1)
# column index: $s2
# intermediate matrix A' base address: $s3
# current sum: $s4
# current sign: $s5

recursive_det:
    move    $t0, $ra    # store $ra temporarily
    jal     initStack   # initialise sp and fp
    move    $t1, $a0    # store n temporarily
    
    move    $a0, $t0    # push old ra to stack (fp-4)
    jal     pushToStack
    move    $a0, $s0    # push old s0 to stack (fp-8)
    jal     pushToStack
    move    $a0, $s1    # push old s1 to stack (fp-12)
    jal     pushToStack
    move    $a0, $s2    # push old s2 to stack (fp-16)
    jal     pushToStack
    move    $a0, $s3    # push old s3 to stack (fp-20)
    jal     pushToStack
    move    $a0, $s4    # push old s4 to stack (fp-24)
    jal     pushToStack
    move    $a0, $s5    # push old s5 to stack (fp-28)
    jal     pushToStack

    move    $s0, $t1    # store n in $s0
    move    $s1, $a1    # store A base address in $s1
    li      $s2, 0      # initial column index = 0

    # allocate memory for A'
    addi    $t0, $s0, -1    # $t0 = n - 1
    mul     $a0, $t0, $t0   # $a0 = (n-1)*(n-1)
    jal     mallocInStack   # call mallocInStack with argument n*n
    move    $s3, $v0        # store return value, i.e. base address of A' in $s3

    li      $s4, 0      # initialise current sum to 0
    li      $s5, 1      # initialise current sign to +1

    beq     $s0, 1 recursive_det_base_case

recursive_det_outer_loop:
    beq     $s2, $s0, recursive_det_return      # if column index == n then return

    move    $t0, $s3        # offset (for intermediate matrix A') = base address of A'
    li      $t1, 0          # current column = 0
    li      $t2, 1          # current row = 1

recursive_det_fill_loop:
    beq     $t1, $s2, recursive_det_fill_loop_next_col  # if current column == column index then move to next column
    
    mul     $t3, $t2, $s0   # $t3 = current row * n
    add     $t3, $t3, $t1   # $t3 = current row * n + current column
    mul     $t3, $t3, 4     # $t3 = 4*(current row * n + current column)
    add     $t3, $t3, $s1   # $t3 = A + 4*(current row * n + current column)
    lw      $t3, 0($t3)     # $t3 = A[current row][current column]
    
    sw      $t3, 0($t0)     # store it in A'

    addi    $t0, $t0, 4     # offset += 4

recursive_det_fill_loop_next_col:
    addi    $t1, $t1, 1                         # current column ++
    blt     $t1, $s0, recursive_det_fill_loop   # if current column < n then loop else move to next row

    li      $t1, 0                              # reset current column
    addi    $t2, $t2, 1                         # current row ++
    blt     $t2, $s0, recursive_det_fill_loop   # if current row < n then loop else calculate determinant of the generated intermediate matrix

    addi    $a0, $s0, -1                        # $a0 = n - 1
    move    $a1, $s3                            # $a1 = A' base address
    jal     recursive_det                       # call recursive_det with parameters n-1, A'

    mul     $t0, $s2, 4                         # $t0 = column index * 4
    add     $t0, $t0, $s1                       # $t0 = A + column index * 4
    lw      $t0, 0($t0)                         # $t0 = A[0][column index]
    mul     $t0, $t0, $v0                       # $t0 = Minor(0, column index) * A[0][column index]
    mul     $t0, $t0, $s5                       # $t0 = sign * Minor(0, column index) * A[0][column index]
    add     $s4, $s4, $t0                       # current sum += Cofactor(0, column index) * A[0][column index]
    mul     $s5, $s5, -1                        # sign = -sign

    addi    $s2, $s2, 1                         # column index ++
    b       recursive_det_outer_loop

recursive_det_base_case:
    lw      $s4, 0($s1)     # for n=1 answer is the single matrix element itself

recursive_det_return:
    addi    $t0, $s0, -1    # $t0 = n - 1
    mul     $t0, $t0, $t0   # $t0 = (n-1)*(n-1)
    mul     $t0, $t0, 4     # $t0 = 4*(n-1)*(n-1)
    add     $sp, $sp, $t0   # deallocate A'

    move    $t0, $s4        # temporarily store the sum to return

    jal     popFromStack
    move    $s5, $v0        # restore $s5
    jal     popFromStack
    move    $s4, $v0        # restore $s4
    jal     popFromStack
    move    $s3, $v0        # restore $s3
    jal     popFromStack
    move    $s2, $v0        # restore $s2
    jal     popFromStack
    move    $s1, $v0        # restore $s1
    jal     popFromStack
    move    $s0, $v0        # restore $s0
    jal     popFromStack
    move    $ra, $v0        # restore $ra

    move    $v0, $t0        # store the sum to return in $v0

    lw      $fp, 0($sp)     # restore frame pointer
    addi    $sp, $sp, 4     # restore stack pointer

    jr      $ra             # return


# print function
#
# function variables
#
# n: $a0
# base address of matrix to print: $a1

printMatrix:
    li      $t0, 0          # offset = 0
    li      $t1, 0          # column_index = 0

printLoop:
    mul     $t2, $t0, 4     # $t2 = 4*offset
    add     $t2, $a1, $t2   # $t2 = base address of A + 4*offset
    lw      $t2, 0($t2)     # load the value at A + 4*offset into $t2

    move    $t3, $a0        # temporarily store n in $t3

    li      $v0, 1          # print $t2
    move    $a0, $t2
    syscall

    li      $v0, 4          # print space
    la      $a0, space
    syscall

    move    $a0, $t3        # restore n in $a0

    addi    $t0, $t0, 1             # offset++
    addi    $t1, $t1, 1             # column_index++
    blt     $t1, $a0, printLoop     # if column_index < n then loop else print newline

    move    $t2, $a0        # temporarily store n in $t2
    
    li      $v0, 4          # print newline
    la      $a0, newline
    syscall
    
    li      $t1, 0          # reset column_index = 0

    move    $a0, $t2        # restore n in $a0

    mul     $t2, $a0, $a0       # $t2 = n*n
    blt		$t0, $t2, printLoop	# if offset < n*n then loop else return

    li      $v0, 4          # print an extra newline for clean output
    la      $a0, newline
    syscall

    jr      $ra

# initStack function
#
# program variables
#
# -

initStack:
    addi    $sp, $sp, -4    # make space for storing frame pointer
    sw      $fp, 0($sp)     # store old frame pointer
    move    $fp, $sp        # update frame pointer to the new base of stack
    jr		$ra

# malloc function
#
# function variables
#
# size: $a0
# return base address: $v0

mallocInStack:
    mul     $a0, $a0, 4
    sub		$sp, $sp, $a0   # sp = sp - (4*size), reserve space in stack
    move    $v0, $sp        # store the base address in $v0
    jr      $ra
    
# push function
#
# function variables
#
# n: $a0

pushToStack:
    addi    $sp, $sp, -4    # make space for storing the new element
    sw      $a0, 0($sp)     # save the new element to stack
    jr      $ra

# pop function (returns the first element in stack and shifts the stack pointer)
#
# function variables
#
# -

popFromStack:
    lw      $v0, 0($sp)     # store the first element of stack as return value
    addi    $sp, $sp, 4     # pop it from the stack
    jr      $ra