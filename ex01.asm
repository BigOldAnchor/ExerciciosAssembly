.data 
	msg1: .asciiz "Insira uma medida do terreno: \n'"
	msg2: .asciiz "Área do terreno: \n"
	msg3: .asciiz " metros."
.text
Main: 
	# L� a primeira medida do terreno
	li $v0, 4				
	la $a0, msg1			
	syscall				
	li $v0, 5 				
	syscall
	add $t0, $v0, $zero	# t0 = 1a medida
	
	# L� a segunda medida do terreno
	li $v0, 4				
	la $a0, msg1			
	syscall				
	li $v0, 5 				
	syscall
	add $t1, $v0, $zero	# t1 = 2a medida
	
	mul $t2, $t0, $t1 # t2 = t0 * t1
	
	#Exibe o resultado
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	li $v0, 4
	la $a0, msg3
	syscall
	
# Pausa
Exit:
	li $v0, 5
	syscall
	