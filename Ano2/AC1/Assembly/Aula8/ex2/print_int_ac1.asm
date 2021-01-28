	.data
buf:	.space 33
	.eqv print_string, 4
	.text
	.globl  print_int_ac1
	
print_int_ac1:	la		$a3,buf
			jal		itoa
			move	$a0,$v0			# print_string( itoa(val, 2, str) ); 
			li 		$v0,print_string	#
			syscall
			jr		$ra