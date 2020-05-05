/**

 Implemente em Assembly MIPS um programa que implemente a função strrchr( ) existente na linguagem C. Esta função tem a seguinte prototipação:
   char *strrchr(char *s, int c) e tem por objetivo retornar um ponteiro para a última ocorrência do caractere c na string s; ou NULL (zero) caso o caractere c
    não seja encontrado em s. No programa principal deve ser lido a string e o caractere e imprimir o resultado da função strrchr.

A sua solução deve seguir a especificação, estar correta e o código seguir as boas práticas de programação citadas em sala de aula, relativas à manipulação de
 pilha, identação, nomes de rótulos, espaçamento entre linhas, comentários e demais questões relativas à legibilidade e qualidade dos códigos.
 */
#include<stdio.h>
#include<stdlib.h>

char * strrchri(char *str, int c){
    char * r = NULL;
    char * aux = str;
    if(*aux == c)
        r = aux; 
    do{
        aux+=1;
        if(*aux == c)
            r = aux;
    }while(*aux != '\0');
    return r;
}


int main(void){
    char str[300];
    char c;
    scanf(" %s %c",str,&c);
    printf("\n%s\n",strrchri(str,c));
    printf("%ld",strrchri(str,c)-str);

}