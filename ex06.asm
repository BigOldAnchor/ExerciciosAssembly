.data
	msg1: .asciiz "Insira o primeiro valor: \n"
	msg2: .asciiz "Insira o segundo valor \n"
	msg3: .asciiz "Resultado: "
.text
	# "Insira o primeiro valor"
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, $zero	# t0 =  1o valor
	
	#  "Insira o segundo valor"
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, $zero 	# t1 =  2o valor
	
	beq $t0 , $t1, Se 		# if (t0 == t1) 
	mul $s0, $t0, $t1
	j Exit 				# Pula pra saída se a condição não for verdadeira
	Se:
		add $s0, $t0, $t1
		
	# Exibe o resultado
	Exit:
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 1
		add $a0, $zero, $s0
		syscall

	  
