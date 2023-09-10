# Macro to draw turtle's shell
.macro DrawShell
	# Draws shell of turtle relative to center
	
	sw $t1, -1544($t3)
	sw $t1, -1540($t3)
	sw $t1, -1536($t3)
	sw $t1, -1532($t3)
	sw $t1, -1528($t3)
	
	sw $t1, -1036($t3)
	sw $t1, -1032($t3)
	sw $t2, -1028($t3)
	sw $t1, -1024($t3)
	sw $t2, -1020($t3)
	sw $t1, -1016($t3)
	sw $t1, -1012($t3)
	
	sw $t1, -524($t3)
	sw $t2, -520($t3)
	sw $t1, -516($t3)
	sw $t2, -512($t3)
	sw $t1, -508($t3)
	sw $t2, -504($t3)
	sw $t1, -500($t3)
	
	sw $t1, -12($t3)
	sw $t1, -8($t3)
	sw $t2, -4($t3)
	sw $t1, 0($t3)
	sw $t2, 4($t3)
	sw $t1, 8($t3)
	sw $t1, 12($t3)
	
	sw $t1, 500($t3)
	sw $t2, 504($t3)
	sw $t1, 508($t3)
	sw $t2, 512($t3)
	sw $t1, 516($t3)
	sw $t2, 520($t3)
	sw $t1, 524($t3)
	
	sw $t1, 1012($t3)
	sw $t1, 1016($t3)
	sw $t2, 1020($t3)
	sw $t1, 1024($t3)
	sw $t2, 1028($t3)
	sw $t1, 1032($t3)
	sw $t1, 1036($t3)
	
	sw $t1, 1528($t3)
	sw $t1, 1532($t3)
	sw $t1, 1536($t3)
	sw $t1, 1540($t3)
	sw $t1, 1544($t3)
.end_macro

# Macro to draw turtle's body facing up
.macro DrawBodyUp
	# Draw head of turtle relative to center
	
	sw $t0, -2052($t3)
	sw $t0, -2048($t3)
	sw $t0, -2044($t3)

	sw $zero, -2564($t3)
	sw $t0, -2560($t3)
	sw $zero, -2556($t3)

	# Draw legs of turtle relative to center
	
	sw $t0, -1548($t3)
	sw $t0, -1552($t3)
	sw $t0, -1040($t3)
	
	sw $t0, -1524($t3)
	sw $t0, -1520($t3)
	sw $t0, -1008($t3)
	
	sw $t0, 1524($t3)
	sw $t0, 1520($t3)
	sw $t0, 2032($t3)
	
	sw $t0, 1548($t3)
	sw $t0, 1552($t3)
	sw $t0, 2064($t3)
	
	# Draw tail of turtle relative to center
	
	sw $t0, 2044($t3)
	sw $t0, 2048($t3)
	sw $t0, 2052($t3)
.end_macro

# Macro to draw turtle's body facing down
.macro DrawBodyDown
	# Draw head of turtle relative to center
	
	sw $t0, 2052($t3)
	sw $t0, 2048($t3)
	sw $t0, 2044($t3)
	
	sw $zero, 2564($t3)
	sw $t0, 2560($t3)
	sw $zero, 2556($t3)
	
	# Draw legs of turtle relative to center
	
	sw $t0, 1548($t3)
	sw $t0, 1552($t3)
	sw $t0, 1040($t3)

	sw $t0, 1524($t3)
	sw $t0, 1520($t3)
	sw $t0, 1008($t3)

	sw $t0, -1524($t3)
	sw $t0, -1520($t3)
	sw $t0, -2032($t3)

	sw $t0, -1548($t3)
	sw $t0, -1552($t3)
	sw $t0, -2064($t3)
	
	# Draw tail of turtle relative to center
	
	sw $t0, -2052($t3)
	sw $t0, -2048($t3)
	sw $t0, -2044($t3)
.end_macro

# Macro to draw turtle's body facing left
.macro DrawBodyLeft
	# Draw head of turtle relative to center
	
	sw $t0, 496($t3)
	sw $t0, -16($t3)
	sw $t0, -528($t3)
	
	sw $zero, 492($t3)
	sw $t0, -20($t3)
	sw $zero, -532($t3)

	# Draw legs of turtle relative to center
	
	sw $t0, 1524($t3)
	sw $t0, 2036($t3)
	sw $t0, 2040($t3)
	
	sw $t0, -1548($t3)
	sw $t0, -2060($t3)
	sw $t0, -2056($t3)
	
	sw $t0, 1548($t3)
	sw $t0, 2060($t3)
	sw $t0, 2064($t3)
	
	sw $t0, -1524($t3)
	sw $t0, -2036($t3)
	sw $t0, -2032($t3)
	
	# Draw tail of turtle relative to center
	
	sw $t0, -496($t3)
	sw $t0, 16($t3)
	sw $t0, 528($t3)
