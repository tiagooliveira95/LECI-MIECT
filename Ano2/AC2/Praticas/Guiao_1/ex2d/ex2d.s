    .equ readInt10, 5
    .equ printInt10, 7
    .equ printStr, 8
    .equ printInt, 6
    .data
str0:    .asciiz "\nIntroduza um numero (sinal e módulo): "
str1:    .asciiz "\nValor lido, em base 2: "
str2:    .asciiz "\nValor lido, em base 16: "
str3:    .asciiz "\nValor lido, em base 10 (unsigned): "
str4:    .asciiz "\nValor lido, em base 10 (signed): "
    .text
    .globl main

main:
        la $a0,str0
        li $v0, printStr
        syscall

        li $v0, readInt10
        syscall
        move $t0,$v0


        la $a0,str1
        li $v0, printStr
        syscall

        li $v0, printInt
        move $a0,$t0
        li $a1,2
        syscall


        la $a0,str2
        li $v0, printStr
        syscall

        li $v0, printInt
        move $a0,$t0
        li $a1,16
        syscall


        la $a0,str3
        li $v0, printStr
        syscall

        li $v0, printInt
        move $a0,$t0
        li $a1,10
        syscall


        la $a0,str4
        li $v0, printStr
        syscall

        li $v0, printInt10
        move $a0, $t0
        syscall

        li $v0, 0

        jr $ra