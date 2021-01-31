	.data
str1:.asciiz "Insira o valor X: "
str2:.asciiz "\nResultado: "
	.eqv print_string, 4
	.eqv read_double, 7
	.eqv print_double, 3
	.text
	.globl main
	
main:				# int main(void) {
	addiu	$sp, $sp, -4		# 	alucar espaco na pilha
	sw	$ra, 0($sp)		#	salvaguardar o $ra
	la	$a0, str1		#	
	li	$v0, print_string	#	
	syscall				#	print_str(str1);
	li	$v0, read_double	#	
	syscall				#	read_double();
	mov.d	$f12, $f0		#	val = read_double;
	jal	sqrt			#	sqrt(val)
	la	$a0, str2		#	
	li	$v0, print_string	#	
	syscall				#	print_str(str2);
	mov.d	$f12, $f0		#
	li	$v0, print_double	#	print_double(xtoy(val));
	syscall			
	lw	$ra, 0($sp)		#	
	addiu	$sp, $sp, 4		#
	li	$v0, 0			#	
	jr	$ra			# }