.end_macro

# Macro to draw turtle's body facing right
.macro DrawBodyRight
	# Draw head of turtle relative to center
	
	sw $t0, -496($t3)
	sw $t0, 16($t3)
	sw $t0, 528($t3)
	
	sw $zero, -492($t3)
	sw $t0, 20($t3)
	sw $zero, 532($t3)

	# Draw legs of turtle relative to center
	
	sw $t0, -1524($t3)
	sw $t0, -2036($t3)
	sw $t0, -2040($t3)
	
	sw $t0, 1548($t3)
	sw $t0, 2060($t3)
	sw $t0, 2056($t3)
	
	sw $t0, -1548($t3)
	sw $t0, -2060($t3)
	sw $t0, -2064($t3)
	
	sw $t0, 1524($t3)
	sw $t0, 2036($t3)
	sw $t0, 2032($t3)
	
	# Draw tail of turtle relative to center
	
	sw $t0, -528($t3)
	sw $t0, -16($t3)
	sw $t0, 496($t3)
.end_macro

# Macro to erase turtle's shell
.macro EraseShell
	# Erases shell of turtle relative to center
	
	sw $t0, -1544($t1)
	sw $t0, -1540($t1)
	sw $t0, -1536($t1)
	sw $t0, -1532($t1)
	sw $t0, -1528($t1)
	
	sw $t0, -1036($t1)
	sw $t0, -1032($t1)
	sw $t0, -1028($t1)
	sw $t0, -1024($t1)
	sw $t0, -1020($t1)
	sw $t0, -1016($t1)
	sw $t0, -1012($t1)
	
	sw $t0, -524($t1)
	sw $t0, -520($t1)
	sw $t0, -516($t1)
	sw $t0, -512($t1)
	sw $t0, -508($t1)
	sw $t0, -504($t1)
	sw $t0, -500($t1)
	
	sw $t0, -12($t1)
	sw $t0, -8($t1)
	sw $t0, -4($t1)
	sw $t0, 0($t1)
	sw $t0, 4($t1)
	sw $t0, 8($t1)
	sw $t0, 12($t1)
	
	sw $t0, 500($t1)
	sw $t0, 504($t1)
	sw $t0, 508($t1)
	sw $t0, 512($t1)
	sw $t0, 516($t1)
	sw $t0, 520($t1)
	sw $t0, 524($t1)
	
	sw $t0, 1012($t1)
	sw $t0, 1016($t1)
	sw $t0, 1020($t1)
	sw $t0, 1024($t1)
	sw $t0, 1028($t1)
	sw $t0, 1032($t1)
	sw $t0, 1036($t1)
	
	sw $t0, 1528($t1)
	sw $t0, 1532($t1)
	sw $t0, 1536($t1)
	sw $t0, 1540($t1)
	sw $t0, 1544($t1)
.end_macro

# Macro to erase turtle's body facing up
.macro EraseBodyUp
	# Erases head of turtle relative to center
	
	sw $t0, -2052($t1)
	sw $t0, -2048($t1)
	sw $t0, -2044($t1)
	
	sw $t0, -2564($t1)
	sw $t0, -2560($t1)
	sw $t0, -2556($t1)

	# Erases legs of turtle relative to center
	
	sw $t0, -1548($t1)
	sw $t0, -1552($t1)
	sw $t0, -1040($t1)
	
	sw $t0, -1524($t1)
	sw $t0, -1520($t1)
	sw $t0, -1008($t1)
	
	sw $t0, 1524($t1)
	sw $t0, 1520($t1)
	sw $t0, 2032($t1)
	
	sw $t0, 1548($t1)
	sw $t0, 1552($t1)
	sw $t0, 2064($t1)
	
	# Erases tail of turtle relative to center
	
	sw $t0, 2044($t1)
	sw $t0, 2048($t1)
	sw $t0, 2052($t1)
.end_macro

