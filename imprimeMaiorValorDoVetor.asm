.data
	mensagem: .asciiz "Digite os 10 valores inteiros do vetor separados pela tecla enter: "
	mensagem2: .asciiz "O maior valor existente no vetor é "
	vetor:
		.align 2
		.space 40

.text
	li $v0, 4
	la $a0, mensagem
	syscall
	
	li $t1, 10 #limite da leitura
	move $t2, $zero #guarda os "índices" do vetor
	move $t0, $zero #iterador de leitura
	loop:
		beq $t0, $t1, acabaLeitura
		li $v0, 5
		syscall
		move $t3, $v0 #guarda o valor lido em $t3
		sw $t3, vetor($t2)
		addi $t2, $t2, 4
		addi $t0, $t0, 1
		j loop
	
	acabaLeitura:
		move $t2, $zero #guarda os "índices" do vetor
		move $t0, $zero #iterador de procura
		lw $t4, vetor($t2) #guarda o primeiro elemento do vetor
		addi $t2, $t2, 4
		novoLoop:
			beq $t0, $t1, impressaoRes
			lw $t3, vetor($t2)
			bgt $t3, $t4, mudaMaiorValor
			continue:
				addi $t2, $t2, 4
				addi $t0, $t0, 1
				j novoLoop
		mudaMaiorValor:
			move $t4, $t3
			j continue
	
	impressaoRes:
		li $v0, 4
		la $a0, mensagem2
		syscall
		
		li $v0, 1
		add $a0, $zero, $t4
		syscall
		
		