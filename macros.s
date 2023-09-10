# Macro to print a string (%x is the address of string)
.macro print_string(%x)
	li $v0, 4	# calls opcode
    	la $a0, %x	# loads address in $a0
    	syscall
.end_macro

# Macro to read a character and store in %x register
.macro read_char(%x)
	li $v0, 12	# calls opcode to read character
	syscall		# reads character
	move %x, $v0	# moves into desired register
.end_macro

# Macro to set registers %x, %y, %z as arguments
.macro arguments2(%x, %y)
	move $a0, %x	# argument %x in $a0
	move $a1, %y	# argument %y in $a1
.end_macro

# Macro to set registers %x, %y, %z as arguments
.macro arguments3(%x, %y, %z)
	move $a0, %x	# argument %x in $a0
	move $a1, %y	# argument %y in $a1
	move $a2, %z	# argument %z in $a2
.end_macro

# Macro to pop an element from the stack to %x register
.macro pop_stack(%x)
	lw %x, 0($sp)	  # stores top of stack to %x
	addi $sp, $sp, 4  # pops top of stack
.end_macro

# Macro to push an element to the stack from %x register
.macro push_stack(%x)
	addi $sp, $sp, -4 # makes space for %x on top of stack
	sw %x, 0($sp)	  # stores %x to top of stack
.end_macro

# Macro to generate a random coordinate and put it in register %n
.macro rand(%n)
	addi $t0, $zero, BASE	# stores base address in register
	addi $t0, $t0, 6144 	# calculate the base address of generation
	
	li $v0, 42 		# loads opcode to generate a random object
	li $a1, 14080 		# max bound
	syscall			# generates a random object

	add $t1, $zero, $a0	# move the randomly generated location to a register
	addi $t2, $zero, 4	# stores 4 in register
	mul $t1, $t1, $t2	# multiply by 4
	
	add %n, $t0, $t1 	# store generated number in register
.end_macro

# Macro to draw four pixels of color %c on the screen according to %a
.macro fourpixels(%a, %c)
	addi $t0, %a, 0		# stores address in register
	add $t1, $zero, %c	# stores color in register
	sw $t1 0($t0)		# stores color in the pixel
	addi $t0, $t0, 4	# moves to next pixel
	sw $t1 0($t0)		# stores color in the pixel
	addi $t0, $t0, 512	# moves to next pixel
	sw $t1 0($t0)		# stores color in the pixel
	addi $t0, $t0, -4	# moves to next pixel
	sw $t1 0($t0)		# stores color in the pixel
.end_macro



