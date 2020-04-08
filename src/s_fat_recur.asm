	
	.data
	.align 0	# determina o alinhamento dos bytes (2 elevado a 0)
strinicio:
	.asciiz "Digite um numero para o fatorial: "
strresp:
	.asciiz "O fatorial de "
strresp2:
	.asciiz " eh :"	

	.text
	.globl main
	
main:

	li $v0, 4		# codigo da chamada de sistema que imprime string
	la $a0, strinicio	# string a ser impressa
	syscall			# chamada do sistema operacional

	# l� um inteiro fornecido pelo usuario em $v0
	li $v0,5
	syscall

	# transfere o valor fornecido pelo usuario para o registrador $a0
	move $a0, $v0
	
	# transferir o controle para a funcao
	jal fatorial	# desvia para fatorial e salva no $ra o endere�o da proxima instrucao

	move $s0, $v0	# salva o valor retornado da funcao fatorial

	move $t0, $a0
	
	# impressao do resultado

	li $v0, 4		# codigo da chamada de sistema que imprime string
	la $a0, strresp		# string de resposta a ser impressa
	syscall			# chamada do sistema operacional

	li $v0, 1		# codigo da chamada de sistema que imprime um inteiro
	move $a0, $t0		# inteiro a ser impresso
	syscall			# chamada do sistema operacional

	li $v0, 4		# codigo da chamada de sistema que imprime string
	la $a0, strresp2	# string de resposta a ser impressa
	syscall			# chamada do sistema operacional

	li $v0, 1		# codigo da chamada de sistema que imprime um inteiro
	move $a0, $s0		# inteiro a ser impresso
	syscall			# chamada do sistema operacional		

	li $v0, 10
	syscall	
	
	
fatorial:	#inicio da funcao fatorial recursiva

	# salva alguns registradores na pilha
	addi $sp, $sp, -8	# move o ponteiro da pilha, s� 4 bytes pois vai salvar s� 1 palavra
	sw $a0, 0($sp)		# salva o registrador $a0 na pilha
	sw $ra, 4($sp)		# salva o registrador $a0 na pilha

	beq $a0, $zero, retorna1	# condi��o de parada (N==0)
	
	addi $a0, $a0, -1	# decrementa $a0 para chamar o fatorial de N-1
	
	jal fatorial		# chamada recursiva

	addi $a0, $a0, 1	# valor de $a0 com o valor de antes da chamada. Para multiplicar, precisa somar 1
	
	mul $v0, $v0, $a0	# multiplica o valor retornado na fun��o recursiva ($v0) pelo valor do par�metro ($a0)
	
	j retornafat		# desvia para retornafat para n�o atribuir 1 a $v0 novamente
		
retorna1:
	addi $v0, $zero, 1	# condi��o de parada. Coloca 1 em $v0. pode ser tamb�m li $v0,1

retornafat:
	# desempilha os registradores e volta ao conte�do que tinha antes de chamar o procedimento
	lw $ra, 4($sp)	
	lw $a0, 0($sp)

	addi $sp, $sp, 8
	
	# volta o controle para onde a funcao foi chamada
	jr $ra	
			
																																												
	# codigo do fatorial sem recurs�o
#	addi $t4, $zero, 1	# atribui 1 ao registrador $t4  (EH O FAT RECEBENDO 1)
	#move $t5, $a0
#	addi $t6, $zero, 1	# atribui 1 ao registrador $t6. Usado na repeticao como parada

#loopfat:			# loop para o calculo do fatorial 
#	ble $a0, $t6, endloop   # condicional que marca o inicio do while

#	mul $t4, $t4, $a0	# fat = fat * cont
#       addi $a0, $a0, -1	# cont--
#   	j loopfat
	
#endloop:
#	move $v0, $t4		# salva o valor do fatorial calculado no loop em $v0
				

		
	
	
