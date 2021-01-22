# $s0 -> i
# $s1 -> array_size
# $s2 -> insert_value
# $s3 -> insert_pos
# $s4 -> &array[i]
# $s5 -> array	
	.data
str1:	.asciiz ", "
str2: 	.asciiz "Size of array : "
str3:	.asciiz "array["
str4:	.asciiz "] = "
str5:	.asciiz "Enter the value to be inserted: "
str6:	.asciiz "Enter the position: "
str7:	.asciiz "\nOriginal array: "
str8:	.asciiz "\nModified array: "
	.align 2
array:	.space 200
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv read_int, 5
	.text
	.globl main
		
main:	addiu 	$sp, $sp,-24			# alucar espaço
		sw	$ra,0($sp)		# salvaguardar $ra
		sw	$s0,4($sp)		#
		sw	$s1,8($sp)		#
		sw	$s2,12($sp)		#
		sw	$s3,16($sp)		#
		sw	$s4,20($sp)		#
		sw	$s5,24($sp)		#
		la	$s5,array		#
		la	$a0,str2		# print_string("Size of array : ");   
		li 	$v0,print_string	#
		syscall				#
		li 	$v0,read_int		#
		syscall					#
		move 	$s1,$v0			# array_size = read_int();
		li 	$t0,0			# i=0
for:		bge 	$s0,$s1,endfor		# while(i < array_size)
		la	$a0,str3		# print_string("array["); 
		li 	$v0,print_string	#
		syscall				#
		move 	$a0,$s0			# print_int(i); 
		li 	$v0,print_int10	#
		syscall				#
		la	$a0,str4		# print_string("] = ");  
		li 	$v0,print_string	#
		syscall				#
		li 	$v0,read_int		#
		syscall				# 
		sll	$s4,$s0,2		# i*4
		addu	$s4,$s4,$s5		# s4 = &array[i]
		sw	$v0,0($s4)		# array[i] = read_int(); 
		addi 	$s0,$s0,1		# i++
		j 	for
endfor:		la	$a0,str5		# print_string("Enter the value to be inserted: "); 
		li 	$v0,print_string	#
		syscall				#
		li 	$v0,read_int		#
		syscall				#
		move	$s2,$v0			# insert_value = read_int(); 
		la	$a0,str6		# print_string("Enter the position: ");
		li 	$v0,print_string	#
		syscall				#
		li 	$v0,read_int		#
		syscall				#
		move	$s3,$v0			# insert_pos = read_int(); 
		la	$a0,str7		# print_string("\nOriginal array: ");
		li 	$v0,print_string	#
		syscall				#
		move 	$a0,$s5			# array
		move	$a1,$s1			# array_size
		jal 	print_array		# print_array(array, array_size);
		move 	$a0,$s5			# array
		move	$a1,$s2			# insert_value
		move 	$a2,$s3			# insert_pos
		move	$a3,$s1			# insert_pos
		jal	insert			#insert(array, insert_value, insert_pos,  insert_pos);
		la	$a0,str8		#print_string("\nModified array: ");  
		li 	$v0,print_string	#
		syscall				#
 		move 	$a0,$s5			# array
		move	$a1,$s1			# array_size
		addiu	$a1,$a1,1		# array_size + 1
		jal 	print_array		# print_array(array, array_size + 1);
 		lw	$ra,0($sp)		# salvaguardar $ra	
 		lw	$s0,4($sp)		
		lw	$s1,8($sp)
		lw	$s2,12($sp)
		lw	$s3,16($sp)
		lw	$s4,20($sp)
		lw	$s5,24($sp)
		li 	$v0,0		# return 0; 
		addiu 	$sp, $sp,4	# libertar espaço
		jr 	$ra
# $t0 -> i
# $t1 -> &array[i]
# $t2 -> *array[i]
insert:	li	$t0,0
	ble 	$a2,$a3, else
	li	$v0,1		# return 1;
	j 	endIf
else: 	addi	$t0,$a3,-1	# i = size-1
for2:	blt	$t0,$a2,endFor	#while( i >= pos)
	sll	$t1,$t0,2	# i * 4
	addu	$t1,$t1,$a0	# t1 = &array[i]
	lw	$t2,0($t1)	# t2 = *array[i]
	#addi	$t1,$t0,1	# i+1
	#sll	$t1,$t1,2	# (i +1) * 4
	#addu	$t1,$t1,$a0	# &array[i+1]
	#sw	$t2,0($t1)	# array[i+1] = array[i]
	sw	$t2,4($t1)	# array[i+1] = array[i]
	addi	$t0,$t0,-1	# i--
	j 	for2		#
endFor:	sll 	$t1,$t2,2	# pos * 4
	addu 	$t1,$t1,$a0	# t1 = &array[pos]	
	sw	$a1,0($t1)	# array[pos] = value; 					
	addi	$t0,$a1,0	# return 0;
endIf:	jr 	$ra


# $t0 -> p
# $t1 -> *a
print_array:	sll	$t0,$a1,2		# n *4
		addu 	$t0,$t0,$a0		# *p = a + n
		move 	$t1, $a0		#
for3:		bge 	$t1,$t0, endfor3	#
		lw 	$a0,0($t1)		# print_int(*a); 
		li 	$v0,print_int10		#
		syscall				#
		la 	$a0,str1		# print_str(", ");  
		li 	$v0,print_string	#
		syscall				#
		addiu 	$t1,$t1,4		# a++
		j 	for3			#
endfor3:	jr 	$ra			#

