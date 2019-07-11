.text 
  
    li  a7, 5 	#lê um numero inteiro     
    ecall 	# faz essa chamada para ler o inteiro
    
    mv t0,a0	#move o inteiro que recebeu para t0
    
    li a6 , 5	#lê um numero inteiro
    ecall	#faz a chamada para leer o inteiro
    
    mv t1,a0	#move o inteiro que recebeu para t1
    
    add s2,t0,t1	# realiza a soma
    sub s3,t0,t1	# realiza a subtração
  
       