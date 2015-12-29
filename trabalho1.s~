.section .data

mensagem_begin: .asciz "\nPrograma Iniciado: Multiplicação de Matrizes\n"

mensagem_valor_m: .asciz "Digite o valor de de M: \n"
mensagem_valor_n: .asciz "Digite o valor de de N: \n"
mensagem_valor_p: .asciz "Digite o valor de de P: \n"
mensagem_matriz_a: .asciz "Matriz A: (%d x %d)\n"
mensagem_matriz_b: .asciz "Matriz B: (%d x %d)\n"
mensagem_teste: .asciz "Matriz preenchida\n " #teste
mostra2: .asciz "%d\n" #teste

mensagem_elemento_a: .asciz "\nElemento (A): " 
mensagem_elemento_b: .asciz "\nElemento (B): "

debug: .asciz "ecx: %d" #teste

matriz_a: .space 24
matriz_b: .space 48
matriz_c: .space 16

valor_m: .int 0
valor_n: .int 0
valor_p: .int 0

num_aux: .int 0

formato1: .asciz "%d"

.section .text
.globl _start

_start:
	pushl $mensagem_begin
	call printf

	pushl $mensagem_valor_m
	call printf
	pushl $valor_m
	pushl $formato1
	call  scanf

	pushl $mensagem_valor_n
	call printf
	pushl $valor_n
	pushl $formato1
	call  scanf

	pushl $mensagem_valor_p
	call printf
	pushl $valor_p
	pushl $formato1
	call  scanf
	
	pushl valor_n	
	pushl valor_m
	pushl $mensagem_matriz_a
	call printf
		
	pushl valor_p
	pushl valor_n
	pushl $mensagem_matriz_b
	call printf

calculaQtdeElementosA:
	addl $16, %esp	
	movl $0, %ebx # apenas para limpar antes
	movl $0, %eax
	movl $0, %ecx
	movl $0, %edi

	movl valor_m, %eax
	movl valor_n, %ebx
	mull %ebx
	movl %eax,%ecx	
	movl $0, %eax
	addl $16,%esp # limpa a pilha
		
	movl $matriz_a, %edi
	movl $0, %ebx

escritaA:	
	incl %ebx
 	pushl %edi
	pushl %ecx
	pushl %ebx
		
	pushl $mensagem_elemento_a
	call printf
	pushl $num_aux
	pushl $formato1
	call scanf		
	addl $12,%esp

	popl %ebx
	popl %ecx
	popl %edi	
	
	movl num_aux, %eax
	movl %eax, (%edi)
	addl $4, %edi
	loop escritaA

calculaQtdeElementosB:
	addl $16, %esp	
	movl $0, %ebx
	movl $0, %eax
	movl $0, %ecx
	movl $0, %edi

	movl valor_n, %eax
	movl valor_p, %ebx
	mull %ebx
	movl %eax,%ecx	
	movl $0, %eax
	addl $16,%esp
		
	movl $matriz_b, %edi
	movl $0, %ebx

escritaB:	
	incl %ebx
 	pushl %edi
	pushl %ecx
	pushl %ebx
		
	pushl $mensagem_elemento_b
	call printf
	pushl $num_aux
	pushl $formato1
	call scanf	
	addl $12,%esp

	popl %ebx
	popl %ecx
	popl %edi	
	
	movl num_aux, %eax
	movl %eax, (%edi)
	addl $4, %edi
	loop escritaB

mostravetA:
	popl %edi
	popl %ecx
	pushl $mensagem_teste
	call printf
	addl $4, %esp
	movl $6, %ecx #tamanho está na manual
	movl $matriz_a, %edi

mostranumA:
	movl (%edi), %ebx
	addl $4, %edi
	pushl %edi
	pushl %ecx
	pushl %ebx
	pushl $mostra2

	call printf
	addl $8, %esp

	popl %ecx
	popl %edi
	loop mostranumA

mostravetB:
	popl %edi
	popl %ecx
	pushl $mensagem_teste
	call printf
	addl $4, %esp
	movl $12, %ecx #tamanho está na manual
	movl $matriz_b, %edi

mostranumB:
	movl (%edi), %ebx
	addl $4, %edi
	pushl %edi
	pushl %ecx
	pushl %ebx
	pushl $mostra2

	call printf
	addl $8, %esp

	popl %ecx
	popl %edi
	loop mostranumB
		
fim:
	pushl $0
	call exit
