# file header copied from example code

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	la x5, _array		# char *x5 = &(array[0])
	lw x6, 0(x5)		# char x6 = *x5
	lw x7, 4(x5)		# char x7 = *(x5 + 4)

stop:
	j stop			# Infinite loop to stop execution

_array:	
	.word 0x11111111
	.word 0xffffffff

.end			# End of file