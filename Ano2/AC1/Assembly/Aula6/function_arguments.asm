# $t0 -> args
# $t1 -> *argv[]
# $t2 -> i
# $t3 -> temp

		.data
str1:	.asciiz "Nr. de parametros:"
str2:	.asciiz "\nP"
str3:	.asciiz ": "
		.eqv	print_int10, 1
		.eqv	print_string, 4
		.text
		.globl main
		
main:	move $t0,$a0			#
		move $t1, $a1			#
			
		la $a0,str1			# print_str("Nr. de parametros: "); 
		li $v0,print_string		#
		syscall				#
		
		move $a0,$t0				# print_int(argc); 
		li $v0,print_int10		#
		syscall				#

		li $t2, 0				# i = 0
for:		bge $t2,$t0,endfor	# while(i < argc) {
		
		la $a0,str2			# print_str("\nP");  
		li $v0,print_string		#
		syscall				#
		
		move $a0,$t2				# print_int(i); 
		li $v0,print_int10		#
		syscall				#
		
		la $a0,str3			# print_str(": ");  
		li $v0,print_string		#
		syscall				#
		
		sll $t3,$t2, 2			# i * 4
		addu $t3, $t3, $t1		# $t3 = &argv[i]
		
		lw $a0,0($t3)			# print_str("\nP");  
		li $v0,print_string		#
		syscall				#
		
		addiu $t2,$t2,1		# i++
		j for					# }
				
endfor:	li $v0, 0				# return 0;
		jr $ra