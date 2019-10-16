.data
	str0:	.asciiz "Digite um valor: " 		#x = s0	
	str1:	.asciiz "O valor da raiz é: "		#r = s1
.text
.globl main

main:
	#Imprimir str0 e Receber o valor de s0
        li $v0, 4
        la $a0, str0
        syscall        
       
        li $v0, 5
        syscall
        move $s0, $v0   
        
        #Declarar valores
        li $s1, 2	#r = s1
        li $s2, 2	#d = s2 
        li $s3, 4	#s = s3
        li $s4, 1	#t = s4
        
        j loop       
      	
      	
loop:
	bne $s4, 1, result	
	#instruções
	addi $s1, $s1, 1
	addi $s2, $s2, 2
	addi $t0, $s2, 1
	add $s3, $s3, $t0
	#se s > x
	slt $t1, $s3, $s0
	beq $t1, $zero, se
	#senão
	slt $t1, $s3, $s0
	bne $t1, $zero, senao

se: li $s4, 0
j loop
senao: li $s4, 1	
j loop


result:
	#Imprimir o valor de s1
	li $v0, 4
        la $a0, str1        
        syscall           
        li $v0, 1
    	move $a0, $s1
    	syscall
    	
    	j fim    
          
fim:
        li $v0, 10
        syscall