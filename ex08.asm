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
	
	bgtz $t0, SeMaior # if (t0 > 0)
	mul $s0, $t0, 3		# s0 = t0 * 3
	j Exit				# Pula pra saída se a condição não for verdadeira
	
	 SeMaior:			
		mul $s0, $t0, 2
	
	# Exibe o resultado
	Exit:
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 1
		add $a0, $zero, $s0
		syscall	   