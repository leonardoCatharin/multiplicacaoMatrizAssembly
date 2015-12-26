.section .data

mensagem_begin: .asciz "\nPrograma Iniciado: Multiplicação de Matrizes\n"

mensagem_valor_m: .asciz "Digite o valor de de M: \n"
mensagem_valor_n: .asciz "Digite o valor de de N: \n"
mensagem_valor_p: .asciz "Digite o valor de de P: \n"
mensagem_matriz_a: .asciz "Matriz A: (%d x %d)\n"
mensagem_matriz_b: .asciz "Matriz B: (%d x %d)\n"
mensagem_teste: .asciz "Matriz preenchida\n "
mostra2: .asciz "%d\n"

mensagem_elemento_a: .asciz "\nElemento (A): " 
mensagem_elemento_b: .asciz "\nElemento (B): "


matriz_a: .space 900
matriz_b: .space 900
matriz_c: .space 900

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
	movl $0, %ebx # apenas para limpar antes
	movl $0, %eax
	movl $0, %ecx
	movl $0, %edi

	movl valor_m, %eax
	movl valor_n, %ebx
	mull %ebx
	pushl %eax
	movl $0,%ecx 
	movl $0, %ebx
	addl %eax,%ecx
	movl $0, %eax

escritaA:
	movl %ecx, %ebx
	pushl $mensagem_elemento_a
	call printf
	pushl $num_aux
	pushl $formato1
	call scanf
	movl num_aux, %eax	
	movl $matriz_a, %edi
	movl %ebx, (%edi)
	addl $4, %edi
	movl %ebx,%ecx
	loop escritaA
	
calculaQtdeElementosB:
	movl $0, %ebx
	movl $0, %eax
	movl $0, %ecx
	movl $0, %esi

	movl valor_n, %eax
	movl valor_p, %ebx
	mull %ebx
	pushl %eax
	movl $0,%ecx 
	movl $0, %ebx
	addl %eax,%ecx
	movl $0, %eax

escritaB:
	movl %ecx, %ebx
	pushl $mensagem_elemento_b
	call printf
	pushl $num_aux
	pushl $formato1
	call scanf
	movl num_aux, %eax	
	movl $matriz_b, %esi
	movl %ebx, (%esi)
	addl $4, %esi
	movl %ebx,%ecx
	loop escritaB

	addl $16, %esp # descarta os elementos empilhados	

fim:
	pushl $0
	call exit

