.section .data

mensagem_begin: .asciz "\nPrograma Iniciado: Multiplicação de duas matrizes\n"

mensagem_valor_m: .asciz "\nDigite o valor de de M: "
mensagem_valor_n: .asciz "\nDigite o valor de de N: "
mensagem_valor_p: .asciz "\nDigite o valor de de P: "
mensagem_matriz_a: .asciz "\nMatriz A: (%d x %d)\n"
mensagem_matriz_b: .asciz "Matriz B: (%d x %d)\n"

mensagem_matriz_preenchida_a: .asciz "Matriz preenchida (A)\n "
mensagem_matriz_preenchida_b: .asciz "Matriz preenchida (B)\n "
mostra_elemento: .asciz "%d\n"

mensagem_elemento_a: .asciz "\nElemento (A): " 
mensagem_elemento_b: .asciz "\nElemento (B): "

matriz_a: .space 900
	tam_matriz_a: .int 0
matriz_b: .space 900
	tam_matriz_b: .int 0
	salto_matriz_b: .int 0
matriz_c: .space 900
	acumulador: .int 0

valor_m: .int 0
valor_n: .int 0
valor_p: .int 0

num_aux: .int 0 #usado para repassar o valor no preenchimento das matrizes

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
	addl $16, %esp #volta o ponteiro da pilha para o início
	movl $0, %ebx #limpeza dos registradores
	movl $0, %eax
	movl $0, %ecx
	movl $0, %edi

	movl valor_m, %eax
	movl valor_n, %ebx
	mull %ebx
	movl $tam_matriz_a, %edx
	movl %eax, (%edx)
	movl %eax,%ecx	
	movl $0, %eax
	addl $16,%esp
		
	movl $matriz_a, %edi
	movl $0, %ebx
	movl $0, %edx

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
	movl $tam_matriz_b, %edx
	movl %eax, (%edx)
	movl %eax,%ecx	
	movl $0, %eax
	addl $16,%esp
		
	movl $matriz_b, %edi
	movl $0, %ebx
	movl $0, %edx

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
	pushl $mensagem_matriz_preenchida_a
	call printf
	addl $4, %esp
	movl tam_matriz_a, %ecx
	movl $matriz_a, %edi

mostranumA:
	movl (%edi), %ebx
	addl $4, %edi
	pushl %edi
	pushl %ecx
	pushl %ebx
	pushl $mostra_elemento

	call printf
	addl $8, %esp

	popl %ecx
	popl %edi
	loop mostranumA

mostravetB:
	popl %edi
	popl %ecx
	pushl $mensagem_matriz_preenchida_b
	call printf
	addl $4, %esp
	movl tam_matriz_b, %ecx
	movl $matriz_b, %edi

mostranumB:
	movl (%edi), %ebx
	addl $4, %edi
	pushl %edi
	pushl %ecx
	pushl %ebx
	pushl $mostra_elemento

	call printf
	addl $8, %esp

	popl %ecx
	popl %edi
	loop mostranumB

valor_loop:
	movl valor_p, %eax
	movl $4, %ebx
	mull %ebx
	movl $salto_matriz_b, %edx
	movl %eax, (%edx)

	movl $matriz_a, %edi
	movl $matriz_b, %esi
	movl $matriz_c,%ebp

	movl valor_m, %ecx

multiplicacao:
	pushl %ecx

	movl (%edi),%eax 
	movl (%esi),%ebx	
	mull %ebx
	movl $acumulador, %ebx
	addl %eax, (%ebx)

	addl $4, %edi
	addl salto_matriz_b, %esi
	
	popl %ecx
	loop multiplicacao

escritaC:
	pushl acumulador
	pushl $mostra_elemento
	call printf

	movl acumulador, %eax
	movl %eax, (%ebp)
	addl $4, %ebp
	movl $0, %eax	
fim:
	pushl $0
	call exit