# Macro to erase turtle's body facing down
.macro EraseBodyDown
	# Erases head of turtle relative to center
	
	sw $t0, 2052($t1)
	sw $t0, 2048($t1)
	sw $t0, 2044($t1)
	
	sw $t0, 2564($t1)
	sw $t0, 2560($t1)
	sw $t0, 2556($t1)

	# Erases legs of turtle relative to center
	
	sw $t0, 1548($t1)
	sw $t0, 1552($t1)
	sw $t0, 1040($t1)

	sw $t0, 1524($t1)
	sw $t0, 1520($t1)
	sw $t0, 1008($t1)

	sw $t0, -1524($t1)
	sw $t0, -1520($t1)
	sw $t0, -2032($t1)

	sw $t0, -1548($t1)
	sw $t0, -1552($t1)
	sw $t0, -2064($t1)
	
	# Erases tail of turtle relative to center
	
	sw $t0, -2052($t1)
	sw $t0, -2048($t1)
	sw $t0, -2044($t1)
.end_macro

# Macro to erase turtle's body facing left
.macro EraseBodyLeft
	# Erases head of turtle relative to center
	
	sw $t0, 496($t1)
	sw $t0, -16($t1)
	sw $t0, -528($t1)
	
	sw $t0, 492($t1)
	sw $t0, -20($t1)
	sw $t0, -532($t1)

	# Erases legs of turtle relative to center
	
	sw $t0, 1524($t1)
	sw $t0, 2036($t1)
	sw $t0, 2040($t1)
	
	sw $t0, -1548($t1)
	sw $t0, -2060($t1)
	sw $t0, -2056($t1)
	
	sw $t0, 1548($t1)
	sw $t0, 2060($t1)
	sw $t0, 2064($t1)
	
	sw $t0, -1524($t1)
	sw $t0, -2036($t1)
	sw $t0, -2032($t1)
	
	# Erases tail of turtle relative to center
	
	sw $t0, -496($t1)
	sw $t0, 16($t1)
	sw $t0, 528($t1)
.end_macro

# Macro to erase turtle's body facing right
.macro EraseBodyRight
	# Erases head of turtle relative to center
	
	sw $t0, -496($t1)
	sw $t0, 16($t1)
	sw $t0, 528($t1)
	
	sw $t0, -492($t1)
	sw $t0, 20($t1)
	sw $t0, 532($t1)

	# Erases legs of turtle relative to center
	
	sw $t0, -1524($t1)
	sw $t0, -2036($t1)
	sw $t0, -2040($t1)
	
	sw $t0, 1548($t1)
	sw $t0, 2060($t1)
	sw $t0, 2056($t1)
	
	sw $t0, -1548($t1)
	sw $t0, -2060($t1)
	sw $t0, -2064($t1)
	
	sw $t0, 1524($t1)
	sw $t0, 2036($t1)
	sw $t0, 2032($t1)
	
	# Erases tail of turtle relative to center
	
	sw $t0, -528($t1)
	sw $t0, -16($t1)
	sw $t0, 496($t1)
.end_macro

# Macro to print frame for lives counter
.macro PrintFrame
	addi $t5, $zero, 10	# sets counter = 10 for 10 rows
	
	# Label for start of loop
	FrameLoop:
	
	sw $t3, 0($t4)
	sw $t3, -4($t4)
	sw $t3, -8($t4)
	sw $t3, -12($t4)
	sw $t3, -16($t4)
	sw $t3, -20($t4)
	sw $t3, -24($t4)
	sw $t3, -28($t4)
	sw $t3, -32($t4)
	sw $t3, -36($t4)
	sw $t3, -40($t4)
	sw $t3, -44($t4)
	sw $t3, -48($t4)
	sw $t3, -52($t4)
	sw $t3, -56($t4)
	sw $zero, -60($t4)
	
	addi $t4, $t4, 512	# moves to next line
	addi $t5, $t5, -1	# decrements counter
	bne $t5, 0, FrameLoop	# checks counter to quit loop
	
	# Prints last Line (all black)
	
	sw $zero, 0($t4)
	sw $zero, -4($t4)
	sw $zero, -8($t4)
	sw $zero, -12($t4)
	sw $zero, -16($t4)
	sw $zero, -20($t4)
	sw $zero, -24($t4)
	sw $zero, -28($t4)
	sw $zero, -32($t4)
	sw $zero, -36($t4)
	sw $zero, -40($t4)
	sw $zero, -44($t4)
	sw $zero, -48($t4)
	sw $zero, -52($t4)
	sw $zero, -56($t4)
	sw $zero, -60($t4)
