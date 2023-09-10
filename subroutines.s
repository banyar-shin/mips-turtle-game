# Subroutine to draw water (only used once)
DrawWater: # DrawWater (no arguments)
	addi $t0, $zero, BASE	# define base address to calculate location
	addi $t1, $zero, WATER	# define color of water
	addi $t2, $zero, 0	# define loop end condition
	
	# Label for start of loop
	WaterLoop:
	
	sw $t1, 0($t0)		# color the pixel
	addi $t0, $t0, 4	# add 4 to move to the next pixel
	addi $t2, $t2, 1	# add 1 to loop end condtion
	blt $t2, TP, WaterLoop	# total = 16384 pixels
	
	jr $ra			# jump back to return address

# Subroutine to display the description of the program
Description:
	la $a0, descrip		# loads address of string to print to $a0
	la $a1, 1		# loads 1 for information dialog
	li $v0, 55		# loads opcode for message dialog string
	syscall			# prints message dialog string
	
	la $a0, diffi		# loads string to display to $a0
	li $v0, 51		# loads opcode for input dialog int
	syscall			# displays an input dialog int
	
	move $s7, $a0		# stores input in $s7 (no validation)

	jr $ra			# jumps back to return address

# Subroutine to get center coordinate using x and y
GetCoord: # GetCoord (x, y)
	addi $t0, $zero, BASE	# set t0 as base address
	add $t1, $zero, $a0	# set t1 to be the x coordinate
	add $t2, $zero, $a1	# set t2 to be the y coordinate
	
	mul $t1, $t1, OFFSET 	# calculate x coordinate (times 4)
	mul $t2, $t2, OFFSET 	# calculate y coordinate (times 4)
	mul $t2, $t2, 128	# final y coordinate (times 128)
	
	add $v0, $t1, $t2	# location = final x + final y
	add $v0, $v0, $t0	# actual location in register (add base register)
	
	jr $ra			# jump back to return address
	
# Subroutine to draw the turtle according to direction and center coordinate
DrawTurtle: # DrawTurtle (x, y, direction)
	push_stack($ra) 	# stores return address in stack
	push_stack($fp)		# stores frame pointer in stack
	
	jal GetCoord		# calls subroutine to get exact address of center
	
	addi $t0, $zero, BODY	# stores color in register
	addi $t1, $zero, SHELLD	# stores color in register
	addi $t2, $zero, SHELLL	# stores color in register
	move $t3, $v0		# stores address of center in register
	add $t4, $zero, $a2	# stores direction in register

	DrawShell	# calls macro to draw shell of turtle relative to center
	
	# Checks direction of turtle
	
	beq $t4, Wkey, DrawBodyUp	# Draws body according
	beq $t4, Skey, DrawBodyDown	# Draws body according
	beq $t4, Akey, DrawBodyLeft	# Draws body according
	beq $t4, Dkey, DrawBodyRight	# Draws body according
	
	# Label for drawing turtle's body facing up relative to center
	DrawBodyUp:
	
	DrawBodyUp	# calls macro to draw turtle's body facing up
	j FinishDrawTurtle	# Finishes drawing
	
	# Label for drawing turtle's body facing down relative to center
	DrawBodyDown:
	
	DrawBodyDown	# calls macro to draw turtle's body facing down
	j FinishDrawTurtle	# Finishes drawing
	
	# Label for drawing turtle's body facing left relative to center
	DrawBodyLeft:
	
	DrawBodyLeft	# calls macro to draw turtle's body facing left
	j FinishDrawTurtle	# finishes drawing
	
	# Label for drawing turtle's body facing right relative to center
	DrawBodyRight:
	
	DrawBodyRight	# calls macro to draw turtle's body facing right

	# Label for when turtle is finished drawing
	FinishDrawTurtle:
	
	pop_stack($fp)		# pops and restores frame pointer
	pop_stack($ra)		# pops and restores return address

	jr $ra			# jumps back to return address
	
