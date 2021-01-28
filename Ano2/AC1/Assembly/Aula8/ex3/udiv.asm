#$t0 -> dividendo
#$t1 -> divisor
#$t2 -> i
#$t3 -> bit
#$t4 -> quociente
#$t5 -> resto
#$t6-> temp
	.data
	.text
	.globl udiv

udiv:	move $t1,$a1
		move $t0,$a0
		sll	$t1,$t1,16			# divisor = divisor << 16;
		andi	$t0,$t0,0xFFFF		# dividendo = (dividendo & 0xFFFF)
		sll	$t0,$t0,1				# dividendo = dividendo << 1
		li 	$t2,0				# i = 0
for:		bge	$t2,16,endfor
		li	$t3,0				#bit = 0; 
		blt	$t0,$t1,endif			# if(dividendo >= divisor)  {
		subu	$t0,$t0,$t1			# dividendo = dividendo - divisor;
		li	$t3,1				#bit = 1; 
endif:	sll	$t0,$t0,1				# dividendo = (dividendo << 1)
		or	$t0,$t0,$t3			# dividendo = dividendo | bit
		addi	$t2,$t2,1				#i++
		j 	for					#}
endfor:	sra	$t5,$t0,1				# resto = (dividendo >> 1)
		lui	$t6,0xFFFF			# t6 =  0xFFFF0000;
		and	$t5,$t5,$t6			# resto = resto & 0xFFFF0000
		andi	$t4,$t0,0xFFFF		# quociente = dividendo & 0xFFFF;
		or	$v0,$t5,$t4			# return (resto | quociente); 
		jr	$ra