	.file	"condtest.c"
	.text
.globl conditiontest
	.type	conditiontest, @function
conditiontest:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jle	.L2
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	.L3
.L2:
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jge	.L4
	movl	12(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	.L3
.L4:
	movl	$0, -4(%ebp)
.L3:
	movl	-4(%ebp), %eax
	leave
	ret
	.size	conditiontest, .-conditiontest
	.section	.rodata
.LC0:
	.string	"The result is %d\n"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	movl	$10, 24(%esp)
	movl	$30, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	call	conditiontest
	movl	$.LC0, %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	printf
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-4)"
	.section	.note.GNU-stack,"",@progbits
