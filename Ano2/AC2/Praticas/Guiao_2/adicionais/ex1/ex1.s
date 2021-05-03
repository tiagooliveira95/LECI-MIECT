    .equ resetCoreTimer, 12
    .equ readCoreTimer, 11
    .equ printString, 8
    .data
str1:    .asciz "*** Windows problem fixer *** \n"
str2:    .asciz "Trying to fix problems...\n"
str3:    .asciz "We were unable to fix your problem\n"
    .text
    .globl main

# Windows problem fixer source code
# Top secret
# Don't share

main:       addi    $sp,$sp,-4
            sw      $ra,0($sp)

            li      $v0,printString
            la      $a0,str1
            syscall                     # printStr("*** Windows problem fixer *** \n")
            li      $v0,printString
            la      $a0,str2            # printStr("Trying to fix problems...\n")
            syscall

while:      li      $a0,5000            # do {
            jal     timeDone
            beq     $v0,0,while         # } while(!timeDone(5000))

            li      $v0,printString
            la      $a0,str3
            syscall                     # printStr("We were unable to fix your problem\n")

            lw      $ra,0($sp)
            addi    $sp,$sp,4
            li      $v0,0
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

