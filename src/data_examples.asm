
	.data
	
	.align 3
	
double:	.double	432128347034985

	.align 2

word:	.word 10

float:	.float 493923429381

	.align 1

half:	.half 5, 6

	.align 0
	
byte:	.byte 0

string:	.asciiz "Isso eh uma string"

	
	.text
	
	li $v0,10
	syscall
