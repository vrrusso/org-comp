#fibbonaci recursivo
#
#int fib(int n){
#	if( n<2 )
#		return 1;
#	return fib(n-1)+fib(n-2);
#}
#int main(){
#
#	int n;
#	scanf(n);
#	printf("%d",fib(n));
#}

.data
	.align 0
str_comeco: 	.asciiz "Digite n:"
str_resposta:	.asciiz "fib("
str_parenteses:	.asciiz ")= "
	.align 2

.text
	.globl main
main:
	#imprime a string de comeco
	addi $v0,$zero,4
	la $a0,str_comeco
	syscall
	
	#le o numero n
	addi $v0,$zero,5
	syscall
	
	#move n para s0
	addu $s0,$zero,$v0
	
	#copia n para a0
	addu $a0,$zero,$s0
	
	jal fib
	
	addu $t0,$zero,$v0
	
	#imprime a string final
	addi $v0,$zero,4
	la $a0,str_resposta
	syscall
	
	#imprime n
	addi $v0,$zero,1
	addu $a0,$zero,$s0
	syscall
	
	#imprime o )=
	addi $v0,$zero,4
	la $a0,str_parenteses
	syscall
	
	#imprime o resultado
	addi $v0,$zero,1
	addu $a0,$zero,$t0
	syscall
		
				
	li $v0, 10			# atribui 10 para $v0. Codigo para exit (termina programa)
	syscall	
				
fib: #funcao recursiva que calcula fatorial
	
	#empilha
	addi $sp,$sp,-16
	sw $a0,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $ra,12($sp)
	
	#if(a0<2)
	addi $t0,$zero,2 #move para t0 o valor 2 para ser mais facil a comparacao
	slt $t1,$a0,$t0  # t1 = a0<2?1:0
	beq $t1,$zero,recursion
	
	#caso a0 seja menor que 2
	
	#seta o registrador de retornp(v0) para 1
	addi $v0,$zero,1
	
	#desimpliha
	lw $ra, 12($sp)
	lw $t1, 8($sp)
	lw $t0, 4($sp)
	lw $a0, 0($sp)
	addi $sp,$sp,16
	
	jr $ra
	
recursion:#caso a0 maior igual a 2 - afundar na recursao
	
	#a0--
	addi $a0,$a0,-1
	#fib(n-1)
	jal fib
	addu $t0,$zero,$v0 #move para t0 o resultado
	#a0--
	addi $a0,$a0,-1
	#fib(n-2)
	jal fib
	addu $t1,$zero,$v0 #move para t1 o resultado
	
	#salvo a soma no registrador de retorno(v0)
	add $v0,$t0,$t1
	
	#desimpliha a0
	lw $ra,12($sp)
	lw $t1, 8($sp)
	lw $t0, 4($sp)
	lw $a0, 0($sp)
	addi $sp,$sp,16
	
	jr $ra
	
	
		