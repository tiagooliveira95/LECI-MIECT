#t0 -> array
#t1 -> dup_array
#t2 -> size
#t3 -> i
#t4 -> j
#t5 -> token
#t6 -> dup_array[i] 
#t7 -> array[i]
#t8 -> array[j]
	.data
	.text
	.globl find_duplicates

#Marca elementos duplicados do array
find_duplicates:
		addiu	$sp,$sp,-4
		sw		$ra,0($sp)
		move	$t0,$a0
		move	$t1,$a1
		move	$t2,$a2
		li		$t3,0			# i = 0
for:		bge		$t3,$t2,endfor
		sll		$t6,$t3,2			# i * 4
		addu	$t6,$t6,$t1		
		sw		$0,0($t6)		# dup_array[i] = 0;
		li		$t4,0			# j = 0
		li		$t5,1			# token = 1
for2:	bge		$t4,$t2,endfor2
		sll		$t7,$t3,2			# i * 4
		addu	$t7,$t7,$t0
		lw		$t7,0($t7)		#t7 = array[i]
		sll		$t8,$t4,2			# j * 4
		addu	$t8,$t8,$t0
		lw		$t8,0($t8)		#t8 = array[j]
		bne		$t7,$t8,endif		# if(array[i] == array[j])
		sll		$t6,$t4,2			# j * 4
		addu	$t6,$t6,$t1		
		sw		$t5,0($t6)		# dup_array[j] = token;
		addi		$t5,$t5,1			# token++
endif:	addi		$t4,$t4,1			# j++
		j		for2
endfor2:	addi		$t3,$t3,1			# i++
		j		for				# }
endfor:	lw		$ra,0($sp)
		addiu	$sp,$sp,4
		jr		$ra
		
		
		
