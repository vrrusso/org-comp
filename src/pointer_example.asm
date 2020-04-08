
	.data
	
	.align 2
	
ponteiro:	.word	# variavel que armazenar� o end. do 1o byte retornado pela fun��o sbrk


	.text
	.globl main
	
main:

	# reserva o espa�o na heap
	li $v0, 9	# fun��o 9 da syscall
	li $a0, 12	# reserva 12 bytes
	syscall		# o endere�o do 1o byte vai estar em $v0
	
	sw $v0, ponteiro
	#la $t0, ponteiro	# carrega em $t0 o endere�o da vari�vel ponteiro
	#sw $v0, 0($t0)		# escreve em (0 + $t0) o conte�do de $v0
	
	# c�digo
	# .
	# .
	
	
	# escrever nas posi��es que est�o na heap
	la $t0, ponteiro	# recupera o endere�o da vair�vel ponteiro
	lw $t1, 0($t0)		# l� o conte�do da vari�vel ponteiro, ou seja, o endere�o do 1o byte das posi��es alocadas
	
	li $t8, 1
	sw $t8, 0($t1)		# est� escrevendo nos primeiros 4 bytes da mem�ria alocada
	
	li $t8, 2
	sw $t8, 4($t1)		# est� escrevendo nos primeiros 4 bytes da mem�ria alocada

	li $t8, 3
	sw $t8, 8($t1)		# est� escrevendo nos primeiros 4 bytes da mem�ria alocada
		
	
	li $v0, 10
	syscall