# Subroutine for erasing turtle according to direction and center coordinate
EraseTurtle: # EraseTurtle (x, y, direction)
	push_stack($ra)	# stores return address in stack
	push_stack($fp)	# stores frame pointer in stack
	
	jal GetCoord	# calls subroutine to get exact address of center
	
	addi $t0, $zero, WATER	# stores color of water in register
	move $t1, $v0		# stores address of center in register 
	add $t2, $zero, $a2	# stores direction in register
	
	EraseShell
	
	# Checks direction of turtle
	
	beq $t2, Wkey, EraseBodyUp	# Erases body accordingly
	beq $t2, Skey, EraseBodyDown	# Erases body accordingly
	beq $t2, Akey, EraseBodyLeft	# Erases body accordingly
	beq $t2, Dkey, EraseBodyRight	# Erases body accordingly
	
	# Label for erasing turtle's body facing up
	EraseBodyUp:
	
	EraseBodyUp	# calls macro to erase turtle's body facing up
	j FinishEraseTurtle	# finishes erasing
	
	# Label for erasing turtle's body facing down
	EraseBodyDown:
	
	EraseBodyDown	# calls macro to erase turtle's body facing down
	j FinishEraseTurtle	# finishes erasing
	
	# Label for erasing turtle's body facing left
	EraseBodyLeft:
	
	EraseBodyLeft	# calls macro to erase turtle's body facing left
	j FinishEraseTurtle	# finishes erasing
	
	# Label for erasing turtle's body facing right
	EraseBodyRight:
	
	EraseBodyRight	# calls macro to erase turtle's body facing right
	
	# Label for when turtle is finished erasing
	FinishEraseTurtle:
	
	pop_stack($fp)	# pops and restores frame pointer
	pop_stack($ra)	# pops and restores return address

	jr $ra		# jumps back to return address

# Subroutine to move the turtle one pixel forward according to direction
MoveTurtle: # MoveTurtle (x, y, direction)
	push_stack($ra)		# stores return address in stack
	push_stack($fp)		# stores frame pointer in stack
	
	jal EraseTurtle		# calls subroutine to erase current turtle
	
	move $t0, $a0		# stores x coordinate in register
	move $t1, $a1		# stores y coordinate in register
	move $t2, $a2		# stores direction of turtle in register
	
	beq $t2, Wkey, AddUp	# jumps to label according to direction
	beq $t2, Skey, AddDown	# jumps to label according to direction
	beq $t2, Akey, AddLeft	# jumps to label according to direction
	beq $t2, Dkey, AddRight	# jumps to label according to direction
	
	# Label for when the turtle is facing up
	AddUp:
	
	beq $t1, 5, FinishAdd	# if edge of screen, skip adding
	addi $t1, $t1, -1	# add -1 to y coordinate
	j FinishAdd		# jumps to finish adding
	
	# Label for when the turtle is facing down
	AddDown:
	
	beq $t1, 122, FinishAdd	# if edge of screen, skip adding
	addi $t1, $t1, 1	# add 1 to y coordinate
	j FinishAdd		# jumps to finish adding
	
	# Label for when the turtle is facing left
	AddLeft:
	
	beq $t0, 5, FinishAdd	# if edge of screen, skip adding
	addi $t0, $t0, -1	# add -1 to x coordinate
	j FinishAdd		# jumps to finish adding
	
	# Label for when the turtle is facing right
	AddRight:
	
	beq $t0, 122, FinishAdd	# if edge of screen, skip adding
	addi $t0, $t0, 1	# add 1 to x coordinate
	
	# Label for when adding is finished
	FinishAdd:
	
	move $s0, $t0		# stores new x coordinate
	move $s1, $t1		# stores new y coordinate
	
	arguments3($t0, $t1, $t2) # calls macro to set registers as arguments
	jal DrawTurtle		 # calls subroutine to draw new turtle
	
	pop_stack($fp)		# pops and restores frame pointer
	pop_stack($ra)		# pops and restores return address

	jr $ra			# jumps back to return address
	
