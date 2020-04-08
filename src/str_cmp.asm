# C�digo que implementa a fun��o strcmp()


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
	la $a0, string1		# endere�o do 1o byte da 1a. string
	la $a1, string2 	# endere�o do 1o byte da 2a. string
	
	jal strcmp		# desvia para a instru��o que est� no label "strcmp" e salva o endere�o
				# da pr�xima instru��o no $ra

	move $a0, $v0		# coloca em $a0 para impress�o o valor retornado da fun��o ($v0)
	li $v0, 1
	syscall
						
	li $v0,10
	syscall

strcmp:
	addi $sp, $sp, -8	# reserva 8 bytes na pilha
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	
	lb $t8, 0($a0)		# le o byte apontado por $t0
	lb $t9, 0($a1)		# le o byte apontado por $t1
	
loop:	bne $t8, $t9, stringsdiferentes		# tem que retornar a diferen�a entre elas
	
	beq $t8, $zero, stringsiguais		# tem que retornar 0
	
	addi $a0, $a0, 1	# avan�a na string 1 (endere�o)
	addi $a1, $a1, 1	# avan�a na string 2 (endere�o)
	
	lb $t8, 0($a0)		# l� o byte apontado por $t0
	lb $t9, 0($a1)		# l� o byte apontado por $t1
	
	j loop
	
stringsdiferentes:			# bytes n�o s�o iguais
	sub $v0, $t8, $t9

	j fimstrcmp
	
stringsiguais:	

	li $v0, 0		# retorna 0
		
fimstrcmp:	
	lw $a0, 0($sp)		# restaura o valor de $a0
	lw $a1, 4($sp)		# restaura o valor de $a1
	addi $sp, $sp, 8	# volta o ponteiro da pilha (desempilha)

	jr $ra		# retorna para onde a fun��o foi chamada		

