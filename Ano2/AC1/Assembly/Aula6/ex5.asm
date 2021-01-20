# $t0 => i
# $t1 => k
# $t2 => uppercase
# $t3 => lowercase
# $t4 => argc
# $t5 => *argv[]
# $t6 => *biggest_string
# $t7 => string_size
# $t8 => argv[i][k]
# $t9 => temp
		
		.data
str1:	.asciiz "\nThe biggest string is: "
str2:	.asciiz "\nP"
str3:	.asciiz ": "
str4:	.asciiz " length: "
str5:	.asciiz " | chars -> uppercase: "
str6:	.asciiz " lowecase: "
		.eqv	print_int10, 1
		.eqv	print_char, 11
		.eqv	print_string, 4
		.text
		.globl main
		
main:	move $t4, $a0			#
		move $t5, $a1			#
		
		li $t7, 0				# string_size = 0;
		li $t0, 0				# i = 0

for:		bge $t0,$t4, endfor	# while(i<argc) {
		li $t1, 0				# k = 0
		li $t2, 0				# upercase = 0;
		li $3, 0				# lowercase = 0;
		
while:	sll $t8, $t0, 2			# i * 4
		addu $t8, $t8,$t5		# &argv[i]
		lw $t8, 0($t8)			# &argv[i][0]
		addu $t8, $t8, $t1		# &argv[i][k]						
		lb $t8, 0($t8)			# argv[i][k]	
		beq $t8, '\0' endwhile	#while(argv[i][k] != '\0'){
		
		slti $t9,$t8,'a'			#  if(argv[i][k] >= 'a' && argv[i][k] <= 'z') lowercase++; else upercase++;){
		beqz $t9,else0		#
		sge $t9,$t8,'A'		#
		beqz $t9,else0		#
		addiu $t2,$t2,1		# upercase++;
		j endif0				# } else {

else0:	addiu $t3,$t3,1		# lowercase++;	
							#}
endif0:	addiu $t1, $t1, 1		# k++
		j while
endwhile:						# }
		bgtu $t7,$t1,endif1	# if(string_size < k){
		sll $t6, $t0,2			# i * 4
		addu $t6,$t6,$t5		# print_str(argv[i]); 
		lw $t6, 0($t6)			# 
		move $t7,$t1			# string_size = k;
endif1:	
		la $a0,str2			# print_str("\nP");  
		li $v0,print_string		#
		syscall				#
		
		move $a0,$t0			# print_int(i); 
		li $v0,print_int10		#
		syscall				#
		
		li $a0,' '				# print_str('\t');  
		li $v0,print_char		#
		syscall				#
		
		sll $a0, $t0,2			# i * 4
		addu $a0,$a0,$t5		# print_str(argv[i]); 
		lw $a0, 0($a0)		# 
		li $v0,print_string		#
		syscall				#
		
		la $a0,str4			# print_str("length: ");  
		li $v0,print_string		#
		syscall				#
		
		move $a0,$t1			# print_int(length); 
		li $v0,print_int10		#
		syscall				#
		
		la $a0,str5			# print_str("| chars -> uppercase: ");  
		li $v0,print_string		#
		syscall				#
		
		move $a0,$t2			# print_int(uppercase); 
		li $v0,print_int10		#
		syscall				#
		
		la $a0,str6			# print_str("lowecase: ");  
		li $v0,print_string		#
		syscall				#
		
		move $a0,$t3			# print_int(lowecase); 
		li $v0,print_int10		#
		syscall				#
				
		addiu $t0, $t0,1		# i++
		j for 				# }

endfor:	la $a0,str1			# print_str("The biggest string is:");  
		li $v0,print_string		#
		syscall				#

		move $a0,$t6			# print_str(biggest_string);  
		li $v0,print_string		#
		syscall				#
		
		li $a0, 0				# return 0
		jr $ra
