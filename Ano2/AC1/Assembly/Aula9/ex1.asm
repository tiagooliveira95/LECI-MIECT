	.data
	.eqv	print_float,2
	.eqv read_int, 5
f1:	.float 2.59375
	.text
	.globl main

#f12 -> res
main:
do:		li $v0, read_int
		syscall

		mtc1	$v0,$f0
		l.s		$f2,f1			# *f1 =  0.10000000.01001100000000000000000
												  			
		cvt.s.w	$f0,$f0			# (float)val
		mul.s	$f12,$f0,$f2		# res = (float)val * 2.59375;

		li		$v0, print_float
		syscall
		mtc1	$0, $f4			# $f4 = 0.0;
		c.eq.s	$f12,$f4
		bc1f		do
		jr		$ra

# Ex B
# mantissa 3*2.59375 = 1.11110010000000000000000 * 2^1
# = 0.10000001.01001100000000000000000 = 0x40F90000    
						    
					            