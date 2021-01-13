# Mapa de Registos
# n_even - $t0
# n_odd - $t1
# p1 - $t2
# p2 - $t3

		.data
		.eqv N, 35
		.eqv read_int,5
		.eqv print_int10,1
a:		.space 140
b:		.space 140
		.text
		.globl main
		
main:	li $t0, 0				# n_even = 0
		li $t1, 0 				# n_odd = 0
		
		la $t2, a				# p1 = a[0] ou &a 	
		li $t4, N				# tmp = N
		sll $t4, $t4,2			# tmp = N * 4
		addu $t4,$t2,$t4		# tmp = $a + N*4 ~ a + N

while:	bge $t2, $t4, endW	# while( p1 < (a + N))
		
		li $v0, read_int
		syscall				# read_int()
		
		sw $v0, 0($t2)		# *p1 = read_int()
		addu $t2,$t2,4		# p1++
		j while
endW:
		la $t2, a				# p1 = a[0] ou &a 
		la $t3, b				# p2 = b[0] ou &b
		
while2:	bge $t2,$t4, endW2	 # while( p1 < (a + N))
		
		lw $t5, 0($t2)			# tmp2 = *p1
		rem $t5,$t5, 2			# tmp2 = *p1 % 2
		
		beqz $t5, else		# if ( (*p1 % 2) != 0 ) {
		lw $t6, 0($t2)			# $t6 = *p1
		sw $t6, 0($t3)		# *p2 = *p1
		addu $t3,$t3,4		# p2++
		add $t1,$t1,1			# n_odd++
		j endIf			 	#}
else:						# else {
		add $t0,$t0,1			# n_even++
endIf:						# }
		addu $t2,$t2,4		# p1++
		j while2
endW2:
		la $t3, b				# p2 = b[0] ou &b
		sll $t4, $t1, 2			# tmp = n_odd *4
		addu $t4, $t4, $t3		# tmp = b + n_odd 

while3:	bge $t3,$t4, endW3
		
		lw $a0, 0($t3)		# $v0 = *p2
		li $v0, print_int10
		syscall				# print_int(*p3)
		addu $t3,$t3,4  		# p2++
		j while3
endW3:	jr $ra







