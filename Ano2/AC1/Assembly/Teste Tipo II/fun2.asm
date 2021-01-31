	.data
	.text
	.globl fun2
	
#Mapa de registos
# $s0 -> p
# $s1 -> k
# $s2 -> n
# $t0 -> *p
fun2:		addiu	$sp,$sp,-16	# alucar espaço
		sw	$ra,0($sp)	# salvaguardar $ra
		sw	$s0,4($sp)	# guardar dados $sx
		sw	$s1,8($sp)	#
		sw	$s2,12($sp)	#
		li	$s2,0		# n = 0
while:	lw	$t0,0($s0)	#t0 = *p
		beq	$t0,$s1,endw	# while(*p != k){
		move	$a0,$t0		# funk( *p,
		move	$a1,$s1		# k
		jal	funk		# )
		add	$s2,$s2,$v0	# n = n + funk(*p, k);
		addiu	$s0,$s0,4	#p++
		j	while		#}
endw:		move 	$v0,$s2
		lw	$ra,0($sp)	#repor ra
		lw	$s0,4($sp)	# report dados restantes $sx
		lw	$s1,8($sp)	#
		lw	$s2,12($sp)	#
		addiu	$sp,$sp,16	#
		jr	$ra		# fim do programa