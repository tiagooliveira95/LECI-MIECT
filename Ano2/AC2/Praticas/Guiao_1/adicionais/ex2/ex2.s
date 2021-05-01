        .equ SRT_MAX_SIZE, 20
        .equ printStr, 8
        .equ readStr, 9
        .equ printInt, 6
        .equ printInt10, 7
        .data
s0:     .asciiz "Introduza 2 strings: "
s1:     .asciiz "Resultados:\n"
str1:   .space 21                       # char str1[STR_MAX_SIZE + 1]
str2:   .space 21                       # char str2[STR_MAX_SIZE + 1]
str3:   .space 41                       # char str3[2 * STR_MAX_SIZE + 1]
        .text
        .globl main

main:   addiu   $sp, $sp, -4
        sw      $ra, 0($sp)

        li $v0, printStr
        la $a0, s0
        syscall                         # printStr("Introduza 2 strings: ");

        li $v0, readStr
        la $a0, str1
        li $a1, STR_MAX_SIZE
        syscall                         # readStr( str1, STR_MAX_SIZE );

        li $v0, readStr
        la $a0, str2
        li $a1, STR_MAX_SIZE
        syscall                         #  readStr( str2, STR_MAX_SIZE );

        li $v0, printStr
        la $a0, s1
        syscall                         #  printStr("Resultados:\n");




        lw      $ra, 0($sp)
        addiu   $sp, $sp, 4
        jr      $ra