	.data
str:	.space 33
	.eqv MAX_STR_SIZE 33
	.eqv print_string, 4
	.eqv read_int, 5
	.text
	.globl main
	
# s0 -> val
# s1 -> str
main:	addiu 	$sp, $sp,-12		# reserva espaço na stack
		sw		$ra,0($sp)		# salvaguardar $ra
		sw		$s0,4($sp)		#
		sw		$s0,8($sp)		#
		la		$s1,str
do:		li 		$v0,read_int		# do { 
		syscall
		move 	$s0,$v0			# val = read_int(); 
		move	$a0,$s0
		li		$a1,2
		move	$a2,$s1
		jal		itoa
		la		$a0,str			# print_string( itoa(val, 2, str) ); 
		li 		$v0,print_string	#
		syscall
		move	$a0,$s0
		li		$a1,8
		move	$a2,$s1
		jal		itoa
		la		$a0,str			# print_string( itoa(val, 2, str) ); 
		li 		$v0,print_string	#
		syscall
		move	$a0,$s0
		li		$a1,16
		move	$a2,$s1
		jal		itoa
		la		$a0,str			# print_string( itoa(val, 2, str) ); 
		li 		$v0,print_string	#
		syscall
		bne		$s0,0,do		#} while(val != 0);
		li		$v0,0			#return 0;
		lw		$ra,0($sp)		# repor $ra
		lw		$s0,4($sp)	
		lw		$s0,8($sp)		#
		addiu 	$sp, $sp,8
		jr		$ra