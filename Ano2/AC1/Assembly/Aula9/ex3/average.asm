	.data
	.text
	.globl average
# $t0 -> i
# $t1 -> &array[i-1]
# $f4 -> array[i-1]
# $f12 -> sum
average:		mtc1.d	$0,$f12		# sum = 0.0
			move	$t0,$a1		# i = n
for:			ble		$t0,0,endfor	# for(; i > 0; i--) {
			addi		$t1,$t0,-1	# i-1
			sll		$t1,$t1,3		# i-1 * 8
			addu	$t1,$t1,$a0
			l.d		$f4,0($t1)	#f4 = array[i-1]
			add.d	$f12,$f12,$f4	# sum += array[i-1];
			addiu	$t0,$t0,-1	# i--
			j		for
endfor:		mtc1	$a1,$f0
			cvt.d.w	$f0,$f0
			div.d	$f12,$f12,$f0	#return sum / (double)n;
			jr		$ra
			