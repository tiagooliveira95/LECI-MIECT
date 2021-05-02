        .equ STR_MAX_SIZE, 20
        .equ printStr, 8
        .equ readStr, 9
        .equ printInt, 6
        .equ printInt10, 7
        .equ putChar,3
        .data
s0:     .asciiz "Introduza 2 strings:\n"
s1:     .asciiz "\nResultados:\n"
str1:   .space 21                       # char str1[STR_MAX_SIZE + 1]
str2:   .space 21                       # char str2[STR_MAX_SIZE + 1]
str3:   .space 41                       # char str3[2 * STR_MAX_SIZE + 1]
        .text
        .globl main

main:   addiu   $sp, $sp, -4
        sw      $ra, 0($sp)

        li      $v0, printStr
        la      $a0, s0
        syscall                         # printStr("Introduza 2 strings: ");

        li      $v0, readStr
        la      $a0, str1
        li      $a1, STR_MAX_SIZE
        syscall                         # readStr( str1, STR_MAX_SIZE );

        li      $v0, putChar            # added for formating purposes
        li      $a0, '\n'
        syscall                         # putChar("\n");

        li      $v0, readStr
        la      $a0, str2
        li      $a1, STR_MAX_SIZE
        syscall                         #  readStr( str2, STR_MAX_SIZE );

        li      $v0, printStr
        la      $a0, s1
        syscall                         #  printStr("Resultados:\n");

        la      $a0, str1               # prinInt( strlen(
        jal     strlen                  #   str1
        move    $a0, $v0                # ) ,
        li      $a1, 10                 #   10
        li      $v0, printInt           # );
        syscall                         #

        li      $v0, putChar            # added for formating purposes
        li      $a0, '\n'
        syscall                         # putChar("\n");

        la      $a0, str2               # prinInt( strlen(
        jal     strlen                  #   str2
        move    $a0, $v0                # ) ,
        li      $a1, 10                 #   10
        li      $v0, printInt           # );
        syscall                         #

        li      $v0, putChar            # added for formating purposes
        li      $a0, '\n'
        syscall                         # putChar("\n");

        la      $a0,str3
        la      $a1,str1
        jal     strcpy
                                        # printStr(
        la      $a0,str3                #   strcat(str3 ,
        la      $a1,str2                #       str2
        jal     strcat                  #   )
        move    $a0,$v0                 #
        li      $v0, printStr           #
        syscall                         # );

        li      $v0, putChar            # added for formating purposes
        li      $a0, '\n'
        syscall                         # putChar("\n");

                                        # printInt10(
        la      $a0,str1                #   strcmp(str1 ,
        la      $a1,str2                #       str2
        jal     strcmp                  #   )
        move    $a0,$v0                 #
        li      $v0, printInt10         #
        syscall                         # );

        li      $v0, 0                  # return 0

        lw      $ra, 0($sp)
        addiu   $sp, $sp, 4
        jr      $ra

#Mapa de registos
# len -> $t0
# s -> $t1
# *s -> $t2
strlen: move    $t1, $a0
        li      $t0, 0                  # len++
for:    lb      $t2, 0($t1)             # $t2 = *s
        beq     $t2, 0, endFor          # for( len = 0; *s != '\0'; len++, s++ )
        addi    $t0,$t0,1               # len++
        addi    $t1,$t1,1               # s++
        j       for
endFor: move    $v0,$t0                 # return len
        jr      $ra

#Mapa de registos
# *dst -> $s0
# *src -> $s1
# *p -> $s2
strcpy: addi    $sp,$sp,-16
        sw      $ra,0($sp)
        sw      $s0,4($sp)
        sw      $s1,8($sp)
        sw      $s2,12($sp)

        move    $s0,$a0
        move    $s1,$a1
        move    $s2,$s0             # char *p = dst;

for2:   lb      $t0,0($s1)          # t0 = *src
        sb      $t0,0($s0)          # t0 = *dst = *src
        beq     $t0,0,endFor2       # for( ; ( *dst = *src ) != '\0'; dst++, src++ );
        addi    $s0,$s0,1           # dst++
        addi    $s1,$s1,1           # src++
        j       for2
endFor2:
        move    $v0,$s2             # return p

        lw      $ra,0($sp)
        lw      $s0,4($sp)
        lw      $s1,8($sp)
        lw      $s2,12($sp)
        addi    $sp,$sp,16

        jr      $ra


#Mapa de registos
# *dst -> $s0
# *src -> $s1
# *p -> $s2
strcat: addi    $sp,$sp,-16
        sw      $ra,0($sp)
        sw      $s0,4($sp)
        sw      $s1,8($sp)
        sw      $s2,12($sp)

        move    $s0,$a0
        move    $s1,$a1
        move    $s2,$s0             # char *p = dst;

for3:   lb      $t0,0($s0)          # for( ; *dst != '\0'; dst++ )
        beq     $t0,0,endFor3       #
        addi    $s0,$s0,1           # dst++
        j       for3
endFor3:
        move    $a0,$s0             # strcpy( dst,
        move    $a1,$s1             #   src
        jal     strcpy              # );

        move    $v0,$s2             # return p

        lw      $ra,0($sp)
        lw      $s0,4($sp)
        lw      $s1,8($sp)
        lw      $s2,12($sp)
        addi    $sp,$sp,16

        jr      $ra

# Returned value is:
#   < 0  string "s1" is "less than" string "s2"
#   = 0  string "s1" is equal to string "s2"
#   > 0  string "s1" is "greater than" string "s2"
#Mapa de registos
# $t0 = *s1
# $t1 = *s2
strcmp: lb      $t0,0($a0)
        lb      $t1,0($a1)
        bne     $t0,$t1,endfor4         # for( ;(*s1 == *s2)  &&
        beq     $t0,0,endfor4           #   *s1 != '\0'); s1++, s2++) {
        addiu   $a0,$a0,1               #       s1++;
        addiu   $a1,$a1,1               #       s2++;
        j       strcmp                    # }
endfor4:
        sub     $v0, $t0, $t1           # return (*s1 - *s2);
        jr      $ra