.end_macro

# Macro to print a heart for lives counter
.macro PrintHeart
	sw $t1, -3092($t4)
	sw $t1, -3088($t4)
	sw $t1, -3080($t4)
	sw $t1, -3076($t4)
	
	sw $t1, -2584($t4)
	sw $t2, -2580($t4)
	sw $t2, -2576($t4)
	sw $t1, -2572($t4)
	sw $t2, -2568($t4)
	sw $t2, -2564($t4)
	sw $t1, -2560($t4)
	
	sw $t1, -2072($t4)
	sw $t2, -2068($t4)
	sw $t2, -2064($t4)
	sw $t2, -2060($t4)
	sw $t2, -2056($t4)
	sw $t2, -2052($t4)
	sw $t1, -2048($t4)
	
	sw $t1, -1556($t4)
	sw $t2, -1552($t4)
	sw $t2, -1548($t4)
	sw $t2, -1544($t4)
	sw $t1, -1540($t4)
	
	sw $t1, -1040($t4)
	sw $t2, -1036($t4)
	sw $t1, -1032($t4)
	
	sw $t1, -524($t4)
.end_macro

# Macro to print zero for lives counter
.macro PrintZero
	sw $zero, -3600($t4)
	sw $zero, -3596($t4)
	sw $zero, -3592($t4)
	sw $zero, -3588($t4)
	sw $zero, -3584($t4)
	
	sw $zero, -3088($t4)
	sw $zero, -3084($t4)
	sw $zero, -3080($t4)
	sw $zero, -3076($t4)
	sw $zero, -3072($t4)
	
	sw $zero, -2576($t4)
	sw $zero, -2572($t4)
	sw $zero, -2564($t4)
	sw $zero, -2560($t4)
	
	sw $zero, -2064($t4)
	sw $zero, -2060($t4)
	sw $zero, -2052($t4)
	sw $zero, -2048($t4)
	
	sw $zero, -1552($t4)
	sw $zero, -1548($t4)
	sw $zero, -1540($t4)
	sw $zero, -1536($t4)
	
	sw $zero, -528($t4)
	sw $zero, -524($t4)
	sw $zero, -520($t4)
	sw $zero, -516($t4)
	sw $zero, -512($t4)
	
	sw $zero, -1040($t4)
	sw $zero, -1036($t4)
	sw $zero, -1028($t4)
	sw $zero, -1024($t4)
	
	sw $zero, -16($t4)
	sw $zero, -12($t4)
	sw $zero, -8($t4)
	sw $zero, -4($t4)
	sw $zero, 0($t4)
.end_macro

# Macro to print one for lives counter
.macro PrintOne
	sw $zero, -3600($t4)
	sw $zero, -3596($t4)
	sw $zero, -3592($t4)
	sw $zero, -3588($t4)
	
	sw $zero, -3088($t4)
	sw $zero, -3084($t4)
	sw $zero, -3080($t4)
	sw $zero, -3076($t4)
	
	sw $zero, -2568($t4)
	sw $zero, -2564($t4)
	
	sw $zero, -2056($t4)
	sw $zero, -2052($t4)
	
	sw $zero, -1544($t4)
	sw $zero, -1540($t4)
	
	sw $zero, -1032($t4)
	sw $zero, -1028($t4)
	
	sw $zero, -528($t4)
	sw $zero, -524($t4)
	sw $zero, -520($t4)
	sw $zero, -516($t4)
	sw $zero, -512($t4)
	
	sw $zero, -16($t4)
	sw $zero, -12($t4)
	sw $zero, -8($t4)
	sw $zero, -4($t4)
	sw $zero, 0($t4)
.end_macro