# Subroutine to get the head coordinate using the x and y
GetHead: # GetHead (x, y, direction)
	push_stack($ra)		# stores return address in stack
	push_stack($fp)		# stores frame pointer in stack
	
	jal GetCoord		# calls subroutine to get exact address of center
	
	move $t0, $v0		# stores exact address of center in register
	move $t1, $a2		# stores direction of turtle in register
	
	beq $t1, Wkey, GetHeadUp	# jumps to label according to direction
	beq $t1, Skey, GetHeadDown	# jumps to label according to direction
	beq $t1, Akey, GetHeadLeft	# jumps to label according to direction
	beq $t1, Dkey, GetHeadRight	# jumps to label according to direction

	# Label for when turtle is facing up
	GetHeadUp:
	
	addi $t0, $t0, -2560	# adds to get position of head
	j FinishGetHead		# finishes getting head
	
	# Label for when turtle is facing down
	GetHeadDown:
	
	addi $t0, $t0, 2560	# adds to get position of head
	j FinishGetHead		# finishes getting head
	
	# Label for when turtle is facing left
	GetHeadLeft:
	
	addi $t0, $t0, -20	# adds to get position of head
	j FinishGetHead		# finishes getting head
	
	# Label for when turtle is facing right
	GetHeadRight:
	
	addi $t0, $t0, 20	# adds to get position of head
	
	# Label for when getting head is finished
	FinishGetHead:
	
	move $v0, $t0		# moves return value to $v0
	
	pop_stack($fp)		# pops and restores frame pointer
	pop_stack($ra)		# pops and restores return address
	
	jr $ra			# jumps back to return address
	
# Draw objects depending on $s6 register
ObjectDraw:
	
	rand($t0)		# calls macro to generate and store random number
	addi $t1, $zero, FOOD	# stores color of food in register
	fourpixels($t0, $t1)	# calls macro to generate 4 pixels of food
	
	# Make a counter for trash loop
	addi $t3, $zero, 1 	# set i to 1
	
	# Label for start of loop
	trashLoop:
	bge $t3, $s6, trashAfter # check if t2 is greater than or eq to # of food
	
	rand($t0)		# calls macro to generate and store random number
	addi $t1, $zero, TRASH
	fourpixels($t0, $t1)	# calls macro to generate 4 pixels of food
	
	addi $t3, $t3, 1 	# i++
	
	j trashLoop		# jumps back to start of loop
	
	# Label to quit loop
	trashAfter:
	
	jr $ra			# jumps back to return address
	
