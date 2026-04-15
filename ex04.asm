.data
	msg1: .asciiz "Insira a base maior do trapézio: \n"
	msg2: .asciiz "Insira a base menor do trapézio: \n"
	msg3: .asciiz "Insira a altura: \n"
	msg4: .asciiz "Área do trapézio: \n"
.text
	# "Insira a base maior"
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, $zero	# t0 =  base maior
	
	# "Insira a base menor"
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, $zero 	# t1 =  base menor
	
	# "Insira a altura"
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, $zero 	# t1 =  altura
	
	# ÁREA DO TRAPÉZIO
	add $s0, $t0, $t1		# s0  = t0 + t1
	mul $s1, $s0, $t2		# s1 = s0 * t2
	div $s2, $s1, 2		# s2 = s1 / 2
	
	# Exibe o salário bruto
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 1
	add $a0, $zero, $s2
	syscall

# Pausa
Exit:
	li $v0, 5
	syscall	 