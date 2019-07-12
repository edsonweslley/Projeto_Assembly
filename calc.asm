.data
	inicial:		.asciz "\n\n== Ultimate Calculadora ==\n\n Operando 1 > "
	operandoATxt:		asciz "\n\n Operando 2 > "
	operadorTxt:		.asciz "\n (+) Adicao\n (-) Subtracao\n (*) Multiplicacao\n (/) Divisao\n Operador > "	

	creditos:		.ascii "Calculadora criada para a disciplina de Organizacao e Arquitetura de Computadores (OAC).\nGrupo: Edson Weslley        (edsonweslley)\n       Euclides Ramos       (EuclidesRamos)\n       Gabriel Guimaraes    (gabrieeeuu)\n       João Pedro de Barros (joaobb)\n       Rafael Dantas        (Rafaeldsa)\n"

	adicaoMensagem:		.asciz "\nResultado da adicao = "
	subtracaoMensagem:	.asciz "\nResultado da subtracao = "
	multiplicacaoMensagem:	.asciz "\nResultado da multiplicacao = "
	divisaoMensagem:	.asciz "\nResultado da divisao = "

.text 

	li a7, 4			# Define o servico a ser realizado como print de string
	la a0, creditos			# Define que os creditos do programa serao imressos na tela
	ecall				# Mostra a os creditos da criacao do programa

_start:
	li a7, 4			# Define o servico a ser realizado como print de string
	la a0, inicial			# Define que a mensagem inicial sera imressa na tela
	ecall				# Mostra a mensagem de introducao da calculadora
	
	#Leitura dos operandos begin ===
    	li a7, 5 			# Define o servico a ser realizado como leitura de inteiros    
   	 ecall 				# Realiza a leitura do primeiro operando e o coloca em a0
    	mv t1,a0			# Move o inteiro recebido para t0
    
    
    li a7, 4				# Define o servico a ser realizado como print de string
	la a0, operadorTxt		# Define que a mensagem de opcoes para operacao sera imressa na tela
	ecall				# Realiza a impressao das opcoes para operacao

	li a7, 12			# Define o servico a ser realizado como entrada de um char
	ecall				# Realiza a entrada do char
	mv s3, a0			# Move o char recebido para s3
    
    li a7, 4				# Define o servico a ser realizado como print de string
	la a0, operandoATxt		# Define que a mensagem inicial sera imressa na tela
	ecall
    
    li a7, 5 				# Define o servico a ser realizado como leitura de inteiros
    ecall				# Realiza a leitura do segundo operando e o coloca em a0
    mv t2,a0				# Move o inteiro recebido para t1
	#Leitura dps operandos end ===
	
	addi s4, zero, 0x2b		# s4 agora contem a representacao de "+" em ascii
	beq s3, s4, adicao		# Compara o char inserido anteriormente com "+", caso iguais, a operacao de adicao sera realizada
	
	addi s4, zero, 0x2d		# s4 agora contem a representacao de "-" em ascii
	beq s3, s4, subtracao		# Compara o char inserido anteriormente com "-", caso iguais, a operacao de adicao sera realizada
	
	addi s4, zero, 0x2a		# s4 agora contem a representacao de "*" em ascii
	beq s3, s4, multiplicacao	# Compara o char inserido anteriormente com "*", caso iguais, a operacao de adicao sera realizada

	addi s4, zero, 0x2f		# s4 agora contem a representacao de "/" em ascii
	beq s3, s4, divisao 		# Compara o char inserido anteriormente com "/", caso iguais, a operacao de adicao sera realizada
	
	j _start			# Caso a entrada nao seja nenhuma das esperadas o programa retorna para o inicio

adicao: 
	add s2,t1,t2			# Realiza a operacao de soma
	la a0, adicaoMensagem
	j imprimeResultado

subtracao:
	sub s2,t1,t2			# Realiza a operacao de subtração
	la a0, subtracaoMensagem
	j imprimeResultado
    
multiplicacao:
	mul s2,t1,t2			# Realiza a operacao de multiplicacao
	la a0, multiplicacaoMensagem
	j imprimeResultado
   	
divisao:
	div s2,t1,t2			# Realiza a operacao de divisao
	la a0, divisaoMensagem
	j imprimeResultado
	
imprimeResultado:
	li a7, 4			# Define o servico a ser realizado como impressao de string
	ecall				# Realiza a impressao 
	
	li a7, 1			# Define o servico a ser realizado como impressao de inteiros
	add a0, s2, zero    		# Adiciona o resultado da operacao realizada no registrador de saida
    ecall				# Realiza a escrita do resultado da operacao no terminal
    
    j _start				# Retorna para o inicio do programa
    
fechar:					# Finaliza o programa
	li a7, 10
	ecall
