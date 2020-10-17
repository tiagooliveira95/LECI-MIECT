.data
.text
.globl main

main:	li $t0,0x12345678	# instrução virtual (decomposta
				# em duas instrucoes nativas)
	sll $t2,$t0,16		# $t2 = shift left logical $t0 << x 
	srl $t3,$t0,16		# $t3 = shift right logical $t0 >> x 
	sra $t4,$t0,16 		# $t4 = shift right arithmetic
	jr $ra			# fim do programa
