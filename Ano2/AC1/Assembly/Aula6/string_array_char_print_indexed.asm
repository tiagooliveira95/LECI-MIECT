# $t0 => i
# $t1 => j
# $t2 => *array
# $t3 => temp

		.data
		.eqv print_str, 4
		.eqv print_char,11
		.eqv	print_int10, 1
		.eqv SIZE, 3
str4:	.asciiz ": "
str0:	.asciiz "\nString #"
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
arr1:	.word str1, str2, str3
		.text
		.globl main
		
main:	la $t2, arr1				# *array[SIZE] = {"Array", "de", "ponteiros"}
		li $t0, 0
		li $t1, 0
		
for:		bge $t0, SIZE, endfor		# while (i < SIZE ){

		la $a0, str0				#  print_str( "\nString #" ); 
		li $v0, print_str			#
		syscall					#
	
		move $a0, $t0				#  print_int10( i ); 
		li $v0, print_int10			#
		syscall					#
		
		la $a0, str4				#  print_str( ": " ); 
		li $v0, print_str			#
		syscall					#
	
		li $t1, 0					# j = 0;

while:	sll $t3, $t0,2				# temp = i * 4
		addu $t3,$t3,$t2			# temp = &array[i]
		lw $t3, 0($t3)
		addu $t3,$t3,$t1			# temp = &array[i][j]
		lb $a0, 0($t3)				
		beq $a0, '\0',endWhile		# while(array[i][j] != '\0') {

		li $v0, print_char			# print_char(*p);
		syscall					#

		li $a0, '-'					# print_char('-'); 
		li $v0, print_char			#
		syscall					#
				
		addiu $t1,$t1,1			# j++
		j while
		
endWhile:						#}
		addiu $t0, $t0,1 			# i++
		j for						# }

endfor: 	jr $ra
