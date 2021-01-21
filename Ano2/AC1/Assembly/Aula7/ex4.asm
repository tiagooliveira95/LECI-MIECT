		.data
str1:	.asciiz "Arquitetura de "
str2:	.space 50
str3:	.asciiz "Computadores I"
		.eqv	print_string, 4
		.eqv	print_char, 11
		.text
		.globl main
		
main:	addiu 	$sp, $sp,-4	# alucar espaço
		sw		$ra,0($sp)	# salvaguardar $ra
		la	 	$s0,str2
		la		$s1,str1
		move	$a0,$s0
		move	$a1,$s1
		jal		strcpy
		move 	$a0,$s0					#  print_string(str2);    
		li 		$v0,print_string			#
		syscall							#
		li	 	$a0,'\n'					# print_string("\n");   
		li 		$v0,print_char			#
		syscall							#
		move 	$a0,$s0					# print_string( strcat(str2, "Computadores I") ); 
		la		$a1,str3					#
		jal 		strcat					#
		move 	$a0,$v0					#
		li 		$v0,print_string			# 
		syscall							# 
		lw		$ra,0($sp)	# salvaguardar $ra
		li 		$v0,0		# return 0; 
		addiu 	$sp, $sp,4	# libertar espaço
		jr 		$ra
# $s0 > dst
# $t0 > *p
# $t1 > tmp
strcat:	addiu 	$sp, $sp,-8	# alucar espaço
		sw		$ra,0($sp)	# salvaguardar $ra
		sw		$s0,4($sp)	
		move 	$s0,$a0		
		move	$t0,$a0		# *p = dst		
while:	lb 		$t1,0($t0)	
		beq		$t1,'\0',endw	# while(*p != '\0') 
		addiu 	$t0,$t0,1		#	p++
		j while
endw:	move 	$a0,$t0
		jal		strcpy
		move	$v0,$s0		# return dst; 
		lw		$ra,0($sp)	# salvaguardar $ra
		lw		$s0,4($sp)	
		addiu 	$sp, $sp,8	# libertar espaço
		jr 		$ra
		
		
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