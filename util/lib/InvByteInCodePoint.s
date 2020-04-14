	.file	"InvByteInCodePoint.cpp"
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.text
	.align 2
	.globl	_ZN3vuu18InvByteInCodePointC2EPc
	.type	_ZN3vuu18InvByteInCodePointC2EPc, @function
_ZN3vuu18InvByteInCodePointC2EPc:
.LFB1007:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt11logic_errorC2EPKc@PLT
	movq	_ZTVN3vuu18InvByteInCodePointE@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1007:
	.size	_ZN3vuu18InvByteInCodePointC2EPc, .-_ZN3vuu18InvByteInCodePointC2EPc
	.globl	_ZN3vuu18InvByteInCodePointC1EPc
	.set	_ZN3vuu18InvByteInCodePointC1EPc,_ZN3vuu18InvByteInCodePointC2EPc
	.align 2
	.globl	_ZN3vuu18InvByteInCodePointC2ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_ZN3vuu18InvByteInCodePointC2ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, @function
_ZN3vuu18InvByteInCodePointC2ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB1010:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt11logic_errorC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
	movq	_ZTVN3vuu18InvByteInCodePointE@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1010:
	.size	_ZN3vuu18InvByteInCodePointC2ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_ZN3vuu18InvByteInCodePointC2ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.globl	_ZN3vuu18InvByteInCodePointC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.set	_ZN3vuu18InvByteInCodePointC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,_ZN3vuu18InvByteInCodePointC2ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.weak	_ZTVN3vuu18InvByteInCodePointE
	.section	.data.rel.ro._ZTVN3vuu18InvByteInCodePointE,"awG",@progbits,_ZTVN3vuu18InvByteInCodePointE,comdat
	.align 8
	.type	_ZTVN3vuu18InvByteInCodePointE, @object
	.size	_ZTVN3vuu18InvByteInCodePointE, 40
_ZTVN3vuu18InvByteInCodePointE:
	.quad	0
	.quad	_ZTIN3vuu18InvByteInCodePointE
	.quad	_ZN3vuu18InvByteInCodePointD1Ev
	.quad	_ZN3vuu18InvByteInCodePointD0Ev
	.quad	_ZNKSt11logic_error4whatEv
	.section	.text._ZN3vuu18InvByteInCodePointD2Ev,"axG",@progbits,_ZN3vuu18InvByteInCodePointD5Ev,comdat
	.align 2
	.weak	_ZN3vuu18InvByteInCodePointD2Ev
	.type	_ZN3vuu18InvByteInCodePointD2Ev, @function
_ZN3vuu18InvByteInCodePointD2Ev:
.LFB1467:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	_ZTVN3vuu18InvByteInCodePointE@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt11logic_errorD2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1467:
	.size	_ZN3vuu18InvByteInCodePointD2Ev, .-_ZN3vuu18InvByteInCodePointD2Ev
	.weak	_ZN3vuu18InvByteInCodePointD1Ev
	.set	_ZN3vuu18InvByteInCodePointD1Ev,_ZN3vuu18InvByteInCodePointD2Ev
	.section	.text._ZN3vuu18InvByteInCodePointD0Ev,"axG",@progbits,_ZN3vuu18InvByteInCodePointD5Ev,comdat
	.align 2
	.weak	_ZN3vuu18InvByteInCodePointD0Ev
	.type	_ZN3vuu18InvByteInCodePointD0Ev, @function
_ZN3vuu18InvByteInCodePointD0Ev:
.LFB1469:
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
	call	_ZN3vuu18InvByteInCodePointD1Ev@PLT
	movq	-8(%rbp), %rax
	movl	$16, %esi
	movq	%rax, %rdi
	call	_ZdlPvm@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1469:
	.size	_ZN3vuu18InvByteInCodePointD0Ev, .-_ZN3vuu18InvByteInCodePointD0Ev
	.weak	_ZTIN3vuu18InvByteInCodePointE
	.section	.data.rel.ro._ZTIN3vuu18InvByteInCodePointE,"awG",@progbits,_ZTIN3vuu18InvByteInCodePointE,comdat
	.align 8
	.type	_ZTIN3vuu18InvByteInCodePointE, @object
	.size	_ZTIN3vuu18InvByteInCodePointE, 24
_ZTIN3vuu18InvByteInCodePointE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSN3vuu18InvByteInCodePointE
	.quad	_ZTISt11logic_error
	.weak	_ZTSN3vuu18InvByteInCodePointE
	.section	.rodata._ZTSN3vuu18InvByteInCodePointE,"aG",@progbits,_ZTSN3vuu18InvByteInCodePointE,comdat
	.align 16
	.type	_ZTSN3vuu18InvByteInCodePointE, @object
	.size	_ZTSN3vuu18InvByteInCodePointE, 27
_ZTSN3vuu18InvByteInCodePointE:
	.string	"N3vuu18InvByteInCodePointE"
	.ident	"GCC: (SUSE Linux) 8.2.1 20180831 [gcc-8-branch revision 264010]"
	.section	.note.GNU-stack,"",@progbits
