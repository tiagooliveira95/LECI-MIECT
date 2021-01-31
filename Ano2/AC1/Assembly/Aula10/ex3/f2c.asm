	.data
d1:	.double 5.0
d2:	.double 32.0
d3:	.double 9.0
	.text
	.globl f2c
#f2->temp
f2c:	l.d	$f4,d1				# double f2c(double ft) 
	l.d	$f6,d2
	l.d	$f8,d3
	sub.d	$f0,$f12,$f6		# f0 = (ft – 32.0)
	div.d	$f2,$f4,$f8		# (5/9.0)
	mul.d	$f0,$f0,$f2		# return (5.0 / 9.0 * (ft – 32.0))
	jr		$ra
