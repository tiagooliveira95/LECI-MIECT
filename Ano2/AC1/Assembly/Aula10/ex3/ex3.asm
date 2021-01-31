	.data
da:	.space 88
a:	.space 44
str1:.asciiz "\nInsira 11 valores em Fahrenheit:\n"
str3:.asciiz "\nArray de Temperaturas\n"
str4:.asciiz "\n\nTemperatura máxima: "
str5:.asciiz "\nMédia: "
str6:.asciiz "\nMediana: "
str7:.asciiz "\nVariancia: "
str8:.asciiz "\nDesvio Padrão: "
	.eqv read_int,5
	.eqv print_double,3
	.eqv print_char,11
	.eqv print_string, 4
	.eqv SIZE 11
	.text
	.globl main

#	$s1 -> i
#	$t1 > &a[i]
#	$t2-> a
#	$t3-> &da[i]
#	$t4-> da[i]
#s0 -> da
main:	addiu	$sp,$sp, -8
		sw	$ra,0($sp)
		sw	$s0,4($sp)
		
		li	$s1,0			# i = 0	
		la	$t2,a
		la	$s0,da
		
		la	$a0, str1		#		
		li	$v0, print_string	#		
		syscall			# print_str(str1);
	
for:		bge	$s1,SIZE,endfor		# for(i = 0; i < SIZE; i++) {
		li	$v0, read_int
		syscall
		sll	$t1,$s1,2		# i*4
		addu	$t1,$t1,$t2
		sw	$v0,0($t1)		# a[i] = read_int()	
		mtc1 $v0,$f12
		cvt.d.w 	$f12,$f12
		jal f2c
		sll	$t3,$s1,3		# i*8
		addu	$t3,$t3,$s0
		s.d	$f0,0($t3)		#da[i] = f2c((double)a[i])
		addiu	$s1,$s1,1		#i++
		j 	for
endfor:	
		la	$a0, str3		#	
		li	$v0, print_string	#	
		syscall				#	print_str(str4);
		
		li	$s1,0			# i = 0
for2:	bge	$s1,SIZE,endfor2		# for(i = 0; i < SIZE; i++) {
		sll	$t3,$s1,3		# i*8
		addu	$t3,$t3,$s0
		l.d	$f12,0($t3)		#da[i] = f2c((double)a[i])
		li $v0, print_double
		syscall
		li $a0,','
		li $v0, print_char
		syscall
		addiu	$s1,$s1,1		#i++
		j 	for2		#}
endfor2:	

		la 	$a0, str4		#	
		li	$v0, print_string	#	
		syscall				#	print_str("Valor maximo")
	
		move	$a0, $s0			#	
		li	$a1, SIZE		#
		jal	max			#	
		mov.d	$f12, $f0		#	
		li	$v0, print_double	#	
		syscall				#	print_double(max(da,SIZE));
		
		
		la 	$a0, str5		#	
		li	$v0, print_string	#	
		syscall				#	print_string("Média")
		move	$a0, $s0			#	
		li	$a1, SIZE		#
		jal	average			#	average(arr, SIZE);
		mov.d	$f12, $f0		#	$f12 = return(average)
		li	$v0, print_double	#	$v0 = 3
		syscall				#	print_double(return(average));
		
		
		
		la 	$a0, str6		#	
		li	$v0, print_string	#	
		syscall				#	print_str("Mediana")
		move	$a0, $s0			#	
		li	$a1, SIZE		#
		jal	median			#	
		mov.d	$f12, $f0		#	
		li	$v0, print_double	#	
		syscall				#	print_double(median(arr, SIZE));
		
		la 	$a0, str7		#	
		li	$v0, print_string	#	
		syscall				#	print_str(Variancia)
		move	$a0, $s0			#	
		li	$a1, SIZE		#
		jal	var			#	v
		mov.d	$f12, $f0		#	
		li	$v0, print_double	#	
		syscall				#	print_double(var(arr, SIZE));
		
		
		la 	$a0, str8		#	
		li	$v0, print_string	#	
		syscall				#	print_str(Desvio Padrão)
		move	$a0, $s0			#	
		li	$a1, SIZE		#
		jal	stdev			#	
		mov.d	$f12, $f0		#	
		li	$v0, print_double	#	
		syscall				#	print_double(stdev(arr, SIZE));
		
	

		li	$t0,0			# i = 0			
		li	$v0,0			#return 0;
		lw	$ra,0($sp)
		lw	$s0,4($sp)
		addiu	$sp,$sp, 8
		jr	$ra
		