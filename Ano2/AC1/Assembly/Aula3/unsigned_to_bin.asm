# Mapa de registos:
# $t0 â€“ value
# $t1 â€“ bit
# $t2 - i
 		.data
str1: 	.asciiz "Introduza um número: "
str2: 	.asciiz "\nO valor em biná¡rio é: "
 		.eqv print_string,4
		.eqv read_int,5
 		.eqv print_char,11 
 		.text
 		.globl main

main: 	la $a0,str1				# (instruÃ§Ã£o virtual)
 		li $v0,print_string 		# print_string(str1);
 		syscall 					#
 	
 		li $v0,read_int			# value=read_int();
 		syscall					#
 		move $t0, $v0				#
 							
 							

 		li $v0, print_string		# print_string(str2);
 		la $a0, str2				#
 		syscall					#
 	
 		li $t2,0 					# i = 0

for:		bgt $t2,31,endfor 			# while(i < 32) {
 		
 		rem $t3, $t2, 4 			# $t3 = $t2 % 4 ;$t3 =  i % 4
 		beq $t3,$0, addSpace		# if((i % 4) == 0)
 		
 		j if2
 		
if2:
		andi $t1,$t0,0x80000000 	# (instrução virtual)
 		
 		beq $t1,$0,else 			# if(bit != 0)
 	
 		li $v0,print_char			# print_char('1');
 		li $a0,'1'					#
 		syscall					#
 		
 		sll $t0,$t0,1				# value = value << 1;
 		addi $t2,$t2,1				# i++;
 		j for
	
 		
else: 							# else
 		li $v0, print_char 			# print_char('0');
 		li $a0, '0'					#
 		syscall					#
 	
 		sll $t0,$t0,1				# value = value << 1;
 		addi $t2,$t2,1				# i++;
 		j for 					# }
 		
addSpace:
		li $v0,print_char			# print_char(' ');
		li $a0, ' '					#
		syscall					#
		j if2

endfor: 							#
 		jr $ra 					# fim do programa 
 		
 		
