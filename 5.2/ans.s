# file header copied from example code

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x6, 0x1
	li x7, 0x2
	li x9, 0x3
	add x5,x6,x7
	sub x8,x5,x9

stop:
	j stop			# Infinite loop to stop execution
	.end			# End of file
