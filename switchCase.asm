.data
	str0:	.asciiz "Digite o valor de i: " 	#s0
	str1:	.asciiz "Digite o valor de j: " 	#s1
	str2:	.asciiz "Digite o valor de g: " 	#s2
	str3:	.asciiz "Digite o valor de h: " 	#s3
	str4:	.asciiz "Digite o valor de k: " 	#s4
	str5:	.asciiz "O valor de f é: "		#s5
.text
.globl main

main:
	#Imprimir str0 e Receber o valor de i 
        li $v0, 4
        la $a0, str0
        syscall        
       
        li $v0, 5
        syscall
        move $s0, $v0
        
      	#Imprimir str1 e Receber o valor de j 
        li $v0, 4
        la $a0, str1
        syscall        
       
        li $v0, 5
        syscall
        move $s1, $v0   
        
       	#Imprimir str2 e Receber o valor de g
        li $v0, 4
        la $a0, str2
        syscall        
        
        li $v0, 5
        syscall
        move $s2, $v0
        
      	#Imprimir str3 e Receber o valor de h
        li $v0, 4
        la $a0, str3
        syscall        
       
        li $v0, 5
        syscall
        move $s3, $v0   
        
        #Imprimir str4 e Receber o valor de k
        li $v0, 4
        la $a0, str4
        syscall        
        
        li $v0, 5
        syscall
        move $s4, $v0  
        
        #Confere se K está no intervalo 0<=k<=3
	slt  $t3, $s4, $zero                 
	bne  $t3, $zero, fim            
	slti $t3, $s4, 4            
	beq  $t3, $zero, fim  
        
        j switch    
	
switch:		
	beq $s4, 0, L0
	beq $s4, 1, L1
	beq $s4, 2, L2
	beq $s4, 3, L3	
	
#Cases	
L0:	add $s5, $s0, $s1   
j result     
L1:     add $s5, $s2, $s3     
j result    
L2:     sub $s5, $s2, $s3  
j result
L3:     sub $s5, $s0, $s3
j result

result:	
	#Imprime o valor de f
	li $v0, 4
        la $a0, str5        
        syscall           
        li $v0, 1
    	move $a0, $s5
    	syscall
    	
    	j fim  
          
fim:
        li $v0, 10
        syscall