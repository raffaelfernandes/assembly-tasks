.data
	leInt: .asciiz "Digite o primeiro valor: "
	leInt2: .asciiz "Digite o segundo valor: "
	res: .asciiz "Média = "

.text
	li $v0, 4
	la $a0, leInt
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, leInt2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $t2, 2
	
	add $t3, $t0, $t1
	div $t3, $t2
	
	mflo $t4
	
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	