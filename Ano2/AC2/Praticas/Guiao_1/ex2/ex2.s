    .equ getChar,2
    .equ putChar,3
    .data
    .text
    .globl main

#Mapa de Registos

main:
do:
    li $v0, getChar     # c = getChar()
    syscall
    move $a0, $v0       #        $a0 = c;

    beq $v0,'\n', while
    li $v0, putChar
    syscall

while: beq $a0, '\n', do
       li $v0, 0
       jr $ra
