.data
	leitura_reg: .asciiz "Digite um valor inteiro de 0 a 9: "
	erro_leitura: .asciiz "Entrada inválida. Digite um valor de 0 a 9: "
	leitura_msb_lsb: .asciiz "Digite um valor inteiro de 15 a 25: "
	erro_leitura_msb_lsb: .asciiz "Entrada inválida. Digite um valor inteiro entre 15 e 25"




.text

	.main:
	#Solicitação de leitura do registrador
	li $v0, 4
	la $a0, leitura_reg
	syscall

	#Ler um valor inteiro de 0 até 9
	ler_inteiro1:
	li $v0, 5
	syscall
	li $t0, 9
	li $t1, 0
	bgt $v0, $t0, leitura_incorreta
	blt $v0, $t1, leitura_incorreta
	#Passar qual é o registrador como argumento
	la $a0, $v0
	jal escolhe_reg
	#Salvar em s0 o valor do registrador escolhido
	la $s0, $v1
	j cont
	
	#Imprime mensagem de erro na leitura e solicita novamente
	leitura_incorreta:
	li $v0, 4
	la $a0, erro_leitura
	syscall
	j ler_inteiro1
	
	cont:
	#Solicitação de leitura dos bits mais e menos significativos
	ler_inteiro2:
	li $v0, 4
	la $a0, leitura_msb_lsb
	syscall
	li $t0, 25
	li $t1, 15
	bgt $v0, $t0, leitura_incorreta2
	blt $v0, $t1, leitura_incorreta2
	move $t8, $v0
	
	ler_inteiro3:
	li $v0, 4
	la $a0, leitura_msb_lsb
	syscall
	#li $t0, 25
	#li $t1, 15
	bgt $v0, $t0, leitura_incorreta3
	blt $v0, $t1, leitura_incorreta3
	move $t9, $v0
	j cont2
	
	leitura_incorreta2:
	li $v0, 4
	la $a0, erro_leitura_msb_lsb
	syscall
	j ler_inteiro2
	
	leitura_incorreta3:
	li $v0, 4
	la $a0, erro_leitura_msb_lsb
	syscall
	j ler_inteiro3
	
	cont2:
	#Compara os inteiros lidos (guardados em t8 e t9)
	#Salvar MSB em s1
	#Salvar LSB em s2
	bgt $t8, $t9, primeiroMaior
	move $s1, $t9
	move $s2, $t8
	#Salvei o MSB em s1 e o LSB em s2
	j cont3
	primeiroMaior:
		move $s1, $t8
		move $s2, $t9
		#Salvei o MSB em s1 e o LSB em s2
	cont3:
	srlv $s0, $s0, $s2
	
	
	
	.escolhe_reg:
	li $t0, $a0
	li $t1, 0
	
	beq $t0, $t1, fim0
	addi $t1, $t1, 1
	
	beq $t0, $t1, fim1
	addi $t1, $t1, 1
	
	beq $t0, $t1, fim2
	addi $t1, $t1, 1
	
	beq $t0, $t1, fim3
	addi $t1, $t1, 1
	
	beq $t0, $t1, fim4
	addi $t1, $t1, 1
	
	beq $t0, $t1, fim5
	addi $t1, $t1, 1
	
	beq $t0, $t1, fim6
	addi $t1, $t1, 1
	
	beq $t0, $t1, fim7
	addi $t1, $t1, 1
	
	beq $t0, $t1, fim8
	addi $t1, $t1, 1
	
	beq $t0, $t1, fim9
	
	fim0:
	la $v1, $t0
	jr $ra
	
	fim1:
	la $v1, $t1
	jr $ra
	
	fim2:
	la $v1, $t2
	jr $ra
	
	fim3:
	la $v1, $t3
	jr $ra
	
	fim4:
	la $v1, $t4
	jr $ra
	
	fim5:
	la $v1, $t5
	jr $ra
	
	fim6:
	la $v1, $t6
	jr $ra
	
	fim7:
	la $v1, $t7
	jr $ra
	
	fim8:
	la $v1, $t8
	jr $ra
	
	fim9:
	la $v1, $t9
	jr $ra
	
	