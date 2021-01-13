# Mapa de Registos
# $t0 = p
# $t1 = *p

# $t2 = houveTroca
# $t3 = aux
# $t4 = size
# $t5 = i
# $t6 = lista
# $t7 = lista + i

		.data
		.eqv SIZE,10
		.eqv TRUE, 1
		.eqv FALSE, 0
		.eqv read_int10,5
lista	:	.space 40 
		.text
		.globl main
		
main:	la $t0, lista			# p = lista ou &lista[0]
		
		li $t4, SIZE			#
		sll $t4, $t4,2			#
		addu $t4,$t4,$t0		# $t5 = lista + size
		
for:							# for
		bge $t0,$t4, endf		# p < lista + size
		
		li $v0,read_int10
		syscall				# $v0 = read_int()
		
		sw $v0, 0($t0)		# *p = readInt
							
		addu $t0,$t0,4		# p++
		j for
do:	
		li $t2, FALSE			# houveTroca = false
		li $t5, 0				# i = 0
		li $t4, SIZE			# $t6 = size
		subiu $t4,1			# $t6 = size - 1

for2:	bge $t5, $t4, for3:		# while  i < SIZE-1

		sll $t6,$t5,2			# $t6 = i * 4
		addu $t6, $t0,$t6		# $t6 = &lista[i]
		lw $t6, 0($t6)			# $t6 = lista[i]
		
		addu $t7, $t5, 1		# $t7 = i + 1
		sll $t7, $t5,2			# $t7 = i * 4
		lw $t7, 0($t7)			# $t7 = lista[i+1]
		
if:		ble $t6,$t7, endfor2	# if (lista[i] > lista[i+1]) 
		
		li $t3,$t6				# aux = lista[i];
		
		
		addu $t5,$t5,1		# i++
		
endfor2:

		















