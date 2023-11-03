# file header copied from example code

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x5, 0x87654321	# a
	slli x6, x5, 16
	srli x7, x5, 16
	slli x7, x7, 16

stop:
	j stop			# Infinite loop to stop execution
	.end			# End of file
