	.file	"condtest.c"
	.text
	.p2align 4,,15
.globl conditiontest
	.type	conditiontest, @function
conditiontest:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %edx
	movl	8(%ebp), %eax
	cmpl	%edx, %eax
	jg	.L3
	movl	$0, %eax
	cmovl	%edx, %eax
.L3:
	popl	%ebp
	ret
	.size	conditiontest, .-conditiontest
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"The result is %d\n"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$16, %esp
	movl	$30, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	xorl	%eax, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-4)"
	.section	.note.GNU-stack,"",@progbits
