# file header copied from example code

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x7, 0		# init x7(count)
	la x5, _arr		# init x5(location counter)

loop:
	lh x6, 0(x5)
	addi x5, x5, 2	# location counter++
	addi x7, x7, 1	# count++
	bnez x6, loop

stop:
	j stop			# Infinite loop to stop execution

_arr:	
	.half 'h'
	.half 'e'
	.half 'l'
	.half 'l'
	.half 'o'
	.half ','
	.half 'w'
	.half 'o'
	.half 'r'
	.half 'l'
	.half 'd'
	.half '!'
	.half 0

.end			# End of file