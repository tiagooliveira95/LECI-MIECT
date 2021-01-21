# $t0 -> i
# $t1 -> array_size
# $t2 -> insert_value
# $t3 -> insert_pos
# $t4 -> &array[i]
# $t5 -> array	
		.data
str1:	.asciiz ", "
str2: 	.asciiz "Size of array : "
str3:	.asciiz "array["
str4:	.asciiz "] = "
str5:	.asciiz "Enter the value to be inserted: "
str6:	.asciiz "Enter the position: "
str7:	.asciiz "\nOriginal array: "
str8:	.asciiz "\nModified array: "
array:	.space 200
		.eqv	print_string, 4
		.eqv	print_int10, 1
		.eqv	read_int, 
		.text
		.globl main
		
main:	addiu 	$sp, $sp,-4		# alucar espaço
		sw		$ra,0($sp)		# salvaguardar $ra
		la		$t5,array
		la	 	$a0,str2			# print_string("Size of array : ");   
		li 		$v0,print_string	#
		syscall					#
		li 		$v0,read_int		#
		syscall					#
		move 	$t1,$v0			# array_size = read_int();
		li 		$t0,0			# i=0
for:		bge 		$t0,$t1,endfor	# while(i < array_size)
		la	 	$a0,str3			# print_string("array["); 
		li 		$v0,print_string	#
		syscall					#
		move 	$a0,$t0			# print_int(i); 
		li 		$v0,print_int10	#
		syscall					#
		la	 	$a0,str4			# print_string("] = ");  
		li 		$v0,print_string	#
		syscall					#
		sll		$t4,$t0,2			# i*4
		addu	$t4,$t4,$t5		# t4 = &array[i]
		li 		$v0,read_int		#
		syscall					# 
		sw		$a0,0($t4)		# array[i] = read_int(); 
		add 		$t0,$t0,1			# i++
		j for
endfor:	la	 	$a0,str5			# print_string("Enter the value to be inserted: "); 
		li 		$v0,print_string	#
		syscall					#
		li 		$v0,read_int		#
		syscall					#
		move	$t2,$v0			# insert_value = read_int(); 
		la	 	$a0,str6			# print_string("Enter the position: ");
		li 		$v0,print_string	#
		syscall					#
		li 		$v0,read_int		#
		syscall					#
		move	$t3,$v0			# insert_pos = read_int(); 
		la	 	$a0,str7			# print_string("\nOriginal array: ");
		li 		$v0,print_string	#
		syscall					#
		
		# TODO change $tx to $sx !!
		#print_array(array, array_size);
 		#insert(array, insert_value, insert_pos, array_size);
 		#print_string("\nModified array: ");
 		#print_array(array, array_size + 1);
 							
		lw		$ra,0($sp)	# salvaguardar $ra
		li 		$v0,0		# return 0; 
		addiu 	$sp, $sp,4	# libertar espaço
		jr 		$ra
# $t0 -> i
# $t1 -> &array[i]
# $t2 -> *array[i]
insert:	li	$t0,0
		ble 	$a2,$a3, else
		li	$v0,1			# return 1;
		j endIf
else: 	add 	$t0,$a1,-1		# i = size-1
for:		blt	$t0,$a2,endFor	#while( i >= pos)
		sll	$t1,$t0,2			# i * 4
		addu $t1,$t1,$a0		# t1 = &array[i]
		lw	$t2,0($t1)		# t2 = *array[i]
		sw	$t2,4($t1)		# array[i+1] = array[i]
		addi	$t0,$t0,-1		# i--
		j for
endFor:	sll $t1,$2,2			# pos * 4
		addu $t1,$1,$a0		# t1 = &array[pos]	
		sw	$a1,0($t1)		# array[pos] = value; 					
		add 	$t0,$a1,0		# return 0;
endIf:	jr $ra


# $t0 -> p
# $t1 -> *a
print_array:	sll	$t0,$a1,2	# n *4
			addu $t0,$t0,$a0	# *p = a + n
			move $t1, $a0
for2:		bge $t1,$t0, endfor
			lw $a0,0($t1)				# print_int(*a); 
			li $v0,print_int10			#
			syscall					#
			la $a0,str1				# print_str(", ");  
			li $v0,print_string			#
			syscall					#
			addu $1,$t1,4				#a++
			j for2
endfor:		jr $ra