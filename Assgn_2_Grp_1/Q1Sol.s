# This program computes and displays the sum of integers from 1 up to n,
# where n is entered by the user.
#

    .globl  main

    .data

# program output text constants
prompt:
    .asciiz "Please enter a positive integer: "
result1:
    .asciiz "The sum of the first "
result2:
    .asciiz " integers is "
newline:
    .asciiz "\n"

    .text

# main program
#
# program variables
#   n:   $s0
#   sum: $s1
#   i:   $s2
#
main:
    li      $v0, 4          # issue prompt
    la      $a0, prompt
    syscall

    li      $v0, 5          # get n from user
    syscall
    move    $s0, $v0

    li      $s1, 0          # sum = 0
    li      $s2, 0          # i = 0
for:
    blt     $s0, $s2, endf  # exit loop if n < i
    add     $s1, $s1, $s2   #     sum += i
    add     $s2, $s2, 1     #     i++
    b       for             # continue loop
endf:

    li      $v0, 4          # print "The sum of the first "
    la      $a0, result1
    syscall

    li      $v0, 1          # print n
    move    $a0, $s0
    syscall

    li      $v0, 4          # print " integers is "
    la      $a0, result2
    syscall

    li      $v0, 1          # print sum
    move    $a0, $s1
    syscall

    li      $v0, 4          # print two newlines
    la      $a0, newline
    syscall
    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10         # terminate the program
    syscall
