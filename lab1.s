.data	
out_string: .asciiz "The result is:\n"	

.text

main:	
li $t0,1
li $t1,0
li $t2,10

loop_top:
bgt $t0, $t2,loop_end
addi$t3, $t0,1
mul $t4, $t0,$t3
add $t3,$t4,$zero
add $t1,$t1,$t3
addi $t0,1
b loop_top

loop_end:
li $v0,4
la $a0,out_string
syscall

li $v0,1
move $a0,$t1
syscall

li $v0,10
syscall