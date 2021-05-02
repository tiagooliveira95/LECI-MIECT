    .equ resetCoreTimer, 12
    .equ readCoreTimer, 11
    .equ putChar, 3
    .equ printInt, 6
    .data
    .text
    .globl main



main:



# Mapa de Registos
# curCount - t0
# retValue - t1
# reset - t2
# ms - t3
timeDone:   li      $t0,0                   # curCount = 0
            li      $t1,0                   # retValue = 0
            li      $t3,$a0                 # ms
            li      $t2,$a1                 # reset

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
endIf:      move    $v0,t1
            jr      $ra

