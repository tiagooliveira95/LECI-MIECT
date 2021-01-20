# $t0 -> **p
# $t1 -> pUltimo
# $t2 -> *c
# $t3 -> i
# $t4 -> temp
	
		.data
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
str4: 	.asciiz "\nString #"
str5:	.asciiz ": "
arr1:	.word str1,str2,str3
		.eqv	print_int10, 1
		.eqv	print_char, 11
		.eqv	print_string, 4
		.eqv SIZE, 3
		.text
		.globl main
		
main:	la $t0, arr1				# p = array
		li $t1, SIZE
		sll $t1,$t1,2				# SIZE * 4
		addu $t1,$t1,$t0			# pultimo = array + SIZE;
		
for:		bge $t0,$t1, endfor

		la $a0,str4				# print_str("\nString #");  
		li $v0,print_string			#
		syscall					#
		
		move $a0,$t3				# print_int(i); 
		li $v0,print_int10			#
		syscall					#
		
		la $a0,str5				# print_str("\nString #");  
		li $v0,print_string			#
		syscall					#
		
		lw $t2, 0($t0)				# *c = *p;
		
while:	lb $t4, 0($t2)				# temp = *c
		beq $t4, '\0',endWhile		#while(*c != '\0'){
			
		move $a0,$t4				# print_char(c);  
		li $v0,print_char			#
		syscall					#
		
		li $a0,'-'					# print_str("-");  
		li $v0,print_char			#
		syscall					#
		
		addiu $t2, $t2,1			# c++
		j while
endWhile:						# }
		addiu $t3,$t3,1			# i++
		addiu $t0, $t0,4			# p++
		j for
endfor:	
		li $a0, 0					# return 0;
		jr $ra
		