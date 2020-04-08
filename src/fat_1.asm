#programa para calcular fatorial de maneira não recursiva e sem procedimento

.data #seguimento de dados

	.align 0
str_inicio:	.asciiz "Digite um numero inteiro positivo:"

.text
	#imprimir string
	
	addi $v0,$zero,4
	#load adress
	la $a0, str_inicio
	syscall
	
	# vai ler um inteiro vindo do teclado
	addi $v0,$zero ,5			# atribui 5 para $vo. Codigo para read_int
	syscall				# chamada de sistema para E/S. Retorno estara em $v0
	move $t2, $v0		# copia conteudo digitado para $t2 para preservar dado
	
	#a raposta do cálculo será guardada em $t0
	addi $t0,$zero,1
	#auxiliar contendo -1
	addi $t1,$zero,-1
			
loop:
	mul $t0,$t2,$t0
	
	add $t2,$t2,$t1 #$t2--;
	
	bne $t2,$zero,loop
	
	#impimir resultado
	addi $v0,$zero,1 #codigo para imprimir inteiro
	move $a0,$t0	#inteiro a ser impresso
	syscall
	
	
	li $v0, 10			# atribui 10 para $v0. Codigo para exit (termina programa)
	syscall				# chamada de sistema para E/S
	