.data
	inicial:				.asciz "\n== Ultimate Calculadora==\n (+) Adicao\n (-) Subtracao\n (*) Multiplicacao\n (/) Divisao\n"
	
	operador:				.space 1
		
	adicaoMensagem:			.asciz "Resultado da adicao = "
	subtracaoMensagem:		.asciz "Resultado da subtracao = "
	multiplicacaoMensagem:	.asciz "Resultado da multiplicacao = "
	divisaoMensagem:		.asciz "Resultado da divisao = "

.text 

_start:
	li a7, 4	# Define o servico a ser realizado como print de string
	la a0, inicial	# Define que a mensagem inicial sera imressa na tela
	ecall		#Mostra a mensagem de introducao da calculador
	
	#Leitura dos operandos begin
    li a7, 5 	# Define o servico a ser realizado como leitura de inteiros    
    ecall 		# Realiza a leitura do primeiro operando e o coloca em a0
    
    mv t0,a0	# Move o inteiro recebido para t0
    
    li a7, 5	# Define o servico a ser realizado como leitura de inteiros
    ecall		# Realiza a leitura do segundo operando e o coloca em a0
    
    mv t1,a0	# Move o inteiro recebido para t1
	#Leitura dps operandos end
	
	li a7, 4			# Define o servico a ser ralizado como impressao de string
	
	j adicao	
	
	
adicao: 
	add s2,t0,t1		# Realiza a operacao de soma
	la a0, adicaoMensagem
	j imprimeResultado

subtracao:
	sub s2,t0,t1		# Realiza a operacao de subtração
	la a0, subtracaoMensagem
	j imprimeResultado
    
multiplicacao:
	mul s2,t0,t1		# Realiza a operacao de multiplicacao
	la a0, multiplicacaoMensagem
	j imprimeResultado
   	
divisao:
	div s2,t0,t1		# Realiza a operacao de divisao
	la a0, divisaoMensagem
	j imprimeResultado
	
imprimeResultado:
	ecall
	
	li a7, 1			# Define o servico a ser realizado como impressao de inteiros
	add a0, s2, zero    # Adiciona o resultado da operacao realizada no registrador de saida
    ecall				# Realiza a escrita do inteiro no terminal
    
    j _start			# Retorna para o inicio do programa
    
fechar:					#Finaliza o programa
	li a7, 10
	ecall
