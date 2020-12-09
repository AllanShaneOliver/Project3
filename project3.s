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
