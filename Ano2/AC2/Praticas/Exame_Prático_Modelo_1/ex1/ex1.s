    .equ UPPER_SFR, 0xBF88
    .equ TRISE, 0x6100
    .equ LATE, 0x6120
    .equ readCoreTimer, 11
    .equ resetCoreTimer,12
    .equ readChar,2
    .data
    .text
    .globl main

main:   addi    $sp,$sp,-8
        sw      $ra,0($sp)
        sw      $s0,4($sp)

        lui     $s0,UPPER_SFR
        lw      $t0,TRISE($s0)
        andi    $t0,$t0,0xE0
        sw      $t0,TRISE($s0)

while:  li      $v0,readChar            # while(1) {
        syscall

        bne     $v0,'0',else1
        lw      $t0,LATE($s0)
        ori     $t0,$t0,1
        j       endif
else1:  bne     $v0,'1',else2
        lw      $t0,LATE($s0)
        ori     $t0,$t0,2
        j       endif
else2:  bne     $v0,'2',else3
        lw      $t0,LATE($s0)
        ori     $t0,$t0,4
        j       endif
else3:  bne     $v0,'3',else4
        lw      $t0,LATE($s0)
        ori     $t0,$t0,8
        j       endif
else4:  lw      $t0,LATE($s0)
        ori     $t0,$t0,0x10
        li      $t1,1               #   reset = true
endif:  sw      $t0,LATE($s0)

        bne     $t1,1,while         #   if(reset) continue;

        li      $a0,2000            #   delay(2000); // waits 2000ms
        jal     delay

        lw      $t0,LATE($s0)
        andi    $t0,$t0,0xE0
        sw      $t0,LATE($s0)

        j       while               # }

        lw      $ra,0($sp)
        lw      $s0,4($sp)
        addi    $sp,$sp,8

        jr      $ra                 # fim

delay:  ble     $a0,0, endFor               # for(; ms > 0; ms--) {
        li      $v0, resetCoreTimer         #
        syscall                             #   resetCoreTimer();
while2: li      $v0, readCoreTimer          #   while(readCoreTimer()
        syscall                             #
        blt     $v0, 20000, while2          #           < 20000);
        addi    $a0,$a0,-1
        j       delay                       # }
endFor: jr      $ra

