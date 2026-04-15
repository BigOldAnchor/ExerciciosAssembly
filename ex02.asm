.data
	msg1: .asciiz "Insira a quantidade de camisas pequenas: \n"
	msg2: .asciiz "Insira a quantidade de camisas médias: \n"
	msg3: .asciiz "Insira a quantidade de camisas grandes: \n"
	msg4: .asciiz "Arrecadação total: \n"
.text
Main: 
	# Lê a quantidade de camisas pequenas 
	li $v0, 4				
	la $a0, msg1			
	syscall				
	li $v0, 5 				
	syscall
	add $t0, $v0, $zero	# t0 = quantidade inserida
	
	# Lê a quantidade de camisas médias 
	li $v0, 4				
	la $a0, msg2			
	syscall				
	li $v0, 5 				
	syscall
	add $t1, $v0, $zero	# t1 = quantidade inserida 
	
	# Lê a quantidade de camisas grandes 
	li $v0, 4				
	la $a0, msg3			
	syscall				
	li $v0, 5 				
	syscall
	add $t3, $v0, $zero	# t2 = quantidade inserida
	
	mul $s0, $t0, 10	# s0 = t0 * 10
	mul $s1, $t1, 12	# s1 = t1 * 12
	mul $s2, $t2, 15	# s2 = t2 * 15
	
	add $t4, $s0, $s1 	# t4 = s0 + s1
	add $t5, $t4, $s2	# t5 = t4 + s2
	
	#Exibe o resultado
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 1
	add $a0, $zero, $t5
	syscall

# Pausa
Exit:
	li $v0, 5
	syscall
	
	
	
	