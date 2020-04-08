

	.data
	.align 2
inteiro:	.word	4

	.text
	
	la $a0, inteiro
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
