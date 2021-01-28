	.data
	.text
	.globl  toascii
# Converte o digitos para o respetivo código ASCII 
# v -> $v0
toascii:	addiu	$v0,$a0,'0'		# v += '0';
		blt		$v0,'9',endif		# if( v > '9' )
		addiu	$v0,$v0,7		# v += 7; // 'A' - '9' - 1
endif:	jr		$ra
