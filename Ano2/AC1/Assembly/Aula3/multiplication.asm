# $t1 = res
# $t2 = i
# $t3 = modr
# $t4 = mdo
	
		.data
str1:	.asciiz "Introduza dois numeros: "
str2:	.asciiz "Resultado: "
		.eqv read_int, 5
		.eqv print_string, 4
		.eqv print_int10,1
		.text
		.globl main

main:	li $t1,0				# res = 0
		li $t2,0				# i = 0
		
		la $a0, str1			# print_string(str1)
		li $v0, print_string	#
		syscall				#
		
		li $v0, read_int		#
		syscall				#
		move $t3,$v0			# modr = read_int()
		andi $t3,$t3,0x0F		#modr = read_int() & 0x0F
		
		li $v0, read_int		#
		syscall				#
		move $t4,$v0			# mdo = read_int()
		andi $t4,$t4,0x0F		#mod = read_int() & 0x0F
		
while:	beqz $t3, endWhile	# modr != 0
		bgt $t2,3,endWhile	# i++ < 4 
		
		andi $t5, $t3, 1		# $t5 = modr & 0x1
		
		beqz $t5, endIf		# if( (mdor & 0x1) != 0 ) 
		addu $t1, $t1,$t4		# res = res + mdo; 
		
endIf:
		
		sll $t4,$t4,1			# mdo = mdo << 1
		srl $t3,$t3,1			# mdor = mdor >> 1
		
		addi $t2,$t2,1			# i++
		j while

endWhile:
		la $a0, str2			# print_string("Resultado: ")
		li $v0, print_string	#
		syscall				#
		
		move $a0,$t1			# print_int10(res)
		li $v0, print_int10		#
		syscall				#
		
		jr $ra
		

	
