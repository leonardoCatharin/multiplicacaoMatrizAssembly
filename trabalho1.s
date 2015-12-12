.section .data

mensagem_begin: .asciz "\nPrograma Iniciado: Multiplicação de Matrizes\n"

mensagem_valor_m: .asciz "Digite o valor de de M: \n"
mensagem_valor_n: .asciz "Digite o valor de de N: \n"
mensagem_valor_p: .asciz "Digite o valor de de P: \n"

matriz_a: .asciz "Matriz A: (%d x %d)\n"
matriz_b: .asciz "Matriz B: (%d x %d)\n"

valor_m: .int 0
valor_n: .int 0
valor_p: .int 0

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
	pushl $matriz_a
	call printf
		
	pushl valor_p
	pushl valor_n
	pushl $matriz_b
	call printf

_fim:
	pushl $0
	call exit



