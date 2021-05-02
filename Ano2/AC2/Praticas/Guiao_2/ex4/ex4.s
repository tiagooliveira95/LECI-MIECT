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
main:   addiu   $sp,$sp,-16
        sw      $ra,0($sp)
        sw      $s0,4($sp)
        sw      $s1,8($sp)
        sw      $s2,12($sp)
        li      $s0, 0                      # cnt1 = 0;
        li      $s1, 0                      # cnt5 = 0;
        li      $s2, 0                      # cnt10 = 0;
while:  li      $a0,100                     # while(1) {
        jal     delay                       #   delay(100)

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
        addiu   $sp,$sp,16
        li      $v0,0                       # return 0
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