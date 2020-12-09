.data
list: .space 6 #can store 6 characters into a string named "list"
invalid: .asciiz "NaN\n"

.text
.globl main

main:
  li $s4, 0
  li $v0, 8 #reads strings into list string
  la $a0, list
  li $a1, 5 #input no more than 10 characters
  syscall

jal SubA

exit:
  li $v0, 10
  syscall

SubA:

  move $s2, $ra
  jal SubB
  move $ra, $s2
  jr $ra

SubB:

move $s0, $ra #1
begin:
  li $t2, 0 #$i=0;
  li $s5, 6 #exit condition - exit loop if at 10th character

loop:
    lb $t0, ($a0) #loads byte of user input into $t0
    addi $t2, $t2, 1 #add 1 after each iteration, i++;
    beq $s5, $t2, exitB #jump to afterloop after 10th character is reached
    addi $a0, $a0, 1
    jal SubC
    j loop

exitB:
  move $ra, $s0 #2
  jr $ra
