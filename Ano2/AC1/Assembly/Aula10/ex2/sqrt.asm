	.data
x:	.double 0.5
xn:	.double 1.0
	.text
	.globl sqrt

# $f0 -> xn
# $f4 -> aux
# $f6 -> tmp
# $t0 -> i
sqrt:						# double sqrt(double val)
		li	$t0,0			# i = 0
		l.d	$f0,xn			#xn = 1.0
		mtc1	$0,$f6			# f6 = 0.0
		c.le.d	$f12,$f6		#if(val > 0.0) 
		bc1t	else			# {
do:		mov.d	$f4,$f0	# aux = xn;
		div.d	$f0,$f12,$f0		# xn = val/xn
		add.d	$f0,$f0,$f4		# xn =  (xn + val/xn)
		l.d	$f6,x			# t6 = 0.5
		mul.d	$f0,$f6,$f0		# xn = 0.5 * (xn + val/xn);
		c.eq.d	$f4,$f0			#while(
		bc1t	endif			#(aux != xn)
		addi	$t0,$t0,1		#i++
		blt	$t0,25,do		#  && (++i < 25));		
		j	endif
else:		mtc1	$0,$f0			#xn = 0.0;
endif:		jr	$ra
