	.data
str:	.asciiz "01"
	.eqv print_int10, 1
	.text
	.globl main
	

main:	addiu	$sp,$sp,-4		#
		sw		$ra,0($sp)		#
		la		$a0,str			#
		jal		atoi				#
		move	$a0,$v0			#
		li 		$v0,print_int10	#
		syscall					#	print_int10( atoi(str) ); 
		li		$v0,0			#	return 0;
		lw		$ra,0($sp)		#
		addiu	$sp,$sp,4		#
		jr		$ra


# $t0 -> digit
# $t1 -> res
# $t2 -> s
# $t3 -> *s
# $v0 -> res
# Sub-rotina terminal: não devem ser usados registos $sx 
atoi:		li		$t1,0		# res = 0
		move 	$t2,$a0		#	
while:	lb		$t3,0($t2)	# $t3 = *s
		blt		$t3,'0', endw	# while( (*s >= '0') &&
		bgt		$t3,'1',endw	# 	 (*s <= '1') ) {
		
		# for base 10 --- \/
		#subu 	$t0,$t3,'0'	#digit = *s++ - '0';
		#addiu	$t2,$t2,1		# s++
		#mul	$v0,$v0,10	# res = 10 * res
		#addu	$v0,$v0,$t0	# res += digit 
		
		# for base 2 --- \/
		subu 	$t0,$t3,'0'	#digit = *s++ - '0';
		addiu	$t2,$t2,1		# s++
		mul		$v0,$v0,2	# res = 2 * res
		addu	$v0,$v0,$t0	# res += digit 
		
		j		while
endw:	jr		$ra			# termina sub-rotina