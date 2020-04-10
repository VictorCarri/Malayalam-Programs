	.file	"StateNamePrinter.cpp"
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.align 8
.LC0:
	.string	"vuu::LenCounter::LenCounter: State value "
.LC1:
	.string	" maps to string "
	.text
	.align 2
	.globl	_ZN3vuu9internals16StateNamePrinterclESt4pairINS_10LenCounter5StateENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE
	.type	_ZN3vuu9internals16StateNamePrinterclESt4pairINS_10LenCounter5StateENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE, @function
_ZN3vuu9internals16StateNamePrinterclESt4pairINS_10LenCounter5StateENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE:
.LFB1546:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leaq	.LC0(%rip), %rsi
	movq	_ZSt4cerr@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZNSolsEi@PLT
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1546:
	.size	_ZN3vuu9internals16StateNamePrinterclESt4pairINS_10LenCounter5StateENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE, .-_ZN3vuu9internals16StateNamePrinterclESt4pairINS_10LenCounter5StateENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB2036:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L4
	cmpl	$65535, -8(%rbp)
	jne	.L4
	leaq	_ZStL8__ioinit(%rip), %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	__cxa_atexit@PLT
.L4:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2036:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_StateNamePrinter.cpp, @function
_GLOBAL__sub_I_StateNamePrinter.cpp:
.LFB2037:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2037:
	.size	_GLOBAL__sub_I_StateNamePrinter.cpp, .-_GLOBAL__sub_I_StateNamePrinter.cpp
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_StateNamePrinter.cpp
	.hidden	__dso_handle
	.ident	"GCC: (SUSE Linux) 8.2.1 20180831 [gcc-8-branch revision 264010]"
	.section	.note.GNU-stack,"",@progbits
