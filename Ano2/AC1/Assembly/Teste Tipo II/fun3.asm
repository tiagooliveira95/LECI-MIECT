	.data
	.eqv s_nome,0
	.eqv s_num,52
	.eqv s_grade,56
	.eqv s_type,60
x:	.float 2.0
	.eqv print_float,2
	.eqv print_string,4
	.text
	.globl fun3
# Mapa de Registos
# $s0-> std
# $t0 -> n
# $t1 -> i
# $f0 -> sum
# $t2 -> &std[i]

# Struct Table
#	NAME	SIZE	ALIGN	OFFSET
#	name	50	1	0
#	num	4	4	52
#	grade	4	4	56
#	type	1	1	60
#	student	60	4

fun3:		addiu	$sp,$sp,-4
		sw	$s0,0($sp)
		move	$s0,$a0
		move	$t0,$a1
		li	$t1,0			# i = 0
for:		bge	$t1,$t0,endfor		# for(; i < n; i++){
		mul	$t2,$t1,60		# i * 60
		addu	$t2,$t2,$s0
		move	$a0,$t2
		li	$v0,print_string
		syscall				# print_str(std[i].name)
		l.s	$f12,s_grade($t2)
		li	$v0,print_float
		syscall				# print_float(std[i].float)
		add.s	$f0,$f0,$f12		# sum +=  std[i].grade
		addi	$t1,$t1,1		#i++
		j	for
endfor:	l.s	$f4,x				# f4 = 2.0
		div.s	$f0,$f0,$f4		# return sum / 2.0
		lw	$s0,0($sp)
		addiu	$sp,$sp,4
		jr	$ra