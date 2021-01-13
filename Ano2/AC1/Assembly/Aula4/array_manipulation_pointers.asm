# Mapa de registos
# num: $t0
# p: $t1
# *p: $t2 

		.data
		.eqv SIZE, 20
		.eqv read_string, 8
		.eqv print_int10, 1
array:	.space SIZE
		.text
		.globl main
		
main: 	la $a0, array			# $a0 = &array
		li $a1, SIZE			# $a1 = SIZE
		
		li $t0, 0				# num = 0
		
		li $v0, read_string		#
		syscall				# read_string(str,SIZE)
		
		la $t1,array			# p = &array

while:						# while(*p != '\0') 
		lb $t2,0($t1)
		beq $t2, 0, endw 		# {
		blt $t2,'0', endif		#
		bgt $t2,'9',endif		#
		
		addi $t0, $t0, 1		# num++	

endif:
		addiu $t1, $t1, 1		# p++
		j while

endw:
		li $v0, print_int10		#
		move $a0,$t0			#
		syscall 				# print_int10(num)
		
		jr $ra
		
		