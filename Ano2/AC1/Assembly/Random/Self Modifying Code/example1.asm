	.data
str1:	.asciiz " string 1 "
str2:	.asciiz "string 2 "
	.eqv print_string, 4
	.text
	.globl main

main:	li	$t0,0x00400078
	lw	$t1,0($t0)
	lw	$t2,4($t0)
	lw	$t4,16($t0)
	lw	$t5,20($t0)
	sw	$t4,0($t0)
	sw	$t5,4($t0)
	sw	$t1,16($t0)
	sw	$t2,20($t0)
	
	la	$a0,str1		# print("string 1")
	li	$v0,print_string	#
	syscall				#
	la	$a0,str2		# print("string 2")
	li	$v0,print_string	#
	syscall				#
	jr	$ra
