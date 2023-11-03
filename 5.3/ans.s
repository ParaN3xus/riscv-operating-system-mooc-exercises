# file header copied from example code

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x6, 0x1	# b
	li x7, 0x2	# c
	li x8, 0x3	# d
	li x9, 0x4	# e
	add x10,x6,x7	# b + c
	add x11,x8,x9	# d + e
	sub x5,x10,x11	# a = x10 - x11

stop:
	j stop			# Infinite loop to stop execution
	.end			# End of file
