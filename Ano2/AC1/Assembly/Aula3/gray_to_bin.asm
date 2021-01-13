# $t1 = gray
# $t2 = bin
# $t3 = mask
#
		.data
str1: 	.asciiz "Introduza um numero: "
str2:	.asciiz "\nValor em código gray: "
str3:	.asciiz "\nValor em binario:  "
		.eqv print_string,4
		.eqv print_int16,34
		.eqv read_int,5
		.text
		.globl main


main:	la $a0, str1			# print_string("...")
		li $v0,print_string		#
		syscall				#
		
		li $v0, read_int		#read_int()
		syscall
		
		move $t1,$v0			# gray = read_int()
		
		srl $t3, $t1, 1			# mask = gray >> 1
		move $t2,$t1

while:	beqz $t3, endWhile	# while(mask != 0)
		xor $t2,$t2,$t3		# bin = bin ^ mask
		srl $t3, $t3,1			# mask = mask >> 1
		j while

endWhile:
		la $a0, str2			# print_string("...")
		li $v0, print_string	#
		syscall				#
		
		or $a0,$0, $t1			# print_int16(gray)
		li $v0, print_int16		#
		syscall				#
		
		
		la $a0, str3			# print_string("...")
		li $v0, print_string	#
		syscall				#
		
		or $a0,$0, $t2			# print_int16(bin)
		li $v0, print_int16		#
		syscall				#
			
		jr $ra
		
		