#calculo de fibbonaci sem preocedimento não recursivo

.data
	.align 0
str_comeco:	.asciiz "Digite n:"

.text
	.globl main
	
main:
	#imprime a string inicial
	addi $v0,$zero,4
	la $a0,str_comeco
	syscall
	
	#le n - até que numero da sequencia sera impresso
	addi $v0,$zero,5
	syscall
	addu $a0,$zero,$v0#move para a0(argumento da funcao) o valor lido 
	
	jal fib
	
	addu $t0,$zero,$v0 #move o resultado do cálculo para t0
	
	#imprime resultado
	addi $v0,$zero,1
	addu $a0,$zero,$t0
	syscall
	
	
	li $v0, 10			# atribui 10 para $v0. Codigo para exit (termina programa)
	syscall
	
		
fib: #inicio da funcao fibonacci
# salva alguns registradores na pilha
	addi $sp, $sp, -4	# move o ponteiro da pilha, s� 4 bytes pois vai salvar s� 1 palavra
	sw $a0, 0($sp)		# salva o registrador $a0 na pilha
	
	addi $a0,$a0,-1
	
	#calculo fibonacci
	add $t0,$zero,$zero #t0 recebe o contador
	
	#t1 e t2 recebem os valores iniciais da sequencia e serão usados para o calculo dos numeros subsequentes
	addi $t1,$zero,1 
	addi $t2,$zero,1
	
loop:
	#atualiza a sequencia
	add $t1, $t1,$t2
	
	#swap t2 e t3
	add $t3,$zero,$t1
	add $t1,$zero,$t2
	add $t2,$zero, $t3
	
	
	#atualiza o contador
	addi $t0,$t0,1
	
	#enquanto t0 for maior que t1
	sgt $t3,$t0,$a0
	beq $t3,$zero,loop
	
	addu $v0,$zero,$t1
	
	# desempilha os registradores e volta ao conte�do que tinha antes de chamar o procedimento
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	
	# volta o controle para onde a funcao foi chamada
	jr $ra
		