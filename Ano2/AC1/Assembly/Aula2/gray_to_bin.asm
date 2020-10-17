.data
.text
.globl main

main:	ori $t0,$0,0x5		# num = gray (guarda o valor gray em $0)
	srl $1,$t0,0x4		# $t1 = num >> 4
	xor $t2,$t0,$t1		# $t2 = num ^ (num >> 4)
	
	srl $t1,$t2,0x2		# $t1 = num >> 2
	xor $t2,$t2,$t1		# $t2 = num ^ (num >> 2)
	
	srl $t1,$t2,0x1		# $t1 = num >> 1
	xor $t2,$t2,$t1		# $t2 = num ^ (num >> 1)
	
	jr $ra			# fim do programa