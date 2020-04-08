#calculo de fibbonaci sem preocedimento não recursivo

.data
	.align 0
str_comeco:	.asciiz "Digite até que numero você quer a sequêcia(começando de 0):"
espaco:		.asciiz " "
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
	addu $t0,$zero,$v0#$t0 = n
	
	add $t1,$zero,$zero #t1 recebe o contador
	
	#t2 e t3 recebem os valores iniciais da sequencia e serão usados para o calculo dos numeros subsequentes
	addi $t2,$zero,1 
	addi $t3,$zero,1
	
loop:
	#imprime o numero atual da sequencia
	addi $v0,$zero,1
	addu $a0,$zero,$t2
	syscall
	
	#imprime um espaço entre os numeros da sequencia
	addi $v0,$zero,4
	la $a0,espaco
	syscall
	
	#atualiza a sequencia
	add $t2, $t2,$t3
	
	#swap t2 e t3
	add $t4,$zero,$t2
	add $t2,$zero,$t3
	add $t3,$zero, $t4
	
	
	#atualiza o contador
	addi $t1,$t1,1
	
	#enquanto t0 for maior que t1
	sgt $t4,$t1,$t0
	beq $t4,$zero,loop
	
	
	li $v0, 10			# atribui 10 para $v0. Codigo para exit (termina programa)
	syscall	
	
	
	
	
	
	
	
	