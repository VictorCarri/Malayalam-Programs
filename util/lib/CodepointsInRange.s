	.file	"CodepointsInRange.cpp"
	.text
	.align 2
	.globl	_ZN3vuu17CodepointsInRangeC2Ejj
	.type	_ZN3vuu17CodepointsInRangeC2Ejj, @function
_ZN3vuu17CodepointsInRangeC2Ejj:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	-16(%rbp), %edx
	movl	%edx, 4(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_ZN3vuu17CodepointsInRangeC2Ejj, .-_ZN3vuu17CodepointsInRangeC2Ejj
	.globl	_ZN3vuu17CodepointsInRangeC1Ejj
	.set	_ZN3vuu17CodepointsInRangeC1Ejj,_ZN3vuu17CodepointsInRangeC2Ejj
	.align 2
	.globl	_ZN3vuu17CodepointsInRangeclEj
	.type	_ZN3vuu17CodepointsInRangeclEj, @function
_ZN3vuu17CodepointsInRangeclEj:
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
	movl	(%rax), %eax
	cmpl	%eax, -12(%rbp)
	jb	.L3
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, -12(%rbp)
	ja	.L3
	movl	$1, %eax
	jmp	.L4
.L3:
	movl	$0, %eax
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_ZN3vuu17CodepointsInRangeclEj, .-_ZN3vuu17CodepointsInRangeclEj
	.ident	"GCC: (SUSE Linux) 9.3.1 20200406 [revision 6db837a5288ee3ca5ec504fbd5a765817e556ac2]"
	.section	.note.GNU-stack,"",@progbits
