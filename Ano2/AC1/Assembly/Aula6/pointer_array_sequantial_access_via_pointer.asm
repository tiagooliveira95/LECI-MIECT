# $t0 => **p
# $t1 => **pultimo
# $t2 => temp
		
		.data
		.eqv print_str, 4
		.eqv print_char,11
		.eqv SIZE, 3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
arr1:	.word str1, str2, str3
		.text
		.globl main
		
main:	la $t0, arr1			# p = array / p = &array[0]
		li $t1, SIZE
		sll $t1, $t1,2			# pultimo = size * 4
		addu $t1, $t0, $t1		# pultimo = array + SIZE

for:		bge $t0, $t1, endfor	# for(; p < pultimo; p++)
		
		lw $a0, 0($t0)		# print_str(*p);
		li $v0, print_str		#
		syscall				#
		
		li $a0, '\n'				# print char
		li $v0, print_char		#
		syscall				#
		
		addiu $t0, $t0, 4		# p++
				
		j for							
 endfor: 	jr $ra