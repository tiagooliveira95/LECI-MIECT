	.data
s1:	.asciiz "Insira uma temperatura em ºF\n"
s2:	.asciiz " ºC"	
	.eqv read_double, 7
	.eqv print_double, 3
	.eqv print_string,4
	.text
	.globl main
	
main:	addiu	$sp,$sp, -4
		sw		$ra,0($sp)
		la		$a0,s1
		li		$v0,print_string
		syscall
		li		$v0,read_double
		syscall
		mov.d	$f12,$f0
		jal		f2c
		mov.d	$f12,$f0	
		li		$v0,print_double
		syscall
		la		$a0,s2
		li		$v0,print_string
		syscall		
		lw		$ra,0($sp)
		addiu	$sp,$sp, 4
		jr		$ra