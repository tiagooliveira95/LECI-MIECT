	.data
	.text
	.globl var

# $s0 -> array
# $s1 -> nval
# $s2 -> i
# $f20 -> media
# $f22 -> soma
# $f24 -> array[i]
#t0 -> &array[i]
var:		addiu $sp,$sp,-40
		sw $ra,0($sp)
		sw $s0,4($sp)
		sw $s1,8($sp)
		sw $s2,12($sp)
		s.s  $f20,16($sp)
		s.s  $f22,24($sp)
		s.s  $f24,32($sp)
		move $s0,$a0
		move $s1,$a1
		jal average
		mov.d $f0,$f20
		cvt.s.d $f20,$f20		#(float)average(array, nval)
		li $s2,0				# i = 0
		mtc1 $0,$f22			#soma=0.0
for:		bge	$s2,$s1,endfor	#for(;i < nval; i++){
		sll $t0,$s2,3			# i * 8
		addu $t0,$t0,$s0		# t0 = &array[i]
		l.d $f24,0($t0)		# $f24 = array[i]
		sub.d $f12,$f24,$f20
		li $a0,2
		jal xtoy
		add.s $f22,$f22,$f0	 # soma += xtoy(array[i] - media, 2);
		addi	$s2,$s2,1		#i++
		j for
endfor:	cvt.d.s $f22,$f22
		mtc1 $s1,$f4
		div.d $f0,$f22,$f4		# return (double)soma / nval;
		lw $ra,0($sp)
		lw $s0,4($sp)
		lw $s1,8($sp)
		lw $s2,12($sp)
		l.s  $f20,16($sp)
		l.s  $f22,24($sp)
		l.s  $f24,32($sp)
		addiu $sp,$sp,40
		jr	$ra