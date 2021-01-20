# Mapa de registos:
# $t0 â€“ value
# $t1 â€“ bit
# $t2 - i

 		.data
str1: 	.asciiz "Introduza um número: "
str2: 	.asciiz "\nO valor em binário é: "
 		.eqv print_string,4
		.eqv read_int,5
 		.eqv print_char,11 
 		.text
 		.globl main

main: 	la $a0,str1				# (instruÃ§Ã£o virtual)
 	li $v0,print_string 			# print_string(str1);
 	syscall 				#
 	
 	li $v0,read_int				# value=read_int();
 	syscall					#
 	move $t0, $v0				#
 							
 							
 		li $v0, print_string		# print_string(str2);
 		la $a0, str2				#
 		syscall					#
 	
 		li $t2,0 					# i = 0
 		li $t4, 1					# flag = 1

for:		#bgt $t2,31,endfor 			# while(i < 32) 
 		
 		rem $t3, $t2, 4 			# $t3 = $t2 % 4 ;$t3 =  i % 4
 		
 		or $t3,$t3,$t4				# 1 quando flag ou (i % 4) para evitar ter espaços ao inicio
 		bnez $t3, if2				# if((i % 4) == 0)
 		
 		li $v0,print_char			# print_char(' ');
		li $a0, ' '					#
		syscall					#


if2:		andi $t1,$t0,0x80000000 	# (instru��o virtual)
 		
 		srl $t1,$t1, 31				# bit >> 31

		# 1 0 = 1; 11 = 0
		
		xori $t5, $t1, 1			# $t5 = ~$t1, $t5 = !bit
 		and $t4, $t5, $t4 			# flag = flag && !bit
 		bnez  $t4, endif			# if(flag != 0) 		 
 		
 		li $v0, print_char
 		addi  $a0, $t1, 0x30		# string =  0x30 + bit
 		syscall

endif:
 		sll $t0,$t0,1				# value = value << 1;
 		addi $t2,$t2,1				# i++;
 		
 		blt $t2,32, for 			# }	# }
 		j endfor
 		
endfor: 							
 		jr $ra 					# fim do programa 

 		
 		
