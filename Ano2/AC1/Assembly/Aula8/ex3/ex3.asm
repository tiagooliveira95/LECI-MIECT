	.data
	.eqv print_string, 4
	.eqv	print_intu10, 36
	.eqv read_int, 5
	.text
	.globl main

# dividendo -> $t0
# divisor	-> $t1
main:	addiu	$sp,$sp,-4
		sw		$ra,0($sp)
		
		li 		$v0,read_int		# 
		syscall					# 
		move	$t0,$v0			# dividendo = read_int()
		li 		$v0,read_int		# 
		syscall					# 
		move	$t1,$v0			# divisor = read_int()
		
		move 	$a0	,$t0
		move 	$a1,$t1
		jal		udiv
		
		move	$a0, $v0			#	
		li		$v0, print_intu10	#	
		syscall					#print_intu10(udiv(dividendo,divisor));
		
		
		lw		$ra,0($sp)
		addiu	$sp,$sp,4
		jr		$ra

		
		