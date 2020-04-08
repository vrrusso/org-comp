# C�digo que implementa a compara��o entre duas strings


	.data
	.align 0
string1:	.asciiz	"vou comparar 1"
string2:	.asciiz "vou comparar 1"

iguais:		.asciiz "As strings sao iguais"
diferentes:	.asciiz "As strings sao diferentes"
	.text
	.globl main
		
main:

	# carregar o endere�o do 1o byte das duas strings
	la $t0, string1		# endere�o do 1o byte da 1a. string
	la $t1, string2 	# endere�o do 1o byte da 2a. string
	
	lb $t8, 0($t0)		# le o byte apontado por $t0
	lb $t9, 0($t1)		# le o byte apontado por $t1
	
loop:	bne $t8, $t9, stringsdiferentes
	
	beq $t8, $zero, stringsiguais
	
	addi $t0, $t0, 1	# avan�a na string 1 (endere�o)
	addi $t1, $t1, 1	# avan�a na string 2 (endere�o)
	
	lb $t8, 0($t0)		# l� o byte apontado por $t0
	lb $t9, 0 ($t1)		# l� o byte apontado por $t1
	
	j loop
	
stringsdiferentes:			# bytes n�o s�o iguais
	li $v0, 4		# fun��o da syscall para imprimir string
	la $a0, diferentes	# carrega em $a0 o endere�o do 1o byte da string "iguais"
	syscall
	j fim
	
stringsiguais:	
	li $v0, 4
	la $a0, iguais
	syscall
					
fim:	li $v0,10
	syscall
