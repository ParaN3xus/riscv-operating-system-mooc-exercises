# file header copied from example code

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

.macro set_struce s
	la x7, \s
	sw x5, 0(x7)
	sw x6, 4(x7)
.endm

.macro get_struce s
	la x7, \s
	lw x5, 0(x7)
	lw x6, 4(x7)
.endm

_start:
	li x5, 0x12345678
	li x6, 0x87654321
	set_struce _s
	li x5, 0
	li x6, 0
	get_struce _s


stop:
	j stop			# Infinite loop to stop execution

_s:	
	.word 0
	.word 0

.end			# End of file