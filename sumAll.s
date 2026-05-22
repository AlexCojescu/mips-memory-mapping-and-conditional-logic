.data
    prompt:     .asciiz "Please enter a number: "
    even_msg:   .asciiz "Sum of even numbers is: "
    odd_msg:    .asciiz "Sum of odd numbers is: "
    newline:    .asciiz "\n"

.text
main:
    # Register Mapping:
    # $s0 = even_sum
    # $s1 = odd_sum
    # $t0 = user input (x)
    
    li $s0, 0  
    li $s1, 0

loop:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0       # $t0 = x

    beq $t0, $zero, print_results

    sra $t1, $t0, 1     # $t1 = x >> 1 (Arithmetic shift to handle negatives)
    sll $t1, $t1, 1     # $t1 = $t1 << 1
    
    beq $t0, $t1, is_even

is_odd:
    add $s1, $s1, $t0   # odd_sum += x
    j loop

is_even:
    add $s0, $s0, $t0   # even_sum += x
    j loop

print_results:
    li $v0, 4
    la $a0, even_msg
    syscall

    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, odd_msg
    syscall

    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall