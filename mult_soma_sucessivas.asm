.data
	mensagem: .asciiz "Vamos multiplicar? Digite o primeiro fator: "
	mensagem2: .asciiz "Digite o segundo fator: "
	mensagem3: .asciiz "Produto = "
.text
	li $v0, 4
	la $a0, mensagem
	syscall
	
	#Guarda em t0 o primeiro fator
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, mensagem2
	syscall
	
	#Guarda em t1 o segundo fator
	li $v0, 5
	syscall
	move $t1, $v0
	
	#iterator
	li $t2, 0
	
	#soma
	li $t4, 0 
	
	bgt $t0, $t1, primeiroEhMaior
	
	#loop irá iterar t0 vezes
	while:
		beq $t2, $t0, final
		add $t4, $t4, $t1
		addi $t2, $t2, 1
		j while
	
	#faz um "swap" de valores nos registradores se o primeiro valor a ser digitado for maior que o segundo
	primeiroEhMaior:
		move $t3, $t1
		move $t1, $t0
		move $t0, $t3
		j while
	
	final:
		li $v0, 4
		la $a0, mensagem3
		syscall
		
		li $v0, 1
		add $a0, $t4, $zero
		syscall 
	