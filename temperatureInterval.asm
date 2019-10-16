.data
	str0:	.asciiz "Digite o valor de s0: " 	#s0	
	str1:	.asciiz "O valor de s1 é: "		#s1
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
      	
      	#Checar se s0 está entre 20 e 40
        slti  $t3, $s0, 20                 
	bne  $t3, $zero, foraDoIntervalo            
	slti $t3, $s0, 40     
	beq  $t3, $zero, foraDoIntervalo
	
	#Colocar 1 em s1 (s0 está no intervalo)
	li $s1, 1
	j result
	
            
	
foraDoIntervalo:
	li $s1, 0
	j result

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