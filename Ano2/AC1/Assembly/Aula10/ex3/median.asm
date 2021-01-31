	.data
	.eqv TRUE, 1
	.eqv FALSE, 0
	.text
	.globl median

# Mapa de Registos
# $t0 -> array
# $t1 -> nval
# $t2 -> houveTroca
# $f8 -> aux
# $t3 -> i
# $t4 -> nval-1;
# $t5 -> &array[i]
# $f4 ->  array[i]
# $f6 ->  array[i+1]

median: move	$t0,$a0
		move	$t1,$a1
do:		li		$t2,FALSE		# houveTroca = FALSE; 
		li		$t3,0			# i = 0
		addi	$t4,$t1,-1		# t4 =  nval-1
for:	bge		$t3,$t4,endfor	# for( i = 0; i < nval-1; i++ ){
		sll		$t5,$t3,3		# i * 8
		addu	$t5,$t5,$t0		#
		l.d		$f4,0($t5)		# f4 = array[i]
		l.d		$f6,8($t5)		# f6 = array[i+1]
		c.le.d	$f4,$f6			# if( array[i] > array[i+1] )
		bc1t	endif			#{
		mov.d	$f8,$f4			# aux = array[i]; 
		s.d		$f6,0($t5)		# array[i] = array[i+1];
		s.d		$f8,8($t5)		# array[i+1] = aux
		li		$t2,TRUE		# houveTroca = TRUE;
endif:	addi	$t3,$t3,1		# i++
		j 		for				#}
endfor:	beq		$t2,TRUE,do		# while( houveTroca == TRUE ); 
		div		$t5,$t1,2		# nval / 2
		sll		$t5,$t5,3		# (nval/2)*8
		addu	$t5,$t5,$t0		#
		l.d		$f0,0($t5)		#  return array[nval / 2]; 
		jr 		$ra				#
		