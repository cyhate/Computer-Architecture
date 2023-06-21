# Andreas


	.data

	out_string:.asciiz"\The result(F) is:\n"
	output_mess1:.asciiz"\Please give me x:\n"
	output_mess2:.asciiz"\Please give me y:\n"

	.text

main:

la $t1, output_mess1
la $t2, output_mess2 #display message on the screen for user to give x and y
syscall

li $s0, 0 # hold result(f) in s0
li $t3, $t1 # t3=x , hold x
li $t4, $t2 # t4=y,  hold y 


calculate_F(): #calculate result(f)

mult $s1, $t3, $t3  # $s1 =$t3*$t3
mult $s2, $s1, $t3  # $s2 =$s1*$t3 
mult $s3, $s2, $t3  # $s3 =$s2*$t3 
mult $s4, $s3, $t3  # $s4 =$s3*$t3 (x5)

mult $s5, $t4, $t4  # $s5 =$t4*$t4 (y2)

sub $s6, $s4, $t4  # $s6 =$s4 - $t4 (x5-y)
sub $s7, $s5, $t3  # $s7 =$s5 - $t3 (y2+x)

mult $s8, $s6, $s7  # $s8 =$s6*$s7 ((x5-y)* (y2+x))
mult $s9, $s8, $s8  # $s9 =$s8*$s8
mult $s10, $s9, $s8  # $s10 =$s9*$s8 ((x5-y)* (y2+x))3

addi $s0, $10, 9 # $s0 = $10+ 9 ((x5-y)* (y2+x))3 + 9

print_result(): #print result(f)

la $so, out_string #print $so 
syscall  # call system for print
