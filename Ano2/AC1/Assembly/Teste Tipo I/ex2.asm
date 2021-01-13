#Mapa de Registos
# i = $t0
# v = $t1

		.data
		.eqv SIZE,8
		.eqv print_string,4
		.eqv print_int10,1
		.eqv print_char,11
str1:	.asciiz "Result is: "
val:		.word 8, 4, 15, -1987, 327, -9, 27, 16
		.text
		.globl main
		
main:	li $t0, 0				# i = 0
		la $t2,val			# $t2 = &val
do:							#{
		sll $t3, $t0,2			# $t3 = i*4
		addu $t3, $t3,$t2 		# $t3 = &val[i]

		lw $t1,0($t3)			# v = val[i]
		
		li $t4, SIZE			# tmp2 = SIZE
		div $t4, $t4,2			# tmp2 = SIZE / 2
		add $t4,$t4,$t0		# tmp2 = i + SIZE / 2
		sll $t4,$t4,2			# (i + SIZE / 2) * 4 bits
		add $t4,$t4,$t2		# tmp2 = &val[i+SIZE/2]
		lw $t5, 0($t4)			# $t5 = val[i+SIZE/2]
		sw $t5, 0($t3)		# val[i] = val[i+SIZE/2];
		sw $t1, 0($t4)		# val[i+SIZE/2] = v;
		
		li $t4, SIZE			# tmp2 = SIZE
		div $t4,$t4,2			# tmp2 = SIZE / 2
		add $t0,$t0,1			# i++
		blt $t0,$t4, do		# } while(++i < SIZE / 2); 
endW:
		la $a0,str1
		li $v0, print_string
		syscall				# print_string("Result is: "); 
		
		li $t0, 0				# i = 0
do2:		
		sll $t3, $t0,2			# $t3 = i*4
		addu $t3, $t3,$t2 		# $t3 = &val[i]
		
		lw $a0,0($t3)			# $a0 =  val[i] 
		add $t0,$t0,1			# i++
		li $v0, print_int10
		syscall				#  print_int10( val[i++] ); 
		
		li $v0, print_char		#
		la $a0, ',' 				#
		syscall				# print_char(','); 
		
		blt $t0, SIZE, do2		# } while(i < SIZE)
		
		jr $ra
		
		