###############################################################################
    # Assignment Number: 4
    # Problem Number: 2
    # Semester Number: 5
    # Group Number: 1 
    # Group Members: Animesh Jha(19CS10070), Nisarg Upadhyaya (19CS30031)
###############################################################################

.globl  main
.data

# program output text constants
array: 
    .space 40    #10 element integer array
prompt_arr:
    .asciiz "Please enter array element "
prompt_sorted:
    .asciiz "Sorted array: "
separator:
    .asciiz " : "
newline:
    .asciiz "\n"

.text

# main program
#
# program variables
# array_length: $s0

main:
    jal     initStack
    li      $s0, 10 # initialise array length

    # read array from user
    li      $t0, 0  # i = 0
    li      $t1, 1  # index = 1 (for printing purpose)

read_loop:
    li      $v0, 4      # print prompt_arr
    la      $a0, prompt_arr
    syscall

    li      $v0, 1      # print index
    move    $a0, $t1
    syscall

    li      $v0, 4      # print separator
    la      $a0, separator
    syscall
    
    li      $v0, 5   # read array element
    syscall   

    sw      $v0, array($t0)     # store array element in array[i]

    addi    $t0, $t0, 4         # i++
    addi    $t1, $t1, 1
    bne     $t0, 40, read_loop  # loop termination condition

    la      $a0, array  # load array address in $a0
    li      $a1, 0      # load start index in $a1
    li      $a2, 9      # load end index in $a2

    jal     recursive_sort  # call recursive sort with parameters array, 0, 9

    li      $v0, 4  # print prompt_sorted
    la      $a0, prompt_sorted
    syscall

    la      $a0, array  # load array address in $a0
    move    $a1, $s0    # store array_length in $a1
    jal     print_array # print array

    lw      $fp, 0($sp) # restore frame pointer
    addi    $sp, $sp, 4 # restore stack pointer

    li      $v0, 10     # terminate program
    syscall

# recursive sort function
#
# function variables
#
# array A start address: $a0
# start index left: $a1
# end index right: $a2
# l: $s0
# r: $s1
# p: $s2

recursive_sort:
    move    $t0, $ra    # store $ra temporarily
    jal     initStack   # initialise sp and fp
    move    $t1, $a0    # store array address temporarily
    
    move    $a0, $t0    # push old ra to stack (fp-4)
    jal     pushToStack
    move    $a0, $s0    # push old s0 to stack (fp-8)
    jal     pushToStack
    move    $a0, $s1    # push old s1 to stack (fp-12)
    jal     pushToStack
    move    $a0, $s2    # push old s2 to stack (fp-16)
    jal     pushToStack

    move    $a0, $t1    # push array address (fp-20)
    jal     pushToStack 
    move    $a0, $a1    # push start index left (fp-24)
    jal     pushToStack
    move    $a0, $a2    # push end index right (fp-28)
    jal     pushToStack

    move    $a0, $t1    # restore array address

    move    $s0, $a1    # l = left
    move    $s1, $a2    # r = right
    move    $s2, $a1    # p = left

recursive_sort_outer_while:
    bge     $s0, $s1, recursive_sort_return     # if l >= r then return

recursive_sort_inner_while_l:
    mul     $t0, $s0, 4     # $t0 = 4*l
    add     $t0, $a0, $t0   # $t0 = base address of A + 4*l
    lw      $t0, 0($t0)     # load the value at A + 4*l into $t0 = A[l]

    mul     $t1, $s2, 4     # $t1 = 4*p
    add     $t1, $a0, $t1   # $t1 = base address of A + 4*p
    lw      $t1, 0($t1)     # load the value at A + 4*p into $t1 = A[p]

    bgt     $t0, $t1, recursive_sort_inner_while_r      # if A[l] > A[p] then move to next loop
    bge     $s0, $a2, recursive_sort_inner_while_r      # if l >= right then move to next loop
    addi    $s0, $s0, 1                                 # l++
    b       recursive_sort_inner_while_l                # loop

recursive_sort_inner_while_r:
    mul     $t0, $s1, 4     # $t0 = 4*r
    add     $t0, $a0, $t0   # $t0 = base address of A + 4*r
    lw      $t0, 0($t0)     # load the value at A + 4*r into $t0 = A[r]

    mul     $t1, $s2, 4     # $t1 = 4*p
    add     $t1, $a0, $t1   # $t1 = base address of A + 4*p
    lw      $t1, 0($t1)     # load the value at A + 4*p into $t1 = A[p]

    blt     $t0, $t1, recursive_sort_inner_if       # if A[r] < A[p] then move to if condition
    ble     $s1, $a1, recursive_sort_inner_if       # if r <= left then move to if condition
    addi    $s1, $s1, -1                            # r--
    b       recursive_sort_inner_while_r            # loop

