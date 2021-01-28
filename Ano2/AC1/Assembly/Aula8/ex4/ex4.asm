# s0 -> insert_pos
	.data
str1:.space 100
str2:.space 50
str3:.asciiz "Enter a string: "
str4:.asciiz "Enter a string to insert: "
str5:.asciiz "Enter the position: "
str6:.asciiz "Original string: "
str7:.asciiz "\nModified string: "
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_char,11
	.text
	.globl main

main:	addiu	$sp,$sp,-8
		sw		$ra,0($sp)
		sw		$s0,4($sp)
		la		$a0,str3			# print_string("Enter a string: ");
		li 		$v0,print_string	#
		syscall
		la		$a0,str1
		li		$a1,50
		jal		read_str
		la		$a0,str4			# print_string("Enter a string to insert: "); 
		li 		$v0,print_string	#
		syscall
		la		$a0,str2
		li		$a1,50
		jal		read_str
		la		$a0,str5			# print_string("Enter the position: ");  
		li 		$v0,print_string	#
		syscall
		li 		$v0,read_int		# 
		syscall					# 
		move	$s0,$v0			# insert_pos = read_int(); 
		la		$a0,str6			# print_string("Original string: "); 
		li 		$v0,print_string	#
		syscall
		la		$a0,str1			# print_string(str1); 
		li 		$v0,print_string	#
		syscall
		la		$a0,str1
		la		$a1,str2
		move	$a2,$s0
		jal		insert
		la		$a0,str7			# print_string("\nModified string: "); 
		li 		$v0,print_string	#
		syscall
		la		$a0,str1			# print_string(str1); 
		li 		$v0,print_string	#
		syscall
		li		$a0,'\n'			# print_string("\n");
		li 		$v0,print_char	#
		syscall
		li		$v0,0			# return 0;
		lw		$ra,0($sp)
		lw		$s0,4($sp)
		addiu	$sp,$sp,8
		jr 		$ra