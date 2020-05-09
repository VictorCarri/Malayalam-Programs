	.file	"UTF8Validator.cpp"
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.section	.text._ZNSt12_Base_bitsetILm1EEC2Ey,"axG",@progbits,_ZNSt12_Base_bitsetILm1EEC5Ey,comdat
	.align 2
	.weak	_ZNSt12_Base_bitsetILm1EEC2Ey
	.type	_ZNSt12_Base_bitsetILm1EEC2Ey, @function
_ZNSt12_Base_bitsetILm1EEC2Ey:
.LFB1037:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1037:
	.size	_ZNSt12_Base_bitsetILm1EEC2Ey, .-_ZNSt12_Base_bitsetILm1EEC2Ey
	.weak	_ZNSt12_Base_bitsetILm1EEC1Ey
	.set	_ZNSt12_Base_bitsetILm1EEC1Ey,_ZNSt12_Base_bitsetILm1EEC2Ey
	.section	.text._ZNSt12_Base_bitsetILm1EE11_S_whichbitEm,"axG",@progbits,_ZNSt12_Base_bitsetILm1EE11_S_whichbitEm,comdat
	.weak	_ZNSt12_Base_bitsetILm1EE11_S_whichbitEm
	.type	_ZNSt12_Base_bitsetILm1EE11_S_whichbitEm, @function
_ZNSt12_Base_bitsetILm1EE11_S_whichbitEm:
.LFB1041:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	andl	$63, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1041:
	.size	_ZNSt12_Base_bitsetILm1EE11_S_whichbitEm, .-_ZNSt12_Base_bitsetILm1EE11_S_whichbitEm
	.section	.text._ZNSt12_Base_bitsetILm1EE10_S_maskbitEm,"axG",@progbits,_ZNSt12_Base_bitsetILm1EE10_S_maskbitEm,comdat
	.weak	_ZNSt12_Base_bitsetILm1EE10_S_maskbitEm
	.type	_ZNSt12_Base_bitsetILm1EE10_S_maskbitEm, @function
_ZNSt12_Base_bitsetILm1EE10_S_maskbitEm:
.LFB1042:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Base_bitsetILm1EE11_S_whichbitEm@PLT
	movl	$1, %edx
	movl	%eax, %ecx
	salq	%cl, %rdx
	movq	%rdx, %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1042:
	.size	_ZNSt12_Base_bitsetILm1EE10_S_maskbitEm, .-_ZNSt12_Base_bitsetILm1EE10_S_maskbitEm
	.section	.text._ZNKSt12_Base_bitsetILm1EE10_M_getwordEm,"axG",@progbits,_ZNKSt12_Base_bitsetILm1EE10_M_getwordEm,comdat
	.align 2
	.weak	_ZNKSt12_Base_bitsetILm1EE10_M_getwordEm
	.type	_ZNKSt12_Base_bitsetILm1EE10_M_getwordEm, @function
_ZNKSt12_Base_bitsetILm1EE10_M_getwordEm:
.LFB1044:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1044:
	.size	_ZNKSt12_Base_bitsetILm1EE10_M_getwordEm, .-_ZNKSt12_Base_bitsetILm1EE10_M_getwordEm
	.section	.text._ZNSt6bitsetILm8EEC1Ey,"axG",@progbits,_ZNSt6bitsetILm8EEC1Ey,comdat
	.align 2
	.weak	_ZNSt6bitsetILm8EEC1Ey
	.type	_ZNSt6bitsetILm8EEC1Ey, @function
_ZNSt6bitsetILm8EEC1Ey:
.LFB1169:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy@PLT
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZNSt12_Base_bitsetILm1EEC2Ey@PLT
	nop
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1169:
	.size	_ZNSt6bitsetILm8EEC1Ey, .-_ZNSt6bitsetILm8EEC1Ey
	.text
	.align 2
	.globl	_ZN3vuu13UTF8ValidatorclEc
	.type	_ZN3vuu13UTF8ValidatorclEc, @function
