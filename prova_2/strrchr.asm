#	Código da segunda avalicação da disciplina Organização de Computadores - Professora Sarita
#
#	char * strrchr(char * str, int c); retorna o ponteiro pra última ocorrência de c em str
#
#	Autor: Victor Rodrigues Russo - 11218855


#Segmento de dados

	.data
.align 0

texto_leitura_str:	.asciiz "Entre com a string:"
texto_leitura_char:	.asciiz "Entre com o char:"
texto_busca_nao_achou:	.asciiz "(null)"
texto_busca_ok:		.asciiz "String a partir da ultima ocorrência do caracter:"
texto_indice:		.asciiz "Indice da ultima ocorrência do caracter:"
quebra_linha:		.asciiz "\n"

#variável string usada
str:			.space 50
chr:			.space 2

.align 2

	.text
	.globl main

main:
	
	#imprime texto_leitura_str
	addi $v0,$zero,4
	la $a0,texto_leitura_str
	syscall
	
	#le a string
	addi $v0,$zero,8
	la $a0,str
	addi $a1,$zero,50 #tamanho máximo da string
	syscall
	
	#imprime texto_leitura_char
	addi $v0,$zero,4
	la $a0,texto_leitura_char
	syscall
	
	
	#le o char como uma string de tamanho 1
	addi $v0,$zero,8
	la $a0,chr
	addi $a1,$zero,2 #tamanho máximo da string
	syscall
	
	#chama a função strrchr
	la $a0,str
	lb $a1,chr	
	jal strrchr
	
	#salva o endereço retornado em t0
	la $t0,($v0)
	
	
	#imprime um pulo de linha
	addi $v0,$zero,4
	la $a0,quebra_linha
	syscall
	
	#se o ponteiro for nulo imprime (null) e finaliza o programa
	bne $t0,$zero,busca_ok
	
	#imprime null
	addi $v0,$zero,4
	la $a0,texto_busca_nao_achou
	syscall
	
	j theend

busca_ok:
	#caso o ponteiro nao for nulo imprime a string a partir dele e o indice da ultima ocorrência
	
	#imprime texto_busca_ok
	addi $v0,$zero,4
	la $a0,texto_busca_ok
	syscall
	
	#imprime a string
	addi $v0,$zero,4
	la $a0,($t0)
	syscall
	
	#imprime texto_indice
	addi $v0,$zero,4
	la $a0,texto_indice
	syscall
	
	#calcula e imprime o indice da última ocorrencia
	addi $v0,$zero,1
	la $t1,str
	sub $a0,$t0,$t1
	syscall
	
theend:	
	li $v0,10
	syscall
	
	
#função strrchr
#a0 char * str string onde será efetuada a busca
#a1 int c  caracter a ser buscado
#v0 retorna um ponteiro para a ultima ocorreni de c em str - null(0) caso não exista

strrchr:
	
	#preparo a pilha e salvo registradores
	addi $sp,$sp,-12
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $t0,8($sp)
	
	#deixo como null(0) o ponteiro de retorno
	addi $v0,$zero,0
	
	#carrego o primeiro char da string e comparo 
	lb $t0,0($a0)
	bne $t0,$a1, loop_strrchr #caso nao sejam iguais vai direto para loop
	
	la $v0,($a0) #caso sejam iguais v0 recebe o primeiro endereço
	
	
loop_strrchr:
	addi $a0,$a0,1 #atualiza o endereço da string
	
	lb $t0,0($a0) #carrego o char e comparo
	bne $t0,$a1, while_strrchr #caso nao seja igual vai direto para a conferência do loop
	
	la $v0,($a0) #caso seja igual v0 recebe o endereço da ocorrência
	
while_strrchr:
	bne $t0,$zero,loop_strrchr #confere se o caracter atual é o terminador de string(0 numérico)
	
	
	#diminuo a pilha e resgato o valor antigo dos registradores
	lw $a0,0($sp)
	lw $a1,4($sp)
	lw $t0,8($sp)
	addi $sp,$sp,12
		

	#volto ao fluxo normal do programa
	jr $ra
	
