.data
	msg1: .asciiz "Insira a altura da pessoa: \n"
	msg2: .asciiz "Altura da maior pessoa: \n"
	msg3: .asciiz "\nAltura da menor pessoa: \n"
.text 
	li $t1, 15		# Contador
	li $s2, 1000	# s2 = 1000 (Inalcançavel e placeholder, para que o primeiro valor seja imediatamente atribuido)
	Enquanto:
		bge $s0, $t1, FimEnquanto		# if (s0 >= 15): break
		# "Insira a altura da pessoa
		li $v0, 4
		la $a0, msg1
		syscall
		li $v0, 5
		syscall
		add $t0, $v0, $zero 	# t0 =  valor atual
		addi $s0, $s0, 1		# s0 += 1
		bgt $t0, $s1, SeMaior	# if (t0 > s1)
		blt $t0, $s2, SeMenor	# if (t0 < s2)
		j Enquanto
	
	SeMaior:	# Substituí o valor de s1 se t0 atual for maior
		sub $s1, $s1, $s1 		# zera s1
		add $s1, $t0, $zero 	# s1 = t0 
		j Enquanto 		# Volta para o loop 
	
	SeMenor:	# Substituí o valor de s2 se t0 atual for menor
		sub $s2, $s2, $s2		# zera s2
		add $s2, $t0, $zero	# s2 = t0
		j Enquanto		# Volta para o loop 
	
	FimEnquanto:
		j Exit
	
	# Exibe o resultado
	Exit: 
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 1
		add $a0, $zero, $s1
		syscall	
		li $v0, 4
		la $a0, msg3
		syscall
		li $v0, 1
		add $a0, $zero, $s2
		syscall	
		