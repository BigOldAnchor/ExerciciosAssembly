.data
	msg1: .asciiz "Insira o primeiro valor: \n"
	msg2: .asciiz "Resultado: "
.text
	# "Insira o primeiro valor"
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, $zero	# t0 =  valor
	
	rem $s0, $t0, 2 		# s0 = t0 % 2
	
	beq $s0, 0, SePar 	# if (s0 == 0)
	add $s1, $t0, 8		# s1 = t0 + 8
	j Exit				# Pula pra saída se a condição não for verdadeira
	
	SePar:
		add $s1, $t0, 5	# s1 = t0 + 5
	
	# Exibe o resultado
	Exit:
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 1
		add $a0, $zero, $s1
		syscall