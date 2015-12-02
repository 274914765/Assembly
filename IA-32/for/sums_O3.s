	.file	"sums.c"
	.text
	.p2align 4,,15
.globl sums
	.type	sums, @function
sums:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	movl	$1, %edx
	movl	8(%ebp), %ecx
	testl	%ecx, %ecx
	jle	.L3
	.p2align 4,,7
	.p2align 3
.L6:
	addl	%edx, %eax
	addl	$1, %edx
	cmpl	%edx, %ecx
	jge	.L6
.L3:
	popl	%ebp
	ret
	.size	sums, .-sums
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Value: %d   Sum: %d\n"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$16, %esp
	movl	$55, 8(%esp)
	movl	$10, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	xorl	%eax, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-4)"
	.section	.note.GNU-stack,"",@progbits
