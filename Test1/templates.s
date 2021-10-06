    # print string
    li      $v0, 4
    la      $a0, prompt
    syscall

    # get input integer
    li      $v0, 5
    syscall
    move    $s0, $v0

    # print integer    
    li      $v0, 1
    move    $a0, $s2
    syscall
