.data
	msg1: .asciiz "Insira o primeiro cateto: \n"
	msg2: .asciiz "Insira o segundo cateto \n"
	msg3: .asciiz "Hipotenusa: "
.text
	# "Insira o primeiro cateto"
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, $zero	# t0 =  1o cateto
	
	#  "Insira o segundo cateto"
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, $zero 	# t1 =  2o cateto
	
	# HIPOTENUSA (aproximada)
	mul $s0, $t0, $t0		# s0  = t0 ^ 2
	mul $s1, $t1, 2		# s1 = t1 * 2
	div $s2, $s0, $s1		# s2 = s0 / s1
	add $s3, $s2, $t1		# s3 = s2 + t1
	
	# Exibe a hipotenusa
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	add $a0, $zero, $s3
	syscall

# Pausa
Exit:
	li $v0, 5
	syscall	 