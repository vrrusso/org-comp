#esse programa le um numero ate 999 e inverte seus digitos

.data
	.align 0
str_comeco:	.asciiz "Digite um numero ate 999:"
	.align 2
array:	.word 0, 0, 0

.text
	.globl main
main:
	#imprimir a string
	addi $v0,$zero,4
	la $a0,str_comeco
	syscall
	
	#ler o numero
	addi $v0,$zero,5
	syscall
	addu $t0,$zero,$v0	#salva em s0 o valor lido

	la $s0,array #salva o endereco base do array em s0	

	#variaveis de controle de laço - t1=contador t2 alvo
	addi $t1,$zero,2
	addi $t2,$zero,-1

	#divisor comeca em 100 - com esse divisor sera possivel acessa cada algarismo do numero
	addi $t3,$zero,100
	
	#salvar um valor 10 para usa-lo
	addi $s1,$zero,10
	
	#variavel de accesso ao array - comeca em 8 que eh a ultima posicao e vai diminuindo de 4 em 4
	addi $s3, $zero,8
	
loop:
	
	div $t4,$t0,$t3#pega o algarismo atual
	
	#salva o digito atual no array ja na ordem invertida
	add $t5,$s0,$s3
	sw $t4,0($t5)
	#reduz a variavel de acesso ao array
	addi $s3,$s3,-4
	
	#reduzir o numero 
	mul $t4,$t4,$t3 #ajusta t4 a verdadeira ordem de magnitude do algarismo atual
	sub $t0,$t0,$t4
	
	#reduzir o divisor
	div $t3,$t3,$s1#divide por 10
	
	#controle de laço 
	#t1--
	#if t1 != t2 goto loop
	addi $t1,$t1,-1
	bne $t1,$t2,loop
	
	#imprime o numero invertido
	
	#variaveis de controle de laço - t1=contador e indice de acesso ao array  t2 alvo
	addi $t1,$zero,0
	addi $t2,$zero,12

loop2:
	#impressao de inteiro
	addi $v0,$zero,1
	add $t5,$s0,$t1#calcula a posicao atual do array
	lw $a0,0($t5) #carrega da memroria direto pro argumento de impressao
	syscall
	
	addi $t1,$t1,4	#aumenta o contador
	
	#if t1 != t2 goto loop2
	bne $t1,$t2,loop2
	
	
	#encerra o programa
	li $v0, 10
	syscall
	
