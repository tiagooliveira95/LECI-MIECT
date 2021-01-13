# Mapa de registos
# p: $t0
# *p: $t1
# lista+Size: $t2 

		.data
		.eqv print_string,4
		.eqv print_int10,1
		.eqv SIZE, 10
str1:	.asciiz "\nConteudo do array:\n"
str2:	.asciiz "; "
lista:	.word 8,-4,3,5,124,-15,87,9,27,15
		.text
		.globl main
		
main:
		la $a0, str1				#
		li $v0, print_string		#
		syscall					# print_string()	
		
		la $t0, lista 				# p = lista ou p = &lista[0]
		
		li $t2, SIZE				# $t2 = SIZE
		sll $t2,$t2,2				# $t2 = SIZE * 4
		addu $t2,$t0,$t2			# $t2 = lista + SIZE
		
for: 								# for 
		bge $t0,$t2,endf			# p < lista + SIZE
		
		lw $a0, 0($t0)			# $a1 = *p
		li $v0,print_int10			#
		syscall					# print_int()
		
		la $a0, str2				#
		li $v0, print_string		#
		syscall					# print_string()	
		
		addu $t0,$t0,4			# p++
		j for
		
endf:
		jr $ra					#fim do programa