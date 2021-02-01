	.data
x:	.double 2.0
	.text
	.globl fun1
#Mapa de registos
# $t0 -> a
# $t1 -> N
# $t2 -> b
# $t3 -> k
# $t4 -> p
# $t5 -> a+N
# $f4 -> *p
# $f6 -> *b
# $f8 -> tmp
# $f10 -> 0.0
fun1:		move	$t0,$a0			# t0 = a
		move	$t1,$a1			# t1 = N
		move	$t2,$a2			# t2 = b
		li	$t3,0			# k = 0
		mtc1	$0,$f10			#f10 = 0.0
		move	$t4,$t0			#p = a
		sll	$t5,$t1,3		# N * 8
		addu	$t5,$t5,$t0		# t5 = a + N
for:		bge	$t4,$t5,endfor		#  for(; p < (a + N); p++) {
		l.d	$f4,0($t4)		# f4 = * p
		l.d	$f8,x			# f8 = 2.0
		div.d 	$f8,$f4,$f8		#f8 = *p / 2.0
		c.eq.d	$f8,$f10		# if ( (*p / 2.0) != 0.0 ) 
		bc1t	else			#{
		s.d	$f4,0($t2)		# *b++ = *p
		addi	$t2,$t2,8		# b++
		j 	endif			#} else {
else:		addi	$t3,$t3,1		# k++ }
endif:		addi	$t4,$t4,8		# p++
		j	for			#}
endfor:		sub	$v0,$t1,$t3		# return (N - k); 
		jr	$ra			# fim programa
