# i = $t0
# *array = $t1
# arr1 = $t2
#tmp = $t3
	
		.data
		.eqv print_str, 4
		.eqv print_char,11
		.eqv SIZE, 3
pointer:	.space 12
arr1:	.asciiz "Array","de","ponteiros"
		.text
		.globl main
	
main:	
		la $t1, pointer		# &pointer
		la $t2, arr1			# $t2 = &arr1
		
		sw $t2, 0($t1)		# *array[0] = &arr[0]
		addiu $t2, $t2,6		#  &arr1 + 6 (eg: Array => 6 bytes)
		
		sw $t2, 4($t1)		# *array[1] = &arr[1]
		addiu $t2, $t2,3		# &arr1 + 3 (eg: de => 3 bytes)
		
		sw $t2, 8($t1)		# *array[2] = &arr[2]
		
		li $t0, 0				# i = 0

for:		bge $t0, SIZE, endfor	# while(i < SIZE) {
		
		sll $t3, $t0, 2			# temp = i * 2
		addu $t3,$t1,$t3		#temp = pointer[i]
		
		lw $a0, 0($t3)		# print string
		li $v0, print_str		#
		syscall				#
		
		li $a0, '\n'				# print char
		li $v0, print_char		#
		syscall				#
		
		addiu $t0, $t0, 1 		# i++
		j for					# }

endfor: 	jr $ra
