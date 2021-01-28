#s0 -> dst
#s1 -> src
#s2 -> pos
#s3 -> len_dst
#s4 -> p

#t0 -> len_src
#t1 -> i
#$t2 -> &dst[i]
# $t3 -> *dst[i]
	.data
	.text
	.globl insert
	
insert:	addiu	$sp,$sp,-20
		sw		$ra,0($sp)
		sw		$s0,4($sp)
		sw		$s1,4($sp)
		sw		$s2,8($sp)
		sw		$s3,12($sp)
		sw		$s4,16($sp)
		move	$s0,$a0
		move	$s1,$a1
		move	$s2,$a2
		move	$a0,$s0
		jal		strlen
		move	$s3,$v0			# len_dst = strlen(dst);
		move	$a0,$s1
		jal		strlen
		move	$t0,$v0			# len_src = strlen(src);
		bgt		$s2,$s3,endif		# if(pos <= len_dst) {
		move	$t1,$s3			# i = len_dst
for:		blt		$t1,$s2,endfor	# for(; i >= pos; i--) {
		addu	$t2,$s0,$t1		# *dst[i] = dst + i
		lb		$t3,0($t2)		# t3 = dst[i]
		addu	$t2,$t2,$t0		# *dst[i] = dst + i +  len_src
		sb		$t3,0($t2)		# dst[i + len_src] = dst[i];
		addiu	$t1,$t1,-1		#  i--
		j 		for				#
endfor:	li		$t1,0			# i = 0	
for2:	bge		$t1,$t0,endif		# for(; i < len_src; i++) {
		addu	$t2,$s1,$t1		# *src[i] = src + i
		lb		$t3,0($t2)		# t3 = src[i]
		addu	$t2,$s0,$t1		# *dst[i] = dst + i
		addu	$t2,$t2,$s2		#  &dst[i + pos]
		sb		$t3,0($t2)		# dst[i + len_src] = src[i];
		addiu	$t1,$t1,1			#  i++
		j 		for2				# }
endif:	move 	$v0,$s4			# return p;	
		lw		$ra,0($sp)
		lw		$s0,4($sp)
		lw		$s1,4($sp)
		lw		$s2,8($sp)
		lw		$s3,12($sp)
		lw		$s4,16($sp)	
		addiu	$sp,$sp,20
		jr		$ra		