    .equ inkey,1
    .equ putChar,3
    .data
    .text
    .globl main

#Mapa de Registos
# char c -> $s0

main:   addi $sp,$sp,-8 #alucar espaço pilha
        sw $ra, 0($sp)
        sw $s0, 4($sp)

                                # do {
while:  li $v0,inkey
        syscall
        move $s0, $v0           # c = inkey()
        beq $s0,0, while        # while( (c = inkey()) == 0 );

        beq $s0, '\n', else     # if( c != '\n' )
        move $a0, $s0
        li $v0, putChar         #   putChar( c );
        syscall

else:   bne $s0,'\n', while        # } while( c != '\n' );

        lw $ra, 0($sp)          #report registos
        lw $s0, 4($sp)
        addi $sp,$sp,8
        li $v0,0                # return 0
        jr $ra





