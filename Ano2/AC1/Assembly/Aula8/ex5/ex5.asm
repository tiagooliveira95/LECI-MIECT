# aux_array -> $s0
# dup_counter -> $s1
# array[i] -> $s2
# array -> $s3
# i -> $t0
# aux_array[i] -> $t1
			.data
array:		.space 40
aux_array:	.space 40
str1:		.asciiz "*, "
str2:		.asciiz "array["
str3:		.asciiz "]="
str4:		.asciiz "\n# repetidos: "
str5:		.asciiz ", "
			.eqv SIZE 10
			.eqv print_string, 4
			.eqv	print_int10, 1
			.eqv read_int, 5
			.text
			.globl main

main:		addiu	$sp,$sp,-16
			sw		$ra,0($sp)
			sw		$s0,4($sp)
			sw		$s1,8($sp)
			sw		$s2,12($sp)
			la		$s3,array
			la		$s0,aux_array
			li		$s1,0
			li		$t0,0				# i = 0
for:			bge		$t0,SIZE,endfor
			la		$a0,str2				#
			li		$v0,print_string		#
			syscall						#print_string("array[");
			move	$a0,$t0				#
			li		$v0,print_int10		#
			syscall						#print_int10(i);
			la		$a0,str3				#
			li		$v0,print_string		#
			syscall						#print_string("]=");
			li		$v0,read_int			#
			syscall						#
			sll		$s2,$t0,2			# i * 4
			addu	$s2,$s2,$s3			#
			sw		$v0,0($s2)			#array[i]=read_int();
			addiu	$t0,$t0,1				# i++
			j		for
endfor:		move	$a0,$s3
			move	$a1,$s0
			li		$a2,SIZE
			jal 		find_duplicates		# find_duplicates(array, aux_array, SIZE);
			li		$t0,0				# i = 0
for2:		bge		$t0,SIZE,endfor2		#for(i < SIZE; i++) {
			sll		$t1,$t0,2				# i * 4
			addu	$t1,$t1,$s0
			lw		$t1,0($t1)
			blt		$t1,2,else			# if(aux_array[i] >= 2) {
			la		$a0,str1				#
			li		$v0,print_string		#
			syscall						# print_string("*, ");
			addiu	$s1,$s1,1			# dup_counter++;
			j		endif				# } else {
else:		sll		$a0,$t0,2			# i * 4
			addu	$a0,$a0,$s3			#
			lw		$a0,0($a0)			#
			li		$v0,print_int10		#
			syscall						#print_int10(array[i]); 
			la		$a0,str5				#
			li		$v0,print_string		#
			syscall						#print_string(", "); 						
endif:									#}
			addiu	$t0,$t0,1				# i++
			j		for2
endfor2:		la		$a0,str4				#
			li		$v0,print_string		#
			syscall						# print_string("\n# repetidos: "); 		
			move	$a0,$s1				#
			li		$v0,print_int10		#
			syscall						# print_int10(dup_counter); 					
			li		$v0,0				# return 0; 
			lw		$ra,0($sp)
			lw		$s0,4($sp)
			lw		$s1,8($sp)
			lw		$s2,12($sp)
			addiu	$sp,$sp,16
			jr		$ra