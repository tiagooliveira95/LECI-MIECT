		.data
str:		.asciiz "ITED - orievA ed edadisrevinU"
		.eqv	print_string, 4
		.text
		.globl main

main:	addiu	$sp,$sp,-4		# alucar expaço stack
		sw 		$ra, 0($sp)		# salvaguardar $ra
		
		la		$a0, str			#
		jal		strrev			# strrev(str)
			
		move	$a0, $v0			# print_string( strrev(str) )
		li		$v0, print_string	#
		syscall					#
		li		$v0, 0			# return 0;
		lw 		$ra, 0($sp)		# Repor dados
		addiu 	$sp,$sp,4
		jr 		$ra

# $s0 -> *p1
# $s1 -> *p2
# $s2 -> *str
# $t0 -> temp
strrev:	addiu	$sp,$sp,-16		# alucar expaço stack
		sw 		$ra, 0($sp)		# salvaguardar $ra
		sw 		$s0, 4($sp)
		sw 		$s1, 8($sp)
		sw		 $s2, 12($sp)
		move 	$s0, $a0			# *p1 = str;
		move 	$s1, $a0			# *p2 = str;
		move 	$s2, $a0
while:	lb 		$t0, 0($s1)		#while(*p2 != '\0')
		beq 		$t0, '\0', endW	# {
		addiu 	$s1,$s1,1		# p2++
		j while					#}
endW:	addiu 	$s1,$s1,-1 		# p2--; 

while2:	bge 		$s0,$s1, endW2	# while( p1 < p2 ) {
		move 	$a0, $s0			#
		move	$a1, $s1			#
		jal exgange				# exchange(p1, p2);
		addiu 	$s0,$s0,1		# p1++;
		addiu 	$s1,$s1,-1		# p2--;
		j while2
endW2:							# }
		move 	$v0, $s2			# return str;
		lw		$ra, 0($sp)		# Repor dados
		lw 		$s0, 4($sp)		#
		lw 		$s1, 8($sp)		#
		lw 		$s2, 12($sp)		#
		addiu 	$sp,$sp,16		# repor stack
		jr		$ra
		
# $t0 -> aux
# $t1 -> temp
exgange:	addiu	$sp, $sp, -4		# alucar expaço stack
		sw 		$ra, 0($sp)		# salvaguardar $ra
		lb 		$t0,0($a0)		#  aux = *c1
		lb 		$t1,0($a1)		# temp = *c2
		sb 		$t1, 0($a0)		# *c1 = *c2;
		sb 		$t0, 0($a1)		# *c2 = aux;
		lw 		$ra, 0($sp)		# Repor dados
		addiu	$sp,$sp,4		# repor stack
		jr 		$ra