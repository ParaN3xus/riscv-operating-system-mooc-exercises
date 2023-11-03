# file header copied from example code

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x5, 0x11111111	# a
	li x6, 0xffffffff	# a
	mv x7, x5
	mv x8, x6

stop:
	j stop			# Infinite loop to stop execution
	.end			# End of file
