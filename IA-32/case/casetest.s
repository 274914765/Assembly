	.file	"casetest.c"
	.section	.rodata
	.align 4
.LC0:
	.string	"The results are c=%d  d=%d  e=%d\n"
	.text
.globl funct1
	.type	funct1, @function
funct1:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	movl	8(%ebp), %eax
	imull	12(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, %ecx
	imull	12(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, %edx
	imull	12(%ebp), %edx
	movl	%edx, -28(%ebp)
	movl	$500, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	-28(%ebp)
	movl	%eax, -12(%ebp)
	movl	$.LC0, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	-16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-20(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	leave
	ret
	.size	funct1, .-funct1
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	movl	$10, 24(%esp)
	movl	$25, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	call	funct1
	movl	$10, 4(%esp)
	movl	$20, (%esp)
	call	funct1
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-4)"
	.section	.note.GNU-stack,"",@progbits
