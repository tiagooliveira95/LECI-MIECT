# i: $t0
# lista: $t1
# lista + i: $t2 

		.data
str1:	.asciiz "\nIntroduza um numero: "
		.align 2
		.eqv SIZE, 5
		.eqv print_string,4
		.eqv read_int10,5
lista:	.space 20
		.text
		.globl main
		
main:	la $t1, lista 				# $t1 = &lista
		li $t0, 0					# i = 0
		li $t3, SIZE				# $t3 = SIZE

for:		bge $t0, $t3, endf			# i < size
		
		la $a0, str1				#
		li $v0, print_string		#
		syscall					# print(string)
		
		li $v0,read_int10			#
		syscall					# read_int()
		
		sll $t2,$t0,2				# $t2 = i * 4
		addu $t2,$t1,$t2			# $t2 = &array + i*4  => $2 = &array[i] 
		sw $v0, 0($t2)			# lista[i] = read_int(); 
		
		addi $t0,$t0,1				 # i++ 
		
		j for						# } 

endf:	jr $ra # termina programa 