	.data
r:	.float 1.0
	.text
	.globl xtoy
	
# $t0 -> i
# $t1 -> abs(y)
# $s0 -> y
# $f0 -> result
# $f20 -> x

xtoy:	addiu	$sp,$sp,-12
	sw	$ra,0($sp)
	sw	$s0,4($sp)
	s.s	$f20,8($sp)
	mov.s	$f20,$f12
	move	$s0,$a0
	jal 	abss			# abss(y)
	move	$t1,$v0			# $t1 abs(y)
	li	$t0,0			# i = 0
	l.s	$f0,r			#result=1.0
for:	bge	$t0,$t1,endfor		# for(; i < abs(y); i++) {
	blez	$s0,else		#if(y > 0){ 
	mul.s	$f0,$f0,$f20		#result *= x;
	j	endif			# } else {
else:	div.s	$f0,$f0,$f20		#result /= x;}
endif:	addi	$t0,$t0,1		#i++
	j	for			#}
endfor:	lw	$ra,0($sp)
	lw	$s0,4($sp)
	l.s	$f20,8($sp)
	addiu	$sp,$sp,12
	jr	$ra

