    .equ resetCoreTimer, 12
    .equ readCoreTimer, 11
    .equ putChar, 3
    .equ printInt, 6
    .data
    .text
    .globl main

# Mapa de Registos
# cnt1 = s0
# cnt5 = s1
# cnt10 = s2
# timeElapsed = s3
main:   addiu   $sp,$sp,-20
        sw      $ra,0($sp)
        sw      $s0,4($sp)
        sw      $s1,8($sp)
        sw      $s2,12($sp)
        sw      $s3,16($sp)
        li      $s0, 0                      # cnt1 = 0;
        li      $s1, 0                      # cnt5 = 0;
        li      $s2, 0                      # cnt10 = 0;
        li      $s3, 0                      # timeElapsed = 0
while:                                      # while(1) {
        seq     $a1,$s3,1000                # a1 = timeElapsed == 1000;
        jal     timeDone                    # timeDone(xx,timeElapsed == 1000) // resets core timer if 1s elapsed
        seq     $t0,$s3,1000                # t0 = timeElapsed == 1000;
        bne     $t0,1,endif                 # if(timeElapsed == 1000) {
        li      $a0, '\n'                   #
        li      $v0, putChar                #
        syscall                             #   putChar('\n');
        li      $s3, 0                      #   timeElapsed = 0
endif:                                      # }

        addi    $s3,100                     # timeElapsed += 100ms
delay:  move    $a0,$s3                     # do {
        li      $a1,0
        jal     timeDone
        beq     $v0,0,delay                 # } while(!timeDone(timeElapsed,false))

        addi    $s2,$s2,1                   #   cnt10++

        rem     $t0,$s2,2                   #   t0 = cnt % 2
        seq     $t0,$t0,$0                  #   t0 = cnt10 & 2 == 0
        add     $s1,$s1,$t0                 #   cnt5 += cnt10 % 2 == 0;

        rem     $t0,$s2,10                  #   t0 = cnt % 10
        seq     $t0,$t0,$0                  #   t0 = cnt10 & 10 == 0
        add     $s0,$s0,$t0                 #   cnt1 += cnt10 % 10 == 0;

        li      $a0, '\r'
        li      $v0, putChar
        syscall                             #   putChar('\r');
        li      $v0,printInt
        move    $a0,$s2                     #   a0 = cnt10
        li      $a1,0x5000A                 #   a1 = 10 | 5 << 16
        syscall                             #   printInt(cnt10, 10 | 5 << 16);

        li      $a0, '\t'
        li      $v0, putChar
        syscall                             #   putChar('\t');
        li      $v0,printInt
        move    $a0,$s1                     #   a0 = cnt5
        li      $a1,0x5000A                 #   a1 = 10 | 5 << 16
        syscall                             #   printInt(cnt5, 10 | 5 << 16);

        li      $a0, '\t'
        li      $v0, putChar
        syscall                             #  putChar('\t');
        li      $v0,printInt
        move    $a0,$s0                     #   a0 = cnt1
        li      $a1,0x5000A                 #   a1 = 10 | 5 << 16
        syscall                             #   printInt(cnt1, 10 | 5 << 16);

        j   while                           # }

        lw      $ra,0($sp)
        lw      $s0,4($sp)
        lw      $s1,8($sp)
        lw      $s2,12($sp)
        lw      $s3,16($sp)
        addiu   $sp,$sp,20
        li      $v0,0                       # return 0
        jr      $ra

# Mapa de Registos
# curCount - t0
# retValue - t1
# reset - t2
# ms - t3
timeDone:   li      $t0,0                   # curCount = 0
            li      $t1,0                   # retValue = 0
            move    $t3,$a0                 # ms
            move    $t2,$a1                 # reset

            ble     $t2,0,else
            li      $v0,resetCoreTimer      # resetCoreTimer();
            syscall
            j       endIf
else:       li      $v0,readCoreTimer       #
            syscall                         #
            move    $t0,$v0                 # curCount = readCoreTimer();
            mul     $t4,$t3,20000           # t4 = ms * 20000
            ble     $t0,$t4,endIf           # if (curCount > (ms * 20000)) {
            div     $t1,$t0,20000           #   retValue = curCount / 20000;
                                            # }
endIf:      move    $v0,$t1
            jr      $ra