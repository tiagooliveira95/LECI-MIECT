	.data
	.text
	.globl max
# $t0 -> p
# $t1 -> n
# $t2 -> u
# $f4 -> *p
# $f12 -> max
max:	move	$t0,$a0
		move	$t1,$a1
		sll		$t2,$t1,3			# n*8
		addu	$t2,$t2,$t0		#*u = p
		addu	$t2,$t2,$t1		#*u = p + n
		addiu	$t2,$t2,-8		# *u = p+n–1;
		l.d		$f12,0($t0)		#max = *p++; 
		addiu	$t0,$t0,8			#p++
for:		bgt		$t0,$t2,endfor	# for(; p <= u; p++){
		l.d		$f4,0($t0)		# f4 = *p
		c.le.d	$f4,$f12
		bc1t		endif			# if(*p > max){
		mov.d	$f12,$f4			# max = *p;
endif:	addiu	$t0,$t0,8			#p++
		j		for				#}
endfor:	jr		$ra