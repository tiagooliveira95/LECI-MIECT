    .equ SFR_BASE_HI, 0xBF88        # 16 MSbits of SFR area
    .equ TRISB, 0x6040
    .equ PORTB, 0x6050
    .equ LATB,  0x6060
    .equ TRISE, 0x6100              # TRISE address is 0xBF886100
    .equ PORTE, 0x6110              # PORTE address is 0xBF886110
    .equ LATE,  0x6120              # LATE  address is 0xBF886120
    .data
    .text
    .globl main


main:   lui     $t0, SFR_BASE_HI        #
        lw      $t1, TRISE($t0)         # READ  (Mem_addr = 0xBF880000 + 0x6100)
        andi    $t1, $t1, 0xFFF0        # MODIFY (bit0=bit1=bit2=bit3 = 0 (0 means OUTPUT))
        sw      $t1, TRISE($t0)         # WRITE (Write TRISE register

        lw      $t1, TRISB($t0)         # READ  (Mem_addr = 0xBF880000 + 0x6040)
        ori     $t1, $t1, 0xF           # MODIFY (bit0=bit1=bit2=bit3 = 1 (1 means INPUT))
        sw      $t1, TRISB($t0)         # WRITE (Write TRISB register

while:  lw      $t1, PORTB($t0)         # READ
        andi    $t1, $t1, 0xF           # t1 = RB3 RB2 RB1 RB0

        xori    $t1,$t1,9               # t1 = 'RB3 RB2 RB1 'RB0
        lw      $t2,LATE($t0)           # READ (Mem_addr = 0xBF880000 + 0x6110)
        andi    $t2,$t2,0xFFF0          # RB3 = RB2 = RB1 = RB0 = 0
        or      $t2,$t2,$t1             # RE0 = RE0 = 'RB0, RE1 = RB1, RE2 = RB2 e RE3 = 'RB3
        sw      $t2,LATE($t0)           # WRITE (Mem_addr = 0xBF880000 + 0x6110)

        j   while