    .equ SFR_BASE_HI, 0xBF88        # 16 MSbits of SFR area
    .equ TRISE, 0x6100              # TRISE address is 0xBF886100
    .equ LATE,  0x6120              # LATE  address is 0xBF886120
    .equ resetCoreTimer, 12
    .equ readCoreTimer, 11
    .data
    .text
    .globl main

# Mapa de Registos
#
#
main:   addiu   $sp,$sp,-8                  # alocate space
        sw      $s0,0($sp)                  # save $s0
        sw      $s1,4($sp)
                                            # endless loop, no need to save $ra
        li      $s0,0                       # v = 0
        lui     $s1,SFR_BASE_HI             #
        lw      $t1,TRISE($s1)              # READ
        andi    $t1,$t1,0xFFFE              # MODIFY -> TRISE0 = 0
        sw      $t1,TRISE($s1)              # WRITE

while:  lw      $t1,LATE($s1)               # while { READ
        andi    $t1,$t1,0xFFFE              #   LATE0 = 0
        or      $t1,$t1,$s0                 #   MODIFY -> LATE0 = v
        sw      $t1,LATE($s1)               #   WRITE
        li      $a0,500                     #
        jal     delay                       #   delay(500)
        xori    $s0,$s0,1                   #   v ^= 1
        j       while                       # }

# Delay sub-rotine
delay:  ble     $a0,0, endFor               # for(; ms > 0; ms--) {
        li      $v0, resetCoreTimer         #
        syscall                             #   resetCoreTimer();
while2: li      $v0, readCoreTimer          #   while(readCoreTimer()
        syscall                             #
        blt     $v0, 20000, while2          #           < 20000);
        addi    $a0,$a0,-1
        j       delay                       # }
endFor: jr      $ra