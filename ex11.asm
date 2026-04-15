.data
	msg1: .asciiz "Insira o número "
	msg2: .asciiz "\nNúmeros entre 0 e 25:  "
	msg3: .asciiz "\nNúmeros entre 26 e 50:  "
	msg4: .asciiz "\nNúmeros entre 51 e 75:  "
	msg5: .asciiz "\nNúmeros entre 76 e 100:  "
.text 
	# CONTADORES
	li $s0, 0
	li $s1, 0
	li $s2, 0
	li $s3, 0
	
	li $t1, -1		# Valor que será comparado sempre que um novo ciclo começar (para que um número negativo seja o fim)
	Enquanto:
		ble  $t0,$t1, FimEnquanto # if (t0 < = t1)
		li $v0, 4
		la $a0, msg1
		syscall
		li $v0, 5
		syscall
		add $t0, $v0, $zero 	# t0 =  valor
		bge $t0, 76, Se100	# if (t0 >= 76)
		bge $t0, 51, Se75		# if (t0 >= 51)
		bge $t0, 26, Se50		# if (t0 >= 26)
		bge $t0, 0, Se25		# if (t0 >= 0)
		j Enquanto
	
	Se25:
		ble $t0, 25, Se025 	# and (t0 <= 25
		j Enquanto
	
	Se025:
		addi $s0, $s0, 1		# somador para os números de 0-25
		j Enquanto
	
	Se50:					# and (t0 <= 50)
		ble $t0, 50, Se2650
		j Enquanto
	
	Se2650:
		addi $s1, $s1, 1		# somador para os números de 26-50
		j Enquanto

	Se75:					# and (t0 <= 75)
		ble $t0, 75, Se5175
		j Enquanto
	
	Se5175:					
		addi $s2, $s2, 1		# somador para os números de 51-75
		j Enquanto
	
	Se100:					# and (t0 <= 100)
		ble $t0, 100, Se76100
		j Enquanto
	
	Se76100:				# somador para os números de 76-100
		addi $s3, $s3, 1
		j Enquanto
		
	FimEnquanto:
		j Exit

	# Exibe o resultado
	Exit: 
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 1
		add $a0, $zero, $s0
		syscall	
		li $v0, 4
		la $a0, msg3
		syscall
		li $v0, 1
		add $a0, $zero, $s1
		syscall
		li $v0, 4
		la $a0, msg4
		syscall
		li $v0, 1
		add $a0, $zero, $s2
		syscall
		li $v0, 4
		la $a0, msg5
		syscall
		li $v0, 1
		add $a0, $zero, $s3
		syscall
	