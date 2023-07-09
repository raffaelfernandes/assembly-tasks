.data
	mensagem: .asciiz "Digite um número para descobrir a soma de todos os números primos até ele: "
	output: .ascii "A soma de todos os números primos até o valor desejado é: "

.text
	# O desafio consiste em, dado um número inteiro digitado pelo usuário, o programa deve imprimir a soma de todos
	# os números de 0 até o número lido (incluso) que são primos. Por exemplo, 10 => 2 + 3 + 5 + 7 = 17.

	#print message
	li $v0, 4
	la $a0, mensagem
	syscall
	
	#read integer
	li $v0, 5
	syscall
	
	move $t0, $v0 #número
	li $t1, 0 #soma
	li $t2, 2 #iterador para todos os números
	li $t6, 2 #valor fixo 2
	li $t7, 1 #valor fixo 1
	
soma_primos:
	li $t3, 2 #iterador para cada número
	bgt $t2, $t0, fim
	
	div $t2, $t6
	mflo $t4 #limite máximo da iteração de cada número
	testa_primo:
		beq $t2, $t6, eh_primo
		ble $t2, $t7, menor
		bgt $t3, $t4, eh_primo
		div $t2, $t3
		mfhi $t5 #guarda o resto da divisão
		beq $t5, $zero, nao_eh_primo
		addi $t3, $t3, 1
		j testa_primo
	menor:
		addi $t2, $t2, 1
		j soma_primos
	eh_primo:
		add $t1, $t1, $t2
		add $t2, $t2, 1
		j soma_primos
	nao_eh_primo:
		add $t2, $t2, 1
		j soma_primos
	fim:
		#print output
		li $v0, 4
		la $a0, output
		syscall
		
		#print integer
		li $v0, 1
		move $a0, $t1
		syscall
		
	
		
		
		
		
	
	