recursive_sort_inner_if:
    blt     $s0, $s1, recursive_sort_inner_swap     # if l < r then move to swap

    # swap A[p] and A[r]
    # $a0 already has base address of array A
    move    $a1, $s2        # move p to $a1
    move    $a2, $s1        # move r to $a2
    jal     swap            # call swap with parameters A, p, r

    # call to recursive sort(A, left, r-1)
    # $a0 already has base address of array A
    lw      $a1, -24($fp)   # load left into $a1
    addi    $a2, $s1, -1    # set $a2 to r-1
    jal     recursive_sort  # call recursvive sort with parameters A, left, r-1

    # call to recursive sort(A, r+1, right) 
    # $a0 already has base address of array A
    addi    $a1, $s1, 1     # set $a1 to r+1
    lw      $a2, -28($fp)   # load right into $a2
    jal     recursive_sort  # call recursvive sort with parameters A, r+1, right

    b       recursive_sort_return

recursive_sort_inner_swap:
    # swap A[l] and A[r]
    # $a0 already has base address of array A
    move    $a1, $s0        # move l to $a1
    move    $a2, $s1        # move r to $a2
    jal     swap            # call swap with parameters A, l, r

    lw      $a1, -24($fp)   # restore $a1
    lw      $a2, -28($fp)   # restore $a2

    b       recursive_sort_outer_while

recursive_sort_return:
    lw      $ra, -4($fp)    # restore $ra
    lw      $s0, -8($fp)    # restore $s0
    lw      $s1, -12($fp)   # restore $s1
    lw      $s2, -16($fp)   # restore $s2
    addi    $sp, $sp, 28    # pop from stack

    lw      $fp, 0($sp)     # restore frame pointer
    addi    $sp, $sp, 4     # restore stack pointer

    jr      $ra             # return

# swap function (for convenience we have implemented it such that
# given the array base address and indices i and j it will swap
# arr[i] and arr[j] wherever they are stored)
#
# function variables
#
# array base address: $a0
# i: $a1
# j: $a2

swap:
    mul     $t0, $a1, 4     # $t0 = 4*i
    add     $t0, $a0, $t0   # $t0 = base address of A + 4*i
    lw      $t2, 0($t0)     # load the value at A + 4*i into $t2 = A[i]

    mul     $t1, $a2, 4     # $t1 = 4*j
    add     $t1, $a0, $t1   # $t1 = base address of A + 4*j
    lw      $t3, 0($t1)     # load the value at A + 4*j into $t3 = A[j]

    sw      $t2, 0($t1)     # load the value in $t2 at  A + 4*j, A[j] now has old value of A[i]
    sw      $t3, 0($t0)     # load the value in $t3 at  A + 4*i, A[i] now has old value of A[j]
    jr		$ra			    # return

# print array function
#
# function variables
#
#   $a0: array base address
#   $a1: N 
#   $t0: i
#   $t2: 4*i (offset)

print_array: 
    li      $t0, 0      # i = 0
    li      $t2, 0      # offset = 0
    move    $s0, $a0    # move array base address to $s0

print_for_loop:
    bge     $t0, $a1, print_func_end  # if i>=n break

    add     $t1, $s0, $t2       # $t1 = array base address + 4*i
    lw      $t1, 0($t1)         # load array[i] in $t1
    addi    $t2, $t2, 4         # offset = offset + 4
    
    li      $v0, 1      # print array[i]
    move    $a0, $t1    # load array[i] in $a0
    syscall             

    li      $v0, 11     # print space character
    li      $a0, 32     # load sapace character in $a0
    syscall

    addi    $t0, $t0, 1 # i++
    b       print_for_loop

print_func_end:
    li      $v0, 4      # print newline
    la      $a0, newline
    syscall

    jr      $ra         # return

# initStack function
#
# function variables
#
# -

initStack:
    addi    $sp, $sp, -4    # make space for storing frame pointer
    sw      $fp, 0($sp)     # store old frame pointer
    move    $fp, $sp        # update frame pointer to the 2new base of stack
    jr		$ra
    
# push function
#
# function variables
#
# n: $a0

pushToStack:
    addi    $sp, $sp, -4    # make space for storing the new element
    sw      $a0, 0($sp)     # save the new element to stack
    jr      $ra
