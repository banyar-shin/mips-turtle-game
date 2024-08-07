.include "macros.s"
.include "longmacros.s"

.data
	input:    .asciiz "\nInput: "
	gameover: .asciiz "Game Over!\nYou scored: "
	descrip:  .asciiz "This is a turtle game where you control the turtle to eat\nfood objects (yellow), and avoid trash objects (dark red).\nYou lose when you run out of lives.\n\nTo start, hit OK on the dialog and:\n - Use (W, A, S, D) to move and E to exit anytime.\n - Use R to reset the level in case of an issue.\nHave fun!!"
	diffi:	  .asciiz "Choose your difficulty (Enter a number):\n1 - Easy | 2 - Medium | 3 - Hard | 4 - Extreme | 5 - IMPOSSIBLE"
	
	text:	  .space  2048
	print:    .space  256

# Set Width (in pixels)
# For 4 x 4 pixels
# 512 x 512 display

.eqv	WIDTH	128	# define width of the display
.eqv	HEIGHT	128	# define height of the display

# Color Codes
.eqv	BODY	0x001be655 	# define turtle's body color, alt: ffffff
.eqv	SHELLD	0x00b97a57 	# define turtle's shell color1, alt: f8dce1
.eqv	SHELLL	0x00dba88c 	# define turtle's shell color2, alt color: d1a9ae
.eqv	WATER	0x0000a4db	# define water's color, alt color: 0095c6
.eqv 	TRASH	0x00931202	# define trash's color
.eqv	FOOD	0x00dada02	# define food color, alt color: f96cb6
.eqv	HEARTD	0x009b1312	# define heart color dark
.eqv	HEARTL	0x00ed2424	# define heart color light
.eqv	FRAME	0x00dedede	# define frame color

# Base Address
.eqv	BASE	0x10040000	# define base address (using the heap option)

# Set Offset
.eqv	OFFSET	4		# define offset between each pixel

# Total Pixel Count
.eqv	TP	16384		# define the total number of pixels

# Input Keys
.eqv	Wkey	119		# define w's ascii value
.eqv	Skey	115		# define s's ascii value
.eqv	Akey	97		# define a's ascii value
.eqv	Dkey	100		# define d's ascii value
.eqv	Ekey	101		# define e's ascii value
.eqv	Rkey	114		# define r's ascii value

# Registers to always be recognized:
#  $s0 = x coordinate
#  $s1 = y coordinate
#  $s2 = direction that the turtle is facing
#  $s3 = the user's input
#  $s4 = user's score
#  $s5 = user's lives count
#  $s6 = number of trash on screen
#  $s7 = difficulty

.text
	jal Description		# calls subroutine to display program description
	
	addi $s4, $zero, 0	# initialize score of user
	addi $s5, $zero, 3	# initialize lives of user
	addi $s6, $zero, 1	# initialize number of trash / level number

# Label for start of each round
Start:
	jal DrawWater		# To draw the water / background
	
	addi $s0, $zero, 114	# initialize x coordinate (column number)
	addi $s1, $zero, 5	# initialize y coordinate (row number)
	addi $s2, $zero, Akey	# initialize direction of turtle
	
	arguments3($s0, $s1, $s2) # calls macro to set registers as arguments
	jal DrawTurtle		  # calls subroutine to draw the turtle using the args

	jal ObjectDraw		  # calls subroutine to draw objects on the screen

# Label for detecting objects in hitbox (also start of input loop)
Detection:
	arguments3($s0, $s1, $s2) # calls macro to set registers as arguments
	jal DetectObject	  # calls subroutine to detect object in hitbox
	
	beq $v0, 0, Start  	# checks return value and start new round if 0
	beq $v0, 1, Exit	# checks return value and exit if 1

	move $a0, $s5		# sets register as argument
	jal PrintLives		# calls subroutine to print lives counter

	print_string (input)	# prints the string
	read_char ($s3)		# reads user input
	
	beq $s3, Wkey, Check	# if key is entered, branch to check
	beq $s3, Skey, Check	# if key is entered, branch to check
	beq $s3, Akey, Check	# if key is entered, branch to check
	beq $s3, Dkey, Check	# if key is entered, branch to check
	beq $s3, Rkey, Start	# if key is entered, reset level (in case)
	beq $s3, Ekey, Exit	# if key is entered, exit game (option for user)
	
	j Detection		# to ignore for invalid input

# Label to check whether to move or turn when a key is entered
Check:
	beq $s2, $s3, Move	# if same input = current direction, move turtle

	beq $s3, Wkey, TurnUp	 # if input != current direction, turn accordingly
	beq $s3, Skey, TurnDown	 # if input != current direction, turn accordingly
	beq $s3, Akey, TurnLeft	 # if input != current direction, turn accordingly
	beq $s3, Dkey, TurnRight # if input != current direction, turn accordingly

# Label to call the MoveTurtle Subroutine
Move:
	arguments3($s0, $s1, $s2) # calls macro to set registers as arguments
	jal MoveTurtle		  # calls subroutine to move turtle one pixel forward
	
	j Detection		  # goes back to loop to wait for another user input

# Label to turn the turtle upwards
TurnUp:
	arguments3($s0, $s1, $s2) # calls macro to set registers as arguments
	jal EraseTurtle		  # calls subroutine to erase current turtle
	
	move $s2, $s3		  # sets user input as new direction
	arguments3($s0, $s1, $s2) # calls macro to set registers as arguments
	jal DrawTurtle		  # calls subroutine to draw the turtle using the args

	j Detection		  # goes back to loop to wait for another user input

# Label to turn the turtle downwards
TurnDown:
	arguments3($s0, $s1, $s2) # calls macro to set registers as arguments
	jal EraseTurtle		  # calls subroutine to erase current turtle
	
	move $s2, $s3		  # sets user input as new direction
	arguments3($s0, $s1, $s2) # calls macro to set registers as arguments
	jal DrawTurtle		  # calls subroutine to draw the turtle using im the args
	
	j Detection		  # goes back to loop to wait for another user input

# Label to turn the turtle left
TurnLeft:
	arguments3($s0, $s1, $s2) # calls macro to set registers as arguments
	jal EraseTurtle		  # calls subroutine to erase current turtle
	
	move $s2, $s3		  # sets user input as new direction
	arguments3($s0, $s1, $s2) # calls macro to set registers as arguments
	jal DrawTurtle		  # calls subroutine to draw the turtle using the args
	
	j Detection		  # goes back to loop to wait for another user input

# Label to turn the turtle right
TurnRight:
	arguments3($s0, $s1, $s2) # calls macro to set registers as arguments
	jal EraseTurtle		  # calls subroutine to erase current turtle
	
	move $s2, $s3		  # sets user input as new direction
	arguments3($s0, $s1, $s2) # calls macro to set registers as arguments
	jal DrawTurtle		  # calls subroutine to draw the turtle using the args
	
	j Detection		  # goes back to loop to wait for another user input

# Label to exit program
Exit:
	move $a0, $s5		# sets register as argument
	jal PrintLives		# calls subroutine to print lives counter
	
	jal GameOver		# calls subroutine for game over text and end of program
	
# Subroutines
.include "subroutines.s"
