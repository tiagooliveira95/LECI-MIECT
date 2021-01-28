	.data
	.eqv print_string, 4
	.text
	.globl  itoa
	
	
	#	$s0 -> s
#	$s1 -> n
#	$s2 -> p
#	$s3 -> b
#	$s4 -> digit
itoa:								# char *itoa(unsigned int n, unsigned int b, char *s) {
		addiu	$sp,$sp,-24		# alucar expaço stack
		sw 		$ra, 0($sp)		# salvaguardar $ra
		sw 		$s0, 4($sp)
		sw 		$s1, 8($sp)
		sw		$s2, 12($sp)
		sw		$s3, 16($sp)
		sw		$s4, 20($sp)
		move	$s0,$a2
		move	$s1,$a0
		move	$s2,$a2			# *p = s	
		move	$s3,$a1
do:		remu	$s4,$s1,$s3		# digit = n % b;
		divu		$s1,$s1,$s3		#n=  n / b;
		move	$a0,$s4	
		jal 		toascii
		sb		$v0,0($s2)		# *p++ = toascii( digit );
		addiu	$s2,$s2,1		# p++						
		bgtz		$s1,do			#} while( n > 0 ); 
		sb		$s0,0($s2)		# *p = '\0';
		move	$a0,$s0
		jal		strrev			# strrev( s ); & return s			
		move	$v0,$s3
		lw 		$ra, 0($sp)		# repor $ra
		lw 		$s0, 4($sp)
		lw 		$s1, 8($sp)
		lw		$s2, 12($sp)
		lw		$s3, 16($sp)
		lw		$s4, 20($sp)
		addiu	$sp,$sp, 24
		jr		$ra