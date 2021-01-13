# Mapa de registos
# $t0 -> p
# $t1 -> *p

		.data
str1:	.asciiz "Introduza uma string: "
		.eqv SIZE, 20
		.eqv read_string, 8
		.eqv print_string, 4
array:	.space SIZE
		.text
		.globl main

main:	
		la $a0, str1
		li $v0, print_string
		syscall
		
		la $a0, array			# $a0 = &array
		li $a1, SIZE			# $a1 = size
		li $v0 read_string
		syscall
		
		la $t0,array			# $0 = array

while:						# while (*p != '\0')
		lb $t1, 0($t0)			#  $t1 = *p
		beq $t1, '\0', endw		# {
		
		sub $t1,$t1,'a'
		add $t1,$t1,'A'
		sb, $t1, 0($t0)
		
		add $t0,$t0,1	
		j while
endw:	
		la $a0, array
		li $v0, print_string
		syscall
		jr $ra	