_ZN3vuu13UTF8ValidatorclEc:
.LFB1166:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movl	%esi, %eax
	movb	%al, -44(%rbp)
	movsbq	-44(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6bitsetILm8EEC1Ey@PLT
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$6, %eax
	ja	.L10
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L12(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L12(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L12:
	.long	.L18-.L12
	.long	.L17-.L12
	.long	.L16-.L12
	.long	.L15-.L12
	.long	.L14-.L12
	.long	.L13-.L12
	.long	.L11-.L12
	.text
.L18:
	leaq	-32(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L19
	movb	$1, -17(%rbp)
	jmp	.L10
.L19:
	leaq	-32(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L21
	leaq	-32(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L21
	leaq	-32(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L21
	movl	$1, %eax
	jmp	.L22
.L21:
	movl	$0, %eax
.L22:
	testb	%al, %al
	je	.L23
	movq	-40(%rbp), %rax
	movl	$1, (%rax)
	movb	$1, -17(%rbp)
	jmp	.L10
.L23:
	leaq	-32(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	movzbl	%al, %ebx
	leaq	-32(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	movzbl	%al, %eax
	andl	%ebx, %eax
	testl	%eax, %eax
	je	.L24
	leaq	-32(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L24
	leaq	-32(%rbp), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L24
	movl	$1, %eax
	jmp	.L25
.L24:
	movl	$0, %eax
.L25:
	testb	%al, %al
	je	.L26
	movq	-40(%rbp), %rax
	movl	$2, (%rax)
	movb	$1, -17(%rbp)
	jmp	.L10
.L26:
	leaq	-32(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L27
	leaq	-32(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L27
	leaq	-32(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L27
	leaq	-32(%rbp), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L27
	leaq	-32(%rbp), %rax
	movl	$3, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L27
	movl	$1, %eax
	jmp	.L28
.L27:
	movl	$0, %eax
.L28:
	testb	%al, %al
	je	.L29
	movq	-40(%rbp), %rax
	movl	$4, (%rax)
	movb	$1, -17(%rbp)
	jmp	.L10
.L29:
	movb	$0, -17(%rbp)
	jmp	.L10
.L17:
	leaq	-32(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L30
	leaq	-32(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L30
	movl	$1, %eax
	jmp	.L31
.L30:
	movl	$0, %eax
.L31:
	testb	%al, %al
	je	.L32
	movq	-40(%rbp), %rax
	movl	$0, (%rax)
	movb	$1, -17(%rbp)
	jmp	.L10
.L32:
	movb	$0, -17(%rbp)
	jmp	.L10
.L16:
	leaq	-32(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L34
	leaq	-32(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L34
	movl	$1, %eax
	jmp	.L35
.L34:
	movl	$0, %eax
.L35:
	testb	%al, %al
	je	.L36
	movq	-40(%rbp), %rax
	movl	$3, (%rax)
	movb	$1, -17(%rbp)
	jmp	.L10
.L36:
	movb	$0, -17(%rbp)
	jmp	.L10
.L15:
	leaq	-32(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L38
	leaq	-32(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L38
	movl	$1, %eax
	jmp	.L39
.L38:
	movl	$0, %eax
.L39:
	testb	%al, %al
	je	.L40
	movq	-40(%rbp), %rax
	movl	$0, (%rax)
	movb	$1, -17(%rbp)
	jmp	.L10
.L40:
	movb	$0, -17(%rbp)
	jmp	.L10
.L14:
	leaq	-32(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L42
	leaq	-32(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L42
	movl	$1, %eax
	jmp	.L43
.L42:
	movl	$0, %eax
.L43:
	testb	%al, %al
	je	.L44
	movq	-40(%rbp), %rax
	movl	$5, (%rax)
	movb	$1, -17(%rbp)
	jmp	.L10
.L44:
	movb	$0, -17(%rbp)
	jmp	.L10
.L13:
	leaq	-32(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L46
	leaq	-32(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L46
	movl	$1, %eax
	jmp	.L47
.L46:
	movl	$0, %eax
.L47:
	testb	%al, %al
	je	.L48
	movq	-40(%rbp), %rax
	movl	$6, (%rax)
	movb	$1, -17(%rbp)
	jmp	.L10
.L48:
	movb	$0, -17(%rbp)
	jmp	.L10
.L11:
	leaq	-32(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L50
	leaq	-32(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L50
	movl	$1, %eax
	jmp	.L51
.L50:
	movl	$0, %eax
.L51:
	testb	%al, %al
	je	.L52
	movq	-40(%rbp), %rax
	movl	$0, (%rax)
	movb	$1, -17(%rbp)
	jmp	.L55
.L52:
	movb	$0, -17(%rbp)
.L55:
	nop
.L10:
	movzbl	-17(%rbp), %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1166:
	.size	_ZN3vuu13UTF8ValidatorclEc, .-_ZN3vuu13UTF8ValidatorclEc
	.align 2
	.globl	_ZN3vuu13UTF8ValidatorC2Ev
	.type	_ZN3vuu13UTF8ValidatorC2Ev, @function
_ZN3vuu13UTF8ValidatorC2Ev:
.LFB1171:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1171:
	.size	_ZN3vuu13UTF8ValidatorC2Ev, .-_ZN3vuu13UTF8ValidatorC2Ev
	.globl	_ZN3vuu13UTF8ValidatorC1Ev
	.set	_ZN3vuu13UTF8ValidatorC1Ev,_ZN3vuu13UTF8ValidatorC2Ev
	.section	.text._ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy,"axG",@progbits,_ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy,comdat
	.weak	_ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy
	.type	_ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy, @function
_ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy:
.LFB1403:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1403:
	.size	_ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy, .-_ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy
	.section	.rodata
.LC0:
	.string	"bitset::test"
	.section	.text._ZNKSt6bitsetILm8EE4testEm,"axG",@progbits,_ZNKSt6bitsetILm8EE4testEm,comdat
	.align 2
	.weak	_ZNKSt6bitsetILm8EE4testEm
	.type	_ZNKSt6bitsetILm8EE4testEm, @function
_ZNKSt6bitsetILm8EE4testEm:
.LFB1404:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE8_M_checkEmPKc@PLT
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE15_Unchecked_testEm@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1404:
	.size	_ZNKSt6bitsetILm8EE4testEm, .-_ZNKSt6bitsetILm8EE4testEm
	.section	.rodata
	.align 8
.LC1:
	.string	"%s: __position (which is %zu) >= _Nb (which is %zu)"
	.section	.text._ZNKSt6bitsetILm8EE8_M_checkEmPKc,"axG",@progbits,_ZNKSt6bitsetILm8EE8_M_checkEmPKc,comdat
	.align 2
	.weak	_ZNKSt6bitsetILm8EE8_M_checkEmPKc
	.type	_ZNKSt6bitsetILm8EE8_M_checkEmPKc, @function
_ZNKSt6bitsetILm8EE8_M_checkEmPKc:
.LFB1503:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	cmpq	$7, -16(%rbp)
	jbe	.L63
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movl	$8, %ecx
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	_ZSt24__throw_out_of_range_fmtPKcz@PLT
.L63:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1503:
	.size	_ZNKSt6bitsetILm8EE8_M_checkEmPKc, .-_ZNKSt6bitsetILm8EE8_M_checkEmPKc
	.section	.text._ZNKSt6bitsetILm8EE15_Unchecked_testEm,"axG",@progbits,_ZNKSt6bitsetILm8EE15_Unchecked_testEm,comdat
	.align 2
	.weak	_ZNKSt6bitsetILm8EE15_Unchecked_testEm
	.type	_ZNKSt6bitsetILm8EE15_Unchecked_testEm, @function
_ZNKSt6bitsetILm8EE15_Unchecked_testEm:
.LFB1504:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt12_Base_bitsetILm1EE10_M_getwordEm@PLT
	movq	%rax, %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Base_bitsetILm1EE10_S_maskbitEm@PLT
	andq	%rbx, %rax
	testq	%rax, %rax
	setne	%al
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1504:
	.size	_ZNKSt6bitsetILm8EE15_Unchecked_testEm, .-_ZNKSt6bitsetILm8EE15_Unchecked_testEm
	.ident	"GCC: (SUSE Linux) 8.2.1 20180831 [gcc-8-branch revision 264010]"
	.section	.note.GNU-stack,"",@progbits
