	.file	"Request.cpp"
	.text
	.align 2
	.globl	_ZN7RequestC2Ev
	.type	_ZN7RequestC2Ev, @function
_ZN7RequestC2Ev:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$2, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_ZN7RequestC2Ev, .-_ZN7RequestC2Ev
	.globl	_ZN7RequestC1Ev
	.set	_ZN7RequestC1Ev,_ZN7RequestC2Ev
	.align 2
	.globl	_ZN7Request10setCommandENS_7CommandE
	.type	_ZN7Request10setCommandENS_7CommandE, @function
_ZN7Request10setCommandENS_7CommandE:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_ZN7Request10setCommandENS_7CommandE, .-_ZN7Request10setCommandENS_7CommandE
	.align 2
	.globl	_ZNK7Request10getCommandEv
	.type	_ZNK7Request10getCommandEv, @function
_ZNK7Request10getCommandEv:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_ZNK7Request10getCommandEv, .-_ZNK7Request10getCommandEv
	.ident	"GCC: (SUSE Linux) 8.2.1 20180831 [gcc-8-branch revision 264010]"
	.section	.note.GNU-stack,"",@progbits