# Subroutine to detect object and do things accordingly
DetectObject: # DetectObject (x, y, direction)
	push_stack($ra) 	# stores return address in stack
	push_stack($fp)		# stores frame pointer in stack
	
	jal GetHead		# calls subroutine to get head coordinate
	
	move $t0, $v0		# moves head coordinate to register
	move $t3, $a2		# stores direction in register
	
	CheckHitbox	# calls macro to detect any collisions
	
	beq $t3, Wkey, EdgeUp	 # For edge case in order to not break game
	beq $t3, Skey, EdgeDown	 # For edge case in order to not break game
	beq $t3, Akey, EdgeLeft	 # For edge case in order to not break game
	beq $t3, Dkey, EdgeRight # For edge case in order to not break game
	
	# Label for edge case up
	EdgeUp:
	
	EdgeUp		# calls macro to detect edge case
	j FinishDetect	# jumps to label to end subroutine
	
	# Label for edge case down
	EdgeDown:
	
	EdgeDown	# calls macro to detect edge case
	j FinishDetect	# jumps to label to end subroutine
	
	# Label for edge case left
	EdgeLeft:
	
	EdgeLeft	# calls macro to detect edge case
	j FinishDetect	# jumps to label to end subroutine
	
	# Label for edge case right
	EdgeRight:
	
	EdgeRight	# calls macro to detect edge case
	j FinishDetect	# jumps to label to end subroutine
	
	# Label for when food is detected
	DetectedFood:
	
	li $a2, 121	# playing a read instrument
	li $a0, 75	# pitch
	li $a3, 100	# volume
	li $a1, 750	# duration
	li $v0, 33	# loads opcode to generate tone
	syscall		# generates tone
	
	addi $s4, $s4, 100	# adds to score counter
	
	beq $s7, 1, Easy	# to branch according to difficulty
	beq $s7, 2, Medium	# to branch according to difficulty
	beq $s7, 3, Hard	# to branch according to difficulty
	beq $s7, 4, Extreme	# to branch according to difficulty
	beq $s7, 5, Impossible	# to branch according to difficulty
	
	# Label for when difficulty is easy
	Easy:
	
	addi $s6, $s6, 2	# adds to trash counter
	j FinishAddScore	# jumps to finish adding score
	
	# Label for when difficulty is medium
	Medium:
	
	addi $s6, $s6, 4	# adds to trash counter
	j FinishAddScore	# jumps to finish adding score
	
	# Label for when difficulty is hard
	Hard:
	
	addi $s6, $s6, 8	# adds to trash counter
	j FinishAddScore	# jumps to finish adding score
	
	# Label for when difficulty is extreme
	Extreme:
	
	addi $s6, $s6, 16	# adds to trash counter
	j FinishAddScore	# jumps to finish adding score
	
	# Label for when difficulty is impossible
	Impossible:
	
	addi $s6, $s6, 2048	# adds to trash counter
	
	# Label for when score is finished adding
	FinishAddScore:
	
	addi $v0, $zero, 0	 # return value = 0 (food detected)
	j FinishDetect		# jumps to label to end subroutine
	
	# Label for when trash is detected
	DetectedTrash:
	
	li $a2, 127	# playing a read instrument
	li $a0, 60	# pitch
	li $a3, 100	# volume
	li $a1, 750	# duration
	li $v0, 33	# loads opcode to generate tone
	syscall		# generates tone
	
	addi $a0, $t2, -516	# stores location of pixel as argument
	jal EraseTrash		# calls subroutine to erase if pixel = trash
	
	addi $a0, $t2, -512	# stores location of pixel as argument
	jal EraseTrash		# calls subroutine to erase if pixel = trash
	
	addi $a0, $t2, -508	# stores location of pixel as argument
	jal EraseTrash		# calls subroutine to erase if pixel = trash
	
	addi $a0, $t2, -4	# stores location of pixel as argument
	jal EraseTrash		# calls subroutine to erase if pixel = trash
	
	addi $a0, $t2, 0	# stores location of pixel as argument
	jal EraseTrash		# calls subroutine to erase if pixel = trash
	
	addi $a0, $t2, 4	# stores location of pixel as argument
	jal EraseTrash		# calls subroutine to erase if pixel = trash
	
	addi $a0, $t2, 8	# stores location of pixel as argument
	jal EraseTrash		# calls subroutine to erase if pixel = trash
	
	addi $a0, $t2, 508	# stores location of pixel as argument
	jal EraseTrash		# calls subroutine to erase if pixel = trash
	
	addi $a0, $t2, 512	# stores location of pixel as argument
	jal EraseTrash		# calls subroutine to erase if pixel = trash
	
	addi $a0, $t2, 516	# stores location of pixel as argument
	jal EraseTrash		# calls subroutine to erase if pixel = trash
	
	# Label to finish erasing trash on the screen
	FinishEraseTrash:
	
	addi $s5, $s5, -1	 # subtracts from lives counter
	addi $v0, $zero, 2	 # return value = 2 (trash detected & lives != 0)
	
	bne $s5, 0, FinishDetect # checks if lives still remain
	addi $v0, $zero, 1	 # return value = 1 (trash detected & lives = 0)
	
	# Label to finish the detection function
	FinishDetect:
	
	pop_stack($fp)		# pops and restores frame pointer
	pop_stack($ra)		# pops and restores return address

	jr $ra			# jumps back to return address

# Subroutine to erase pixel if trash
EraseTrash:
	lw $t0, 0($a0)			# loads pixel value to register
	addi $t1, $zero, WATER		# stores value of water in register
	
	beq $t0, TRASH, ErasePixel	# branch if pixel = trash
	j FinishErasePixel		# jumps to skip erase if pixel != trash
	
	# Label to erase trash pixel
	ErasePixel:
	
	sw $t1, 0($a0)		# overwrite pixel value with water
	
	# Label to finish erasing trash pixel
	FinishErasePixel:

	jr $ra		# jumps back to return address

