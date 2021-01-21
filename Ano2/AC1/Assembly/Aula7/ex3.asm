		.data
str2:	.space 31
str1:	.asciiz "I serodatupmoC ed arutetiuqrA"
str3:	.asciiz "String too long: "
		.eqv STR_MAX_SIZE  30
		.eqv	print_string, 4
		.eqv	print_char, 11
		.eqv	print_int10, 1
		.text
		.globl main
	
# $s0 > exit_value
# $s1 > str1
# $s2 > str2
main:	addiu 	$sp,$sp,-4		# alucar espaço no stack
		sw 		$ra, 0($sp)		# salvaguardar $ra
		la		$s1, str1
		la		$s2, str2
		move	$a0,$s1
		jal 		strlen
		bgt		$v0,STR_MAX_SIZE, else	# if(strlen(str1) <= STR_MAX_SIZE) { 
		move	$a0, $s2
		move 	$a1, $s1
		jal 		strcpy
		move 	$a0,$s2					# print_string(str2);   
		li 		$v0,print_string			#
		syscall							#
		li	 	$a0,'\n'					# print_string("\n");   
		li 		$v0,print_char			#
		syscall							#
		move	$a0,$s2					# print_string(strrev(str2)); 
		jal		strrev					#
		move	$a0,$v0					#
		li 		$v0,print_string			#
		syscall							#
		li		$s0,0					# exit_value = 0;
		j endIf
else:	la	 	$a0,str3					# print_string("String too long: ");   
		li 		$v0,print_string			#
		syscall							#
		move	$a0,$s1					# print_int10(strlen(str1)); 
		jal		strlen					#
		move 	$a0,$v0					#
		li 		$v0,print_int10			#
		syscall							#
		li		$s0,-1					# exit_value = -1;
endIf:
		
		lw 		$ra, 0($sp)	# repor $ra
		addiu	$sp,$sp,4	# libertar stack
		move	$v0,$s0		# return exit_value
		jr		$ra

# $t0 > i
# $v0 > dst
# $t2 > src[i]
strcpy:	move	$t1, $a0
do:		lb 		$t2, 0($a1)		# do { 
		sb 		$t2,0($a0)		# dst[i] = src[i]
		addiu	$a0,$a0,1 
		addiu	$a1,$a1,1
		bne		$t2, '\0', do 		# while(src[i++] != '\0');
		move 	$v0, $t1			# return dst
		jr		$ra
		
# $s0 -> *p1
# $s1 -> *p2
# $s2 -> *str
# $t0 -> temp
strrev:	addiu	$sp,$sp,-16		# alucar expaço stack
		sw 		$ra, 0($sp)		# salvaguardar $ra
		sw 		$s0, 4($sp)
		sw 		$s1, 8($sp)
		sw		$s2, 12($sp)
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
		
# O argumento da função é passado em $a0
# O resultado é devolvido em $v0
# Sub-rotina terminal: não devem ser usados registos $sx 
# $t0 -> *s
# $t1 -> len
strlen:	li 		$t1, 0			# len = 0
while3:	lb	 	$t0, 0($a0)		# while(*s++ != '\0')
		addiu	$a0, $a0,1 		#
		beq	 	$t0, '\0', endw 	#{
		addi 		$t1,$t1,1			# len ++
		j 		while3			# }
endw: 	move 	$v0, $t1			# return len;
		jr		 $ra				#