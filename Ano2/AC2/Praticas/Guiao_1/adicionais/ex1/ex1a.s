    .equ inkey,1
    .equ putChar,3
    .equ printInt, 6
    .data
    .text
    .globl main
# Mapa de registos
# s -> $s0
# cnt -> $s1
# c -> $s2

main:       addi    $sp, $sp, -16
            sw      $ra, 0($sp)
            sw      $s0, 4($sp)
            sw      $s1, 8($sp)
            sw      $s2, 12($sp)

do:         li      $a0, '\r'
            li      $v0, putChar
            syscall                 # putChar('\r')

            move    $a0, $s1
            li      $a1, 10
            ori     $a1, $a1, 3
            sll     $a1, $a1, 16    # printInt(cnt, 10 | 3 << 16);

            li      $a0, '\t'
            li      $v0, putChar
            syscall                 # putChar('\r')

            move    $a0, $s1
            li      $a1, 2
            ori     $a1, $a1, 8
            sll     $a1, $a1, 16    # printInt(cnt, 2 | 8 << 16);

            li      $a0, 5
            jal     wait            # wait(5);

            li      $v0,inkey       # c = inkey();
            syscall
            move    $s2, $v0

            bne     $s2, '+', endIf0
            li      $s0, 0
endIf0:     bne     $s2, '-', endIf1
            li      $s0, 1
endIf1:     bne     $s0, 0, endIf       #   if( s == 0 ) {
            addi    $s1, $s1, 1         #       cnt = cnt + 1
            andi    $s1, $s1, 0xFF      #       cnt = cnt & 0xFF
            j       endIf               #   } else {
elseIf1:    addi    $s1, $s1, -1        #       cnt = cnt - 1
            andi    $s1, $s1, 0xFF      #       cnt = cnt & 0xFF
                                        #   }ld
endIf:      bne     $s2,'q',do          # } while(c != 'q')
            li      $v0, 0

            lw      $ra, 0($sp)
            lw      $s0, 4($sp)
            lw      $s1, 8($sp)
            lw      $s2, 12($sp)
            addi    $sp, $sp, 16

            jr      $ra

# Mapa de Registos
# t0 -> i
# t1 -> ts
# t2 -> 515000 * ts
wait:       li      $t0, 0              # i = 0
            move    $t1, $a0            # t1 = ts
            li      $t2, 515000         # t2 = 515000
            mul     $t2, $t2, $t1       # t2 = 515000 * ts
while:      ble     $t0, $t2, endW      # for( i=0; i < 515000 * ts;)
            addi    $t0, $t0, 1         # i++
            j       while               # }
endW:       jr      $ra