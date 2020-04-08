# esse programa soma dois vetores e armazena em um terceiro vetor

	.data

	.align 2
# tr�s vetores definidos estaticamente

vetor1:	.word 1, 2, 3, 4, 5
vetor2:	.word 6, 7, 8, 9, 10
vetor3:	.word 0, 0, 0, 0, 0

	.text
	.globl main
	
main:
	# carregar em $t0, $t1 e $t2 os endere�os iniciais dos vetores
	la $t0, vetor1
	la $t1, vetor2
	la $t2, vetor3
	
	li $t9, 4
	
loop:	
	lw $t6, 0($t0)	#carrega em $t6 a posi��o armazenada em 0 + $t0
	lw $t7, 0($t1)	#carrega em $t7 a posi��o armazenada em 0 + $t1
	add $t8, $t6, $t7	# soma os registradores $t6 e $t7 e armazena em $t8
	sw $t8, 0($t2)	#salva o conte�do de $t8 em 0 + $t2
	
	addi $t0, $t0, 4	# incremente de 4 posi��es o �ndice do vetor
	addi $t1, $t1, 4
	addi $t2, $t2, 4
	
	addi $t9, $t9, -1
	
	bge $t9, $zero, loop
	
	li $v0, 10
	syscall
	
	
	
	
  