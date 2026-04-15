.data
	msg1: .asciiz "Insira o primeiro valor: \n"
	msg2: .asciiz "Insira o segundo valor \n"
	msg3: .asciiz "Insira um valor maior que 0 pro segundo valor. \n"
	msg4: .asciiz "Resultado da divisão: \n"
.text
	# "Insira o primeiro valor"
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, $zero	# t0 =  1o valor
	
	Enquanto:
		#  "Insira o segundo valor"
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 5
		syscall
		add $t1, $v0, $zero 	# t1 =  2o valor
		bgtz $t1, FimEnquanto # if (t > 0)
		li $v0, 4
		la $a0, msg3
		syscall
		j Enquanto
	
	FimEnquanto: 	# Se t1 for maior que zero, aplica a divisão
		div $s0, $t0, $t1	# s0 = t0 / t1
	
	# Exibe o resultado
	Exit:
		li $v0, 4
		la $a0, msg4
		syscall
		li $v0, 1
		add $a0, $zero, $s0
		syscall	   
		