    .equ SFR_BASE_HI, 0xBF88        # 16 MSbits of SFR area
    .equ TRISB, 0x6040
    .equ TRISE, 0x6100              # TRISE address is 0xBF886100
    .equ LATE,  0x6120              # LATE  address is 0xBF886120
    .equ resetCoreTimer, 12
    .equ readCoreTimer, 11
    .data
    .text
    .globl main

# Mapa de registos
# $s0 - SFR_BASE_HI
# $s1 - counter
main:   li      $s1, 0                      # counter = 0
        lui     $s0, SFR_BASE_HI            #
        lw      $t1, TRISE($s0)             # READ  (Mem_addr = 0xBF880000 + 0x6100)
        andi    $t1, $t1, 0xFFF0            # MODIFY (bit0=bit1=bit2=bit3 = 0 (0 means OUTPUT))
        sw      $t1, TRISE($s0)             # WRITE (Write TRISE register

        lw      $t1, TRISB($s0)             # READ  (Mem_addr = 0xBF880000 + 0x6040)
        ori     $t1, $t1, 0xF               # MODIFY (bit0=bit1=bit2=bit3 = 1 (1 means INPUT))
        sw      $t1, TRISB($s0)             # WRITE (Write TRISB register
            
while:                                      # while(1) {        
        li      $a0,666
        jal     delay                       #   delay(500)
        move    $t0,$s1                     #   t0 = counter
        andi    $t0,$t0,8                   #   t0 = counter && 8
        srl     $t0,$t0,3                   #   t0 = (counter && 8) << 3
        xori    $t0,$t0,1                   #   t0 = '((counter && 8) << 3)
        sll     $s1,$s1,1                   #   counter = counter << 1
        or      $s1,$s1,$t0                 #   counter = counter << 1 | '((counter && 8) << 3)
        lw      $t0,LATE($s0)               #   READ
        andi    $t0,$t0,0xFFF0              #   bit[3..0] = 0
        or      $t0,$t0,$s1                 #   LATE[3..0] = COUNTER[3..0]
        sw      $t0,LATE($s0)               #   WRITE
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