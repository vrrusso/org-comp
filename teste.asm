.data
inteiro:  .word 8
    .align 0
string: .asciiz  "O numero é: "

   
    .text
    .globl main
   
    main:
   
    li $v0, 4
    la $a0, string
    syscall
   
    li $v0, 1
    la $a0, inteiro
    syscall
   
    li $v0, 10
    syscall