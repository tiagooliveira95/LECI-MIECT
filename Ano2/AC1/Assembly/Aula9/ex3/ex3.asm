	.data
	.eqv  read_int,5
	.eqv print_double,3
	.eqv SIZE 10
a:	.space 80	
	.text
	.globl main

#	$t0 -> i
#	$t1 > &a[i]
#	$t2-> a
main:	addiu	$sp,$sp, -4
		sw		$ra,0($sp)
		li		$t0,0			# i = 0	
		la		$t2,a
for:		bge		$t0,SIZE,endfor	# for(i = 0; i < SIZE; i++) {
		li		$v0, read_int
		syscall
		mtc1	$v0,$f12
		cvt.d.w	$f12,$f12			# (double)read_int();
		sll		$t1,$t0,3			# i  * 8
		addu	$t1,$t1,$t2
		s.d		$f12,0($t1)		#a[i] = (double)read_int();		
		addiu	$t0,$t0,1			#i++
		j 		for
endfor:	move	$a0,$t2
		li		$a1,SIZE
		jal		average
		li		$v0, print_double
		syscall
		li		$v0,0			#return 0;
		lw		$ra,0($sp)
		addiu	$sp,$sp, 4
		jr		$ra
		












