# file header copied from example code

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x1, 0x1
	li x2, 0x2
	li x4, 0x3
	add x0,x1,x2
	sub x3,x0,x4

stop:
	j stop			# Infinite loop to stop execution
	.end			# End of file
