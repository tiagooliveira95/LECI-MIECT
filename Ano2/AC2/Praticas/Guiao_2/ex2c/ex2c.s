# a) a frequencia do counter é de 100 Hz

# Mapa de Registos
# t0 - counter
        .equ resetCoreTimer, 12
        .equ readCoreTimer, 11
        .equ printInt,6
        .equ putChar,3
        .data
        .text
        .globl main

main:   li  $t0,0                       #counter = 0
while:                                  # while(1)
        li      $a0,1000                #
        jal     delay                   # delay(1000)

        addi    $t0,$t0,1               # ++counter
        li      $v0,printInt
        move    $a0,$t0                 # a0 = counter
        li      $a1,4                   # a1 = 4
        sll     $a1,$a1,16              # a1 = 4 << 16
        ori     $a1,$a1,10              # a1 = 10 | 4 << 16
        syscall                         # printInt(++counter, 10 | 4 << 16);

        li      $a0, '\r'
        li      $v0, putChar
        syscall                         # putChar('\r') // cursor regressa ao início da linha

        j       while                   #
endW:   li      $v0,0                   # return 0
        jr      $ra


delay:  ble     $a0,0, endFor               # for(; ms > 0; ms--) {
        li      $v0, resetCoreTimer         #
        syscall                             #   resetCoreTimer();
while2: li      $v0, readCoreTimer          #   while(readCoreTimer()
        syscall                             #
        blt     $v0, 20000, while2          #           < 20000);
        addi    $a0,$a0,-1
        j       delay                       # }
endFor: jr      $ra



