
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
	
main:	# inicio do codigo principal

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


fatorial:	#inicio da funcao fatorial
	# salva alguns registradores na pilha
	addi $sp, $sp, -4	# move o ponteiro da pilha, s� 4 bytes pois vai salvar s� 1 palavra
	sw $a0, 0($sp)		# salva o registrador $a0 na pilha
	
	# codigo do fatorial
	addi $t4, $zero, 1	# atribui 1 ao registrador $t4  (EH O FAT RECEBENDO 1)
	#move $t5, $a0
	addi $t6, $zero, 1	# atribui 1 ao registrador $t6. Usado na repeticao como parada

loopfat:			# loop para o calculo do fatorial 
	ble $a0, $t6, endloop   # condicional que marca o inicio do while

	mul $t4, $t4, $a0	# fat = fat * cont
        addi $a0, $a0, -1	# cont--
   	j loopfat
	
endloop:
	move $v0, $t4		# salva o valor do fatorial calculado no loop em $v0
				
	# desempilha os registradores e volta ao conte�do que tinha antes de chamar o procedimento
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	
	# volta o controle para onde a funcao foi chamada
	jr $ra
	