# Subroutine to print lives counter
PrintLives: # PrintLives (lives)
	push_stack($ra)		# stores return address in stack
	push_stack($fp)		# stores frame pointer in stack
	
	move $t0, $a0		# move number of lives to register
	addi $t1, $zero, HEARTD	# stores color of heart dark to register
	addi $t2, $zero, HEARTL	# stores color of heart light to register
	addi $t3, $zero, FRAME	# stores color of frame to register
	
	addi $t4, $zero, BASE	# stores base address to register
	addi $t4, $t4, 508	# adds to base address to get top right pixel
	
	PrintFrame		# calls macro to print frame
	
	addi $t4, $t4, -1024	# adds to get specific location for heart
	addi $t4, $t4, -4	# adds to get specific location for heart
	
	PrintHeart		# calls macro to print heart relative to a pixel
	
	# Print Number:
	
	addi $t4, $t4, -32	# adds to get specific location for number

	beq $t0, 0, PrintZero	# checks to prints the right number of lives
	beq $t0, 1, PrintOne	# checks to prints the right number of lives
	beq $t0, 2, PrintTwo	# checks to prints the right number of lives
	beq $t0, 3, PrintThree	# checks to prints the right number of lives
	
	# Label for Zero
	PrintZero:
	
	PrintZero		# calls macro to print zero on display
	j FinishNumber		# jumps to finish printing number
	
	# Label for One
	PrintOne:
	
	PrintOne		# calls macro to print one on display
	j FinishNumber		# jumps to finish printing number
	
	# Label for Two
	PrintTwo:
	
	PrintTwo		# calls macro to print two on display
	j FinishNumber		# jumps to finish printing number
	
	# Label for Three
	PrintThree:
	
	PrintThree		# calls macro to print three on display
	
	FinishNumber:
	
	pop_stack($fp)		# pops and restores frame pointer
	pop_stack($ra)		# pops and restores return address
	
	jr $ra			# jumps back to return address
	
# Subroutine to display game over text and random fact
GameOver:	
	la $a0, gameover	# loads address of text to $a0
	move $a1, $s4		# loads score to display to $a1
	li $v0, 56		# loads opcode for message dialog int
	syscall			# displays message dialong int

	# Open (for reading) from a pre-made file
  	li   $v0, 13       # loads opcode for opening a file
  	la   $a0, file     # output file name
  	li   $a1, 0        # Open for read (flags are 0: read, 1: write)
  	li   $a2, 0        # mode is ignored
  	syscall            # open a file (file descriptor returned in $v0)
  	
  	move $s6, $v0      # save the file descriptor 

 	# Read from just opened
  	li   $v0, 14	# loads opcode to read from file
  	move $a0, $s6	# file descriptor 
  	la   $a1, text	# address of buffer from which to write
  	li   $a2, 2048	# hardcoded buffer length
  	syscall		# reads from opened file
  
  	# Generate random number
  	li $a1, 16	# here you set $a1 to the max bound
  	li $v0, 42	# loads opcode for generating a random int
  	syscall		# generates the random number
    
  	move $t0, $a0 	# save random number to $t0
  	
	la $t1, text	# set $t1 equal to start of address
	la $t3, print	# loads string to be printed which is currently empty

  	# Label for start of loop to find the sentence to print
  	FindSentence:
  	
  	beq $t0, $zero, PrintLoop	# if counter = 0, branch to quit loop (edge case)
  	
  	lb $t2, 0($t1)			# loads character to register
  	beq $t2, 10, Decrement		# if character = '\n', branch to decrement
  	addi $t1, $t1, 1		# increment to next character
  	j FindSentence			# jumps back to main loop
  
  	# Label for decrementing the counter when '\n' is found
  	Decrement:
  	
  	addi $t0, $t0, -1		# decrement the counter
  	beq $t0, $zero, SentenceStart	# if counter = 0, branch to quit loop
  	addi $t1, $t1, 1		# move to next character
  	j FindSentence			# jumps back to main loop
    
    	# Label for when the sentence to print is found
	SentenceStart:
	
	addi $t1, $t1, 1	# move to next character, start of sentence
	
	# Label to start loop that prints the sentence
	PrintLoop:
	
	lb $t2, 0($t1)		# loads character to register
	beq $t2, 10, Done	# if character = '\n', branch to complete printing
	
	sb $t2, ($t3)		# stores the character in the string to be printed
	
	addi $t3, $t3, 1	# moves to next character 
	addi $t1, $t1, 1	# moves to next character
	
	j PrintLoop		# jumps back to print next character
	
	# Label to finish printing random sentence
	Done:
	
	la $a0, heresa		# loads address of first string to $a0
	la $a1, print		# loads address of second string to $a1
	li $v0, 59		# loads opcode for message dialog
	syscall			# prints message dialog
	
	li $v0, 10	# calls opcode for terminate program
	syscall		# terminates program
	
	jr $ra
