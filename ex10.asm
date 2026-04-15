.data 
	msg1: .asciiz "Insira o 1o valor: \n"
	msg2: .asciiz "Insira o 2o valor: \n"
	msg3: .asciiz "Resto da divisão: \n"
.text
Main:
	# Insira o 1o valor
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, $zero 	# t0 = 1o valor 
	
	# Insira o 1o valor
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, $zero 	# t1 = 2o valor
	bgt $t0, $t1, Se
	# Resto da divisão se o t1 for maior que t0
	div $s0, $t1, $t0 		# s0 = t1 / t0
	mul $s1, $t0, $s0 		# s1 = t0 * s0
	sub $s2, $t1, $s1		# s2 = t1 - s1
	j Exit
	
	Se:		# Resto da divisão se o t0 for maior que t1
		div $s0, $t0, $t1 		# s0 = t0 / t1
		mul $s1, $t1, $s0 		# s1 = t1 * s0
		sub $s2, $t0, $s1		# s2 = t0 - s1
	
	#	Exibe o resultado
	Exit:
		li $v0, 4
		la $a0, msg3
		syscall
		li $v0, 1
		add $a0, $zero, $s2
		syscall
	