# Macro to print two for lives counter
.macro PrintTwo
	sw $zero, -3600($t4)
	sw $zero, -3596($t4)
	sw $zero, -3592($t4)
	sw $zero, -3588($t4)
	sw $zero, -3584($t4)
	
	sw $zero, -3088($t4)
	sw $zero, -3084($t4)
	sw $zero, -3080($t4)
	sw $zero, -3076($t4)
	sw $zero, -3072($t4)
	
	sw $zero, -2564($t4)
	sw $zero, -2560($t4)
	
	sw $zero, -2064($t4)
	sw $zero, -2060($t4)
	sw $zero, -2056($t4)
	sw $zero, -2052($t4)
	sw $zero, -2048($t4)
	
	sw $zero, -1552($t4)
	sw $zero, -1548($t4)
	sw $zero, -1544($t4)
	sw $zero, -1540($t4)
	sw $zero, -1536($t4)
	
	sw $zero, -1040($t4)
	sw $zero, -1036($t4)
	
	sw $zero, -528($t4)
	sw $zero, -524($t4)
	sw $zero, -520($t4)
	sw $zero, -516($t4)
	sw $zero, -512($t4)
	
	sw $zero, -16($t4)
	sw $zero, -12($t4)
	sw $zero, -8($t4)
	sw $zero, -4($t4)
	sw $zero, 0($t4)
.end_macro

# Macro to print three for lives counter
.macro PrintThree
	sw $zero, -3600($t4)
	sw $zero, -3596($t4)
	sw $zero, -3592($t4)
	sw $zero, -3588($t4)
	sw $zero, -3584($t4)
	
	sw $zero, -3088($t4)
	sw $zero, -3084($t4)
	sw $zero, -3080($t4)
	sw $zero, -3076($t4)
	sw $zero, -3072($t4)
	
	sw $zero, -2564($t4)
	sw $zero, -2560($t4)
	
	sw $zero, -2064($t4)
	sw $zero, -2060($t4)
	sw $zero, -2056($t4)
	sw $zero, -2052($t4)
	sw $zero, -2048($t4)
	
	sw $zero, -1552($t4)
	sw $zero, -1548($t4)
	sw $zero, -1544($t4)
	sw $zero, -1540($t4)
	sw $zero, -1536($t4)
	
	sw $zero, -1028($t4)
	sw $zero, -1024($t4)
	
	sw $zero, -528($t4)
	sw $zero, -524($t4)
	sw $zero, -520($t4)
	sw $zero, -516($t4)
	sw $zero, -512($t4)
	
	sw $zero, -16($t4)
	sw $zero, -12($t4)
	sw $zero, -8($t4)
	sw $zero, -4($t4)
	sw $zero, 0($t4)
.end_macro

# Macro to check if the turtle hits an object
.macro CheckHitbox
	addi $t2, $t0, -516		# stores location of pixel in register
	lw $t1, 0($t2)			# loads pixel value to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	beq $t1, TRASH, DetectedTrash	# checks color of pixel to see if it's trash
	
	addi $t2, $t0, -512		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	beq $t1, TRASH, DetectedTrash	# checks color of pixel to see if it's trash
	
	addi $t2, $t0, -508		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	beq $t1, TRASH, DetectedTrash	# checks color of pixel to see if it's trash
	
	addi $t2, $t0, -4		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	beq $t1, TRASH, DetectedTrash	# checks color of pixel to see if it's trash

	addi $t2, $t0, 4		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	beq $t1, TRASH, DetectedTrash	# checks color of pixel to see if it's trash
	
	addi $t2, $t0, 508		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	beq $t1, TRASH, DetectedTrash	# checks color of pixel to see if it's trash
	
	addi $t2, $t0, 512		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	beq $t1, TRASH, DetectedTrash	# checks color of pixel to see if it's trash
	
	addi $t2, $t0, 516		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	beq $t1, TRASH, DetectedTrash	# checks color of pixel to see if it's trash
.end_macro

# Macro to check edge case to prevent getting stuck in a level
.macro EdgeUp
	addi $t2, $t0, 496		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, 500		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, 504		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, 520		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, 524		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, 528		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
.end_macro

# Macro to check edge case to prevent getting stuck in a level
.macro EdgeDown
	addi $t2, $t0, -496		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, -500		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, -504		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, -520		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, -524		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, -528		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
.end_macro

# Macro to check edge case to prevent getting stuck in a level
.macro EdgeLeft
	addi $t2, $t0, -2044		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, -1532		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, -1020		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, 1028		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, 1540		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, 2052		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
.end_macro

# Macro to check edge case to prevent getting stuck in a level
.macro EdgeRight
	addi $t2, $t0, 2044		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, 1532		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, 1020		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, -1028		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, -1540		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
	
	addi $t2, $t0, -2052		# stores location of pixel in register
	lw $t1, 0($t2)			# loads value of pixel to register
	beq $t1, FOOD, DetectedFood	# checks color of pixel to see if it's food
.end_macro
