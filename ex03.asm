.data 
	msg1: .asciiz "Insira as horas trabalhadas: \n"
	msg2: .asciiz "Insira as horas EXTRAS trabalhadas: \n"
	msg3: .asciiz "Insira o percentual de desconto do salário: \n"
	msg4: .asciiz "\nSalário bruto: "
	msg5: .asciiz "\nSalário líquido: "
.text
Main: 
	# "Insira as horas trabalhadas 
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, $zero	# t0 =  Horas trabalhadas
	
	# "Insira as horas EXTRAS trabalhadas
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, $zero 	# t1 =  Horas EXTRAS trabalhadas
	
	# "Insira o percentual de desconto do salário"
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, $zero 	# t1 =  Percentual de desconto
	
	# SALÁRIO BRUTO
	mul $s0, $t0, 10 		#  s0 = t0 * 10
	mul $s1, $t1, 15		# s1 = s2 * 15
	add $s2, $s0, $s1		# s2 = s0 + s1
	
	# SALÁRIO LÍQUIDO
	mul $s3, $s2, $t2 		# s3 = s2 * t2
	div $s4, $s3, 100 		# s4 = s3 / 100
	sub $s5, $s2, $s4		# s5 = s2 - s4
	
	# Exibe o salário bruto
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 1
	add $a0, $zero, $s2
	syscall

	# Exibe o salário líquido
	li $v0, 4
	la $a0, msg5
	syscall
	li $v0, 1
	add $a0, $zero, $s5
	syscall
	
# Pausa
Exit:
	li $v0, 5
	syscall	 