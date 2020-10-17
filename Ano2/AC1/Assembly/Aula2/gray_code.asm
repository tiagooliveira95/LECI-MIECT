.data
.text
.globl main

main:	ori $t0,$0,0xA		# add x to $t0
	srl $t1,$t0,0x1 	# bin >> 1
	xor $t1,$t1,$t0		# gray = bin ^ (bin >> 1) 
	jr $ra 
