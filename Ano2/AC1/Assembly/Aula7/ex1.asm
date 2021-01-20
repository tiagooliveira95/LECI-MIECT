		.data
str1:	.asciiz "Arquitetura de Computadores I"
		.eqv	print_int10, 1
		.text
		.globl main

main:	addiu $sp, $sp, -4		# 	fazer espaco na pilha
		sw $ra, 0($sp)		# 	salvaguardar o $ra
		
		la $a0, str1
		jal strlen				# strlen(str);
		
		move $a0, $v0		# print_int10(strlen(str));
		li $v0,print_int10		#
		syscall				#
		
		li $v0, 0				# return 0;
		lw $ra 0($sp)
		addiu $sp, $sp, 4	# repor stack

		jr $ra

# O argumento da função é passado em $a0
# O resultado é devolvido em $v0
# Sub-rotina terminal: não devem ser usados registos $sx 
# $t0 -> *s
# $t1 -> len
strlen:	li $t1, 0			# len = 0
while:	lb $t0, 0($a0)		# while(*s++ != '\0')
		addiu $a0, $a0,1 	#
		beq $t0, '\0' endw #{
		addi $t1,$t1,1		# len ++
		j while 			# }
endw: 	move $v0, $t1		# return len;
		jr $ra			#