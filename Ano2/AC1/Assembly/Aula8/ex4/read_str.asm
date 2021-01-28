# $s0 -> *s
# $t0 -> len
# $t2 -> s[len-1] 
# $t3 -> &s[len-1] 
	.data
	.eqv read_string, 8
	.text
	.globl read_str
	
read_str:	addiu	$sp,$sp,-8
		sw		$ra,0($sp)
		sw		$s0,4($sp)
		move	$s0,$a0
		li 		$v0,read_string		# 
		syscall	
		move	$a0,$s0
		jal		strlen
		move	$t0,$v0				# len = strlen(s); 
		addu	$t3,$s0,$t0
		addiu	$t3,$t3,-1
		lb		$t2,0($t3)
		bne		$t2,0x0A,endif		# if(s[len-1] == 0x0A)
		sb		$0,0($t3)
endif:	lw		$ra,0($sp)
		lw		$s0,4($sp)
		addiu	$sp,$sp,8
		jr 		$ra