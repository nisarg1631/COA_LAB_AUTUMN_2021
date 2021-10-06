###############################################################################
    # COA LAB TEST 1
    # Problem Number: 1
    # Semester Number: 5
    # Name: Nisarg Upadhyaya (19CS30031)
###############################################################################

.globl  main
.data

# program output text constants
string: 
    .space 101    #space for string
prompt:
    .asciiz "Please enter a string (at most 100 in length): "
prompt_upper:
    .asciiz "String in uppercase is: "
prompt_operation:
    .asciiz "Please enter the operation ( E for encrypt, D for decrypt ): "
prompt_shift:
    .asciiz "Please enter shift amount: "
prompt_encrypt:
    .asciiz "Encrypted string is: "
prompt_decrypt:
    .asciiz "Decrypted string is: "
newline:
    .asciiz "\n"

.text

# main program

main:
    jal     initStack

    # print prompt
    li      $v0, 4
    la      $a0, prompt
    syscall

    # get string from user
    li      $v0, 8
    la      $a0, string
    li      $a1, 100
    syscall

    # call to upper
    la      $a0, string
    jal     to_upper

    # print prompt
    li      $v0, 4
    la      $a0, prompt_upper
    syscall

    #print string
    li      $v0, 4
    la      $a0, string
    syscall

    #print newline
    li      $v0, 4
    la      $a0, newline
    syscall

    # print operation prompt
    li      $v0, 4
    la      $a0, prompt_operation
    syscall

    # get op
    li      $v0, 12
    syscall
    move    $s0, $v0

    #print newline
    li      $v0, 4
    la      $a0, newline
    syscall

    # print shift prompt
    li      $v0, 4
    la      $a0, prompt_shift
    syscall

    # get shift
    li      $v0, 5
    syscall
    move    $s1, $v0

    beq     $s0, 69, call_encrypt # if op is E branch to encryption

    # else decrypt
    # print decryption prompt
    li      $v0, 4
    la      $a0, prompt_decrypt
    syscall

    # call decrypt
    la      $a0, string
    move    $a1, $s1
    jal     decrypt

    b       end

call_encrypt:
    # print encryption prompt
    li      $v0, 4
    la      $a0, prompt_encrypt
    syscall

    # call encrypt
    la      $a0, string
    move    $a1, $s1
    jal     encrypt

end:
    #print string
    li      $v0, 4
    la      $a0, string
    syscall

    lw      $fp, 0($sp)     # restore frame pointer
    addi    $sp, $sp, 4     # restore stack pointer
    li      $v0, 10         # terminate program
    syscall

# to upper function
# $a0 -> string
to_upper:
    li      $t0, 0
     
to_upper_loop:
    move    $t2, $a0
    add     $t2, $t2, $t0
    lbu     $t1, 0($t2)
    beq     $t1, $zero, to_upper_done      # if null or newline done
    beq     $t1, 10, to_upper_done          # if null or newline done
    blt     $t1, 91, to_upper_next          # if already upper then next
    addi    $t1, $t1, -32
    sb      $t1, 0($t2)

to_upper_next:
    addi    $t0, $t0, 1
    j       to_upper_loop

to_upper_done:
    jr $ra   

# encrypt function
# $a0 -> string
# $a1 -> shift
encrypt:
    li      $t0, 0
    li      $t3, 26

encrypt_loop:
    move    $t2, $a0
    add     $t2, $t2, $t0
    lbu     $t1, 0($t2)
    beq     $t1, $zero, encrypt_done        # if null or newline done
    beq     $t1, 10, encrypt_done           # if null or newline done

    addi    $t1, $t1, -65   # bring char to range 0-25
    add     $t1, $t1, $a1   # add shift
    div     $t1, $t3
    mfhi    $t1             # bring char to range 0-25
    addi    $t1, $t1, 65    # bring char to range 65-90

    sb      $t1, 0($t2)
    addi    $t0, $t0, 1
    j       encrypt_loop

encrypt_done:
    jr $ra

# decrypt function
# $a0 -> string
# $a1 -> shift
decrypt:
    li      $t0, 0
    li      $t3, 26

decrypt_loop:
    move    $t2, $a0
    add     $t2, $t2, $t0
    lbu     $t1, 0($t2)
    beq     $t1, $zero, decrypt_done        # if null or newline done
    beq     $t1, 10, decrypt_done           # if null or newline done

    addi    $t1, $t1, -65   # bring char to range 0-25
    sub     $t1, $t1, $a1   # subtract shift
    div     $t1, $t3
    mfhi    $t1             # bring char to range 0-25
    add     $t1, $t1, $t3   # normalize
    div     $t1, $t3
    mfhi    $t1             # bring char to range 0-25
    addi    $t1, $t1, 65    # bring char to range 65-90

    sb      $t1, 0($t2)
    addi    $t0, $t0, 1
    j       decrypt_loop

decrypt_done:
    jr $ra

# initStack function
initStack:
    addi    $sp, $sp, -4    # make space for storing frame pointer
    sw      $fp, 0($sp)     # store old frame pointer
    move    $fp, $sp        # update frame pointer to the new base of stack
    jr		$ra
