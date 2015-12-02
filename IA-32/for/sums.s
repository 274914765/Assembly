	.file	"sums.c"
	.text
.globl sums
	.type	sums, @function
sums:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -4(%ebp)
	movl	$1, -8(%ebp)
	jmp	.L2
.L3:
	movl	-8(%ebp), %eax
	addl	%eax, -4(%ebp)
	addl	$1, -8(%ebp)
.L2:
	movl	-8(%ebp), %eax
	cmpl	8(%ebp), %eax
	jle	.L3
	movl	-4(%ebp), %eax
	leave
	ret
	.size	sums, .-sums
	.section	.rodata
.LC0:
	.string	"Value: %d   Sum: %d\n"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	movl	$10, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	sums
	movl	$.LC0, %edx
	movl	%eax, 8(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	printf
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-4)"
	.section	.note.GNU-stack,"",@progbits
