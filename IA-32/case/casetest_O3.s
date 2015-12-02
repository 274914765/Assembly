	.file	"casetest.c"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC0:
	.string	"The results are c=%d  d=%d  e=%d\n"
	.text
	.p2align 4,,15
.globl funct1
	.type	funct1, @function
funct1:
	pushl	%ebp
	movl	$500, %edx
	movl	%esp, %ebp
	subl	$24, %esp
	movl	12(%ebp), %ecx
	movl	%edx, %eax
	imull	8(%ebp), %ecx
	sarl	$31, %edx
	movl	$.LC0, (%esp)
	idivl	%ecx
	movl	$1717986919, %edx
	movl	%ecx, 4(%esp)
	movl	%eax, 12(%esp)
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	%edx
	subl	%eax, %edx
	movl	%edx, 8(%esp)
	call	printf
	leave
	ret
	.size	funct1, .-funct1
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$16, %esp
	movl	$2, 12(%esp)
	movl	$50, 8(%esp)
	movl	$250, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	$2, 12(%esp)
	movl	$40, 8(%esp)
	movl	$200, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	xorl	%eax, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-4)"
	.section	.note.GNU-stack,"",@progbits
