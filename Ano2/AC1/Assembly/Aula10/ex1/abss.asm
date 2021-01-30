	.data
	.text
	.globl abss
	
abss:	bgez	$a0,endif
		not	$a0,$a0
		addi	$a0,$a0,1
endif:	move	$v0,$a0
		jr	$ra