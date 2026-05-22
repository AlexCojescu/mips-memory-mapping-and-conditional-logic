.data
    n:      .word 25
    str1:   .asciiz "Less than\n"
    str2:   .asciiz "Less than or equal to\n"
    str3:   .asciiz "Greater than\n"
    str4:   .asciiz "Greater than or equal to\n"

.text
main:
    # Step 4: Read integer
    li $v0, 5          
    syscall            
    move $t0, $v0      
    lw $t1, n          

    # --- STEPS 5 & 6 (COMMENTED OUT AS PER INSTRUCTIONS) ---
    # slt $t2, $t0, $t1  
    # beq $t2, $0, GTE   
    # li $v0, 4
    # la $a0, str1
    # syscall
    # j end              
# GTE:
    # li $v0, 4
    # la $a0, str4
    # syscall

    # --- STEPS 7 & 8 (ACTIVE CODE) ---
    # Step 7: Compare if input > n
    slt $t2, $t1, $t0  # If 25 < input, then input is Greater Than 25
    beq $t2, $0, LTE   # If $t2 is 0, it means input is NOT > n, so go to Less Than or Equal
    
    # Print "Greater than"
    li $v0, 4
    la $a0, str3
    syscall
    j end

LTE:
    # Step 8: Print "Less than or equal to"
    li $v0, 4
    la $a0, str2
    syscall

end:
    li $v0, 10         # Exit - THIS MUST BE THE LAST THING THAT RUNS
    syscall