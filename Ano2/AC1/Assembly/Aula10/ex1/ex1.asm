	.data
	.eqv print_string, 4
	.eqv print_float, 2
	.eqv read_float, 6
	.eqv read_int, 5
str1:.asciiz "Insira o valor X "
str2:.asciiz "\nInsira o valor Y "
str3:.asciiz "\nResultado: "
	.text
	.globl main
	
main:				# int main(void) {
	addiu	$sp, $sp, -4		# alocar espaco na pilha
	sw	$ra, 0($sp)		#	salvaguarda do $ra
	la	$a0, str1		#	
	li	$v0, print_string	#	
	syscall				#	print_str(str1)
	li	$v0, read_float		
	syscall				#	read_double();
	mov.s	$f12, $f0		#	x = read_float();
	la	$a0, str2		#	
	li	$v0, print_string	#	
	syscall				#	print_str(str2)
	li	$v0, read_int		#	
	syscall				#	read_int();
	move	$a0, $v0		
	jal	xtoy			#	xtoy(x, y);
	mov.s 	$f12, $f0		#	result = xtoy(x, y); return result;	
	la	$a0, str3		#	
	li	$v0, print_string	#	
	syscall				#	print_str(str3)
	li	$v0, print_float	#
	syscall				#	print_float(result);	
	lw	$ra, 0($sp)		#	repoem o valor $ra
	addiu	$sp, $sp, 4		#
	li	$v0, 0			#	return 0;
	jr	$ra			# }