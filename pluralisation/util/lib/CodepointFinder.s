	.file	"CodepointFinder.cpp"
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.section	.text._ZNSt11char_traitsIcE6assignERcRKc,"axG",@progbits,_ZNSt11char_traitsIcE6assignERcRKc,comdat
	.weak	_ZNSt11char_traitsIcE6assignERcRKc
	.type	_ZNSt11char_traitsIcE6assignERcRKc, @function
_ZNSt11char_traitsIcE6assignERcRKc:
.LFB340:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE340:
	.size	_ZNSt11char_traitsIcE6assignERcRKc, .-_ZNSt11char_traitsIcE6assignERcRKc
	.section	.text._ZNSt11char_traitsIcE2eqERKcS2_,"axG",@progbits,_ZNSt11char_traitsIcE2eqERKcS2_,comdat
	.weak	_ZNSt11char_traitsIcE2eqERKcS2_
	.type	_ZNSt11char_traitsIcE2eqERKcS2_, @function
_ZNSt11char_traitsIcE2eqERKcS2_:
.LFB341:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	sete	%al
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE341:
	.size	_ZNSt11char_traitsIcE2eqERKcS2_, .-_ZNSt11char_traitsIcE2eqERKcS2_
	.section	.text._ZnwmPv,"axG",@progbits,_ZnwmPv,comdat
	.weak	_ZnwmPv
	.type	_ZnwmPv, @function
_ZnwmPv:
.LFB446:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE446:
	.size	_ZnwmPv, .-_ZnwmPv
	.section	.text._ZNSt12_Base_bitsetILm1EEC2Ey,"axG",@progbits,_ZNSt12_Base_bitsetILm1EEC5Ey,comdat
	.align 2
	.weak	_ZNSt12_Base_bitsetILm1EEC2Ey
	.type	_ZNSt12_Base_bitsetILm1EEC2Ey, @function
_ZNSt12_Base_bitsetILm1EEC2Ey:
.LFB1041:
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
.LFE1041:
	.size	_ZNSt12_Base_bitsetILm1EEC2Ey, .-_ZNSt12_Base_bitsetILm1EEC2Ey
	.weak	_ZNSt12_Base_bitsetILm1EEC1Ey
	.set	_ZNSt12_Base_bitsetILm1EEC1Ey,_ZNSt12_Base_bitsetILm1EEC2Ey
	.section	.text._ZNSt12_Base_bitsetILm1EE11_S_whichbitEm,"axG",@progbits,_ZNSt12_Base_bitsetILm1EE11_S_whichbitEm,comdat
	.weak	_ZNSt12_Base_bitsetILm1EE11_S_whichbitEm
	.type	_ZNSt12_Base_bitsetILm1EE11_S_whichbitEm, @function
_ZNSt12_Base_bitsetILm1EE11_S_whichbitEm:
.LFB1045:
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
.LFE1045:
	.size	_ZNSt12_Base_bitsetILm1EE11_S_whichbitEm, .-_ZNSt12_Base_bitsetILm1EE11_S_whichbitEm
	.section	.text._ZNSt12_Base_bitsetILm1EE10_S_maskbitEm,"axG",@progbits,_ZNSt12_Base_bitsetILm1EE10_S_maskbitEm,comdat
	.weak	_ZNSt12_Base_bitsetILm1EE10_S_maskbitEm
	.type	_ZNSt12_Base_bitsetILm1EE10_S_maskbitEm, @function
_ZNSt12_Base_bitsetILm1EE10_S_maskbitEm:
.LFB1046:
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
.LFE1046:
	.size	_ZNSt12_Base_bitsetILm1EE10_S_maskbitEm, .-_ZNSt12_Base_bitsetILm1EE10_S_maskbitEm
	.section	.text._ZNKSt12_Base_bitsetILm1EE10_M_getwordEm,"axG",@progbits,_ZNKSt12_Base_bitsetILm1EE10_M_getwordEm,comdat
	.align 2
	.weak	_ZNKSt12_Base_bitsetILm1EE10_M_getwordEm
	.type	_ZNKSt12_Base_bitsetILm1EE10_M_getwordEm, @function
_ZNKSt12_Base_bitsetILm1EE10_M_getwordEm:
.LFB1048:
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
.LFE1048:
	.size	_ZNKSt12_Base_bitsetILm1EE10_M_getwordEm, .-_ZNKSt12_Base_bitsetILm1EE10_M_getwordEm
	.section	.text._ZNKSt5ctypeIcE5widenEc,"axG",@progbits,_ZNKSt5ctypeIcE5widenEc,comdat
	.align 2
	.weak	_ZNKSt5ctypeIcE5widenEc
	.type	_ZNKSt5ctypeIcE5widenEc, @function
_ZNKSt5ctypeIcE5widenEc:
.LFB1433:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, %eax
	movb	%al, -12(%rbp)
	movq	-8(%rbp), %rax
	movzbl	56(%rax), %eax
	testb	%al, %al
	je	.L14
	movzbl	-12(%rbp), %eax
	movzbl	%al, %eax
	movq	-8(%rbp), %rdx
	cltq
	movzbl	57(%rdx,%rax), %eax
	jmp	.L15
.L14:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$48, %rax
	movq	(%rax), %rcx
	movsbl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	*%rcx
	nop
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1433:
	.size	_ZNKSt5ctypeIcE5widenEc, .-_ZNKSt5ctypeIcE5widenEc
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata
	.type	_ZStL13allocator_arg, @object
	.size	_ZStL13allocator_arg, 1
_ZStL13allocator_arg:
	.zero	1
	.type	_ZStL6ignore, @object
	.size	_ZStL6ignore, 1
_ZStL6ignore:
	.zero	1
	.align 4
	.type	_ZN9__gnu_cxxL21__default_lock_policyE, @object
	.size	_ZN9__gnu_cxxL21__default_lock_policyE, 4
_ZN9__gnu_cxxL21__default_lock_policyE:
	.long	2
	.type	_ZN5boost6detail19dynamic_bitset_implL15access_by_bytesE, @object
	.size	_ZN5boost6detail19dynamic_bitset_implL15access_by_bytesE, 1
_ZN5boost6detail19dynamic_bitset_implL15access_by_bytesE:
	.byte	1
	.type	_ZN5boost6detail19dynamic_bitset_implL16access_by_blocksE, @object
	.size	_ZN5boost6detail19dynamic_bitset_implL16access_by_blocksE, 1
_ZN5boost6detail19dynamic_bitset_implL16access_by_blocksE:
	.zero	1
	.align 4
	.type	_ZN5boost6detail19dynamic_bitset_implL11table_widthE, @object
	.size	_ZN5boost6detail19dynamic_bitset_implL11table_widthE, 4
_ZN5boost6detail19dynamic_bitset_implL11table_widthE:
	.long	8
	.section	.text._ZN5boost15source_locationC2EPKcjS2_j,"axG",@progbits,_ZN5boost15source_locationC5EPKcjS2_j,comdat
	.align 2
	.weak	_ZN5boost15source_locationC2EPKcjS2_j
	.type	_ZN5boost15source_locationC2EPKcjS2_j, @function
_ZN5boost15source_locationC2EPKcjS2_j:
.LFB3642:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	%rcx, -32(%rbp)
	movl	%r8d, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 16(%rax)
	movq	-8(%rbp), %rax
	movl	-24(%rbp), %edx
	movl	%edx, 20(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3642:
	.size	_ZN5boost15source_locationC2EPKcjS2_j, .-_ZN5boost15source_locationC2EPKcjS2_j
	.weak	_ZN5boost15source_locationC1EPKcjS2_j
	.set	_ZN5boost15source_locationC1EPKcjS2_j,_ZN5boost15source_locationC2EPKcjS2_j
	.section	.text._ZNK5boost15source_location9file_nameEv,"axG",@progbits,_ZNK5boost15source_location9file_nameEv,comdat
	.align 2
	.weak	_ZNK5boost15source_location9file_nameEv
	.type	_ZNK5boost15source_location9file_nameEv, @function
_ZNK5boost15source_location9file_nameEv:
.LFB3644:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3644:
	.size	_ZNK5boost15source_location9file_nameEv, .-_ZNK5boost15source_location9file_nameEv
	.section	.text._ZNK5boost15source_location13function_nameEv,"axG",@progbits,_ZNK5boost15source_location13function_nameEv,comdat
	.align 2
	.weak	_ZNK5boost15source_location13function_nameEv
	.type	_ZNK5boost15source_location13function_nameEv, @function
_ZNK5boost15source_location13function_nameEv:
.LFB3645:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3645:
	.size	_ZNK5boost15source_location13function_nameEv, .-_ZNK5boost15source_location13function_nameEv
	.section	.text._ZNK5boost15source_location4lineEv,"axG",@progbits,_ZNK5boost15source_location4lineEv,comdat
	.align 2
	.weak	_ZNK5boost15source_location4lineEv
	.type	_ZNK5boost15source_location4lineEv, @function
_ZNK5boost15source_location4lineEv:
.LFB3646:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3646:
	.size	_ZNK5boost15source_location4lineEv, .-_ZNK5boost15source_location4lineEv
	.section	.text._ZN5boost36throw_exception_assert_compatibilityERKSt9exception,"axG",@progbits,_ZN5boost36throw_exception_assert_compatibilityERKSt9exception,comdat
	.weak	_ZN5boost36throw_exception_assert_compatibilityERKSt9exception
	.type	_ZN5boost36throw_exception_assert_compatibilityERKSt9exception, @function
_ZN5boost36throw_exception_assert_compatibilityERKSt9exception:
.LFB3649:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3649:
	.size	_ZN5boost36throw_exception_assert_compatibilityERKSt9exception, .-_ZN5boost36throw_exception_assert_compatibilityERKSt9exception
	.section	.text._ZN5boost10error_infoINS_15throw_function_EPKcEC2ES3_,"axG",@progbits,_ZN5boost10error_infoINS_15throw_function_EPKcEC5ES3_,comdat
	.align 2
	.weak	_ZN5boost10error_infoINS_15throw_function_EPKcEC2ES3_
	.type	_ZN5boost10error_infoINS_15throw_function_EPKcEC2ES3_, @function
_ZN5boost10error_infoINS_15throw_function_EPKcEC2ES3_:
.LFB3659:
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
.LFE3659:
	.size	_ZN5boost10error_infoINS_15throw_function_EPKcEC2ES3_, .-_ZN5boost10error_infoINS_15throw_function_EPKcEC2ES3_
	.weak	_ZN5boost10error_infoINS_15throw_function_EPKcEC1ES3_
	.set	_ZN5boost10error_infoINS_15throw_function_EPKcEC1ES3_,_ZN5boost10error_infoINS_15throw_function_EPKcEC2ES3_
	.section	.text._ZN5boost10error_infoINS_11throw_file_EPKcEC2ES3_,"axG",@progbits,_ZN5boost10error_infoINS_11throw_file_EPKcEC5ES3_,comdat
	.align 2
	.weak	_ZN5boost10error_infoINS_11throw_file_EPKcEC2ES3_
	.type	_ZN5boost10error_infoINS_11throw_file_EPKcEC2ES3_, @function
_ZN5boost10error_infoINS_11throw_file_EPKcEC2ES3_:
.LFB3662:
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
.LFE3662:
	.size	_ZN5boost10error_infoINS_11throw_file_EPKcEC2ES3_, .-_ZN5boost10error_infoINS_11throw_file_EPKcEC2ES3_
	.weak	_ZN5boost10error_infoINS_11throw_file_EPKcEC1ES3_
	.set	_ZN5boost10error_infoINS_11throw_file_EPKcEC1ES3_,_ZN5boost10error_infoINS_11throw_file_EPKcEC2ES3_
	.section	.text._ZN5boost10error_infoINS_11throw_line_EiEC2Ei,"axG",@progbits,_ZN5boost10error_infoINS_11throw_line_EiEC5Ei,comdat
	.align 2
	.weak	_ZN5boost10error_infoINS_11throw_line_EiEC2Ei
	.type	_ZN5boost10error_infoINS_11throw_line_EiEC2Ei, @function
_ZN5boost10error_infoINS_11throw_line_EiEC2Ei:
.LFB3665:
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
.LFE3665:
	.size	_ZN5boost10error_infoINS_11throw_line_EiEC2Ei, .-_ZN5boost10error_infoINS_11throw_line_EiEC2Ei
	.weak	_ZN5boost10error_infoINS_11throw_line_EiEC1Ei
	.set	_ZN5boost10error_infoINS_11throw_line_EiEC1Ei,_ZN5boost10error_infoINS_11throw_line_EiEC2Ei
	.section	.text._ZN5boost9exceptionC2Ev,"axG",@progbits,_ZN5boost9exceptionC5Ev,comdat
	.align 2
	.weak	_ZN5boost9exceptionC2Ev
	.type	_ZN5boost9exceptionC2Ev, @function
_ZN5boost9exceptionC2Ev:
.LFB3671:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	_ZTVN5boost9exceptionE@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC1Ev@PLT
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-8(%rbp), %rax
	movl	$-1, 32(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3671:
	.size	_ZN5boost9exceptionC2Ev, .-_ZN5boost9exceptionC2Ev
	.weak	_ZN5boost9exceptionC1Ev
	.set	_ZN5boost9exceptionC1Ev,_ZN5boost9exceptionC2Ev
	.section	.text._ZN5boost9exceptionD2Ev,"axG",@progbits,_ZN5boost9exceptionD5Ev,comdat
	.align 2
	.weak	_ZN5boost9exceptionD2Ev
	.type	_ZN5boost9exceptionD2Ev, @function
_ZN5boost9exceptionD2Ev:
.LFB3674:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	_ZTVN5boost9exceptionE@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED1Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3674:
	.size	_ZN5boost9exceptionD2Ev, .-_ZN5boost9exceptionD2Ev
	.weak	_ZN5boost9exceptionD1Ev
	.set	_ZN5boost9exceptionD1Ev,_ZN5boost9exceptionD2Ev
	.section	.text._ZN5boost9exceptionD0Ev,"axG",@progbits,_ZN5boost9exceptionD5Ev,comdat
	.align 2
	.weak	_ZN5boost9exceptionD0Ev
	.type	_ZN5boost9exceptionD0Ev, @function
_ZN5boost9exceptionD0Ev:
.LFB3676:
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
	call	_ZN5boost9exceptionD1Ev@PLT
	movq	-8(%rbp), %rax
	movl	$40, %esi
	movq	%rax, %rdi
	call	_ZdlPvm@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3676:
	.size	_ZN5boost9exceptionD0Ev, .-_ZN5boost9exceptionD0Ev
	.section	.text._ZN5boost16exception_detail10clone_baseD2Ev,"axG",@progbits,_ZN5boost16exception_detail10clone_baseD5Ev,comdat
	.align 2
	.weak	_ZN5boost16exception_detail10clone_baseD2Ev
	.type	_ZN5boost16exception_detail10clone_baseD2Ev, @function
_ZN5boost16exception_detail10clone_baseD2Ev:
.LFB3684:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	_ZTVN5boost16exception_detail10clone_baseE@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3684:
	.size	_ZN5boost16exception_detail10clone_baseD2Ev, .-_ZN5boost16exception_detail10clone_baseD2Ev
	.weak	_ZN5boost16exception_detail10clone_baseD1Ev
	.set	_ZN5boost16exception_detail10clone_baseD1Ev,_ZN5boost16exception_detail10clone_baseD2Ev
	.section	.text._ZN5boost16exception_detail10clone_baseD0Ev,"axG",@progbits,_ZN5boost16exception_detail10clone_baseD5Ev,comdat
	.align 2
	.weak	_ZN5boost16exception_detail10clone_baseD0Ev
	.type	_ZN5boost16exception_detail10clone_baseD0Ev, @function
_ZN5boost16exception_detail10clone_baseD0Ev:
.LFB3686:
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
	call	_ZN5boost16exception_detail10clone_baseD1Ev@PLT
	movq	-8(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	_ZdlPvm@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3686:
	.size	_ZN5boost16exception_detail10clone_baseD0Ev, .-_ZN5boost16exception_detail10clone_baseD0Ev
	.section	.text._ZN5boost16exception_detail20copy_boost_exceptionEPNS_9exceptionEPKS1_,"axG",@progbits,_ZN5boost16exception_detail20copy_boost_exceptionEPNS_9exceptionEPKS1_,comdat
	.weak	_ZN5boost16exception_detail20copy_boost_exceptionEPNS_9exceptionEPKS1_
	.type	_ZN5boost16exception_detail20copy_boost_exceptionEPNS_9exceptionEPKS1_, @function
_ZN5boost16exception_detail20copy_boost_exceptionEPNS_9exceptionEPKS1_:
.LFB3687:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3687
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC1Ev@PLT
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	_ZNK5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE3getEv@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L33
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	addq	$40, %rax
	movq	(%rax), %rcx
	leaq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB0:
	call	*%rcx
.LEHE0:
	leaq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB1:
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEaSERKS3_@PLT
.LEHE1:
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED1Ev@PLT
.L33:
	movq	-64(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-64(%rbp), %rax
	movl	32(%rax), %edx
	movq	-56(%rbp), %rax
	movl	%edx, 32(%rax)
	movq	-64(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-56(%rbp), %rax
	leaq	8(%rax), %rdx
	leaq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
.LEHB2:
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEaSERKS3_@PLT
.LEHE2:
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED1Ev@PLT
	jmp	.L38
.L37:
	movq	%rax, %rbx
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED1Ev@PLT
	jmp	.L35
.L36:
	movq	%rax, %rbx
.L35:
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB3:
	call	_Unwind_Resume@PLT
.LEHE3:
.L38:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3687:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table._ZN5boost16exception_detail20copy_boost_exceptionEPNS_9exceptionEPKS1_,"aG",@progbits,_ZN5boost16exception_detail20copy_boost_exceptionEPNS_9exceptionEPKS1_,comdat
.LLSDA3687:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3687-.LLSDACSB3687
.LLSDACSB3687:
	.uleb128 .LEHB0-.LFB3687
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L36-.LFB3687
	.uleb128 0
	.uleb128 .LEHB1-.LFB3687
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L37-.LFB3687
	.uleb128 0
	.uleb128 .LEHB2-.LFB3687
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L36-.LFB3687
	.uleb128 0
	.uleb128 .LEHB3-.LFB3687
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSE3687:
	.section	.text._ZN5boost16exception_detail20copy_boost_exceptionEPNS_9exceptionEPKS1_,"axG",@progbits,_ZN5boost16exception_detail20copy_boost_exceptionEPNS_9exceptionEPKS1_,comdat
	.size	_ZN5boost16exception_detail20copy_boost_exceptionEPNS_9exceptionEPKS1_, .-_ZN5boost16exception_detail20copy_boost_exceptionEPNS_9exceptionEPKS1_
	.section	.rodata
	.align 4
	.type	_ZN5boost6detail16static_log2_implL6n_zeroE, @object
	.size	_ZN5boost6detail16static_log2_implL6n_zeroE, 4
_ZN5boost6detail16static_log2_implL6n_zeroE:
	.long	16
	.align 4
	.type	_ZN5boost6detail16static_log2_implL9initial_nE, @object
	.size	_ZN5boost6detail16static_log2_implL9initial_nE, 4
_ZN5boost6detail16static_log2_implL9initial_nE:
	.long	32
	.section	.text._ZNSt6bitsetILm8EEC1Ey,"axG",@progbits,_ZNSt6bitsetILm8EEC1Ey,comdat
	.align 2
	.weak	_ZNSt6bitsetILm8EEC1Ey
	.type	_ZNSt6bitsetILm8EEC1Ey, @function
_ZNSt6bitsetILm8EEC1Ey:
.LFB5403:
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
.LFE5403:
	.size	_ZNSt6bitsetILm8EEC1Ey, .-_ZNSt6bitsetILm8EEC1Ey
	.section	.text._ZN3vuu18InvByteInCodePointC2EOS0_,"axG",@progbits,_ZN3vuu18InvByteInCodePointC5EOS0_,comdat
	.align 2
	.weak	_ZN3vuu18InvByteInCodePointC2EOS0_
	.type	_ZN3vuu18InvByteInCodePointC2EOS0_, @function
_ZN3vuu18InvByteInCodePointC2EOS0_:
.LFB5405:
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
	call	_ZNSt11logic_errorC2EOS_@PLT
	movq	_ZTVN3vuu18InvByteInCodePointE@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5405:
	.size	_ZN3vuu18InvByteInCodePointC2EOS0_, .-_ZN3vuu18InvByteInCodePointC2EOS0_
	.weak	_ZN3vuu18InvByteInCodePointC1EOS0_
	.set	_ZN3vuu18InvByteInCodePointC1EOS0_,_ZN3vuu18InvByteInCodePointC2EOS0_
	.section	.rodata
	.align 8
.LC0:
	.string	"vuu::CodepointFinder::operator(): the second byte of a 2-byte codepoint is invalid!"
.LC1:
	.string	"\tInvalid byte = "
.LC2:
	.string	"\tBitstring built so far = "
	.align 8
.LC3:
	.string	"vuu::CodepointFinder::operator(): the second byte of a 3-byte codepoint is invalid!"
	.align 8
.LC4:
	.string	"vuu::CodepointFinder::operator(): the third byte of a 3-byte codepoint is invalid!"
	.align 8
.LC5:
	.string	"vuu::CodepointFinder::operator(): the second byte of a 4-byte codepoint is invalid!"
	.align 8
.LC6:
	.string	"vuu::CodepointFinder::operator(): the third byte of a 4-byte codepoint is invalid!"
	.align 8
.LC7:
	.string	"vuu::CodepointFinder::operator(): the fourth byte of a 4-byte codepoint is invalid!"
	.text
	.align 2
	.globl	_ZN3vuu15CodepointFinderclEc
	.type	_ZN3vuu15CodepointFinderclEc, @function
_ZN3vuu15CodepointFinderclEc:
.LFB5400:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5400
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1848, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -1832(%rbp)
	movl	%esi, %eax
	movb	%al, -1836(%rbp)
	movsbq	-1836(%rbp), %rdx
	leaq	-1328(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6bitsetILm8EEC1Ey@PLT
	movq	-1832(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$6, %eax
	ja	.L197
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L44(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L44(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L44:
	.long	.L50-.L44
	.long	.L49-.L44
	.long	.L48-.L44
	.long	.L47-.L44
	.long	.L46-.L44
	.long	.L45-.L44
	.long	.L43-.L44
	.text
.L50:
	leaq	-1328(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
.LEHB4:
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L51
	movq	-1832(%rbp), %rax
	leaq	8(%rax), %rdx
	movsbq	-1836(%rbp), %rax
	movq	%rax, -1320(%rbp)
	leaq	-1320(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSt12forward_listIySaIyEE10push_frontEOy@PLT
	jmp	.L198
.L51:
	leaq	-1328(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L53
	leaq	-1328(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L53
	leaq	-1328(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L53
	movl	$1, %eax
	jmp	.L54
.L53:
	movl	$0, %eax
.L54:
	testb	%al, %al
	je	.L55
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv@PLT
	leaq	16(%rax), %rbx
	leaq	-1280(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE4:
	leaq	-1312(%rbp), %rax
	leaq	-1280(%rbp), %rsi
	movq	$-1, %rcx
	movl	$3, %edx
	movq	%rax, %rdi
.LEHB5:
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm@PLT
.LEHE5:
	leaq	-1312(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB6:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
.LEHE6:
	leaq	-1312(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-1280(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	-1832(%rbp), %rax
	movl	$1, (%rax)
	jmp	.L198
.L55:
	leaq	-1328(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
.LEHB7:
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L56
	leaq	-1328(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L56
	leaq	-1328(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L56
	leaq	-1328(%rbp), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L56
	movl	$1, %eax
	jmp	.L57
.L56:
	movl	$0, %eax
.L57:
	testb	%al, %al
	je	.L58
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv@PLT
	leaq	16(%rax), %rbx
	leaq	-1216(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE7:
	leaq	-1248(%rbp), %rax
	leaq	-1216(%rbp), %rsi
	movq	$-1, %rcx
	movl	$4, %edx
	movq	%rax, %rdi
.LEHB8:
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm@PLT
.LEHE8:
	leaq	-1248(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB9:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
.LEHE9:
	leaq	-1248(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-1216(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	-1832(%rbp), %rax
	movl	$2, (%rax)
	jmp	.L198
.L58:
	leaq	-1328(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
.LEHB10:
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L59
	leaq	-1328(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L59
	leaq	-1328(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L59
	leaq	-1328(%rbp), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L59
	leaq	-1328(%rbp), %rax
	movl	$3, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L59
	movl	$1, %eax
	jmp	.L60
.L59:
	movl	$0, %eax
.L60:
	testb	%al, %al
	je	.L198
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv@PLT
	leaq	16(%rax), %rbx
	leaq	-1152(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE10:
	leaq	-1184(%rbp), %rax
	leaq	-1152(%rbp), %rsi
	movq	$-1, %rcx
	movl	$5, %edx
	movq	%rax, %rdi
.LEHB11:
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm@PLT
.LEHE11:
	leaq	-1184(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB12:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
.LEHE12:
	leaq	-1184(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-1152(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	-1832(%rbp), %rax
	movl	$4, (%rax)
	jmp	.L198
.L49:
	leaq	-1328(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
.LEHB13:
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L61
	leaq	-1328(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L61
	movl	$1, %eax
	jmp	.L62
.L61:
	movl	$0, %eax
.L62:
	testb	%al, %al
	je	.L63
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv@PLT
	leaq	16(%rax), %rbx
	leaq	-1088(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE13:
	leaq	-1120(%rbp), %rax
	leaq	-1088(%rbp), %rsi
	movq	$-1, %rcx
	movl	$2, %edx
	movq	%rax, %rdi
.LEHB14:
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm@PLT
.LEHE14:
	leaq	-1120(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB15:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
.LEHE15:
	leaq	-1120(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv@PLT
	movq	%rax, %rdx
	leaq	-1056(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB16:
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE16:
	leaq	-1056(%rbp), %rcx
	leaq	-1824(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB17:
	call	_ZN5boost14dynamic_bitsetImSaImEEC1IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE@PLT
.LEHE17:
	leaq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	-1832(%rbp), %rax
	leaq	8(%rax), %rbx
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
.LEHB18:
	call	_ZNK5boost14dynamic_bitsetImSaImEE8to_ulongEv@PLT
	movq	%rax, -1016(%rbp)
	leaq	-1016(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZNSt12forward_listIySaIyEE10push_frontEOy@PLT
	movq	-1832(%rbp), %rax
	leaq	16(%rax), %rbx
	movl	$392, %edi
	call	_Znwm@PLT
.LEHE18:
	movq	%rax, %rsi
	movq	%rsi, -1848(%rbp)
	movq	%rsi, %rdi
.LEHB19:
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1Ev@PLT
.LEHE19:
	movq	-1848(%rbp), %rsi
	movq	%rbx, %rdi
	call	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE5resetEPS5_@PLT
	movq	-1832(%rbp), %rax
	movl	$0, (%rax)
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEED1Ev@PLT
	jmp	.L48
.L63:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
.LEHB20:
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1Ev@PLT
.LEHE20:
	leaq	-1824(%rbp), %rax
	addq	$16, %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
.LEHB21:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	leaq	-1008(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE21:
	leaq	-1008(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB22:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv@PLT
	movq	%rax, %rdx
	leaq	-976(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE22:
	leaq	-976(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB23:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
.LEHE23:
	leaq	-976(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-1008(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-944(%rbp), %rax
	leaq	-1824(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB24:
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE24:
	leaq	-944(%rbp), %rdx
	leaq	-1344(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB25:
	call	_ZN3vuu18InvByteInCodePointC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE25:
	leaq	-944(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rbx
	leaq	-1344(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZN3vuu18InvByteInCodePointC1EOS0_@PLT
	movq	_ZN3vuu18InvByteInCodePointD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	_ZTIN3vuu18InvByteInCodePointE@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB26:
	call	__cxa_throw@PLT
.LEHE26:
.L48:
	leaq	-1328(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
.LEHB27:
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L64
	leaq	-1328(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L64
	movl	$1, %eax
	jmp	.L65
.L64:
	movl	$0, %eax
.L65:
	testb	%al, %al
	je	.L66
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv@PLT
	leaq	16(%rax), %rbx
	leaq	-880(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE27:
	leaq	-912(%rbp), %rax
	leaq	-880(%rbp), %rsi
	movq	$-1, %rcx
	movl	$2, %edx
	movq	%rax, %rdi
.LEHB28:
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm@PLT
.LEHE28:
	leaq	-912(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB29:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
.LEHE29:
	leaq	-912(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-880(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	-1832(%rbp), %rax
	movl	$3, (%rax)
	jmp	.L42
.L66:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
.LEHB30:
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1Ev@PLT
.LEHE30:
	leaq	-1824(%rbp), %rax
	addq	$16, %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
.LEHB31:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	leaq	-848(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE31:
	leaq	-848(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB32:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv@PLT
	movq	%rax, %rdx
	leaq	-816(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE32:
	leaq	-816(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB33:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
.LEHE33:
	leaq	-816(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-848(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-784(%rbp), %rax
	leaq	-1824(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB34:
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE34:
	leaq	-784(%rbp), %rdx
	leaq	-1360(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB35:
	call	_ZN3vuu18InvByteInCodePointC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE35:
	leaq	-784(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rbx
	leaq	-1360(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZN3vuu18InvByteInCodePointC1EOS0_@PLT
	movq	_ZN3vuu18InvByteInCodePointD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	_ZTIN3vuu18InvByteInCodePointE@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB36:
	call	__cxa_throw@PLT
.LEHE36:
.L47:
	leaq	-1328(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
.LEHB37:
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L68
	leaq	-1328(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L68
	movl	$1, %eax
	jmp	.L69
.L68:
	movl	$0, %eax
.L69:
	testb	%al, %al
	je	.L70
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv@PLT
	leaq	16(%rax), %rbx
	leaq	-720(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE37:
	leaq	-752(%rbp), %rax
	leaq	-720(%rbp), %rsi
	movq	$-1, %rcx
	movl	$2, %edx
	movq	%rax, %rdi
.LEHB38:
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm@PLT
.LEHE38:
	leaq	-752(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB39:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
.LEHE39:
	leaq	-752(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-720(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv@PLT
	movq	%rax, %rdx
	leaq	-688(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB40:
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE40:
	leaq	-688(%rbp), %rcx
	leaq	-1824(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB41:
	call	_ZN5boost14dynamic_bitsetImSaImEEC1IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE@PLT
.LEHE41:
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	-1832(%rbp), %rax
	leaq	8(%rax), %rbx
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
.LEHB42:
	call	_ZNK5boost14dynamic_bitsetImSaImEE8to_ulongEv@PLT
	movq	%rax, -648(%rbp)
	leaq	-648(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZNSt12forward_listIySaIyEE10push_frontEOy@PLT
	movq	-1832(%rbp), %rax
	leaq	16(%rax), %rbx
	movl	$392, %edi
	call	_Znwm@PLT
.LEHE42:
	movq	%rax, %rsi
	movq	%rsi, -1848(%rbp)
	movq	%rsi, %rdi
.LEHB43:
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1Ev@PLT
.LEHE43:
	movq	-1848(%rbp), %rsi
	movq	%rbx, %rdi
	call	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE5resetEPS5_@PLT
	movq	-1832(%rbp), %rax
	movl	$0, (%rax)
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEED1Ev@PLT
	jmp	.L42
.L70:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
.LEHB44:
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1Ev@PLT
.LEHE44:
	leaq	-1824(%rbp), %rax
	addq	$16, %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
.LEHB45:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	leaq	-640(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE45:
	leaq	-640(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB46:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv@PLT
	movq	%rax, %rdx
	leaq	-608(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE46:
	leaq	-608(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB47:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
.LEHE47:
	leaq	-608(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-640(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-576(%rbp), %rax
	leaq	-1824(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB48:
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE48:
	leaq	-576(%rbp), %rdx
	leaq	-1376(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB49:
	call	_ZN3vuu18InvByteInCodePointC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE49:
	leaq	-576(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rbx
	leaq	-1376(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZN3vuu18InvByteInCodePointC1EOS0_@PLT
	movq	_ZN3vuu18InvByteInCodePointD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	_ZTIN3vuu18InvByteInCodePointE@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB50:
	call	__cxa_throw@PLT
.LEHE50:
.L46:
	leaq	-1328(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
.LEHB51:
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L72
	leaq	-1328(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L72
	movl	$1, %eax
	jmp	.L73
.L72:
	movl	$0, %eax
.L73:
	testb	%al, %al
	je	.L74
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv@PLT
	leaq	16(%rax), %rbx
	leaq	-512(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE51:
	leaq	-544(%rbp), %rax
	leaq	-512(%rbp), %rsi
	movq	$-1, %rcx
	movl	$2, %edx
	movq	%rax, %rdi
.LEHB52:
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm@PLT
.LEHE52:
	leaq	-544(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB53:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
.LEHE53:
	leaq	-544(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-512(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	-1832(%rbp), %rax
	movl	$5, (%rax)
	jmp	.L42
.L74:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
.LEHB54:
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1Ev@PLT
.LEHE54:
	leaq	-1824(%rbp), %rax
	addq	$16, %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
.LEHB55:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	leaq	-480(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE55:
	leaq	-480(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB56:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv@PLT
	movq	%rax, %rdx
	leaq	-448(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE56:
	leaq	-448(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB57:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
.LEHE57:
	leaq	-448(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-480(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-416(%rbp), %rax
	leaq	-1824(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB58:
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE58:
	leaq	-416(%rbp), %rdx
	leaq	-1392(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB59:
	call	_ZN3vuu18InvByteInCodePointC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE59:
	leaq	-416(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rbx
	leaq	-1392(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZN3vuu18InvByteInCodePointC1EOS0_@PLT
	movq	_ZN3vuu18InvByteInCodePointD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	_ZTIN3vuu18InvByteInCodePointE@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB60:
	call	__cxa_throw@PLT
.LEHE60:
.L45:
	leaq	-1328(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
.LEHB61:
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L76
	leaq	-1328(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L76
	movl	$1, %eax
	jmp	.L77
.L76:
	movl	$0, %eax
.L77:
	testb	%al, %al
	je	.L78
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv@PLT
	leaq	16(%rax), %rbx
	leaq	-352(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE61:
	leaq	-384(%rbp), %rax
	leaq	-352(%rbp), %rsi
	movq	$-1, %rcx
	movl	$2, %edx
	movq	%rax, %rdi
.LEHB62:
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm@PLT
.LEHE62:
	leaq	-384(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB63:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
.LEHE63:
	leaq	-384(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-352(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	-1832(%rbp), %rax
	movl	$6, (%rax)
	jmp	.L42
.L78:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
.LEHB64:
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1Ev@PLT
.LEHE64:
	leaq	-1824(%rbp), %rax
	addq	$16, %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
.LEHB65:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	leaq	-320(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE65:
	leaq	-320(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB66:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv@PLT
	movq	%rax, %rdx
	leaq	-288(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE66:
	leaq	-288(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB67:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
.LEHE67:
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-320(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-256(%rbp), %rax
	leaq	-1824(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB68:
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE68:
	leaq	-256(%rbp), %rdx
	leaq	-1408(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB69:
	call	_ZN3vuu18InvByteInCodePointC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE69:
	leaq	-256(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rbx
	leaq	-1408(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZN3vuu18InvByteInCodePointC1EOS0_@PLT
	movq	_ZN3vuu18InvByteInCodePointD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	_ZTIN3vuu18InvByteInCodePointE@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB70:
	call	__cxa_throw@PLT
.LEHE70:
.L43:
	leaq	-1328(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
.LEHB71:
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	testb	%al, %al
	je	.L80
	leaq	-1328(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE4testEm@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L80
	movl	$1, %eax
	jmp	.L81
.L80:
	movl	$0, %eax
.L81:
	testb	%al, %al
	je	.L82
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv@PLT
	leaq	16(%rax), %rbx
	leaq	-192(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE71:
	leaq	-224(%rbp), %rax
	leaq	-192(%rbp), %rsi
	movq	$-1, %rcx
	movl	$2, %edx
	movq	%rax, %rdi
.LEHB72:
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm@PLT
.LEHE72:
	leaq	-224(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB73:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
.LEHE73:
	leaq	-224(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv@PLT
	movq	%rax, %rdx
	leaq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB74:
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE74:
	leaq	-160(%rbp), %rcx
	leaq	-1824(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB75:
	call	_ZN5boost14dynamic_bitsetImSaImEEC1IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE@PLT
.LEHE75:
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	-1832(%rbp), %rax
	leaq	8(%rax), %rbx
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
.LEHB76:
	call	_ZNK5boost14dynamic_bitsetImSaImEE8to_ulongEv@PLT
	movq	%rax, -120(%rbp)
	leaq	-120(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZNSt12forward_listIySaIyEE10push_frontEOy@PLT
	movq	-1832(%rbp), %rax
	leaq	16(%rax), %rbx
	movl	$392, %edi
	call	_Znwm@PLT
.LEHE76:
	movq	%rax, %rsi
	movq	%rsi, -1848(%rbp)
	movq	%rsi, %rdi
.LEHB77:
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1Ev@PLT
.LEHE77:
	movq	-1848(%rbp), %rsi
	movq	%rbx, %rdi
	call	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE5resetEPS5_@PLT
	movq	-1832(%rbp), %rax
	movl	$0, (%rax)
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEED1Ev@PLT
	jmp	.L197
.L82:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
.LEHB78:
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1Ev@PLT
.LEHE78:
	leaq	-1824(%rbp), %rax
	addq	$16, %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
.LEHB79:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	leaq	-112(%rbp), %rax
	leaq	-1328(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev@PLT
.LEHE79:
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB80:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rbx
	movq	-1832(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdi
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv@PLT
	movq	%rax, %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE80:
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB81:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
.LEHE81:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	leaq	-48(%rbp), %rax
	leaq	-1824(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB82:
	call	_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE82:
	leaq	-48(%rbp), %rdx
	leaq	-1424(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB83:
	call	_ZN3vuu18InvByteInCodePointC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE83:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rbx
	leaq	-1424(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZN3vuu18InvByteInCodePointC1EOS0_@PLT
	movq	_ZN3vuu18InvByteInCodePointD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	_ZTIN3vuu18InvByteInCodePointE@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB84:
	call	__cxa_throw@PLT
.LEHE84:
.L198:
	nop
.L42:
	jmp	.L197
.L141:
	movq	%rax, %rbx
	leaq	-1312(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L84
.L140:
	movq	%rax, %rbx
.L84:
	leaq	-1280(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB85:
	call	_Unwind_Resume@PLT
.L143:
	movq	%rax, %rbx
	leaq	-1248(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L86
.L142:
	movq	%rax, %rbx
.L86:
	leaq	-1216(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L145:
	movq	%rax, %rbx
	leaq	-1184(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L88
.L144:
	movq	%rax, %rbx
.L88:
	leaq	-1152(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L147:
	movq	%rax, %rbx
	leaq	-1120(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L90
.L146:
	movq	%rax, %rbx
.L90:
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L148:
	movq	%rax, %rbx
	leaq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L150:
	movq	%rax, %rbx
	movl	$392, %esi
	movq	-1848(%rbp), %rdi
	call	_ZdlPvm@PLT
	jmp	.L93
.L149:
	movq	%rax, %rbx
.L93:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L153:
	movq	%rax, %rbx
	leaq	-976(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L95
.L152:
	movq	%rax, %rbx
.L95:
	leaq	-1008(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L96
.L154:
	movq	%rax, %rbx
	leaq	-944(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L96
.L155:
	movq	%rax, %rbx
	leaq	-1344(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN3vuu18InvByteInCodePointD1Ev@PLT
	jmp	.L96
.L151:
	movq	%rax, %rbx
.L96:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L157:
	movq	%rax, %rbx
	leaq	-912(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L100
.L156:
	movq	%rax, %rbx
.L100:
	leaq	-880(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L160:
	movq	%rax, %rbx
	leaq	-816(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L102
.L159:
	movq	%rax, %rbx
.L102:
	leaq	-848(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L103
.L161:
	movq	%rax, %rbx
	leaq	-784(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L103
.L162:
	movq	%rax, %rbx
	leaq	-1360(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN3vuu18InvByteInCodePointD1Ev@PLT
	jmp	.L103
.L158:
	movq	%rax, %rbx
.L103:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L164:
	movq	%rax, %rbx
	leaq	-752(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L107
.L163:
	movq	%rax, %rbx
.L107:
	leaq	-720(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L165:
	movq	%rax, %rbx
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L167:
	movq	%rax, %rbx
	movl	$392, %esi
	movq	-1848(%rbp), %rdi
	call	_ZdlPvm@PLT
	jmp	.L110
.L166:
	movq	%rax, %rbx
.L110:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L170:
	movq	%rax, %rbx
	leaq	-608(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L112
.L169:
	movq	%rax, %rbx
.L112:
	leaq	-640(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L113
.L171:
	movq	%rax, %rbx
	leaq	-576(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L113
.L172:
	movq	%rax, %rbx
	leaq	-1376(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN3vuu18InvByteInCodePointD1Ev@PLT
	jmp	.L113
.L168:
	movq	%rax, %rbx
.L113:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L174:
	movq	%rax, %rbx
	leaq	-544(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L117
.L173:
	movq	%rax, %rbx
.L117:
	leaq	-512(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L177:
	movq	%rax, %rbx
	leaq	-448(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L119
.L176:
	movq	%rax, %rbx
.L119:
	leaq	-480(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L120
.L178:
	movq	%rax, %rbx
	leaq	-416(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L120
.L179:
	movq	%rax, %rbx
	leaq	-1392(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN3vuu18InvByteInCodePointD1Ev@PLT
	jmp	.L120
.L175:
	movq	%rax, %rbx
.L120:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L181:
	movq	%rax, %rbx
	leaq	-384(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L124
.L180:
	movq	%rax, %rbx
.L124:
	leaq	-352(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L184:
	movq	%rax, %rbx
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L126
.L183:
	movq	%rax, %rbx
.L126:
	leaq	-320(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L127
.L185:
	movq	%rax, %rbx
	leaq	-256(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L127
.L186:
	movq	%rax, %rbx
	leaq	-1408(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN3vuu18InvByteInCodePointD1Ev@PLT
	jmp	.L127
.L182:
	movq	%rax, %rbx
.L127:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L188:
	movq	%rax, %rbx
	leaq	-224(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L131
.L187:
	movq	%rax, %rbx
.L131:
	leaq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L189:
	movq	%rax, %rbx
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L191:
	movq	%rax, %rbx
	movl	$392, %esi
	movq	-1848(%rbp), %rdi
	call	_ZdlPvm@PLT
	jmp	.L134
.L190:
	movq	%rax, %rbx
.L134:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.L194:
	movq	%rax, %rbx
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L136
.L193:
	movq	%rax, %rbx
.L136:
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L137
.L195:
	movq	%rax, %rbx
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L137
.L196:
	movq	%rax, %rbx
	leaq	-1424(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN3vuu18InvByteInCodePointD1Ev@PLT
	jmp	.L137
.L192:
	movq	%rax, %rbx
.L137:
	leaq	-1824(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.LEHE85:
.L197:
	nop
	addq	$1848, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5400:
	.section	.gcc_except_table,"a",@progbits
.LLSDA5400:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5400-.LLSDACSB5400
.LLSDACSB5400:
	.uleb128 .LEHB4-.LFB5400
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB5-.LFB5400
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L140-.LFB5400
	.uleb128 0
	.uleb128 .LEHB6-.LFB5400
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L141-.LFB5400
	.uleb128 0
	.uleb128 .LEHB7-.LFB5400
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB8-.LFB5400
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L142-.LFB5400
	.uleb128 0
	.uleb128 .LEHB9-.LFB5400
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L143-.LFB5400
	.uleb128 0
	.uleb128 .LEHB10-.LFB5400
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB11-.LFB5400
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L144-.LFB5400
	.uleb128 0
	.uleb128 .LEHB12-.LFB5400
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L145-.LFB5400
	.uleb128 0
	.uleb128 .LEHB13-.LFB5400
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB14-.LFB5400
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L146-.LFB5400
	.uleb128 0
	.uleb128 .LEHB15-.LFB5400
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L147-.LFB5400
	.uleb128 0
	.uleb128 .LEHB16-.LFB5400
	.uleb128 .LEHE16-.LEHB16
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB17-.LFB5400
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L148-.LFB5400
	.uleb128 0
	.uleb128 .LEHB18-.LFB5400
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L149-.LFB5400
	.uleb128 0
	.uleb128 .LEHB19-.LFB5400
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L150-.LFB5400
	.uleb128 0
	.uleb128 .LEHB20-.LFB5400
	.uleb128 .LEHE20-.LEHB20
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB21-.LFB5400
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L151-.LFB5400
	.uleb128 0
	.uleb128 .LEHB22-.LFB5400
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L152-.LFB5400
	.uleb128 0
	.uleb128 .LEHB23-.LFB5400
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L153-.LFB5400
	.uleb128 0
	.uleb128 .LEHB24-.LFB5400
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L151-.LFB5400
	.uleb128 0
	.uleb128 .LEHB25-.LFB5400
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L154-.LFB5400
	.uleb128 0
	.uleb128 .LEHB26-.LFB5400
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L155-.LFB5400
	.uleb128 0
	.uleb128 .LEHB27-.LFB5400
	.uleb128 .LEHE27-.LEHB27
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB28-.LFB5400
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L156-.LFB5400
	.uleb128 0
	.uleb128 .LEHB29-.LFB5400
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L157-.LFB5400
	.uleb128 0
	.uleb128 .LEHB30-.LFB5400
	.uleb128 .LEHE30-.LEHB30
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB31-.LFB5400
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L158-.LFB5400
	.uleb128 0
	.uleb128 .LEHB32-.LFB5400
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L159-.LFB5400
	.uleb128 0
	.uleb128 .LEHB33-.LFB5400
	.uleb128 .LEHE33-.LEHB33
	.uleb128 .L160-.LFB5400
	.uleb128 0
	.uleb128 .LEHB34-.LFB5400
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L158-.LFB5400
	.uleb128 0
	.uleb128 .LEHB35-.LFB5400
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L161-.LFB5400
	.uleb128 0
	.uleb128 .LEHB36-.LFB5400
	.uleb128 .LEHE36-.LEHB36
	.uleb128 .L162-.LFB5400
	.uleb128 0
	.uleb128 .LEHB37-.LFB5400
	.uleb128 .LEHE37-.LEHB37
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB38-.LFB5400
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L163-.LFB5400
	.uleb128 0
	.uleb128 .LEHB39-.LFB5400
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L164-.LFB5400
	.uleb128 0
	.uleb128 .LEHB40-.LFB5400
	.uleb128 .LEHE40-.LEHB40
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB41-.LFB5400
	.uleb128 .LEHE41-.LEHB41
	.uleb128 .L165-.LFB5400
	.uleb128 0
	.uleb128 .LEHB42-.LFB5400
	.uleb128 .LEHE42-.LEHB42
	.uleb128 .L166-.LFB5400
	.uleb128 0
	.uleb128 .LEHB43-.LFB5400
	.uleb128 .LEHE43-.LEHB43
	.uleb128 .L167-.LFB5400
	.uleb128 0
	.uleb128 .LEHB44-.LFB5400
	.uleb128 .LEHE44-.LEHB44
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB45-.LFB5400
	.uleb128 .LEHE45-.LEHB45
	.uleb128 .L168-.LFB5400
	.uleb128 0
	.uleb128 .LEHB46-.LFB5400
	.uleb128 .LEHE46-.LEHB46
	.uleb128 .L169-.LFB5400
	.uleb128 0
	.uleb128 .LEHB47-.LFB5400
	.uleb128 .LEHE47-.LEHB47
	.uleb128 .L170-.LFB5400
	.uleb128 0
	.uleb128 .LEHB48-.LFB5400
	.uleb128 .LEHE48-.LEHB48
	.uleb128 .L168-.LFB5400
	.uleb128 0
	.uleb128 .LEHB49-.LFB5400
	.uleb128 .LEHE49-.LEHB49
	.uleb128 .L171-.LFB5400
	.uleb128 0
	.uleb128 .LEHB50-.LFB5400
	.uleb128 .LEHE50-.LEHB50
	.uleb128 .L172-.LFB5400
	.uleb128 0
	.uleb128 .LEHB51-.LFB5400
	.uleb128 .LEHE51-.LEHB51
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB52-.LFB5400
	.uleb128 .LEHE52-.LEHB52
	.uleb128 .L173-.LFB5400
	.uleb128 0
	.uleb128 .LEHB53-.LFB5400
	.uleb128 .LEHE53-.LEHB53
	.uleb128 .L174-.LFB5400
	.uleb128 0
	.uleb128 .LEHB54-.LFB5400
	.uleb128 .LEHE54-.LEHB54
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB55-.LFB5400
	.uleb128 .LEHE55-.LEHB55
	.uleb128 .L175-.LFB5400
	.uleb128 0
	.uleb128 .LEHB56-.LFB5400
	.uleb128 .LEHE56-.LEHB56
	.uleb128 .L176-.LFB5400
	.uleb128 0
	.uleb128 .LEHB57-.LFB5400
	.uleb128 .LEHE57-.LEHB57
	.uleb128 .L177-.LFB5400
	.uleb128 0
	.uleb128 .LEHB58-.LFB5400
	.uleb128 .LEHE58-.LEHB58
	.uleb128 .L175-.LFB5400
	.uleb128 0
	.uleb128 .LEHB59-.LFB5400
	.uleb128 .LEHE59-.LEHB59
	.uleb128 .L178-.LFB5400
	.uleb128 0
	.uleb128 .LEHB60-.LFB5400
	.uleb128 .LEHE60-.LEHB60
	.uleb128 .L179-.LFB5400
	.uleb128 0
	.uleb128 .LEHB61-.LFB5400
	.uleb128 .LEHE61-.LEHB61
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB62-.LFB5400
	.uleb128 .LEHE62-.LEHB62
	.uleb128 .L180-.LFB5400
	.uleb128 0
	.uleb128 .LEHB63-.LFB5400
	.uleb128 .LEHE63-.LEHB63
	.uleb128 .L181-.LFB5400
	.uleb128 0
	.uleb128 .LEHB64-.LFB5400
	.uleb128 .LEHE64-.LEHB64
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB65-.LFB5400
	.uleb128 .LEHE65-.LEHB65
	.uleb128 .L182-.LFB5400
	.uleb128 0
	.uleb128 .LEHB66-.LFB5400
	.uleb128 .LEHE66-.LEHB66
	.uleb128 .L183-.LFB5400
	.uleb128 0
	.uleb128 .LEHB67-.LFB5400
	.uleb128 .LEHE67-.LEHB67
	.uleb128 .L184-.LFB5400
	.uleb128 0
	.uleb128 .LEHB68-.LFB5400
	.uleb128 .LEHE68-.LEHB68
	.uleb128 .L182-.LFB5400
	.uleb128 0
	.uleb128 .LEHB69-.LFB5400
	.uleb128 .LEHE69-.LEHB69
	.uleb128 .L185-.LFB5400
	.uleb128 0
	.uleb128 .LEHB70-.LFB5400
	.uleb128 .LEHE70-.LEHB70
	.uleb128 .L186-.LFB5400
	.uleb128 0
	.uleb128 .LEHB71-.LFB5400
	.uleb128 .LEHE71-.LEHB71
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB72-.LFB5400
	.uleb128 .LEHE72-.LEHB72
	.uleb128 .L187-.LFB5400
	.uleb128 0
	.uleb128 .LEHB73-.LFB5400
	.uleb128 .LEHE73-.LEHB73
	.uleb128 .L188-.LFB5400
	.uleb128 0
	.uleb128 .LEHB74-.LFB5400
	.uleb128 .LEHE74-.LEHB74
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB75-.LFB5400
	.uleb128 .LEHE75-.LEHB75
	.uleb128 .L189-.LFB5400
	.uleb128 0
	.uleb128 .LEHB76-.LFB5400
	.uleb128 .LEHE76-.LEHB76
	.uleb128 .L190-.LFB5400
	.uleb128 0
	.uleb128 .LEHB77-.LFB5400
	.uleb128 .LEHE77-.LEHB77
	.uleb128 .L191-.LFB5400
	.uleb128 0
	.uleb128 .LEHB78-.LFB5400
	.uleb128 .LEHE78-.LEHB78
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB79-.LFB5400
	.uleb128 .LEHE79-.LEHB79
	.uleb128 .L192-.LFB5400
	.uleb128 0
	.uleb128 .LEHB80-.LFB5400
	.uleb128 .LEHE80-.LEHB80
	.uleb128 .L193-.LFB5400
	.uleb128 0
	.uleb128 .LEHB81-.LFB5400
	.uleb128 .LEHE81-.LEHB81
	.uleb128 .L194-.LFB5400
	.uleb128 0
	.uleb128 .LEHB82-.LFB5400
	.uleb128 .LEHE82-.LEHB82
	.uleb128 .L192-.LFB5400
	.uleb128 0
	.uleb128 .LEHB83-.LFB5400
	.uleb128 .LEHE83-.LEHB83
	.uleb128 .L195-.LFB5400
	.uleb128 0
	.uleb128 .LEHB84-.LFB5400
	.uleb128 .LEHE84-.LEHB84
	.uleb128 .L196-.LFB5400
	.uleb128 0
	.uleb128 .LEHB85-.LFB5400
	.uleb128 .LEHE85-.LEHB85
	.uleb128 0
	.uleb128 0
.LLSDACSE5400:
	.text
	.size	_ZN3vuu15CodepointFinderclEc, .-_ZN3vuu15CodepointFinderclEc
	.section	.text._ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implD2Ev,"axG",@progbits,_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implD5Ev,comdat
	.align 2
	.weak	_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implD2Ev
	.type	_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implD2Ev, @function
_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implD2Ev:
.LFB5411:
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
	call	_ZNSaISt14_Fwd_list_nodeIyEED2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5411:
	.size	_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implD2Ev, .-_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implD2Ev
	.weak	_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implD1Ev
	.set	_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implD1Ev,_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implD2Ev
	.section	.text._ZNSt14_Fwd_list_baseIySaIyEEC2Ev,"axG",@progbits,_ZNSt14_Fwd_list_baseIySaIyEEC5Ev,comdat
	.align 2
	.weak	_ZNSt14_Fwd_list_baseIySaIyEEC2Ev
	.type	_ZNSt14_Fwd_list_baseIySaIyEEC2Ev, @function
_ZNSt14_Fwd_list_baseIySaIyEEC2Ev:
.LFB5413:
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
	call	_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implC1Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5413:
	.size	_ZNSt14_Fwd_list_baseIySaIyEEC2Ev, .-_ZNSt14_Fwd_list_baseIySaIyEEC2Ev
	.weak	_ZNSt14_Fwd_list_baseIySaIyEEC1Ev
	.set	_ZNSt14_Fwd_list_baseIySaIyEEC1Ev,_ZNSt14_Fwd_list_baseIySaIyEEC2Ev
	.section	.text._ZNSt12forward_listIySaIyEEC2Ev,"axG",@progbits,_ZNSt12forward_listIySaIyEEC5Ev,comdat
	.align 2
	.weak	_ZNSt12forward_listIySaIyEEC2Ev
	.type	_ZNSt12forward_listIySaIyEEC2Ev, @function
_ZNSt12forward_listIySaIyEEC2Ev:
.LFB5415:
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
	call	_ZNSt14_Fwd_list_baseIySaIyEEC2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5415:
	.size	_ZNSt12forward_listIySaIyEEC2Ev, .-_ZNSt12forward_listIySaIyEEC2Ev
	.weak	_ZNSt12forward_listIySaIyEEC1Ev
	.set	_ZNSt12forward_listIySaIyEEC1Ev,_ZNSt12forward_listIySaIyEEC2Ev
	.text
	.align 2
	.globl	_ZN3vuu15CodepointFinderC2Ev
	.type	_ZN3vuu15CodepointFinderC2Ev, @function
_ZN3vuu15CodepointFinderC2Ev:
.LFB5417:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5417
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	_ZNSt12forward_listIySaIyEEC1Ev@PLT
	movq	-24(%rbp), %rax
	leaq	16(%rax), %rbx
	movl	$392, %edi
.LEHB86:
	call	_Znwm@PLT
.LEHE86:
	movq	%rax, %rsi
	movq	%rsi, -32(%rbp)
	movq	%rsi, %rdi
.LEHB87:
	call	_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1Ev@PLT
.LEHE87:
	movq	-32(%rbp), %rsi
	movq	%rbx, %rdi
	call	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC1IS7_vEEPS5_@PLT
	jmp	.L207
.L206:
	movq	%rax, %rbx
	movl	$392, %esi
	movq	-32(%rbp), %rdi
	call	_ZdlPvm@PLT
	jmp	.L204
.L205:
	movq	%rax, %rbx
.L204:
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	_ZNSt12forward_listIySaIyEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB88:
	call	_Unwind_Resume@PLT
.LEHE88:
.L207:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5417:
	.section	.gcc_except_table
.LLSDA5417:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5417-.LLSDACSB5417
.LLSDACSB5417:
	.uleb128 .LEHB86-.LFB5417
	.uleb128 .LEHE86-.LEHB86
	.uleb128 .L205-.LFB5417
	.uleb128 0
	.uleb128 .LEHB87-.LFB5417
	.uleb128 .LEHE87-.LEHB87
	.uleb128 .L206-.LFB5417
	.uleb128 0
	.uleb128 .LEHB88-.LFB5417
	.uleb128 .LEHE88-.LEHB88
	.uleb128 0
	.uleb128 0
.LLSDACSE5417:
	.text
	.size	_ZN3vuu15CodepointFinderC2Ev, .-_ZN3vuu15CodepointFinderC2Ev
	.globl	_ZN3vuu15CodepointFinderC1Ev
	.set	_ZN3vuu15CodepointFinderC1Ev,_ZN3vuu15CodepointFinderC2Ev
	.align 2
	.globl	_ZNK3vuu15CodepointFinder6cbeginEv
	.type	_ZNK3vuu15CodepointFinder6cbeginEv, @function
_ZNK3vuu15CodepointFinder6cbeginEv:
.LFB5419:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	_ZNKSt12forward_listIySaIyEE6cbeginEv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5419:
	.size	_ZNK3vuu15CodepointFinder6cbeginEv, .-_ZNK3vuu15CodepointFinder6cbeginEv
	.align 2
	.globl	_ZNK3vuu15CodepointFinder4cendEv
	.type	_ZNK3vuu15CodepointFinder4cendEv, @function
_ZNK3vuu15CodepointFinder4cendEv:
.LFB5420:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	_ZNKSt12forward_listIySaIyEE4cendEv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5420:
	.size	_ZNK3vuu15CodepointFinder4cendEv, .-_ZNK3vuu15CodepointFinder4cendEv
	.section	.text._ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2Ev,"axG",@progbits,_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC5Ev,comdat
	.align 2
	.weak	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2Ev
	.type	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2Ev, @function
_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2Ev:
.LFB5674:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5674:
	.size	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2Ev, .-_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2Ev
	.weak	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC1Ev
	.set	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC1Ev,_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2Ev
	.section	.text._ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED2Ev,"axG",@progbits,_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED5Ev,comdat
	.align 2
	.weak	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED2Ev
	.type	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED2Ev, @function
_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED2Ev:
.LFB5677:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5677
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7releaseEv@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5677:
	.section	.gcc_except_table
.LLSDA5677:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5677-.LLSDACSB5677
.LLSDACSB5677:
.LLSDACSE5677:
	.section	.text._ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED2Ev,"axG",@progbits,_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED5Ev,comdat
	.size	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED2Ev, .-_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED2Ev
	.weak	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED1Ev
	.set	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED1Ev,_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEED2Ev
	.section	.text._ZNK5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE3getEv,"axG",@progbits,_ZNK5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE3getEv,comdat
	.align 2
	.weak	_ZNK5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE3getEv
	.type	_ZNK5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE3getEv, @function
_ZNK5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE3getEv:
.LFB5679:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5679:
	.size	_ZNK5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE3getEv, .-_ZNK5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE3getEv
	.section	.text._ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEaSERKS3_,"axG",@progbits,_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEaSERKS3_,comdat
	.align 2
	.weak	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEaSERKS3_
	.type	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEaSERKS3_, @function
_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEaSERKS3_:
.LFB5680:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE5adoptEPS2_@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5680:
	.size	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEaSERKS3_, .-_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEaSERKS3_
	.section	.text._ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy,"axG",@progbits,_ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy,comdat
	.weak	_ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy
	.type	_ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy, @function
_ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy:
.LFB5707:
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
.LFE5707:
	.size	_ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy, .-_ZNSt13_Sanitize_valILm8ELb1EE18_S_do_sanitize_valEy
	.section	.rodata
.LC8:
	.string	"bitset::test"
	.section	.text._ZNKSt6bitsetILm8EE4testEm,"axG",@progbits,_ZNKSt6bitsetILm8EE4testEm,comdat
	.align 2
	.weak	_ZNKSt6bitsetILm8EE4testEm
	.type	_ZNKSt6bitsetILm8EE4testEm, @function
_ZNKSt6bitsetILm8EE4testEm:
.LFB5708:
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
	leaq	.LC8(%rip), %rdx
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
.LFE5708:
	.size	_ZNKSt6bitsetILm8EE4testEm, .-_ZNKSt6bitsetILm8EE4testEm
	.section	.text._ZNSt12forward_listIySaIyEE10push_frontEOy,"axG",@progbits,_ZNSt12forward_listIySaIyEE10push_frontEOy,comdat
	.align 2
	.weak	_ZNSt12forward_listIySaIyEE10push_frontEOy
	.type	_ZNSt12forward_listIySaIyEE10push_frontEOy, @function
_ZNSt12forward_listIySaIyEE10push_frontEOy:
.LFB5709:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRyEONSt16remove_referenceIT_E4typeEOS2_@PLT
	movq	%rax, %r12
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt12forward_listIySaIyEE13cbefore_beginEv@PLT
	movq	%r12, %rdx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZNSt14_Fwd_list_baseIySaIyEE15_M_insert_afterIJyEEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIyEDpOT_@PLT
	nop
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5709:
	.size	_ZNSt12forward_listIySaIyEE10push_frontEOy, .-_ZNSt12forward_listIySaIyEE10push_frontEOy
	.section	.text._ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv,"axG",@progbits,_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv,comdat
	.align 2
	.weak	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv
	.type	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv, @function
_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv:
.LFB5710:
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
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE3getEv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5710:
	.size	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv, .-_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEdeEv
	.section	.text._ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev,"axG",@progbits,_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev,comdat
	.align 2
	.weak	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev
	.type	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev, @function
_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev:
.LFB5711:
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
	call	_ZNKSt6bitsetILm8EE9to_stringIcSt11char_traitsIcESaIcEEENSt7__cxx1112basic_stringIT_T0_T1_EEv@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5711:
	.size	_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev, .-_ZNKSt6bitsetILm8EE9to_stringB5cxx11Ev
	.section	.text._ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv,"axG",@progbits,_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv,comdat
	.align 2
	.weak	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv
	.type	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv, @function
_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv:
.LFB5714:
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
	call	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE3getEv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5714:
	.size	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv, .-_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEptEv
	.section	.text._ZN5boost14dynamic_bitsetImSaImEEC2IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE,"axG",@progbits,_ZN5boost14dynamic_bitsetImSaImEEC5IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE,comdat
	.align 2
	.weak	_ZN5boost14dynamic_bitsetImSaImEEC2IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE
	.type	_ZN5boost14dynamic_bitsetImSaImEEC2IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE, @function
_ZN5boost14dynamic_bitsetImSaImEEC2IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE:
.LFB5717:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5717
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-40(%rbp), %rbx
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaImEC1Ev@PLT
	leaq	-17(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZNSt6vectorImSaImEEC1ERKS0_@PLT
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaImED1Ev@PLT
	movq	-40(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	$-1, %r8
	movq	$-1, %rcx
	movq	%rax, %rdi
.LEHB89:
	call	_ZN5boost14dynamic_bitsetImSaImEE16init_from_stringIcSt11char_traitsIcESaIcEEEvRKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeESF_m@PLT
.LEHE89:
	jmp	.L232
.L231:
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6vectorImSaImEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB90:
	call	_Unwind_Resume@PLT
.LEHE90:
.L232:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5717:
	.section	.gcc_except_table
.LLSDA5717:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5717-.LLSDACSB5717
.LLSDACSB5717:
	.uleb128 .LEHB89-.LFB5717
	.uleb128 .LEHE89-.LEHB89
	.uleb128 .L231-.LFB5717
	.uleb128 0
	.uleb128 .LEHB90-.LFB5717
	.uleb128 .LEHE90-.LEHB90
	.uleb128 0
	.uleb128 0
.LLSDACSE5717:
	.section	.text._ZN5boost14dynamic_bitsetImSaImEEC2IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE,"axG",@progbits,_ZN5boost14dynamic_bitsetImSaImEEC5IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE,comdat
	.size	_ZN5boost14dynamic_bitsetImSaImEEC2IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE, .-_ZN5boost14dynamic_bitsetImSaImEEC2IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE
	.weak	_ZN5boost14dynamic_bitsetImSaImEEC1IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE
	.set	_ZN5boost14dynamic_bitsetImSaImEEC1IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE,_ZN5boost14dynamic_bitsetImSaImEEC2IcSt11char_traitsIcESaIcEEERKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeE
	.section	.rodata
	.align 8
.LC9:
	.string	"boost::dynamic_bitset<Block, Allocator>::~dynamic_bitset() [with Block = long unsigned int; Allocator = std::allocator<long unsigned int>]"
	.align 8
.LC10:
	.string	"/usr/local/include/boost/dynamic_bitset/dynamic_bitset.hpp"
.LC11:
	.string	"m_check_invariants()"
	.section	.text._ZN5boost14dynamic_bitsetImSaImEED2Ev,"axG",@progbits,_ZN5boost14dynamic_bitsetImSaImEED5Ev,comdat
	.align 2
	.weak	_ZN5boost14dynamic_bitsetImSaImEED2Ev
	.type	_ZN5boost14dynamic_bitsetImSaImEED2Ev, @function
_ZN5boost14dynamic_bitsetImSaImEED2Ev:
.LFB5720:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5720
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK5boost14dynamic_bitsetImSaImEE18m_check_invariantsEv@PLT
	testb	%al, %al
	jne	.L234
	leaq	.LC9(%rip), %rcx
	movl	$701, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	call	__assert_fail@PLT
.L234:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6vectorImSaImEED1Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5720:
	.section	.gcc_except_table
.LLSDA5720:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5720-.LLSDACSB5720
.LLSDACSB5720:
.LLSDACSE5720:
	.section	.text._ZN5boost14dynamic_bitsetImSaImEED2Ev,"axG",@progbits,_ZN5boost14dynamic_bitsetImSaImEED5Ev,comdat
	.size	_ZN5boost14dynamic_bitsetImSaImEED2Ev, .-_ZN5boost14dynamic_bitsetImSaImEED2Ev
	.weak	_ZN5boost14dynamic_bitsetImSaImEED1Ev
	.set	_ZN5boost14dynamic_bitsetImSaImEED1Ev,_ZN5boost14dynamic_bitsetImSaImEED2Ev
	.section	.rodata
	.align 8
.LC12:
	.string	"long unsigned int boost::dynamic_bitset<Block, Allocator>::to_ulong() const [with Block = long unsigned int; Allocator = std::allocator<long unsigned int>]"
	.align 8
.LC13:
	.string	"boost::dynamic_bitset::to_ulong overflow"
	.align 8
.LC14:
	.string	"(last_block * bits_per_block) < static_cast<size_type>(ulong_width)"
	.section	.text._ZNK5boost14dynamic_bitsetImSaImEE8to_ulongEv,"axG",@progbits,_ZNK5boost14dynamic_bitsetImSaImEE8to_ulongEv,comdat
	.align 2
	.weak	_ZNK5boost14dynamic_bitsetImSaImEE8to_ulongEv
	.type	_ZNK5boost14dynamic_bitsetImSaImEE8to_ulongEv, @function
_ZNK5boost14dynamic_bitsetImSaImEE8to_ulongEv:
.LFB5722:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5722
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -120(%rbp)
	movq	-120(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L236
	movl	$0, %eax
	jmp	.L244
.L236:
	movq	-120(%rbp), %rax
	movl	$63, %esi
	movq	%rax, %rdi
.LEHB91:
	call	_ZNK5boost14dynamic_bitsetImSaImEE9find_nextEm@PLT
	cmpq	$-1, %rax
	setne	%al
	testb	%al, %al
	je	.L238
	leaq	-112(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC12(%rip), %rcx
	movl	$1308, %edx
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	call	_ZN5boost15source_locationC1EPKcjS2_j@PLT
	leaq	-80(%rbp), %rax
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	call	_ZNSt14overflow_errorC1EPKc@PLT
.LEHE91:
	leaq	-112(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB92:
	call	_ZN5boost15throw_exceptionISt14overflow_errorEEvRKT_RKNS_15source_locationE@PLT
.LEHE92:
.L238:
	movq	$64, -64(%rbp)
	movq	-120(%rbp), %rax
	leaq	24(%rax), %rdx
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZSt3minImERKT_S2_S2_@PLT
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	subq	$1, %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEE11block_indexEm@PLT
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	salq	$6, %rax
	cmpq	$63, %rax
	jbe	.L239
	leaq	.LC12(%rip), %rcx
	movl	$1320, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC14(%rip), %rdi
	call	__assert_fail@PLT
.L239:
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
.L241:
	movq	-32(%rbp), %rax
	cmpq	-48(%rbp), %rax
	ja	.L240
	movq	-32(%rbp), %rax
	salq	$6, %rax
	movq	%rax, -56(%rbp)
	movq	-120(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEEixEm@PLT
	movq	(%rax), %rax
	movq	-56(%rbp), %rdx
	movl	%edx, %ecx
	salq	%cl, %rax
	orq	%rax, -24(%rbp)
	addq	$1, -32(%rbp)
	jmp	.L241
.L240:
	movq	-24(%rbp), %rax
	jmp	.L244
.L243:
	movq	%rax, %rbx
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt14overflow_errorD1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB93:
	call	_Unwind_Resume@PLT
.LEHE93:
.L244:
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5722:
	.section	.gcc_except_table
.LLSDA5722:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5722-.LLSDACSB5722
.LLSDACSB5722:
	.uleb128 .LEHB91-.LFB5722
	.uleb128 .LEHE91-.LEHB91
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB92-.LFB5722
	.uleb128 .LEHE92-.LEHB92
	.uleb128 .L243-.LFB5722
	.uleb128 0
	.uleb128 .LEHB93-.LFB5722
	.uleb128 .LEHE93-.LEHB93
	.uleb128 0
	.uleb128 0
.LLSDACSE5722:
	.section	.text._ZNK5boost14dynamic_bitsetImSaImEE8to_ulongEv,"axG",@progbits,_ZNK5boost14dynamic_bitsetImSaImEE8to_ulongEv,comdat
	.size	_ZNK5boost14dynamic_bitsetImSaImEE8to_ulongEv, .-_ZNK5boost14dynamic_bitsetImSaImEE8to_ulongEv
	.section	.text._ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE5resetEPS5_,"axG",@progbits,_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE5resetEPS5_,comdat
	.align 2
	.weak	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE5resetEPS5_
	.type	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE5resetEPS5_, @function
_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE5resetEPS5_:
.LFB5730:
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
	movq	%rax, %rdi
	call	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv@PLT
	movq	%rax, %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZSt4swapIPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleISB_ESt18is_move_assignableISB_EEE5valueEvE4typeERSB_SL_@PLT
	movq	-32(%rbp), %rax
	testq	%rax, %rax
	je	.L247
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE11get_deleterEv@PLT
	movq	%rax, %rbx
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS9_@PLT
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
	call	_ZNKSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEclEPS5_@PLT
.L247:
	nop
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5730:
	.size	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE5resetEPS5_, .-_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE5resetEPS5_
	.section	.text._ZNSt19_Fwd_list_node_baseC2Ev,"axG",@progbits,_ZNSt19_Fwd_list_node_baseC5Ev,comdat
	.align 2
	.weak	_ZNSt19_Fwd_list_node_baseC2Ev
	.type	_ZNSt19_Fwd_list_node_baseC2Ev, @function
_ZNSt19_Fwd_list_node_baseC2Ev:
.LFB5740:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5740:
	.size	_ZNSt19_Fwd_list_node_baseC2Ev, .-_ZNSt19_Fwd_list_node_baseC2Ev
	.weak	_ZNSt19_Fwd_list_node_baseC1Ev
	.set	_ZNSt19_Fwd_list_node_baseC1Ev,_ZNSt19_Fwd_list_node_baseC2Ev
	.section	.text._ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implC2Ev,"axG",@progbits,_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implC5Ev,comdat
	.align 2
	.weak	_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implC2Ev
	.type	_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implC2Ev, @function
_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implC2Ev:
.LFB5742:
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
	call	_ZNSaISt14_Fwd_list_nodeIyEEC2Ev@PLT
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt19_Fwd_list_node_baseC1Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5742:
	.size	_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implC2Ev, .-_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implC2Ev
	.weak	_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implC1Ev
	.set	_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implC1Ev,_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implC2Ev
	.section	.text._ZNSaISt14_Fwd_list_nodeIyEED2Ev,"axG",@progbits,_ZNSaISt14_Fwd_list_nodeIyEED5Ev,comdat
	.align 2
	.weak	_ZNSaISt14_Fwd_list_nodeIyEED2Ev
	.type	_ZNSaISt14_Fwd_list_nodeIyEED2Ev, @function
_ZNSaISt14_Fwd_list_nodeIyEED2Ev:
.LFB5745:
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
	call	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEED2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5745:
	.size	_ZNSaISt14_Fwd_list_nodeIyEED2Ev, .-_ZNSaISt14_Fwd_list_nodeIyEED2Ev
	.weak	_ZNSaISt14_Fwd_list_nodeIyEED1Ev
	.set	_ZNSaISt14_Fwd_list_nodeIyEED1Ev,_ZNSaISt14_Fwd_list_nodeIyEED2Ev
	.section	.text._ZNSt14_Fwd_list_baseIySaIyEED2Ev,"axG",@progbits,_ZNSt14_Fwd_list_baseIySaIyEED5Ev,comdat
	.align 2
	.weak	_ZNSt14_Fwd_list_baseIySaIyEED2Ev
	.type	_ZNSt14_Fwd_list_baseIySaIyEED2Ev, @function
_ZNSt14_Fwd_list_baseIySaIyEED2Ev:
.LFB5748:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5748
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rcx
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt14_Fwd_list_baseIySaIyEE14_M_erase_afterEPSt19_Fwd_list_node_baseS3_@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt14_Fwd_list_baseIySaIyEE14_Fwd_list_implD1Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5748:
	.section	.gcc_except_table
.LLSDA5748:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5748-.LLSDACSB5748
.LLSDACSB5748:
.LLSDACSE5748:
	.section	.text._ZNSt14_Fwd_list_baseIySaIyEED2Ev,"axG",@progbits,_ZNSt14_Fwd_list_baseIySaIyEED5Ev,comdat
	.size	_ZNSt14_Fwd_list_baseIySaIyEED2Ev, .-_ZNSt14_Fwd_list_baseIySaIyEED2Ev
	.weak	_ZNSt14_Fwd_list_baseIySaIyEED1Ev
	.set	_ZNSt14_Fwd_list_baseIySaIyEED1Ev,_ZNSt14_Fwd_list_baseIySaIyEED2Ev
	.section	.text._ZNSt12forward_listIySaIyEED2Ev,"axG",@progbits,_ZNSt12forward_listIySaIyEED5Ev,comdat
	.align 2
	.weak	_ZNSt12forward_listIySaIyEED2Ev
	.type	_ZNSt12forward_listIySaIyEED2Ev, @function
_ZNSt12forward_listIySaIyEED2Ev:
.LFB5751:
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
	call	_ZNSt14_Fwd_list_baseIySaIyEED2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5751:
	.size	_ZNSt12forward_listIySaIyEED2Ev, .-_ZNSt12forward_listIySaIyEED2Ev
	.weak	_ZNSt12forward_listIySaIyEED1Ev
	.set	_ZNSt12forward_listIySaIyEED1Ev,_ZNSt12forward_listIySaIyEED2Ev
	.section	.text._ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2IS7_vEEPS5_,"axG",@progbits,_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC5IS7_vEEPS5_,comdat
	.align 2
	.weak	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2IS7_vEEPS5_
	.type	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2IS7_vEEPS5_, @function
_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2IS7_vEEPS5_:
.LFB5758:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5758
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
	call	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC1EPS5_@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5758:
	.section	.gcc_except_table
.LLSDA5758:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5758-.LLSDACSB5758
.LLSDACSB5758:
.LLSDACSE5758:
	.section	.text._ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2IS7_vEEPS5_,"axG",@progbits,_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC5IS7_vEEPS5_,comdat
	.size	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2IS7_vEEPS5_, .-_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2IS7_vEEPS5_
	.weak	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC1IS7_vEEPS5_
	.set	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC1IS7_vEEPS5_,_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2IS7_vEEPS5_
	.section	.text._ZNKSt12forward_listIySaIyEE6cbeginEv,"axG",@progbits,_ZNKSt12forward_listIySaIyEE6cbeginEv,comdat
	.align 2
	.weak	_ZNKSt12forward_listIySaIyEE6cbeginEv
	.type	_ZNKSt12forward_listIySaIyEE6cbeginEv, @function
_ZNKSt12forward_listIySaIyEE6cbeginEv:
.LFB5763:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	leaq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt24_Fwd_list_const_iteratorIyEC1EPKSt19_Fwd_list_node_base@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5763:
	.size	_ZNKSt12forward_listIySaIyEE6cbeginEv, .-_ZNKSt12forward_listIySaIyEE6cbeginEv
	.section	.text._ZNKSt12forward_listIySaIyEE4cendEv,"axG",@progbits,_ZNKSt12forward_listIySaIyEE4cendEv,comdat
	.align 2
	.weak	_ZNKSt12forward_listIySaIyEE4cendEv
	.type	_ZNKSt12forward_listIySaIyEE4cendEv, @function
_ZNKSt12forward_listIySaIyEE4cendEv:
.LFB5764:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	leaq	-8(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	_ZNSt24_Fwd_list_const_iteratorIyEC1EPKSt19_Fwd_list_node_base@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5764:
	.size	_ZNKSt12forward_listIySaIyEE4cendEv, .-_ZNKSt12forward_listIySaIyEE4cendEv
	.section	.text._ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7releaseEv,"axG",@progbits,_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7releaseEv,comdat
	.align 2
	.weak	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7releaseEv
	.type	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7releaseEv, @function
_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7releaseEv:
.LFB5877:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L259
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	(%rdx), %rdx
	addq	$32, %rdx
	movq	(%rdx), %rdx
	movq	%rax, %rdi
	call	*%rdx
	testb	%al, %al
	je	.L259
	movl	$1, %eax
	jmp	.L260
.L259:
	movl	$0, %eax
.L260:
	testb	%al, %al
	je	.L262
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
.L262:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5877:
	.size	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7releaseEv, .-_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7releaseEv
	.section	.text._ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE5adoptEPS2_,"axG",@progbits,_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE5adoptEPS2_,comdat
	.align 2
	.weak	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE5adoptEPS2_
	.type	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE5adoptEPS2_, @function
_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE5adoptEPS2_:
.LFB5878:
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
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7releaseEv@PLT
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7add_refEv@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5878:
	.size	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE5adoptEPS2_, .-_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE5adoptEPS2_
	.section	.rodata
	.align 8
.LC15:
	.string	"%s: __position (which is %zu) >= _Nb (which is %zu)"
	.section	.text._ZNKSt6bitsetILm8EE8_M_checkEmPKc,"axG",@progbits,_ZNKSt6bitsetILm8EE8_M_checkEmPKc,comdat
	.align 2
	.weak	_ZNKSt6bitsetILm8EE8_M_checkEmPKc
	.type	_ZNKSt6bitsetILm8EE8_M_checkEmPKc, @function
_ZNKSt6bitsetILm8EE8_M_checkEmPKc:
.LFB5899:
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
	jbe	.L266
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movl	$8, %ecx
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	_ZSt24__throw_out_of_range_fmtPKcz@PLT
.L266:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5899:
	.size	_ZNKSt6bitsetILm8EE8_M_checkEmPKc, .-_ZNKSt6bitsetILm8EE8_M_checkEmPKc
	.section	.text._ZNKSt6bitsetILm8EE15_Unchecked_testEm,"axG",@progbits,_ZNKSt6bitsetILm8EE15_Unchecked_testEm,comdat
	.align 2
	.weak	_ZNKSt6bitsetILm8EE15_Unchecked_testEm
	.type	_ZNKSt6bitsetILm8EE15_Unchecked_testEm, @function
_ZNKSt6bitsetILm8EE15_Unchecked_testEm:
.LFB5900:
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
.LFE5900:
	.size	_ZNKSt6bitsetILm8EE15_Unchecked_testEm, .-_ZNKSt6bitsetILm8EE15_Unchecked_testEm
	.section	.text._ZNKSt12forward_listIySaIyEE13cbefore_beginEv,"axG",@progbits,_ZNKSt12forward_listIySaIyEE13cbefore_beginEv,comdat
	.align 2
	.weak	_ZNKSt12forward_listIySaIyEE13cbefore_beginEv
	.type	_ZNKSt12forward_listIySaIyEE13cbefore_beginEv, @function
_ZNKSt12forward_listIySaIyEE13cbefore_beginEv:
.LFB5901:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rdx
	leaq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt24_Fwd_list_const_iteratorIyEC1EPKSt19_Fwd_list_node_base@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5901:
	.size	_ZNKSt12forward_listIySaIyEE13cbefore_beginEv, .-_ZNKSt12forward_listIySaIyEE13cbefore_beginEv
	.section	.text._ZSt4moveIRyEONSt16remove_referenceIT_E4typeEOS2_,"axG",@progbits,_ZSt4moveIRyEONSt16remove_referenceIT_E4typeEOS2_,comdat
	.weak	_ZSt4moveIRyEONSt16remove_referenceIT_E4typeEOS2_
	.type	_ZSt4moveIRyEONSt16remove_referenceIT_E4typeEOS2_, @function
_ZSt4moveIRyEONSt16remove_referenceIT_E4typeEOS2_:
.LFB5902:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5902:
	.size	_ZSt4moveIRyEONSt16remove_referenceIT_E4typeEOS2_, .-_ZSt4moveIRyEONSt16remove_referenceIT_E4typeEOS2_
	.section	.text._ZNSt14_Fwd_list_baseIySaIyEE15_M_insert_afterIJyEEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIyEDpOT_,"axG",@progbits,_ZNSt14_Fwd_list_baseIySaIyEE15_M_insert_afterIJyEEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIyEDpOT_,comdat
	.align 2
	.weak	_ZNSt14_Fwd_list_baseIySaIyEE15_M_insert_afterIJyEEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIyEDpOT_
	.type	_ZNSt14_Fwd_list_baseIySaIyEE15_M_insert_afterIJyEEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIyEDpOT_, @function
_ZNSt14_Fwd_list_baseIySaIyEE15_M_insert_afterIJyEEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIyEDpOT_:
.LFB5903:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt7forwardIyEOT_RNSt16remove_referenceIS0_E4typeE@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt14_Fwd_list_baseIySaIyEE14_M_create_nodeIJyEEEPSt14_Fwd_list_nodeIyEDpOT_@PLT
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5903:
	.size	_ZNSt14_Fwd_list_baseIySaIyEE15_M_insert_afterIJyEEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIyEDpOT_, .-_ZNSt14_Fwd_list_baseIySaIyEE15_M_insert_afterIJyEEEPSt19_Fwd_list_node_baseSt24_Fwd_list_const_iteratorIyEDpOT_
	.section	.text._ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE3getEv,"axG",@progbits,_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE3getEv,comdat
	.align 2
	.weak	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE3getEv
	.type	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE3getEv, @function
_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE3getEv:
.LFB5904:
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
	call	_ZNKSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5904:
	.size	_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE3getEv, .-_ZNKSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE3getEv
	.section	.text._ZNKSt6bitsetILm8EE9to_stringIcSt11char_traitsIcESaIcEEENSt7__cxx1112basic_stringIT_T0_T1_EEv,"axG",@progbits,_ZNKSt6bitsetILm8EE9to_stringIcSt11char_traitsIcESaIcEEENSt7__cxx1112basic_stringIT_T0_T1_EEv,comdat
	.align 2
	.weak	_ZNKSt6bitsetILm8EE9to_stringIcSt11char_traitsIcESaIcEEENSt7__cxx1112basic_stringIT_T0_T1_EEv
	.type	_ZNKSt6bitsetILm8EE9to_stringIcSt11char_traitsIcESaIcEEENSt7__cxx1112basic_stringIT_T0_T1_EEv, @function
_ZNKSt6bitsetILm8EE9to_stringIcSt11char_traitsIcESaIcEEENSt7__cxx1112basic_stringIT_T0_T1_EEv:
.LFB5905:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5905
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
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev@PLT
	movq	-24(%rbp), %rsi
	movq	-32(%rbp), %rax
	movl	$49, %ecx
	movl	$48, %edx
	movq	%rax, %rdi
.LEHB94:
	call	_ZNKSt6bitsetILm8EE17_M_copy_to_stringIcSt11char_traitsIcESaIcEEEvRNSt7__cxx1112basic_stringIT_T0_T1_EES7_S7_@PLT
.LEHE94:
	jmp	.L281
.L280:
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB95:
	call	_Unwind_Resume@PLT
.LEHE95:
.L281:
	movq	-24(%rbp), %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5905:
	.section	.gcc_except_table
.LLSDA5905:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5905-.LLSDACSB5905
.LLSDACSB5905:
	.uleb128 .LEHB94-.LFB5905
	.uleb128 .LEHE94-.LEHB94
	.uleb128 .L280-.LFB5905
	.uleb128 0
	.uleb128 .LEHB95-.LFB5905
	.uleb128 .LEHE95-.LEHB95
	.uleb128 0
	.uleb128 0
.LLSDACSE5905:
	.section	.text._ZNKSt6bitsetILm8EE9to_stringIcSt11char_traitsIcESaIcEEENSt7__cxx1112basic_stringIT_T0_T1_EEv,"axG",@progbits,_ZNKSt6bitsetILm8EE9to_stringIcSt11char_traitsIcESaIcEEENSt7__cxx1112basic_stringIT_T0_T1_EEv,comdat
	.size	_ZNKSt6bitsetILm8EE9to_stringIcSt11char_traitsIcESaIcEEENSt7__cxx1112basic_stringIT_T0_T1_EEv, .-_ZNKSt6bitsetILm8EE9to_stringIcSt11char_traitsIcESaIcEEENSt7__cxx1112basic_stringIT_T0_T1_EEv
	.section	.text._ZNSaImEC2Ev,"axG",@progbits,_ZNSaImEC5Ev,comdat
	.align 2
	.weak	_ZNSaImEC2Ev
	.type	_ZNSaImEC2Ev, @function
_ZNSaImEC2Ev:
.LFB5912:
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
	call	_ZN9__gnu_cxx13new_allocatorImEC2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5912:
	.size	_ZNSaImEC2Ev, .-_ZNSaImEC2Ev
	.weak	_ZNSaImEC1Ev
	.set	_ZNSaImEC1Ev,_ZNSaImEC2Ev
	.section	.text._ZNSaImED2Ev,"axG",@progbits,_ZNSaImED5Ev,comdat
	.align 2
	.weak	_ZNSaImED2Ev
	.type	_ZNSaImED2Ev, @function
_ZNSaImED2Ev:
.LFB5915:
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
	call	_ZN9__gnu_cxx13new_allocatorImED2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5915:
	.size	_ZNSaImED2Ev, .-_ZNSaImED2Ev
	.weak	_ZNSaImED1Ev
	.set	_ZNSaImED1Ev,_ZNSaImED2Ev
	.section	.text._ZNSt6vectorImSaImEEC2ERKS0_,"axG",@progbits,_ZNSt6vectorImSaImEEC5ERKS0_,comdat
	.align 2
	.weak	_ZNSt6vectorImSaImEEC2ERKS0_
	.type	_ZNSt6vectorImSaImEEC2ERKS0_, @function
_ZNSt6vectorImSaImEEC2ERKS0_:
.LFB5918:
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
	call	_ZNSt12_Vector_baseImSaImEEC2ERKS0_@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5918:
	.size	_ZNSt6vectorImSaImEEC2ERKS0_, .-_ZNSt6vectorImSaImEEC2ERKS0_
	.weak	_ZNSt6vectorImSaImEEC1ERKS0_
	.set	_ZNSt6vectorImSaImEEC1ERKS0_,_ZNSt6vectorImSaImEEC2ERKS0_
	.section	.text._ZNSt6vectorImSaImEED2Ev,"axG",@progbits,_ZNSt6vectorImSaImEED5Ev,comdat
	.align 2
	.weak	_ZNSt6vectorImSaImEED2Ev
	.type	_ZNSt6vectorImSaImEED2Ev, @function
_ZNSt6vectorImSaImEED2Ev:
.LFB5921:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5921
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZSt8_DestroyIPmmEvT_S1_RSaIT0_E@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEED2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5921:
	.section	.gcc_except_table
.LLSDA5921:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5921-.LLSDACSB5921
.LLSDACSB5921:
.LLSDACSE5921:
	.section	.text._ZNSt6vectorImSaImEED2Ev,"axG",@progbits,_ZNSt6vectorImSaImEED5Ev,comdat
	.size	_ZNSt6vectorImSaImEED2Ev, .-_ZNSt6vectorImSaImEED2Ev
	.weak	_ZNSt6vectorImSaImEED1Ev
	.set	_ZNSt6vectorImSaImEED1Ev,_ZNSt6vectorImSaImEED2Ev
	.section	.rodata
	.align 8
.LC16:
	.ascii	"void boost::dynamic_bitset<Block, Allocator>::init_from_stri"
	.ascii	"ng(const std::__cxx11::basic_string<_CharT, _Traits, _Alloc>"
	.ascii	"&, typename std::__cxx11::basic_string<_CharT, _Traits, _All"
	.ascii	"oc>::size_type, typename std::__cxx11::basic_string<_CharT, "
	.ascii	"_Traits, _Alloc>::size_type, boost::dynamic_bitset<Block, Al"
	.ascii	"locator>::size_type) [with CharT = char; Traits = std::char_"
	.ascii	"traits<char>; Alloc = std:"
	.string	":allocator<char>; Block = long unsigned int; Allocator = std::allocator<long unsigned int>; typename std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::size_type = long unsigned int; boost::dynamic_bitset<Block, Allocator>::size_type = long unsigned int]"
.LC17:
	.string	"pos <= s.size()"
	.align 8
.LC18:
	.string	"Tr::eq(c, one) || Tr::eq(c, BOOST_DYNAMIC_BITSET_WIDEN_CHAR(fac, '0'))"
	.section	.text._ZN5boost14dynamic_bitsetImSaImEE16init_from_stringIcSt11char_traitsIcESaIcEEEvRKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeESF_m,"axG",@progbits,_ZN5boost14dynamic_bitsetImSaImEE16init_from_stringIcSt11char_traitsIcESaIcEEEvRKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeESF_m,comdat
	.align 2
	.weak	_ZN5boost14dynamic_bitsetImSaImEE16init_from_stringIcSt11char_traitsIcESaIcEEEvRKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeESF_m
	.type	_ZN5boost14dynamic_bitsetImSaImEE16init_from_stringIcSt11char_traitsIcESaIcEEEvRKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeESF_m, @function
_ZN5boost14dynamic_bitsetImSaImEE16init_from_stringIcSt11char_traitsIcESaIcEEEvRKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeESF_m:
.LFB5923:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5923
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movq	%rcx, -128(%rbp)
	movq	%r8, -136(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv@PLT
	cmpq	%rax, -120(%rbp)
	jbe	.L287
	leaq	.LC16(%rip), %rcx
	movl	$436, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC17(%rip), %rdi
	call	__assert_fail@PLT
.L287:
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv@PLT
	subq	-120(%rbp), %rax
	movq	%rax, -80(%rbp)
	leaq	-80(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt3minImERKT_S2_S2_@PLT
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-136(%rbp), %rax
	cmpq	$-1, %rax
	je	.L288
	leaq	-136(%rbp), %rax
	movq	(%rax), %rax
	jmp	.L289
.L288:
	movq	-32(%rbp), %rax
.L289:
	movq	%rax, -40(%rbp)
	movq	-104(%rbp), %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEE15calc_num_blocksEm@PLT
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB96:
	call	_ZNSt6vectorImSaImEE6resizeEm@PLT
.LEHE96:
	movq	-104(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	leaq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6localeC1Ev@PLT
	leaq	-72(%rbp), %rax
	movq	%rax, %rdi
.LEHB97:
	call	_ZSt9use_facetISt5ctypeIcEERKT_RKSt6locale@PLT
.LEHE97:
	movq	%rax, -48(%rbp)
	leaq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6localeD1Ev@PLT
	movq	-48(%rbp), %rax
	movl	$49, %esi
	movq	%rax, %rdi
.LEHB98:
	call	_ZNKSt5ctypeIcE5widenEc@PLT
	movb	%al, -81(%rbp)
	movq	-136(%rbp), %rax
	cmpq	%rax, -32(%rbp)
	jbe	.L290
	leaq	-136(%rbp), %rax
	movq	(%rax), %rax
	jmp	.L291
.L290:
	movq	-32(%rbp), %rax
.L291:
	movq	%rax, -56(%rbp)
	movq	$0, -24(%rbp)
.L295:
	movq	-24(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jnb	.L298
	movq	-120(%rbp), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	subq	-24(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEixEm@PLT
	movzbl	(%rax), %eax
	movb	%al, -82(%rbp)
	leaq	-81(%rbp), %rdx
	leaq	-82(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt11char_traitsIcE2eqERKcS2_@PLT
	testb	%al, %al
	jne	.L293
	movq	-48(%rbp), %rax
	movl	$48, %esi
	movq	%rax, %rdi
	call	_ZNKSt5ctypeIcE5widenEc@PLT
	movb	%al, -57(%rbp)
	leaq	-57(%rbp), %rdx
	leaq	-82(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt11char_traitsIcE2eqERKcS2_@PLT
	testb	%al, %al
	jne	.L293
	leaq	.LC16(%rip), %rcx
	movl	$456, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC18(%rip), %rdi
	call	__assert_fail@PLT
.L293:
	leaq	-81(%rbp), %rdx
	leaq	-82(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt11char_traitsIcE2eqERKcS2_@PLT
	testb	%al, %al
	je	.L294
	movq	-24(%rbp), %rcx
	movq	-104(%rbp), %rax
	movl	$1, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEE3setEmb@PLT
.L294:
	addq	$1, -24(%rbp)
	jmp	.L295
.L297:
	movq	%rax, %rbx
	leaq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6localeD1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.LEHE98:
.L298:
	nop
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5923:
	.section	.gcc_except_table
.LLSDA5923:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5923-.LLSDACSB5923
.LLSDACSB5923:
	.uleb128 .LEHB96-.LFB5923
	.uleb128 .LEHE96-.LEHB96
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB97-.LFB5923
	.uleb128 .LEHE97-.LEHB97
	.uleb128 .L297-.LFB5923
	.uleb128 0
	.uleb128 .LEHB98-.LFB5923
	.uleb128 .LEHE98-.LEHB98
	.uleb128 0
	.uleb128 0
.LLSDACSE5923:
	.section	.text._ZN5boost14dynamic_bitsetImSaImEE16init_from_stringIcSt11char_traitsIcESaIcEEEvRKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeESF_m,"axG",@progbits,_ZN5boost14dynamic_bitsetImSaImEE16init_from_stringIcSt11char_traitsIcESaIcEEEvRKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeESF_m,comdat
	.size	_ZN5boost14dynamic_bitsetImSaImEE16init_from_stringIcSt11char_traitsIcESaIcEEEvRKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeESF_m, .-_ZN5boost14dynamic_bitsetImSaImEE16init_from_stringIcSt11char_traitsIcESaIcEEEvRKNSt7__cxx1112basic_stringIT_T0_T1_EENSC_9size_typeESF_m
	.section	.text._ZNK5boost14dynamic_bitsetImSaImEE18m_check_invariantsEv,"axG",@progbits,_ZNK5boost14dynamic_bitsetImSaImEE18m_check_invariantsEv,comdat
	.align 2
	.weak	_ZNK5boost14dynamic_bitsetImSaImEE18m_check_invariantsEv
	.type	_ZNK5boost14dynamic_bitsetImSaImEE18m_check_invariantsEv, @function
_ZNK5boost14dynamic_bitsetImSaImEE18m_check_invariantsEv:
.LFB5924:
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
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK5boost14dynamic_bitsetImSaImEE16count_extra_bitsEv@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L300
	movq	-24(%rbp), %rax
	movq	$-1, %rdx
	movl	%eax, %ecx
	salq	%cl, %rdx
	movq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK5boost14dynamic_bitsetImSaImEE15m_highest_blockEv@PLT
	movq	(%rax), %rax
	andq	-32(%rbp), %rax
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	je	.L300
	movl	$0, %eax
	jmp	.L301
.L300:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE4sizeEv@PLT
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE8capacityEv@PLT
	cmpq	%rax, %rbx
	ja	.L302
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK5boost14dynamic_bitsetImSaImEE10num_blocksEv@PLT
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK5boost14dynamic_bitsetImSaImEE4sizeEv@PLT
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEE15calc_num_blocksEm@PLT
	cmpq	%rax, %rbx
	je	.L303
.L302:
	movl	$1, %eax
	jmp	.L304
.L303:
	movl	$0, %eax
.L304:
	testb	%al, %al
	je	.L305
	movl	$0, %eax
	jmp	.L301
.L305:
	movl	$1, %eax
.L301:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5924:
	.size	_ZNK5boost14dynamic_bitsetImSaImEE18m_check_invariantsEv, .-_ZNK5boost14dynamic_bitsetImSaImEE18m_check_invariantsEv
	.section	.text._ZNK5boost14dynamic_bitsetImSaImEE9find_nextEm,"axG",@progbits,_ZNK5boost14dynamic_bitsetImSaImEE9find_nextEm,comdat
	.align 2
	.weak	_ZNK5boost14dynamic_bitsetImSaImEE9find_nextEm
	.type	_ZNK5boost14dynamic_bitsetImSaImEE9find_nextEm, @function
_ZNK5boost14dynamic_bitsetImSaImEE9find_nextEm:
.LFB5925:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK5boost14dynamic_bitsetImSaImEE4sizeEv@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	$1, %rax
	cmpq	%rax, -48(%rbp)
	jnb	.L307
	cmpq	$0, -8(%rbp)
	jne	.L308
.L307:
	movq	$-1, %rax
	jmp	.L309
.L308:
	addq	$1, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEE11block_indexEm@PLT
	movq	%rax, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEE9bit_indexEm@PLT
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEEixEm@PLT
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movl	%edx, %ecx
	shrq	%cl, %rax
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L310
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost6detail10lowest_bitImEEiT_@PLT
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	jmp	.L312
.L310:
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNK5boost14dynamic_bitsetImSaImEE14m_do_find_fromEm@PLT
.L312:
	nop
.L309:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5925:
	.size	_ZNK5boost14dynamic_bitsetImSaImEE9find_nextEm, .-_ZNK5boost14dynamic_bitsetImSaImEE9find_nextEm
	.section	.text._ZN5boost10wrapexceptISt14overflow_errorED2Ev,"axG",@progbits,_ZN5boost10wrapexceptISt14overflow_errorED5Ev,comdat
	.align 2
	.weak	_ZN5boost10wrapexceptISt14overflow_errorED2Ev
	.type	_ZN5boost10wrapexceptISt14overflow_errorED2Ev, @function
_ZN5boost10wrapexceptISt14overflow_errorED2Ev:
.LFB5928:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	_ZTVN5boost10wrapexceptISt14overflow_errorEE@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	_ZTVN5boost10wrapexceptISt14overflow_errorEE@GOTPCREL(%rip), %rax
	leaq	64(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	_ZTVN5boost10wrapexceptISt14overflow_errorEE@GOTPCREL(%rip), %rax
	leaq	104(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	_ZN5boost9exceptionD2Ev@PLT
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	_ZNSt14overflow_errorD2Ev@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail10clone_baseD2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5928:
	.size	_ZN5boost10wrapexceptISt14overflow_errorED2Ev, .-_ZN5boost10wrapexceptISt14overflow_errorED2Ev
	.weak	_ZN5boost10wrapexceptISt14overflow_errorED1Ev
	.set	_ZN5boost10wrapexceptISt14overflow_errorED1Ev,_ZN5boost10wrapexceptISt14overflow_errorED2Ev
	.set	.LTHUNK1,_ZN5boost10wrapexceptISt14overflow_errorED1Ev
	.weak	_ZThn8_N5boost10wrapexceptISt14overflow_errorED1Ev
	.type	_ZThn8_N5boost10wrapexceptISt14overflow_errorED1Ev, @function
_ZThn8_N5boost10wrapexceptISt14overflow_errorED1Ev:
.LFB6418:
	.cfi_startproc
	subq	$8, %rdi
	jmp	.LTHUNK1
	.cfi_endproc
.LFE6418:
	.size	_ZThn8_N5boost10wrapexceptISt14overflow_errorED1Ev, .-_ZThn8_N5boost10wrapexceptISt14overflow_errorED1Ev
	.set	.LTHUNK0,_ZN5boost10wrapexceptISt14overflow_errorED1Ev
	.weak	_ZThn24_N5boost10wrapexceptISt14overflow_errorED1Ev
	.type	_ZThn24_N5boost10wrapexceptISt14overflow_errorED1Ev, @function
_ZThn24_N5boost10wrapexceptISt14overflow_errorED1Ev:
.LFB6419:
	.cfi_startproc
	subq	$24, %rdi
	jmp	.LTHUNK0
	.cfi_endproc
.LFE6419:
	.size	_ZThn24_N5boost10wrapexceptISt14overflow_errorED1Ev, .-_ZThn24_N5boost10wrapexceptISt14overflow_errorED1Ev
	.section	.text._ZN5boost10wrapexceptISt14overflow_errorED0Ev,"axG",@progbits,_ZN5boost10wrapexceptISt14overflow_errorED5Ev,comdat
	.align 2
	.weak	_ZN5boost10wrapexceptISt14overflow_errorED0Ev
	.type	_ZN5boost10wrapexceptISt14overflow_errorED0Ev, @function
_ZN5boost10wrapexceptISt14overflow_errorED0Ev:
.LFB5930:
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
	call	_ZN5boost10wrapexceptISt14overflow_errorED1Ev@PLT
	movq	-8(%rbp), %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	_ZdlPvm@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5930:
	.size	_ZN5boost10wrapexceptISt14overflow_errorED0Ev, .-_ZN5boost10wrapexceptISt14overflow_errorED0Ev
	.set	.LTHUNK3,_ZN5boost10wrapexceptISt14overflow_errorED0Ev
	.weak	_ZThn8_N5boost10wrapexceptISt14overflow_errorED0Ev
	.type	_ZThn8_N5boost10wrapexceptISt14overflow_errorED0Ev, @function
_ZThn8_N5boost10wrapexceptISt14overflow_errorED0Ev:
.LFB6420:
	.cfi_startproc
	subq	$8, %rdi
	jmp	.LTHUNK3
	.cfi_endproc
.LFE6420:
	.size	_ZThn8_N5boost10wrapexceptISt14overflow_errorED0Ev, .-_ZThn8_N5boost10wrapexceptISt14overflow_errorED0Ev
	.set	.LTHUNK2,_ZN5boost10wrapexceptISt14overflow_errorED0Ev
	.weak	_ZThn24_N5boost10wrapexceptISt14overflow_errorED0Ev
	.type	_ZThn24_N5boost10wrapexceptISt14overflow_errorED0Ev, @function
_ZThn24_N5boost10wrapexceptISt14overflow_errorED0Ev:
.LFB6421:
	.cfi_startproc
	subq	$24, %rdi
	jmp	.LTHUNK2
	.cfi_endproc
.LFE6421:
	.size	_ZThn24_N5boost10wrapexceptISt14overflow_errorED0Ev, .-_ZThn24_N5boost10wrapexceptISt14overflow_errorED0Ev
	.section	.text._ZN5boost16exception_detail10clone_baseC2ERKS1_,"axG",@progbits,_ZN5boost16exception_detail10clone_baseC5ERKS1_,comdat
	.align 2
	.weak	_ZN5boost16exception_detail10clone_baseC2ERKS1_
	.type	_ZN5boost16exception_detail10clone_baseC2ERKS1_, @function
_ZN5boost16exception_detail10clone_baseC2ERKS1_:
.LFB5933:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	_ZTVN5boost16exception_detail10clone_baseE@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5933:
	.size	_ZN5boost16exception_detail10clone_baseC2ERKS1_, .-_ZN5boost16exception_detail10clone_baseC2ERKS1_
	.weak	_ZN5boost16exception_detail10clone_baseC1ERKS1_
	.set	_ZN5boost16exception_detail10clone_baseC1ERKS1_,_ZN5boost16exception_detail10clone_baseC2ERKS1_
	.section	.text._ZN5boost9exceptionC2ERKS0_,"axG",@progbits,_ZN5boost9exceptionC5ERKS0_,comdat
	.align 2
	.weak	_ZN5boost9exceptionC2ERKS0_
	.type	_ZN5boost9exceptionC2ERKS0_, @function
_ZN5boost9exceptionC2ERKS0_:
.LFB5939:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	_ZTVN5boost9exceptionE@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	-16(%rbp), %rdx
	addq	$8, %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC1ERKS3_@PLT
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-16(%rbp), %rax
	movl	32(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 32(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5939:
	.size	_ZN5boost9exceptionC2ERKS0_, .-_ZN5boost9exceptionC2ERKS0_
	.weak	_ZN5boost9exceptionC1ERKS0_
	.set	_ZN5boost9exceptionC1ERKS0_,_ZN5boost9exceptionC2ERKS0_
	.section	.text._ZN5boost15throw_exceptionISt14overflow_errorEEvRKT_RKNS_15source_locationE,"axG",@progbits,_ZN5boost15throw_exceptionISt14overflow_errorEEvRKT_RKNS_15source_locationE,comdat
	.weak	_ZN5boost15throw_exceptionISt14overflow_errorEEvRKT_RKNS_15source_locationE
	.type	_ZN5boost15throw_exceptionISt14overflow_errorEEvRKT_RKNS_15source_locationE, @function
_ZN5boost15throw_exceptionISt14overflow_errorEEvRKT_RKNS_15source_locationE:
.LFB5926:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5926
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost36throw_exception_assert_compatibilityERKSt9exception@PLT
	movl	$64, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rbx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB99:
	call	_ZN5boost10wrapexceptISt14overflow_errorEC1ERKS1_RKNS_15source_locationE@PLT
.LEHE99:
	movq	_ZN5boost10wrapexceptISt14overflow_errorED1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	_ZTIN5boost10wrapexceptISt14overflow_errorEE@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB100:
	call	__cxa_throw@PLT
.L319:
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	__cxa_free_exception@PLT
	movq	%r12, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.LEHE100:
	.cfi_endproc
.LFE5926:
	.section	.gcc_except_table
.LLSDA5926:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5926-.LLSDACSB5926
.LLSDACSB5926:
	.uleb128 .LEHB99-.LFB5926
	.uleb128 .LEHE99-.LEHB99
	.uleb128 .L319-.LFB5926
	.uleb128 0
	.uleb128 .LEHB100-.LFB5926
	.uleb128 .LEHE100-.LEHB100
	.uleb128 0
	.uleb128 0
.LLSDACSE5926:
	.section	.text._ZN5boost15throw_exceptionISt14overflow_errorEEvRKT_RKNS_15source_locationE,"axG",@progbits,_ZN5boost15throw_exceptionISt14overflow_errorEEvRKT_RKNS_15source_locationE,comdat
	.size	_ZN5boost15throw_exceptionISt14overflow_errorEEvRKT_RKNS_15source_locationE, .-_ZN5boost15throw_exceptionISt14overflow_errorEEvRKT_RKNS_15source_locationE
	.section	.text._ZSt3minImERKT_S2_S2_,"axG",@progbits,_ZSt3minImERKT_S2_S2_,comdat
	.weak	_ZSt3minImERKT_S2_S2_
	.type	_ZSt3minImERKT_S2_S2_, @function
_ZSt3minImERKT_S2_S2_:
.LFB5943:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jnb	.L321
	movq	-16(%rbp), %rax
	jmp	.L322
.L321:
	movq	-8(%rbp), %rax
.L322:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5943:
	.size	_ZSt3minImERKT_S2_S2_, .-_ZSt3minImERKT_S2_S2_
	.section	.text._ZN5boost14dynamic_bitsetImSaImEE11block_indexEm,"axG",@progbits,_ZN5boost14dynamic_bitsetImSaImEE11block_indexEm,comdat
	.weak	_ZN5boost14dynamic_bitsetImSaImEE11block_indexEm
	.type	_ZN5boost14dynamic_bitsetImSaImEE11block_indexEm, @function
_ZN5boost14dynamic_bitsetImSaImEE11block_indexEm:
.LFB5944:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	shrq	$6, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5944:
	.size	_ZN5boost14dynamic_bitsetImSaImEE11block_indexEm, .-_ZN5boost14dynamic_bitsetImSaImEE11block_indexEm
	.section	.text._ZNKSt6vectorImSaImEEixEm,"axG",@progbits,_ZNKSt6vectorImSaImEEixEm,comdat
	.align 2
	.weak	_ZNKSt6vectorImSaImEEixEm
	.type	_ZNKSt6vectorImSaImEEixEm, @function
_ZNKSt6vectorImSaImEEixEm:
.LFB5945:
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
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5945:
	.size	_ZNKSt6vectorImSaImEEixEm, .-_ZNKSt6vectorImSaImEEixEm
	.section	.text._ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv,"axG",@progbits,_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv,comdat
	.align 2
	.weak	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv
	.type	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv, @function
_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv:
.LFB5967:
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
	call	_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5967:
	.size	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv, .-_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv
	.section	.text._ZSt4moveIRPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS9_,"axG",@progbits,_ZSt4moveIRPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS9_,comdat
	.weak	_ZSt4moveIRPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS9_
	.type	_ZSt4moveIRPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS9_, @function
_ZSt4moveIRPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS9_:
.LFB5969:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5969:
	.size	_ZSt4moveIRPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS9_, .-_ZSt4moveIRPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS9_
	.section	.text._ZSt4swapIPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleISB_ESt18is_move_assignableISB_EEE5valueEvE4typeERSB_SL_,"axG",@progbits,_ZSt4swapIPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleISB_ESt18is_move_assignableISB_EEE5valueEvE4typeERSB_SL_,comdat
	.weak	_ZSt4swapIPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleISB_ESt18is_move_assignableISB_EEE5valueEvE4typeERSB_SL_
	.type	_ZSt4swapIPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleISB_ESt18is_move_assignableISB_EEE5valueEvE4typeERSB_SL_, @function
_ZSt4swapIPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleISB_ESt18is_move_assignableISB_EEE5valueEvE4typeERSB_SL_:
.LFB5968:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS9_@PLT
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS9_@PLT
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt4moveIRPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS9_@PLT
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5968:
	.size	_ZSt4swapIPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleISB_ESt18is_move_assignableISB_EEE5valueEvE4typeERSB_SL_, .-_ZSt4swapIPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleISB_ESt18is_move_assignableISB_EEE5valueEvE4typeERSB_SL_
	.section	.text._ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE11get_deleterEv,"axG",@progbits,_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE11get_deleterEv,comdat
	.align 2
	.weak	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE11get_deleterEv
	.type	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE11get_deleterEv, @function
_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE11get_deleterEv:
.LFB5970:
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
	call	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE10_M_deleterEv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5970:
	.size	_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE11get_deleterEv, .-_ZNSt10unique_ptrINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE11get_deleterEv
	.section	.text._ZNKSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEclEPS5_,"axG",@progbits,_ZNKSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEclEPS5_,comdat
	.align 2
	.weak	_ZNKSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEclEPS5_
	.type	_ZNKSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEclEPS5_, @function
_ZNKSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEclEPS5_:
.LFB5971:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	testq	%rax, %rax
	je	.L336
	movq	(%rax), %rdx
	addq	$8, %rdx
	movq	(%rdx), %rdx
	movq	%rax, %rdi
	call	*%rdx
.L336:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5971:
	.size	_ZNKSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEclEPS5_, .-_ZNKSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEclEPS5_
	.section	.text._ZNSaISt14_Fwd_list_nodeIyEEC2Ev,"axG",@progbits,_ZNSaISt14_Fwd_list_nodeIyEEC5Ev,comdat
	.align 2
	.weak	_ZNSaISt14_Fwd_list_nodeIyEEC2Ev
	.type	_ZNSaISt14_Fwd_list_nodeIyEEC2Ev, @function
_ZNSaISt14_Fwd_list_nodeIyEEC2Ev:
.LFB5976:
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
	call	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEEC2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5976:
	.size	_ZNSaISt14_Fwd_list_nodeIyEEC2Ev, .-_ZNSaISt14_Fwd_list_nodeIyEEC2Ev
	.weak	_ZNSaISt14_Fwd_list_nodeIyEEC1Ev
	.set	_ZNSaISt14_Fwd_list_nodeIyEEC1Ev,_ZNSaISt14_Fwd_list_nodeIyEEC2Ev
	.section	.text._ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEED2Ev,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEED5Ev,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEED2Ev
	.type	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEED2Ev, @function
_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEED2Ev:
.LFB5979:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5979:
	.size	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEED2Ev, .-_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEED2Ev
	.weak	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEED1Ev
	.set	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEED1Ev,_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEED2Ev
	.section	.text._ZNSt14_Fwd_list_baseIySaIyEE14_M_erase_afterEPSt19_Fwd_list_node_baseS3_,"axG",@progbits,_ZNSt14_Fwd_list_baseIySaIyEE14_M_erase_afterEPSt19_Fwd_list_node_baseS3_,comdat
	.align 2
	.weak	_ZNSt14_Fwd_list_baseIySaIyEE14_M_erase_afterEPSt19_Fwd_list_node_baseS3_
	.type	_ZNSt14_Fwd_list_baseIySaIyEE14_M_erase_afterEPSt19_Fwd_list_node_baseS3_, @function
_ZNSt14_Fwd_list_baseIySaIyEE14_M_erase_afterEPSt19_Fwd_list_node_baseS3_:
.LFB5981:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
.L341:
	movq	-24(%rbp), %rax
	cmpq	-56(%rbp), %rax
	je	.L340
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt14_Fwd_list_nodeIyE9_M_valptrEv@PLT
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt14_Fwd_list_baseIySaIyEE21_M_get_Node_allocatorEv@PLT
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE7destroyIyEEvRS2_PT_@PLT
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt14_Fwd_list_baseIySaIyEE11_M_put_nodeEPSt14_Fwd_list_nodeIyE@PLT
	jmp	.L341
.L340:
	movq	-48(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-56(%rbp), %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5981:
	.size	_ZNSt14_Fwd_list_baseIySaIyEE14_M_erase_afterEPSt19_Fwd_list_node_baseS3_, .-_ZNSt14_Fwd_list_baseIySaIyEE14_M_erase_afterEPSt19_Fwd_list_node_baseS3_
	.section	.text._ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2EPS5_,"axG",@progbits,_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC5EPS5_,comdat
	.align 2
	.weak	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2EPS5_
	.type	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2EPS5_, @function
_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2EPS5_:
.LFB5983:
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
	movq	%rax, %rdi
	call	_ZNSt5tupleIJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC1IS6_S8_Lb1EEEv@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv@PLT
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5983:
	.size	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2EPS5_, .-_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2EPS5_
	.weak	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC1EPS5_
	.set	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC1EPS5_,_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEC2EPS5_
	.section	.text._ZNSt24_Fwd_list_const_iteratorIyEC2EPKSt19_Fwd_list_node_base,"axG",@progbits,_ZNSt24_Fwd_list_const_iteratorIyEC5EPKSt19_Fwd_list_node_base,comdat
	.align 2
	.weak	_ZNSt24_Fwd_list_const_iteratorIyEC2EPKSt19_Fwd_list_node_base
	.type	_ZNSt24_Fwd_list_const_iteratorIyEC2EPKSt19_Fwd_list_node_base, @function
_ZNSt24_Fwd_list_const_iteratorIyEC2EPKSt19_Fwd_list_node_base:
.LFB5986:
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
.LFE5986:
	.size	_ZNSt24_Fwd_list_const_iteratorIyEC2EPKSt19_Fwd_list_node_base, .-_ZNSt24_Fwd_list_const_iteratorIyEC2EPKSt19_Fwd_list_node_base
	.weak	_ZNSt24_Fwd_list_const_iteratorIyEC1EPKSt19_Fwd_list_node_base
	.set	_ZNSt24_Fwd_list_const_iteratorIyEC1EPKSt19_Fwd_list_node_base,_ZNSt24_Fwd_list_const_iteratorIyEC2EPKSt19_Fwd_list_node_base
	.section	.text._ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7add_refEv,"axG",@progbits,_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7add_refEv,comdat
	.align 2
	.weak	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7add_refEv
	.type	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7add_refEv, @function
_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7add_refEv:
.LFB6022:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L347
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	(%rdx), %rdx
	addq	$24, %rdx
	movq	(%rdx), %rdx
	movq	%rax, %rdi
	call	*%rdx
.L347:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6022:
	.size	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7add_refEv, .-_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7add_refEv
	.section	.text._ZSt7forwardIyEOT_RNSt16remove_referenceIS0_E4typeE,"axG",@progbits,_ZSt7forwardIyEOT_RNSt16remove_referenceIS0_E4typeE,comdat
	.weak	_ZSt7forwardIyEOT_RNSt16remove_referenceIS0_E4typeE
	.type	_ZSt7forwardIyEOT_RNSt16remove_referenceIS0_E4typeE, @function
_ZSt7forwardIyEOT_RNSt16remove_referenceIS0_E4typeE:
.LFB6058:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6058:
	.size	_ZSt7forwardIyEOT_RNSt16remove_referenceIS0_E4typeE, .-_ZSt7forwardIyEOT_RNSt16remove_referenceIS0_E4typeE
	.section	.text._ZNSt14_Fwd_list_nodeIyEC2Ev,"axG",@progbits,_ZNSt14_Fwd_list_nodeIyEC5Ev,comdat
	.align 2
	.weak	_ZNSt14_Fwd_list_nodeIyEC2Ev
	.type	_ZNSt14_Fwd_list_nodeIyEC2Ev, @function
_ZNSt14_Fwd_list_nodeIyEC2Ev:
.LFB6061:
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
	call	_ZNSt19_Fwd_list_node_baseC2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6061:
	.size	_ZNSt14_Fwd_list_nodeIyEC2Ev, .-_ZNSt14_Fwd_list_nodeIyEC2Ev
	.weak	_ZNSt14_Fwd_list_nodeIyEC1Ev
	.set	_ZNSt14_Fwd_list_nodeIyEC1Ev,_ZNSt14_Fwd_list_nodeIyEC2Ev
	.section	.text._ZNSt14_Fwd_list_baseIySaIyEE14_M_create_nodeIJyEEEPSt14_Fwd_list_nodeIyEDpOT_,"axG",@progbits,_ZNSt14_Fwd_list_baseIySaIyEE14_M_create_nodeIJyEEEPSt14_Fwd_list_nodeIyEDpOT_,comdat
	.align 2
	.weak	_ZNSt14_Fwd_list_baseIySaIyEE14_M_create_nodeIJyEEEPSt14_Fwd_list_nodeIyEDpOT_
	.type	_ZNSt14_Fwd_list_baseIySaIyEE14_M_create_nodeIJyEEEPSt14_Fwd_list_nodeIyEDpOT_, @function
_ZNSt14_Fwd_list_baseIySaIyEE14_M_create_nodeIJyEEEPSt14_Fwd_list_nodeIyEDpOT_:
.LFB6059:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt14_Fwd_list_baseIySaIyEE11_M_get_nodeEv@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$16, %edi
	call	_ZnwmPv@PLT
	movq	%rax, %rdi
	call	_ZNSt14_Fwd_list_nodeIyEC1Ev@PLT
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt7forwardIyEOT_RNSt16remove_referenceIS0_E4typeE@PLT
	movq	%rax, %r12
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt14_Fwd_list_nodeIyE9_M_valptrEv@PLT
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt14_Fwd_list_baseIySaIyEE21_M_get_Node_allocatorEv@PLT
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE9constructIyJyEEEvRS2_PT_DpOT0_@PLT
	movq	-24(%rbp), %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6059:
	.size	_ZNSt14_Fwd_list_baseIySaIyEE14_M_create_nodeIJyEEEPSt14_Fwd_list_nodeIyEDpOT_, .-_ZNSt14_Fwd_list_baseIySaIyEE14_M_create_nodeIJyEEEPSt14_Fwd_list_nodeIyEDpOT_
	.section	.text._ZNKSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv,"axG",@progbits,_ZNKSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv,comdat
	.align 2
	.weak	_ZNKSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv
	.type	_ZNKSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv, @function
_ZNKSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv:
.LFB6063:
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
	call	_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERKNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERKSD_@PLT
	movq	(%rax), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6063:
	.size	_ZNKSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv, .-_ZNKSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE6_M_ptrEv
	.section	.text._ZNKSt6bitsetILm8EE17_M_copy_to_stringIcSt11char_traitsIcESaIcEEEvRNSt7__cxx1112basic_stringIT_T0_T1_EES7_S7_,"axG",@progbits,_ZNKSt6bitsetILm8EE17_M_copy_to_stringIcSt11char_traitsIcESaIcEEEvRNSt7__cxx1112basic_stringIT_T0_T1_EES7_S7_,comdat
	.align 2
	.weak	_ZNKSt6bitsetILm8EE17_M_copy_to_stringIcSt11char_traitsIcESaIcEEEvRNSt7__cxx1112basic_stringIT_T0_T1_EES7_S7_
	.type	_ZNKSt6bitsetILm8EE17_M_copy_to_stringIcSt11char_traitsIcESaIcEEEvRNSt7__cxx1112basic_stringIT_T0_T1_EES7_S7_, @function
_ZNKSt6bitsetILm8EE17_M_copy_to_stringIcSt11char_traitsIcESaIcEEEvRNSt7__cxx1112basic_stringIT_T0_T1_EES7_S7_:
.LFB6067:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%ecx, %eax
	movb	%dl, -36(%rbp)
	movb	%al, -40(%rbp)
	movsbl	-36(%rbp), %edx
	movq	-32(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6assignEmc@PLT
	movq	$8, -8(%rbp)
.L358:
	cmpq	$0, -8(%rbp)
	je	.L359
	movq	-8(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6bitsetILm8EE15_Unchecked_testEm@PLT
	testb	%al, %al
	je	.L357
	movl	$8, %eax
	subq	-8(%rbp), %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEixEm@PLT
	movq	%rax, %rdx
	leaq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSt11char_traitsIcE6assignERcRKc@PLT
.L357:
	subq	$1, -8(%rbp)
	jmp	.L358
.L359:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6067:
	.size	_ZNKSt6bitsetILm8EE17_M_copy_to_stringIcSt11char_traitsIcESaIcEEEvRNSt7__cxx1112basic_stringIT_T0_T1_EES7_S7_, .-_ZNKSt6bitsetILm8EE17_M_copy_to_stringIcSt11char_traitsIcESaIcEEEvRNSt7__cxx1112basic_stringIT_T0_T1_EES7_S7_
	.section	.text._ZN9__gnu_cxx13new_allocatorImEC2Ev,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorImEC5Ev,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorImEC2Ev
	.type	_ZN9__gnu_cxx13new_allocatorImEC2Ev, @function
_ZN9__gnu_cxx13new_allocatorImEC2Ev:
.LFB6081:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6081:
	.size	_ZN9__gnu_cxx13new_allocatorImEC2Ev, .-_ZN9__gnu_cxx13new_allocatorImEC2Ev
	.weak	_ZN9__gnu_cxx13new_allocatorImEC1Ev
	.set	_ZN9__gnu_cxx13new_allocatorImEC1Ev,_ZN9__gnu_cxx13new_allocatorImEC2Ev
	.section	.text._ZN9__gnu_cxx13new_allocatorImED2Ev,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorImED5Ev,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorImED2Ev
	.type	_ZN9__gnu_cxx13new_allocatorImED2Ev, @function
_ZN9__gnu_cxx13new_allocatorImED2Ev:
.LFB6084:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6084:
	.size	_ZN9__gnu_cxx13new_allocatorImED2Ev, .-_ZN9__gnu_cxx13new_allocatorImED2Ev
	.weak	_ZN9__gnu_cxx13new_allocatorImED1Ev
	.set	_ZN9__gnu_cxx13new_allocatorImED1Ev,_ZN9__gnu_cxx13new_allocatorImED2Ev
	.section	.text._ZNSt12_Vector_baseImSaImEE12_Vector_implD2Ev,"axG",@progbits,_ZNSt12_Vector_baseImSaImEE12_Vector_implD5Ev,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseImSaImEE12_Vector_implD2Ev
	.type	_ZNSt12_Vector_baseImSaImEE12_Vector_implD2Ev, @function
_ZNSt12_Vector_baseImSaImEE12_Vector_implD2Ev:
.LFB6088:
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
	call	_ZNSaImED2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6088:
	.size	_ZNSt12_Vector_baseImSaImEE12_Vector_implD2Ev, .-_ZNSt12_Vector_baseImSaImEE12_Vector_implD2Ev
	.weak	_ZNSt12_Vector_baseImSaImEE12_Vector_implD1Ev
	.set	_ZNSt12_Vector_baseImSaImEE12_Vector_implD1Ev,_ZNSt12_Vector_baseImSaImEE12_Vector_implD2Ev
	.section	.text._ZNSt12_Vector_baseImSaImEEC2ERKS0_,"axG",@progbits,_ZNSt12_Vector_baseImSaImEEC5ERKS0_,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseImSaImEEC2ERKS0_
	.type	_ZNSt12_Vector_baseImSaImEEC2ERKS0_, @function
_ZNSt12_Vector_baseImSaImEEC2ERKS0_:
.LFB6090:
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
	call	_ZNSt12_Vector_baseImSaImEE12_Vector_implC1ERKS0_@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6090:
	.size	_ZNSt12_Vector_baseImSaImEEC2ERKS0_, .-_ZNSt12_Vector_baseImSaImEEC2ERKS0_
	.weak	_ZNSt12_Vector_baseImSaImEEC1ERKS0_
	.set	_ZNSt12_Vector_baseImSaImEEC1ERKS0_,_ZNSt12_Vector_baseImSaImEEC2ERKS0_
	.section	.text._ZNSt12_Vector_baseImSaImEED2Ev,"axG",@progbits,_ZNSt12_Vector_baseImSaImEED5Ev,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseImSaImEED2Ev
	.type	_ZNSt12_Vector_baseImSaImEED2Ev, @function
_ZNSt12_Vector_baseImSaImEED2Ev:
.LFB6093:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6093
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	sarq	$3, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmm@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE12_Vector_implD1Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6093:
	.section	.gcc_except_table
.LLSDA6093:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE6093-.LLSDACSB6093
.LLSDACSB6093:
.LLSDACSE6093:
	.section	.text._ZNSt12_Vector_baseImSaImEED2Ev,"axG",@progbits,_ZNSt12_Vector_baseImSaImEED5Ev,comdat
	.size	_ZNSt12_Vector_baseImSaImEED2Ev, .-_ZNSt12_Vector_baseImSaImEED2Ev
	.weak	_ZNSt12_Vector_baseImSaImEED1Ev
	.set	_ZNSt12_Vector_baseImSaImEED1Ev,_ZNSt12_Vector_baseImSaImEED2Ev
	.section	.text._ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv,"axG",@progbits,_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv
	.type	_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv, @function
_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv:
.LFB6095:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6095:
	.size	_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv, .-_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv
	.section	.text._ZSt8_DestroyIPmmEvT_S1_RSaIT0_E,"axG",@progbits,_ZSt8_DestroyIPmmEvT_S1_RSaIT0_E,comdat
	.weak	_ZSt8_DestroyIPmmEvT_S1_RSaIT0_E
	.type	_ZSt8_DestroyIPmmEvT_S1_RSaIT0_E, @function
_ZSt8_DestroyIPmmEvT_S1_RSaIT0_E:
.LFB6096:
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
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt8_DestroyIPmEvT_S1_@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6096:
	.size	_ZSt8_DestroyIPmmEvT_S1_RSaIT0_E, .-_ZSt8_DestroyIPmmEvT_S1_RSaIT0_E
	.section	.text._ZN5boost14dynamic_bitsetImSaImEE15calc_num_blocksEm,"axG",@progbits,_ZN5boost14dynamic_bitsetImSaImEE15calc_num_blocksEm,comdat
	.align 2
	.weak	_ZN5boost14dynamic_bitsetImSaImEE15calc_num_blocksEm
	.type	_ZN5boost14dynamic_bitsetImSaImEE15calc_num_blocksEm, @function
_ZN5boost14dynamic_bitsetImSaImEE15calc_num_blocksEm:
.LFB6097:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	shrq	$6, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	andl	$63, %eax
	testq	%rax, %rax
	setne	%al
	movzbl	%al, %eax
	addq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6097:
	.size	_ZN5boost14dynamic_bitsetImSaImEE15calc_num_blocksEm, .-_ZN5boost14dynamic_bitsetImSaImEE15calc_num_blocksEm
	.section	.text._ZNSt6vectorImSaImEE6resizeEm,"axG",@progbits,_ZNSt6vectorImSaImEE6resizeEm,comdat
	.align 2
	.weak	_ZNSt6vectorImSaImEE6resizeEm
	.type	_ZNSt6vectorImSaImEE6resizeEm, @function
_ZNSt6vectorImSaImEE6resizeEm:
.LFB6098:
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
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE4sizeEv@PLT
	cmpq	%rax, -16(%rbp)
	seta	%al
	testb	%al, %al
	je	.L371
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE4sizeEv@PLT
	movq	-16(%rbp), %rdx
	subq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorImSaImEE17_M_default_appendEm@PLT
	jmp	.L373
.L371:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE4sizeEv@PLT
	cmpq	%rax, -16(%rbp)
	setb	%al
	testb	%al, %al
	je	.L373
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorImSaImEE15_M_erase_at_endEPm@PLT
.L373:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6098:
	.size	_ZNSt6vectorImSaImEE6resizeEm, .-_ZNSt6vectorImSaImEE6resizeEm
	.section	.rodata
	.align 8
.LC19:
	.ascii	"boost::dynamic_bitset<Block, Allocator>"
	.string	"& boost::dynamic_bitset<Block, Allocator>::set(boost::dynamic_bitset<Block, Allocator>::size_type, bool) [with Block = long unsigned int; Allocator = std::allocator<long unsigned int>; boost::dynamic_bitset<Block, Allocator>::size_type = long unsigned int]"
.LC20:
	.string	"pos < m_num_bits"
	.section	.text._ZN5boost14dynamic_bitsetImSaImEE3setEmb,"axG",@progbits,_ZN5boost14dynamic_bitsetImSaImEE3setEmb,comdat
	.align 2
	.weak	_ZN5boost14dynamic_bitsetImSaImEE3setEmb
	.type	_ZN5boost14dynamic_bitsetImSaImEE3setEmb, @function
_ZN5boost14dynamic_bitsetImSaImEE3setEmb:
.LFB6100:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, %eax
	movb	%al, -36(%rbp)
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	cmpq	%rax, -32(%rbp)
	jb	.L375
	leaq	.LC19(%rip), %rcx
	movl	$1034, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC20(%rip), %rdi
	call	__assert_fail@PLT
.L375:
	cmpb	$0, -36(%rbp)
	je	.L376
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEE8bit_maskEm@PLT
	movq	%rax, %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEE11block_indexEm@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorImSaImEEixEm@PLT
	movq	(%rax), %rdx
	orq	%rbx, %rdx
	movq	%rdx, (%rax)
	jmp	.L377
.L376:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEE5resetEm@PLT
.L377:
	movq	-24(%rbp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6100:
	.size	_ZN5boost14dynamic_bitsetImSaImEE3setEmb, .-_ZN5boost14dynamic_bitsetImSaImEE3setEmb
	.section	.text._ZNK5boost14dynamic_bitsetImSaImEE16count_extra_bitsEv,"axG",@progbits,_ZNK5boost14dynamic_bitsetImSaImEE16count_extra_bitsEv,comdat
	.align 2
	.weak	_ZNK5boost14dynamic_bitsetImSaImEE16count_extra_bitsEv
	.type	_ZNK5boost14dynamic_bitsetImSaImEE16count_extra_bitsEv, @function
_ZNK5boost14dynamic_bitsetImSaImEE16count_extra_bitsEv:
.LFB6101:
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
	call	_ZNK5boost14dynamic_bitsetImSaImEE4sizeEv@PLT
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEE9bit_indexEm@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6101:
	.size	_ZNK5boost14dynamic_bitsetImSaImEE16count_extra_bitsEv, .-_ZNK5boost14dynamic_bitsetImSaImEE16count_extra_bitsEv
	.section	.rodata
	.align 8
.LC21:
	.string	"const Block& boost::dynamic_bitset<Block, Allocator>::m_highest_block() const [with Block = long unsigned int; Allocator = std::allocator<long unsigned int>]"
	.align 8
.LC22:
	.string	"size() > 0 && num_blocks() > 0"
	.section	.text._ZNK5boost14dynamic_bitsetImSaImEE15m_highest_blockEv,"axG",@progbits,_ZNK5boost14dynamic_bitsetImSaImEE15m_highest_blockEv,comdat
	.align 2
	.weak	_ZNK5boost14dynamic_bitsetImSaImEE15m_highest_blockEv
	.type	_ZNK5boost14dynamic_bitsetImSaImEE15m_highest_blockEv, @function
_ZNK5boost14dynamic_bitsetImSaImEE15m_highest_blockEv:
.LFB6102:
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
	call	_ZNK5boost14dynamic_bitsetImSaImEE4sizeEv@PLT
	testq	%rax, %rax
	je	.L382
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK5boost14dynamic_bitsetImSaImEE10num_blocksEv@PLT
	testq	%rax, %rax
	jne	.L385
.L382:
	leaq	.LC21(%rip), %rcx
	movl	$2025, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC22(%rip), %rdi
	call	__assert_fail@PLT
.L385:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE4backEv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6102:
	.size	_ZNK5boost14dynamic_bitsetImSaImEE15m_highest_blockEv, .-_ZNK5boost14dynamic_bitsetImSaImEE15m_highest_blockEv
	.section	.text._ZNKSt6vectorImSaImEE4sizeEv,"axG",@progbits,_ZNKSt6vectorImSaImEE4sizeEv,comdat
	.align 2
	.weak	_ZNKSt6vectorImSaImEE4sizeEv
	.type	_ZNKSt6vectorImSaImEE4sizeEv, @function
_ZNKSt6vectorImSaImEE4sizeEv:
.LFB6103:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	sarq	$3, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6103:
	.size	_ZNKSt6vectorImSaImEE4sizeEv, .-_ZNKSt6vectorImSaImEE4sizeEv
	.section	.text._ZNKSt6vectorImSaImEE8capacityEv,"axG",@progbits,_ZNKSt6vectorImSaImEE8capacityEv,comdat
	.align 2
	.weak	_ZNKSt6vectorImSaImEE8capacityEv
	.type	_ZNKSt6vectorImSaImEE8capacityEv, @function
_ZNKSt6vectorImSaImEE8capacityEv:
.LFB6104:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	sarq	$3, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6104:
	.size	_ZNKSt6vectorImSaImEE8capacityEv, .-_ZNKSt6vectorImSaImEE8capacityEv
	.section	.text._ZNK5boost14dynamic_bitsetImSaImEE10num_blocksEv,"axG",@progbits,_ZNK5boost14dynamic_bitsetImSaImEE10num_blocksEv,comdat
	.align 2
	.weak	_ZNK5boost14dynamic_bitsetImSaImEE10num_blocksEv
	.type	_ZNK5boost14dynamic_bitsetImSaImEE10num_blocksEv, @function
_ZNK5boost14dynamic_bitsetImSaImEE10num_blocksEv:
.LFB6105:
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
	call	_ZNKSt6vectorImSaImEE4sizeEv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6105:
	.size	_ZNK5boost14dynamic_bitsetImSaImEE10num_blocksEv, .-_ZNK5boost14dynamic_bitsetImSaImEE10num_blocksEv
	.section	.text._ZNK5boost14dynamic_bitsetImSaImEE4sizeEv,"axG",@progbits,_ZNK5boost14dynamic_bitsetImSaImEE4sizeEv,comdat
	.align 2
	.weak	_ZNK5boost14dynamic_bitsetImSaImEE4sizeEv
	.type	_ZNK5boost14dynamic_bitsetImSaImEE4sizeEv, @function
_ZNK5boost14dynamic_bitsetImSaImEE4sizeEv:
.LFB6106:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6106:
	.size	_ZNK5boost14dynamic_bitsetImSaImEE4sizeEv, .-_ZNK5boost14dynamic_bitsetImSaImEE4sizeEv
	.section	.text._ZN5boost14dynamic_bitsetImSaImEE9bit_indexEm,"axG",@progbits,_ZN5boost14dynamic_bitsetImSaImEE9bit_indexEm,comdat
	.weak	_ZN5boost14dynamic_bitsetImSaImEE9bit_indexEm
	.type	_ZN5boost14dynamic_bitsetImSaImEE9bit_indexEm, @function
_ZN5boost14dynamic_bitsetImSaImEE9bit_indexEm:
.LFB6107:
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
.LFE6107:
	.size	_ZN5boost14dynamic_bitsetImSaImEE9bit_indexEm, .-_ZN5boost14dynamic_bitsetImSaImEE9bit_indexEm
	.section	.rodata
	.align 8
.LC23:
	.string	"int boost::detail::lowest_bit(T) [with T = long unsigned int]"
	.align 8
.LC24:
	.string	"/usr/local/include/boost/dynamic_bitset/detail/lowest_bit.hpp"
.LC25:
	.string	"x >= 1"
	.section	.text._ZN5boost6detail10lowest_bitImEEiT_,"axG",@progbits,_ZN5boost6detail10lowest_bitImEEiT_,comdat
	.weak	_ZN5boost6detail10lowest_bitImEEiT_
	.type	_ZN5boost6detail10lowest_bitImEEiT_, @function
_ZN5boost6detail10lowest_bitImEEiT_:
.LFB6108:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L397
	leaq	.LC23(%rip), %rcx
	movl	$26, %edx
	leaq	.LC24(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L397:
	movq	-8(%rbp), %rax
	negq	%rax
	andq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost12integer_log2ImEEiT_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6108:
	.size	_ZN5boost6detail10lowest_bitImEEiT_, .-_ZN5boost6detail10lowest_bitImEEiT_
	.section	.text._ZNK5boost14dynamic_bitsetImSaImEE14m_do_find_fromEm,"axG",@progbits,_ZNK5boost14dynamic_bitsetImSaImEE14m_do_find_fromEm,comdat
	.align 2
	.weak	_ZNK5boost14dynamic_bitsetImSaImEE14m_do_find_fromEm
	.type	_ZNK5boost14dynamic_bitsetImSaImEE14m_do_find_fromEm, @function
_ZNK5boost14dynamic_bitsetImSaImEE14m_do_find_fromEm:
.LFB6109:
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
	movq	%rsi, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -24(%rbp)
.L403:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK5boost14dynamic_bitsetImSaImEE10num_blocksEv@PLT
	cmpq	%rax, -24(%rbp)
	jnb	.L400
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEEixEm@PLT
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L400
	movl	$1, %eax
	jmp	.L401
.L400:
	movl	$0, %eax
.L401:
	testb	%al, %al
	je	.L402
	addq	$1, -24(%rbp)
	jmp	.L403
.L402:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK5boost14dynamic_bitsetImSaImEE10num_blocksEv@PLT
	cmpq	%rax, -24(%rbp)
	setnb	%al
	testb	%al, %al
	je	.L404
	movq	$-1, %rax
	jmp	.L405
.L404:
	movq	-24(%rbp), %rax
	salq	$6, %rax
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEEixEm@PLT
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	_ZN5boost6detail10lowest_bitImEEiT_@PLT
	cltq
	addq	%rbx, %rax
.L405:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6109:
	.size	_ZNK5boost14dynamic_bitsetImSaImEE14m_do_find_fromEm, .-_ZNK5boost14dynamic_bitsetImSaImEE14m_do_find_fromEm
	.section	.text._ZN5boost16exception_detail10clone_baseC2Ev,"axG",@progbits,_ZN5boost16exception_detail10clone_baseC5Ev,comdat
	.align 2
	.weak	_ZN5boost16exception_detail10clone_baseC2Ev
	.type	_ZN5boost16exception_detail10clone_baseC2Ev, @function
_ZN5boost16exception_detail10clone_baseC2Ev:
.LFB6112:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	_ZTVN5boost16exception_detail10clone_baseE@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6112:
	.size	_ZN5boost16exception_detail10clone_baseC2Ev, .-_ZN5boost16exception_detail10clone_baseC2Ev
	.weak	_ZN5boost16exception_detail10clone_baseC1Ev
	.set	_ZN5boost16exception_detail10clone_baseC1Ev,_ZN5boost16exception_detail10clone_baseC2Ev
	.section	.text._ZNSt14overflow_errorC2ERKS_,"axG",@progbits,_ZNSt14overflow_errorC5ERKS_,comdat
	.align 2
	.weak	_ZNSt14overflow_errorC2ERKS_
	.type	_ZNSt14overflow_errorC2ERKS_, @function
_ZNSt14overflow_errorC2ERKS_:
.LFB6115:
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
	call	_ZNSt13runtime_errorC2ERKS_@PLT
	movq	_ZTVSt14overflow_error@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6115:
	.size	_ZNSt14overflow_errorC2ERKS_, .-_ZNSt14overflow_errorC2ERKS_
	.weak	_ZNSt14overflow_errorC1ERKS_
	.set	_ZNSt14overflow_errorC1ERKS_,_ZNSt14overflow_errorC2ERKS_
	.section	.text._ZN5boost10wrapexceptISt14overflow_errorEC2ERKS1_RKNS_15source_locationE,"axG",@progbits,_ZN5boost10wrapexceptISt14overflow_errorEC5ERKS1_RKNS_15source_locationE,comdat
	.align 2
	.weak	_ZN5boost10wrapexceptISt14overflow_errorEC2ERKS1_RKNS_15source_locationE
	.type	_ZN5boost10wrapexceptISt14overflow_errorEC2ERKS1_RKNS_15source_locationE, @function
_ZN5boost10wrapexceptISt14overflow_errorEC2ERKS1_RKNS_15source_locationE:
.LFB6117:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail10clone_baseC2Ev@PLT
	movq	-40(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSt14overflow_errorC2ERKS_@PLT
	movq	-40(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	call	_ZN5boost9exceptionC2Ev@PLT
	movq	_ZTVN5boost10wrapexceptISt14overflow_errorEE@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	movq	_ZTVN5boost10wrapexceptISt14overflow_errorEE@GOTPCREL(%rip), %rax
	leaq	64(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	_ZTVN5boost10wrapexceptISt14overflow_errorEE@GOTPCREL(%rip), %rax
	leaq	104(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN5boost10wrapexceptISt14overflow_errorE9copy_fromEPKv@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK5boost15source_location9file_nameEv@PLT
	movq	%rax, %rdx
	leaq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN5boost10error_infoINS_11throw_file_EPKcEC1ES3_@PLT
	leaq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_file_EPKcEE@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK5boost15source_location4lineEv@PLT
	movl	%eax, %edx
	leaq	-12(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZN5boost10error_infoINS_11throw_line_EiEC1Ei@PLT
	leaq	-12(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_line_EiEE@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK5boost15source_location13function_nameEv@PLT
	movq	%rax, %rdx
	leaq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN5boost10error_infoINS_15throw_function_EPKcEC1ES3_@PLT
	leaq	-8(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_15throw_function_EPKcEE@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6117:
	.size	_ZN5boost10wrapexceptISt14overflow_errorEC2ERKS1_RKNS_15source_locationE, .-_ZN5boost10wrapexceptISt14overflow_errorEC2ERKS1_RKNS_15source_locationE
	.weak	_ZN5boost10wrapexceptISt14overflow_errorEC1ERKS1_RKNS_15source_locationE
	.set	_ZN5boost10wrapexceptISt14overflow_errorEC1ERKS1_RKNS_15source_locationE,_ZN5boost10wrapexceptISt14overflow_errorEC2ERKS1_RKNS_15source_locationE
	.section	.text._ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2ERKS3_,"axG",@progbits,_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC5ERKS3_,comdat
	.align 2
	.weak	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2ERKS3_
	.type	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2ERKS3_, @function
_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2ERKS3_:
.LFB6120:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEE7add_refEv@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6120:
	.size	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2ERKS3_, .-_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2ERKS3_
	.weak	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC1ERKS3_
	.set	_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC1ERKS3_,_ZN5boost16exception_detail12refcount_ptrINS0_20error_info_containerEEC2ERKS3_
	.section	.text._ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_,"axG",@progbits,_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_,comdat
	.weak	_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_
	.type	_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_, @function
_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_:
.LFB6139:
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
	call	_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERT0_RSt11_Tuple_implIXT_EJS9_DpT1_EE@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6139:
	.size	_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_, .-_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_
	.section	.text._ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE10_M_deleterEv,"axG",@progbits,_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE10_M_deleterEv,comdat
	.align 2
	.weak	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE10_M_deleterEv
	.type	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE10_M_deleterEv, @function
_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE10_M_deleterEv:
.LFB6140:
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
	call	_ZSt3getILm1EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6140:
	.size	_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE10_M_deleterEv, .-_ZNSt15__uniq_ptr_implINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EE10_M_deleterEv
	.section	.text._ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEEC2Ev,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEEC5Ev,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEEC2Ev
	.type	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEEC2Ev, @function
_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEEC2Ev:
.LFB6144:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6144:
	.size	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEEC2Ev, .-_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEEC2Ev
	.weak	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEEC1Ev
	.set	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEEC1Ev,_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEEC2Ev
	.section	.text._ZNSt14_Fwd_list_baseIySaIyEE21_M_get_Node_allocatorEv,"axG",@progbits,_ZNSt14_Fwd_list_baseIySaIyEE21_M_get_Node_allocatorEv,comdat
	.align 2
	.weak	_ZNSt14_Fwd_list_baseIySaIyEE21_M_get_Node_allocatorEv
	.type	_ZNSt14_Fwd_list_baseIySaIyEE21_M_get_Node_allocatorEv, @function
_ZNSt14_Fwd_list_baseIySaIyEE21_M_get_Node_allocatorEv:
.LFB6146:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6146:
	.size	_ZNSt14_Fwd_list_baseIySaIyEE21_M_get_Node_allocatorEv, .-_ZNSt14_Fwd_list_baseIySaIyEE21_M_get_Node_allocatorEv
	.section	.text._ZNSt14_Fwd_list_nodeIyE9_M_valptrEv,"axG",@progbits,_ZNSt14_Fwd_list_nodeIyE9_M_valptrEv,comdat
	.align 2
	.weak	_ZNSt14_Fwd_list_nodeIyE9_M_valptrEv
	.type	_ZNSt14_Fwd_list_nodeIyE9_M_valptrEv, @function
_ZNSt14_Fwd_list_nodeIyE9_M_valptrEv:
.LFB6147:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx16__aligned_bufferIyE6_M_ptrEv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6147:
	.size	_ZNSt14_Fwd_list_nodeIyE9_M_valptrEv, .-_ZNSt14_Fwd_list_nodeIyE9_M_valptrEv
	.section	.text._ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE7destroyIyEEvRS2_PT_,"axG",@progbits,_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE7destroyIyEEvRS2_PT_,comdat
	.weak	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE7destroyIyEEvRS2_PT_
	.type	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE7destroyIyEEvRS2_PT_, @function
_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE7destroyIyEEvRS2_PT_:
.LFB6148:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE7destroyIyEEvPT_@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6148:
	.size	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE7destroyIyEEvRS2_PT_, .-_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE7destroyIyEEvRS2_PT_
	.section	.text._ZNSt14_Fwd_list_baseIySaIyEE11_M_put_nodeEPSt14_Fwd_list_nodeIyE,"axG",@progbits,_ZNSt14_Fwd_list_baseIySaIyEE11_M_put_nodeEPSt14_Fwd_list_nodeIyE,comdat
	.align 2
	.weak	_ZNSt14_Fwd_list_baseIySaIyEE11_M_put_nodeEPSt14_Fwd_list_nodeIyE
	.type	_ZNSt14_Fwd_list_baseIySaIyEE11_M_put_nodeEPSt14_Fwd_list_nodeIyE, @function
_ZNSt14_Fwd_list_baseIySaIyEE11_M_put_nodeEPSt14_Fwd_list_nodeIyE:
.LFB6149:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt14pointer_traitsIPSt14_Fwd_list_nodeIyEE10pointer_toERS1_@PLT
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt14_Fwd_list_baseIySaIyEE21_M_get_Node_allocatorEv@PLT
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE10deallocateERS2_PS1_m@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6149:
	.size	_ZNSt14_Fwd_list_baseIySaIyEE11_M_put_nodeEPSt14_Fwd_list_nodeIyE, .-_ZNSt14_Fwd_list_baseIySaIyEE11_M_put_nodeEPSt14_Fwd_list_nodeIyE
	.section	.text._ZNSt5tupleIJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2IS6_S8_Lb1EEEv,"axG",@progbits,_ZNSt5tupleIJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC5IS6_S8_Lb1EEEv,comdat
	.align 2
	.weak	_ZNSt5tupleIJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2IS6_S8_Lb1EEEv
	.type	_ZNSt5tupleIJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2IS6_S8_Lb1EEEv, @function
_ZNSt5tupleIJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2IS6_S8_Lb1EEEv:
.LFB6151:
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
	call	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6151:
	.size	_ZNSt5tupleIJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2IS6_S8_Lb1EEEv, .-_ZNSt5tupleIJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2IS6_S8_Lb1EEEv
	.weak	_ZNSt5tupleIJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC1IS6_S8_Lb1EEEv
	.set	_ZNSt5tupleIJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC1IS6_S8_Lb1EEEv,_ZNSt5tupleIJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2IS6_S8_Lb1EEEv
	.section	.text._ZNSt14_Fwd_list_baseIySaIyEE11_M_get_nodeEv,"axG",@progbits,_ZNSt14_Fwd_list_baseIySaIyEE11_M_get_nodeEv,comdat
	.align 2
	.weak	_ZNSt14_Fwd_list_baseIySaIyEE11_M_get_nodeEv
	.type	_ZNSt14_Fwd_list_baseIySaIyEE11_M_get_nodeEv, @function
_ZNSt14_Fwd_list_baseIySaIyEE11_M_get_nodeEv:
.LFB6189:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt14_Fwd_list_baseIySaIyEE21_M_get_Node_allocatorEv@PLT
	movl	$1, %esi
	movq	%rax, %rdi
	call	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE8allocateERS2_m@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__to_addressISt14_Fwd_list_nodeIyEEPT_S3_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6189:
	.size	_ZNSt14_Fwd_list_baseIySaIyEE11_M_get_nodeEv, .-_ZNSt14_Fwd_list_baseIySaIyEE11_M_get_nodeEv
	.section	.text._ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE9constructIyJyEEEvRS2_PT_DpOT0_,"axG",@progbits,_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE9constructIyJyEEEvRS2_PT_DpOT0_,comdat
	.weak	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE9constructIyJyEEEvRS2_PT_DpOT0_
	.type	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE9constructIyJyEEEvRS2_PT_DpOT0_, @function
_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE9constructIyJyEEEvRS2_PT_DpOT0_:
.LFB6190:
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
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt7forwardIyEOT_RNSt16remove_referenceIS0_E4typeE@PLT
	movq	%rax, %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE9constructIyJyEEEvPT_DpOT0_@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6190:
	.size	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE9constructIyJyEEEvRS2_PT_DpOT0_, .-_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE9constructIyJyEEEvRS2_PT_DpOT0_
	.section	.text._ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERKNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERKSD_,"axG",@progbits,_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERKNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERKSD_,comdat
	.weak	_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERKNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERKSD_
	.type	_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERKNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERKSD_, @function
_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERKNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERKSD_:
.LFB6191:
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
	call	_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERKT0_RKSt11_Tuple_implIXT_EJS9_DpT1_EE@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6191:
	.size	_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERKNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERKSD_, .-_ZSt3getILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERKNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERKSD_
	.section	.text._ZNSt12_Vector_baseImSaImEE12_Vector_implC2ERKS0_,"axG",@progbits,_ZNSt12_Vector_baseImSaImEE12_Vector_implC5ERKS0_,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseImSaImEE12_Vector_implC2ERKS0_
	.type	_ZNSt12_Vector_baseImSaImEE12_Vector_implC2ERKS0_, @function
_ZNSt12_Vector_baseImSaImEE12_Vector_implC2ERKS0_:
.LFB6205:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSaImEC2ERKS_@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE17_Vector_impl_dataC2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6205:
	.size	_ZNSt12_Vector_baseImSaImEE12_Vector_implC2ERKS0_, .-_ZNSt12_Vector_baseImSaImEE12_Vector_implC2ERKS0_
	.weak	_ZNSt12_Vector_baseImSaImEE12_Vector_implC1ERKS0_
	.set	_ZNSt12_Vector_baseImSaImEE12_Vector_implC1ERKS0_,_ZNSt12_Vector_baseImSaImEE12_Vector_implC2ERKS0_
	.section	.text._ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmm,"axG",@progbits,_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmm,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmm
	.type	_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmm, @function
_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmm:
.LFB6207:
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
	cmpq	$0, -16(%rbp)
	je	.L430
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt16allocator_traitsISaImEE10deallocateERS0_Pmm@PLT
.L430:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6207:
	.size	_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmm, .-_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmm
	.section	.text._ZSt8_DestroyIPmEvT_S1_,"axG",@progbits,_ZSt8_DestroyIPmEvT_S1_,comdat
	.weak	_ZSt8_DestroyIPmEvT_S1_
	.type	_ZSt8_DestroyIPmEvT_S1_, @function
_ZSt8_DestroyIPmEvT_S1_:
.LFB6208:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt12_Destroy_auxILb1EE9__destroyIPmEEvT_S3_@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6208:
	.size	_ZSt8_DestroyIPmEvT_S1_, .-_ZSt8_DestroyIPmEvT_S1_
	.section	.text._ZNSt6vectorImSaImEE15_S_use_relocateEv,"axG",@progbits,_ZNSt6vectorImSaImEE15_S_use_relocateEv,comdat
	.weak	_ZNSt6vectorImSaImEE15_S_use_relocateEv
	.type	_ZNSt6vectorImSaImEE15_S_use_relocateEv, @function
_ZNSt6vectorImSaImEE15_S_use_relocateEv:
.LFB6210:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	_ZNSt6vectorImSaImEE19_S_nothrow_relocateESt17integral_constantIbLb1EE@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6210:
	.size	_ZNSt6vectorImSaImEE15_S_use_relocateEv, .-_ZNSt6vectorImSaImEE15_S_use_relocateEv
	.section	.text._ZNSt6vectorImSaImEE19_S_nothrow_relocateESt17integral_constantIbLb1EE,"axG",@progbits,_ZNSt6vectorImSaImEE19_S_nothrow_relocateESt17integral_constantIbLb1EE,comdat
	.weak	_ZNSt6vectorImSaImEE19_S_nothrow_relocateESt17integral_constantIbLb1EE
	.type	_ZNSt6vectorImSaImEE19_S_nothrow_relocateESt17integral_constantIbLb1EE, @function
_ZNSt6vectorImSaImEE19_S_nothrow_relocateESt17integral_constantIbLb1EE:
.LFB6211:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6211:
	.size	_ZNSt6vectorImSaImEE19_S_nothrow_relocateESt17integral_constantIbLb1EE, .-_ZNSt6vectorImSaImEE19_S_nothrow_relocateESt17integral_constantIbLb1EE
	.section	.rodata
.LC26:
	.string	"vector::_M_default_append"
	.section	.text._ZNSt6vectorImSaImEE17_M_default_appendEm,"axG",@progbits,_ZNSt6vectorImSaImEE17_M_default_appendEm,comdat
	.align 2
	.weak	_ZNSt6vectorImSaImEE17_M_default_appendEm
	.type	_ZNSt6vectorImSaImEE17_M_default_appendEm, @function
_ZNSt6vectorImSaImEE17_M_default_appendEm:
.LFB6209:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6209
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	cmpq	$0, -80(%rbp)
	je	.L454
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE4sizeEv@PLT
	movq	%rax, -32(%rbp)
	movq	-72(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	sarq	$3, %rax
	movq	%rax, -40(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE8max_sizeEv@PLT
	cmpq	%rax, -32(%rbp)
	ja	.L438
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE8max_sizeEv@PLT
	subq	-32(%rbp), %rax
	cmpq	%rax, -40(%rbp)
	jbe	.L439
.L438:
	movl	$1, %eax
	jmp	.L440
.L439:
	movl	$0, %eax
.L440:
	testb	%al, %al
	movq	-40(%rbp), %rax
	cmpq	-80(%rbp), %rax
	jb	.L442
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv@PLT
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	movq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB101:
	call	_ZSt27__uninitialized_default_n_aIPmmmET_S1_T0_RSaIT1_E@PLT
	movq	-72(%rbp), %rdx
	movq	%rax, 8(%rdx)
	jmp	.L454
.L442:
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rax
	leaq	.LC26(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE12_M_check_lenEmPKc@PLT
	movq	%rax, -48(%rbp)
	movq	-72(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE11_M_allocateEm@PLT
.LEHE101:
	movq	%rax, -56(%rbp)
	call	_ZNSt6vectorImSaImEE15_S_use_relocateEv@PLT
	testb	%al, %al
	je	.L443
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	-56(%rbp), %rax
	addq	%rax, %rcx
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
.LEHB102:
	call	_ZSt27__uninitialized_default_n_aIPmmmET_S1_T0_RSaIT1_E@PLT
.LEHE102:
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv@PLT
	movq	%rax, %rcx
	movq	-72(%rbp), %rax
	movq	8(%rax), %rsi
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, %rdi
	call	_ZNSt6vectorImSaImEE11_S_relocateEPmS2_S2_RS0_@PLT
	jmp	.L444
.L443:
	movq	$0, -24(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	-56(%rbp), %rax
	addq	%rax, %rcx
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
.LEHB103:
	call	_ZSt27__uninitialized_default_n_aIPmmmET_S1_T0_RSaIT1_E@PLT
	movq	-32(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv@PLT
	movq	%rax, %rcx
	movq	-72(%rbp), %rax
	movq	8(%rax), %rsi
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, %rdi
	call	_ZSt34__uninitialized_move_if_noexcept_aIPmS0_SaImEET0_T_S3_S2_RT1_@PLT
.LEHE103:
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv@PLT
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB104:
	call	_ZSt8_DestroyIPmmEvT_S1_RSaIT0_E@PLT
.L444:
	movq	-72(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	16(%rdx), %rcx
	movq	-72(%rbp), %rdx
	movq	(%rdx), %rdx
	subq	%rdx, %rcx
	movq	%rcx, %rdx
	sarq	$3, %rdx
	movq	%rdx, %rsi
	movq	-72(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	%rsi, %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmm@PLT
.LEHE104:
	movq	-72(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-32(%rbp), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-48(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, 16(%rax)
	jmp	.L454
.L450:
	movq	%rax, %rdi
	call	__cxa_begin_catch@PLT
	movq	-72(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB105:
	call	_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmm@PLT
	call	__cxa_rethrow@PLT
.LEHE105:
.L451:
	movq	%rax, %rbx
	call	__cxa_end_catch@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB106:
	call	_Unwind_Resume@PLT
.LEHE106:
.L452:
	movq	%rax, %rdi
	call	__cxa_begin_catch@PLT
	cmpq	$0, -24(%rbp)
	je	.L448
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv@PLT
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	-24(%rbp), %rax
	addq	%rax, %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB107:
	call	_ZSt8_DestroyIPmmEvT_S1_RSaIT0_E@PLT
.L448:
	movq	-72(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE13_M_deallocateEPmm@PLT
	call	__cxa_rethrow@PLT
.LEHE107:
.L453:
	movq	%rax, %rbx
	call	__cxa_end_catch@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB108:
	call	_Unwind_Resume@PLT
.LEHE108:
.L454:
	nop
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6209:
	.section	.gcc_except_table
	.align 4
.LLSDA6209:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT6209-.LLSDATTD6209
.LLSDATTD6209:
	.byte	0x1
	.uleb128 .LLSDACSE6209-.LLSDACSB6209
.LLSDACSB6209:
	.uleb128 .LEHB101-.LFB6209
	.uleb128 .LEHE101-.LEHB101
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB102-.LFB6209
	.uleb128 .LEHE102-.LEHB102
	.uleb128 .L450-.LFB6209
	.uleb128 0x1
	.uleb128 .LEHB103-.LFB6209
	.uleb128 .LEHE103-.LEHB103
	.uleb128 .L452-.LFB6209
	.uleb128 0x1
	.uleb128 .LEHB104-.LFB6209
	.uleb128 .LEHE104-.LEHB104
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB105-.LFB6209
	.uleb128 .LEHE105-.LEHB105
	.uleb128 .L451-.LFB6209
	.uleb128 0
	.uleb128 .LEHB106-.LFB6209
	.uleb128 .LEHE106-.LEHB106
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB107-.LFB6209
	.uleb128 .LEHE107-.LEHB107
	.uleb128 .L453-.LFB6209
	.uleb128 0
	.uleb128 .LEHB108-.LFB6209
	.uleb128 .LEHE108-.LEHB108
	.uleb128 0
	.uleb128 0
.LLSDACSE6209:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT6209:
	.section	.text._ZNSt6vectorImSaImEE17_M_default_appendEm,"axG",@progbits,_ZNSt6vectorImSaImEE17_M_default_appendEm,comdat
	.size	_ZNSt6vectorImSaImEE17_M_default_appendEm, .-_ZNSt6vectorImSaImEE17_M_default_appendEm
	.section	.text._ZNSt6vectorImSaImEE15_M_erase_at_endEPm,"axG",@progbits,_ZNSt6vectorImSaImEE15_M_erase_at_endEPm,comdat
	.align 2
	.weak	_ZNSt6vectorImSaImEE15_M_erase_at_endEPm
	.type	_ZNSt6vectorImSaImEE15_M_erase_at_endEPm, @function
_ZNSt6vectorImSaImEE15_M_erase_at_endEPm:
.LFB6212:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6212
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	subq	-32(%rbp), %rax
	sarq	$3, %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L457
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZSt8_DestroyIPmmEvT_S1_RSaIT0_E@PLT
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L457:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6212:
	.section	.gcc_except_table
.LLSDA6212:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE6212-.LLSDACSB6212
.LLSDACSB6212:
.LLSDACSE6212:
	.section	.text._ZNSt6vectorImSaImEE15_M_erase_at_endEPm,"axG",@progbits,_ZNSt6vectorImSaImEE15_M_erase_at_endEPm,comdat
	.size	_ZNSt6vectorImSaImEE15_M_erase_at_endEPm, .-_ZNSt6vectorImSaImEE15_M_erase_at_endEPm
	.section	.text._ZNSt6vectorImSaImEEixEm,"axG",@progbits,_ZNSt6vectorImSaImEEixEm,comdat
	.align 2
	.weak	_ZNSt6vectorImSaImEEixEm
	.type	_ZNSt6vectorImSaImEEixEm, @function
_ZNSt6vectorImSaImEEixEm:
.LFB6213:
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
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6213:
	.size	_ZNSt6vectorImSaImEEixEm, .-_ZNSt6vectorImSaImEEixEm
	.section	.text._ZN5boost14dynamic_bitsetImSaImEE8bit_maskEm,"axG",@progbits,_ZN5boost14dynamic_bitsetImSaImEE8bit_maskEm,comdat
	.weak	_ZN5boost14dynamic_bitsetImSaImEE8bit_maskEm
	.type	_ZN5boost14dynamic_bitsetImSaImEE8bit_maskEm, @function
_ZN5boost14dynamic_bitsetImSaImEE8bit_maskEm:
.LFB6214:
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
	call	_ZN5boost14dynamic_bitsetImSaImEE9bit_indexEm@PLT
	movl	$1, %edx
	movl	%eax, %ecx
	salq	%cl, %rdx
	movq	%rdx, %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6214:
	.size	_ZN5boost14dynamic_bitsetImSaImEE8bit_maskEm, .-_ZN5boost14dynamic_bitsetImSaImEE8bit_maskEm
	.section	.rodata
	.align 8
.LC27:
	.ascii	"boost::dynamic_bitset<Block, Alloca"
	.string	"tor>& boost::dynamic_bitset<Block, Allocator>::reset(boost::dynamic_bitset<Block, Allocator>::size_type) [with Block = long unsigned int; Allocator = std::allocator<long unsigned int>; boost::dynamic_bitset<Block, Allocator>::size_type = long unsigned int]"
	.section	.text._ZN5boost14dynamic_bitsetImSaImEE5resetEm,"axG",@progbits,_ZN5boost14dynamic_bitsetImSaImEE5resetEm,comdat
	.align 2
	.weak	_ZN5boost14dynamic_bitsetImSaImEE5resetEm
	.type	_ZN5boost14dynamic_bitsetImSaImEE5resetEm, @function
_ZN5boost14dynamic_bitsetImSaImEE5resetEm:
.LFB6215:
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
	movq	24(%rax), %rax
	cmpq	%rax, -32(%rbp)
	jb	.L463
	leaq	.LC27(%rip), %rcx
	movl	$1064, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC20(%rip), %rdi
	call	__assert_fail@PLT
.L463:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEE8bit_maskEm@PLT
	notq	%rax
	movq	%rax, %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost14dynamic_bitsetImSaImEE11block_indexEm@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt6vectorImSaImEEixEm@PLT
	movq	(%rax), %rdx
	andq	%rbx, %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6215:
	.size	_ZN5boost14dynamic_bitsetImSaImEE5resetEm, .-_ZN5boost14dynamic_bitsetImSaImEE5resetEm
	.section	.text._ZNKSt6vectorImSaImEE4backEv,"axG",@progbits,_ZNKSt6vectorImSaImEE4backEv,comdat
	.align 2
	.weak	_ZNKSt6vectorImSaImEE4backEv
	.type	_ZNKSt6vectorImSaImEE4backEv, @function
_ZNKSt6vectorImSaImEE4backEv:
.LFB6216:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE3endEv@PLT
	movq	%rax, -8(%rbp)
	leaq	-8(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEmiEl@PLT
	movq	%rax, -16(%rbp)
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEdeEv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6216:
	.size	_ZNKSt6vectorImSaImEE4backEv, .-_ZNKSt6vectorImSaImEE4backEv
	.section	.rodata
	.align 8
.LC28:
	.string	"int boost::integer_log2(T) [with T = long unsigned int]"
	.align 8
.LC29:
	.string	"/usr/local/include/boost/integer/integer_log2.hpp"
.LC30:
	.string	"x > 0"
	.section	.text._ZN5boost12integer_log2ImEEiT_,"axG",@progbits,_ZN5boost12integer_log2ImEEiT_,comdat
	.weak	_ZN5boost12integer_log2ImEEiT_
	.type	_ZN5boost12integer_log2ImEEiT_, @function
_ZN5boost12integer_log2ImEEiT_:
.LFB6217:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L468
	leaq	.LC28(%rip), %rcx
	movl	$96, %edx
	leaq	.LC29(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	call	__assert_fail@PLT
.L468:
	movl	$32, -4(%rbp)
	movq	-24(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	_ZN5boost6detail17integer_log2_implImEEiT_i@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6217:
	.size	_ZN5boost12integer_log2ImEEiT_, .-_ZN5boost12integer_log2ImEEiT_
	.section	.text._ZN5boost10wrapexceptISt14overflow_errorE9copy_fromEPKv,"axG",@progbits,_ZN5boost10wrapexceptISt14overflow_errorE9copy_fromEPKv,comdat
	.align 2
	.weak	_ZN5boost10wrapexceptISt14overflow_errorE9copy_fromEPKv
	.type	_ZN5boost10wrapexceptISt14overflow_errorE9copy_fromEPKv, @function
_ZN5boost10wrapexceptISt14overflow_errorE9copy_fromEPKv:
.LFB6218:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6218:
	.size	_ZN5boost10wrapexceptISt14overflow_errorE9copy_fromEPKv, .-_ZN5boost10wrapexceptISt14overflow_errorE9copy_fromEPKv
	.section	.text._ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_file_EPKcEE,"axG",@progbits,_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_file_EPKcEE,comdat
	.weak	_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_file_EPKcEE
	.type	_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_file_EPKcEE, @function
_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_file_EPKcEE:
.LFB6219:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 48(%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6219:
	.size	_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_file_EPKcEE, .-_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_file_EPKcEE
	.section	.text._ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_line_EiEE,"axG",@progbits,_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_line_EiEE,comdat
	.weak	_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_line_EiEE
	.type	_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_line_EiEE, @function
_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_line_EiEE:
.LFB6220:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 56(%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6220:
	.size	_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_line_EiEE, .-_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_11throw_line_EiEE
	.section	.text._ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_15throw_function_EPKcEE,"axG",@progbits,_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_15throw_function_EPKcEE,comdat
	.weak	_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_15throw_function_EPKcEE
	.type	_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_15throw_function_EPKcEE, @function
_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_15throw_function_EPKcEE:
.LFB6221:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 40(%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6221:
	.size	_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_15throw_function_EPKcEE, .-_ZN5boost16exception_detail8set_infoINS_10wrapexceptISt14overflow_errorEEEERKT_S7_RKNS_10error_infoINS_15throw_function_EPKcEE
	.section	.text._ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERT0_RSt11_Tuple_implIXT_EJS9_DpT1_EE,"axG",@progbits,_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERT0_RSt11_Tuple_implIXT_EJS9_DpT1_EE,comdat
	.weak	_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERT0_RSt11_Tuple_implIXT_EJS9_DpT1_EE
	.type	_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERT0_RSt11_Tuple_implIXT_EJS9_DpT1_EE, @function
_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERT0_RSt11_Tuple_implIXT_EJS9_DpT1_EE:
.LFB6222:
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
	call	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERS9_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6222:
	.size	_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERT0_RSt11_Tuple_implIXT_EJS9_DpT1_EE, .-_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERT0_RSt11_Tuple_implIXT_EJS9_DpT1_EE
	.section	.text._ZSt3getILm1EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_,"axG",@progbits,_ZSt3getILm1EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_,comdat
	.weak	_ZSt3getILm1EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_
	.type	_ZSt3getILm1EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_, @function
_ZSt3getILm1EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_:
.LFB6223:
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
	call	_ZSt12__get_helperILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEJEERT0_RSt11_Tuple_implIXT_EJS8_DpT1_EE@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6223:
	.size	_ZSt3getILm1EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_, .-_ZSt3getILm1EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERSD_
	.section	.text._ZN9__gnu_cxx16__aligned_bufferIyE6_M_ptrEv,"axG",@progbits,_ZN9__gnu_cxx16__aligned_bufferIyE6_M_ptrEv,comdat
	.align 2
	.weak	_ZN9__gnu_cxx16__aligned_bufferIyE6_M_ptrEv
	.type	_ZN9__gnu_cxx16__aligned_bufferIyE6_M_ptrEv, @function
_ZN9__gnu_cxx16__aligned_bufferIyE6_M_ptrEv:
.LFB6224:
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
	call	_ZN9__gnu_cxx16__aligned_bufferIyE7_M_addrEv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6224:
	.size	_ZN9__gnu_cxx16__aligned_bufferIyE6_M_ptrEv, .-_ZN9__gnu_cxx16__aligned_bufferIyE6_M_ptrEv
	.section	.text._ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE7destroyIyEEvPT_,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE7destroyIyEEvPT_,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE7destroyIyEEvPT_
	.type	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE7destroyIyEEvPT_, @function
_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE7destroyIyEEvPT_:
.LFB6225:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6225:
	.size	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE7destroyIyEEvPT_, .-_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE7destroyIyEEvPT_
	.section	.text._ZNSt14pointer_traitsIPSt14_Fwd_list_nodeIyEE10pointer_toERS1_,"axG",@progbits,_ZNSt14pointer_traitsIPSt14_Fwd_list_nodeIyEE10pointer_toERS1_,comdat
	.weak	_ZNSt14pointer_traitsIPSt14_Fwd_list_nodeIyEE10pointer_toERS1_
	.type	_ZNSt14pointer_traitsIPSt14_Fwd_list_nodeIyEE10pointer_toERS1_, @function
_ZNSt14pointer_traitsIPSt14_Fwd_list_nodeIyEE10pointer_toERS1_:
.LFB6226:
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
	call	_ZSt9addressofISt14_Fwd_list_nodeIyEEPT_RS2_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6226:
	.size	_ZNSt14pointer_traitsIPSt14_Fwd_list_nodeIyEE10pointer_toERS1_, .-_ZNSt14pointer_traitsIPSt14_Fwd_list_nodeIyEE10pointer_toERS1_
	.section	.text._ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE10deallocateERS2_PS1_m,"axG",@progbits,_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE10deallocateERS2_PS1_m,comdat
	.weak	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE10deallocateERS2_PS1_m
	.type	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE10deallocateERS2_PS1_m, @function
_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE10deallocateERS2_PS1_m:
.LFB6227:
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
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE10deallocateEPS2_m@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6227:
	.size	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE10deallocateERS2_PS1_m, .-_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE10deallocateERS2_PS1_m
	.section	.text._ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2Ev,"axG",@progbits,_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC5Ev,comdat
	.align 2
	.weak	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2Ev
	.type	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2Ev, @function
_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2Ev:
.LFB6229:
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
	call	_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEEC2Ev@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EEC2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6229:
	.size	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2Ev, .-_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2Ev
	.weak	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC1Ev
	.set	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC1Ev,_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEEC2Ev
	.section	.text._ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE8allocateERS2_m,"axG",@progbits,_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE8allocateERS2_m,comdat
	.weak	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE8allocateERS2_m
	.type	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE8allocateERS2_m, @function
_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE8allocateERS2_m:
.LFB6260:
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
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8allocateEmPKv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6260:
	.size	_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE8allocateERS2_m, .-_ZNSt16allocator_traitsISaISt14_Fwd_list_nodeIyEEE8allocateERS2_m
	.section	.text._ZSt12__to_addressISt14_Fwd_list_nodeIyEEPT_S3_,"axG",@progbits,_ZSt12__to_addressISt14_Fwd_list_nodeIyEEPT_S3_,comdat
	.weak	_ZSt12__to_addressISt14_Fwd_list_nodeIyEEPT_S3_
	.type	_ZSt12__to_addressISt14_Fwd_list_nodeIyEEPT_S3_, @function
_ZSt12__to_addressISt14_Fwd_list_nodeIyEEPT_S3_:
.LFB6261:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6261:
	.size	_ZSt12__to_addressISt14_Fwd_list_nodeIyEEPT_S3_, .-_ZSt12__to_addressISt14_Fwd_list_nodeIyEEPT_S3_
	.section	.text._ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE9constructIyJyEEEvPT_DpOT0_,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE9constructIyJyEEEvPT_DpOT0_,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE9constructIyJyEEEvPT_DpOT0_
	.type	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE9constructIyJyEEEvPT_DpOT0_, @function
_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE9constructIyJyEEEvPT_DpOT0_:
.LFB6262:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt7forwardIyEOT_RNSt16remove_referenceIS0_E4typeE@PLT
	movq	(%rax), %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$8, %edi
	call	_ZnwmPv@PLT
	movq	%rbx, (%rax)
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6262:
	.size	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE9constructIyJyEEEvPT_DpOT0_, .-_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE9constructIyJyEEEvPT_DpOT0_
	.section	.text._ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERKT0_RKSt11_Tuple_implIXT_EJS9_DpT1_EE,"axG",@progbits,_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERKT0_RKSt11_Tuple_implIXT_EJS9_DpT1_EE,comdat
	.weak	_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERKT0_RKSt11_Tuple_implIXT_EJS9_DpT1_EE
	.type	_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERKT0_RKSt11_Tuple_implIXT_EJS9_DpT1_EE, @function
_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERKT0_RKSt11_Tuple_implIXT_EJS9_DpT1_EE:
.LFB6263:
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
	call	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERKS9_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6263:
	.size	_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERKT0_RKSt11_Tuple_implIXT_EJS9_DpT1_EE, .-_ZSt12__get_helperILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEJSt14default_deleteIS5_EEERKT0_RKSt11_Tuple_implIXT_EJS9_DpT1_EE
	.section	.text._ZNSaImEC2ERKS_,"axG",@progbits,_ZNSaImEC5ERKS_,comdat
	.align 2
	.weak	_ZNSaImEC2ERKS_
	.type	_ZNSaImEC2ERKS_, @function
_ZNSaImEC2ERKS_:
.LFB6273:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx13new_allocatorImEC2ERKS1_@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6273:
	.size	_ZNSaImEC2ERKS_, .-_ZNSaImEC2ERKS_
	.weak	_ZNSaImEC1ERKS_
	.set	_ZNSaImEC1ERKS_,_ZNSaImEC2ERKS_
	.section	.text._ZNSt12_Vector_baseImSaImEE17_Vector_impl_dataC2Ev,"axG",@progbits,_ZNSt12_Vector_baseImSaImEE17_Vector_impl_dataC5Ev,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseImSaImEE17_Vector_impl_dataC2Ev
	.type	_ZNSt12_Vector_baseImSaImEE17_Vector_impl_dataC2Ev, @function
_ZNSt12_Vector_baseImSaImEE17_Vector_impl_dataC2Ev:
.LFB6276:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6276:
	.size	_ZNSt12_Vector_baseImSaImEE17_Vector_impl_dataC2Ev, .-_ZNSt12_Vector_baseImSaImEE17_Vector_impl_dataC2Ev
	.weak	_ZNSt12_Vector_baseImSaImEE17_Vector_impl_dataC1Ev
	.set	_ZNSt12_Vector_baseImSaImEE17_Vector_impl_dataC1Ev,_ZNSt12_Vector_baseImSaImEE17_Vector_impl_dataC2Ev
	.section	.text._ZNSt16allocator_traitsISaImEE10deallocateERS0_Pmm,"axG",@progbits,_ZNSt16allocator_traitsISaImEE10deallocateERS0_Pmm,comdat
	.weak	_ZNSt16allocator_traitsISaImEE10deallocateERS0_Pmm
	.type	_ZNSt16allocator_traitsISaImEE10deallocateERS0_Pmm, @function
_ZNSt16allocator_traitsISaImEE10deallocateERS0_Pmm:
.LFB6278:
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
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx13new_allocatorImE10deallocateEPmm@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6278:
	.size	_ZNSt16allocator_traitsISaImEE10deallocateERS0_Pmm, .-_ZNSt16allocator_traitsISaImEE10deallocateERS0_Pmm
	.section	.text._ZNSt12_Destroy_auxILb1EE9__destroyIPmEEvT_S3_,"axG",@progbits,_ZNSt12_Destroy_auxILb1EE9__destroyIPmEEvT_S3_,comdat
	.weak	_ZNSt12_Destroy_auxILb1EE9__destroyIPmEEvT_S3_
	.type	_ZNSt12_Destroy_auxILb1EE9__destroyIPmEEvT_S3_, @function
_ZNSt12_Destroy_auxILb1EE9__destroyIPmEEvT_S3_:
.LFB6279:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6279:
	.size	_ZNSt12_Destroy_auxILb1EE9__destroyIPmEEvT_S3_, .-_ZNSt12_Destroy_auxILb1EE9__destroyIPmEEvT_S3_
	.section	.text._ZNKSt6vectorImSaImEE8max_sizeEv,"axG",@progbits,_ZNKSt6vectorImSaImEE8max_sizeEv,comdat
	.align 2
	.weak	_ZNKSt6vectorImSaImEE8max_sizeEv
	.type	_ZNKSt6vectorImSaImEE8max_sizeEv, @function
_ZNKSt6vectorImSaImEE8max_sizeEv:
.LFB6280:
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
	call	_ZNKSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv@PLT
	movq	%rax, %rdi
	call	_ZNSt6vectorImSaImEE11_S_max_sizeERKS0_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6280:
	.size	_ZNKSt6vectorImSaImEE8max_sizeEv, .-_ZNKSt6vectorImSaImEE8max_sizeEv
	.section	.text._ZSt27__uninitialized_default_n_aIPmmmET_S1_T0_RSaIT1_E,"axG",@progbits,_ZSt27__uninitialized_default_n_aIPmmmET_S1_T0_RSaIT1_E,comdat
	.weak	_ZSt27__uninitialized_default_n_aIPmmmET_S1_T0_RSaIT1_E
	.type	_ZSt27__uninitialized_default_n_aIPmmmET_S1_T0_RSaIT1_E, @function
_ZSt27__uninitialized_default_n_aIPmmmET_S1_T0_RSaIT1_E:
.LFB6281:
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
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt25__uninitialized_default_nIPmmET_S1_T0_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6281:
	.size	_ZSt27__uninitialized_default_n_aIPmmmET_S1_T0_RSaIT1_E, .-_ZSt27__uninitialized_default_n_aIPmmmET_S1_T0_RSaIT1_E
	.section	.text._ZNKSt6vectorImSaImEE12_M_check_lenEmPKc,"axG",@progbits,_ZNKSt6vectorImSaImEE12_M_check_lenEmPKc,comdat
	.align 2
	.weak	_ZNKSt6vectorImSaImEE12_M_check_lenEmPKc
	.type	_ZNKSt6vectorImSaImEE12_M_check_lenEmPKc, @function
_ZNKSt6vectorImSaImEE12_M_check_lenEmPKc:
.LFB6282:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE8max_sizeEv@PLT
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE4sizeEv@PLT
	subq	%rax, %rbx
	movq	%rbx, %rdx
	movq	-48(%rbp), %rax
	cmpq	%rax, %rdx
	setb	%al
	testb	%al, %al
	je	.L504
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.L504:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE4sizeEv@PLT
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE4sizeEv@PLT
	movq	%rax, -32(%rbp)
	leaq	-48(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt3maxImERKT_S2_S2_@PLT
	movq	(%rax), %rax
	addq	%rbx, %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE4sizeEv@PLT
	cmpq	%rax, -24(%rbp)
	jb	.L505
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE8max_sizeEv@PLT
	cmpq	%rax, -24(%rbp)
	jbe	.L506
.L505:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt6vectorImSaImEE8max_sizeEv@PLT
	jmp	.L507
.L506:
	movq	-24(%rbp), %rax
.L507:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6282:
	.size	_ZNKSt6vectorImSaImEE12_M_check_lenEmPKc, .-_ZNKSt6vectorImSaImEE12_M_check_lenEmPKc
	.section	.text._ZNSt12_Vector_baseImSaImEE11_M_allocateEm,"axG",@progbits,_ZNSt12_Vector_baseImSaImEE11_M_allocateEm,comdat
	.align 2
	.weak	_ZNSt12_Vector_baseImSaImEE11_M_allocateEm
	.type	_ZNSt12_Vector_baseImSaImEE11_M_allocateEm, @function
_ZNSt12_Vector_baseImSaImEE11_M_allocateEm:
.LFB6283:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L510
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt16allocator_traitsISaImEE8allocateERS0_m@PLT
	jmp	.L512
.L510:
	movl	$0, %eax
.L512:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6283:
	.size	_ZNSt12_Vector_baseImSaImEE11_M_allocateEm, .-_ZNSt12_Vector_baseImSaImEE11_M_allocateEm
	.section	.text._ZNSt6vectorImSaImEE11_S_relocateEPmS2_S2_RS0_,"axG",@progbits,_ZNSt6vectorImSaImEE11_S_relocateEPmS2_S2_RS0_,comdat
	.weak	_ZNSt6vectorImSaImEE11_S_relocateEPmS2_S2_RS0_
	.type	_ZNSt6vectorImSaImEE11_S_relocateEPmS2_S2_RS0_, @function
_ZNSt6vectorImSaImEE11_S_relocateEPmS2_S2_RS0_:
.LFB6284:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt6vectorImSaImEE14_S_do_relocateEPmS2_S2_RS0_St17integral_constantIbLb1EE@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6284:
	.size	_ZNSt6vectorImSaImEE11_S_relocateEPmS2_S2_RS0_, .-_ZNSt6vectorImSaImEE11_S_relocateEPmS2_S2_RS0_
	.section	.text._ZSt34__uninitialized_move_if_noexcept_aIPmS0_SaImEET0_T_S3_S2_RT1_,"axG",@progbits,_ZSt34__uninitialized_move_if_noexcept_aIPmS0_SaImEET0_T_S3_S2_RT1_,comdat
	.weak	_ZSt34__uninitialized_move_if_noexcept_aIPmS0_SaImEET0_T_S3_S2_RT1_
	.type	_ZSt34__uninitialized_move_if_noexcept_aIPmS0_SaImEET0_T_S3_S2_RT1_, @function
_ZSt34__uninitialized_move_if_noexcept_aIPmS0_SaImEET0_T_S3_S2_RT1_:
.LFB6285:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt32__make_move_if_noexcept_iteratorImSt13move_iteratorIPmEET0_PT_@PLT
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt32__make_move_if_noexcept_iteratorImSt13move_iteratorIPmEET0_PT_@PLT
	movq	%rax, %rdi
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movq	%rbx, %rsi
	call	_ZSt22__uninitialized_copy_aISt13move_iteratorIPmES1_mET0_T_S4_S3_RSaIT1_E@PLT
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6285:
	.size	_ZSt34__uninitialized_move_if_noexcept_aIPmS0_SaImEET0_T_S3_S2_RT1_, .-_ZSt34__uninitialized_move_if_noexcept_aIPmS0_SaImEET0_T_S3_S2_RT1_
	.section	.text._ZNKSt6vectorImSaImEE3endEv,"axG",@progbits,_ZNKSt6vectorImSaImEE3endEv,comdat
	.align 2
	.weak	_ZNKSt6vectorImSaImEE3endEv
	.type	_ZNKSt6vectorImSaImEE3endEv, @function
_ZNKSt6vectorImSaImEE3endEv:
.LFB6286:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	leaq	-8(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEC1ERKS2_@PLT
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6286:
	.size	_ZNKSt6vectorImSaImEE3endEv, .-_ZNKSt6vectorImSaImEE3endEv
	.section	.text._ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEmiEl,"axG",@progbits,_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEmiEl,comdat
	.align 2
	.weak	_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEmiEl
	.type	_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEmiEl, @function
_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEmiEl:
.LFB6287:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	salq	$3, %rdx
	negq	%rdx
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	leaq	-8(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEC1ERKS2_@PLT
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6287:
	.size	_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEmiEl, .-_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEmiEl
	.section	.text._ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEdeEv,"axG",@progbits,_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEdeEv,comdat
	.align 2
	.weak	_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEdeEv
	.type	_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEdeEv, @function
_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEdeEv:
.LFB6288:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6288:
	.size	_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEdeEv, .-_ZNK9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEdeEv
	.section	.text._ZN5boost6detail17integer_log2_implImEEiT_i,"axG",@progbits,_ZN5boost6detail17integer_log2_implImEEiT_i,comdat
	.weak	_ZN5boost6detail17integer_log2_implImEEiT_i
	.type	_ZN5boost6detail17integer_log2_implImEEiT_i, @function
_ZN5boost6detail17integer_log2_implImEEiT_i:
.LFB6289:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
.L526:
	cmpq	$1, -24(%rbp)
	je	.L524
	movl	-28(%rbp), %eax
	movq	-24(%rbp), %rdx
	movl	%eax, %ecx
	shrq	%cl, %rdx
	movq	%rdx, %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L525
	movl	-28(%rbp), %eax
	addl	%eax, -4(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
.L525:
	movl	-28(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -28(%rbp)
	jmp	.L526
.L524:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6289:
	.size	_ZN5boost6detail17integer_log2_implImEEiT_i, .-_ZN5boost6detail17integer_log2_implImEEiT_i
	.section	.text._ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERS9_,"axG",@progbits,_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERS9_,comdat
	.weak	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERS9_
	.type	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERS9_, @function
_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERS9_:
.LFB6290:
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
	call	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERS7_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6290:
	.size	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERS9_, .-_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERS9_
	.section	.text._ZSt12__get_helperILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEJEERT0_RSt11_Tuple_implIXT_EJS8_DpT1_EE,"axG",@progbits,_ZSt12__get_helperILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEJEERT0_RSt11_Tuple_implIXT_EJS8_DpT1_EE,comdat
	.weak	_ZSt12__get_helperILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEJEERT0_RSt11_Tuple_implIXT_EJS8_DpT1_EE
	.type	_ZSt12__get_helperILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEJEERT0_RSt11_Tuple_implIXT_EJS8_DpT1_EE, @function
_ZSt12__get_helperILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEJEERT0_RSt11_Tuple_implIXT_EJS8_DpT1_EE:
.LFB6291:
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
	call	_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEE7_M_headERS8_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6291:
	.size	_ZSt12__get_helperILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEJEERT0_RSt11_Tuple_implIXT_EJS8_DpT1_EE, .-_ZSt12__get_helperILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEJEERT0_RSt11_Tuple_implIXT_EJS8_DpT1_EE
	.section	.text._ZN9__gnu_cxx16__aligned_bufferIyE7_M_addrEv,"axG",@progbits,_ZN9__gnu_cxx16__aligned_bufferIyE7_M_addrEv,comdat
	.align 2
	.weak	_ZN9__gnu_cxx16__aligned_bufferIyE7_M_addrEv
	.type	_ZN9__gnu_cxx16__aligned_bufferIyE7_M_addrEv, @function
_ZN9__gnu_cxx16__aligned_bufferIyE7_M_addrEv:
.LFB6292:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6292:
	.size	_ZN9__gnu_cxx16__aligned_bufferIyE7_M_addrEv, .-_ZN9__gnu_cxx16__aligned_bufferIyE7_M_addrEv
	.section	.text._ZSt9addressofISt14_Fwd_list_nodeIyEEPT_RS2_,"axG",@progbits,_ZSt9addressofISt14_Fwd_list_nodeIyEEPT_RS2_,comdat
	.weak	_ZSt9addressofISt14_Fwd_list_nodeIyEEPT_RS2_
	.type	_ZSt9addressofISt14_Fwd_list_nodeIyEEPT_RS2_, @function
_ZSt9addressofISt14_Fwd_list_nodeIyEEPT_RS2_:
.LFB6293:
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
	call	_ZSt11__addressofISt14_Fwd_list_nodeIyEEPT_RS2_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6293:
	.size	_ZSt9addressofISt14_Fwd_list_nodeIyEEPT_RS2_, .-_ZSt9addressofISt14_Fwd_list_nodeIyEEPT_RS2_
	.section	.text._ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE10deallocateEPS2_m,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE10deallocateEPS2_m,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE10deallocateEPS2_m
	.type	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE10deallocateEPS2_m, @function
_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE10deallocateEPS2_m:
.LFB6294:
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
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6294:
	.size	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE10deallocateEPS2_m, .-_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE10deallocateEPS2_m
	.section	.text._ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEEC2Ev,"axG",@progbits,_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEEC5Ev,comdat
	.align 2
	.weak	_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEEC2Ev
	.type	_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEEC2Ev, @function
_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEEC2Ev:
.LFB6296:
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
	call	_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EEC2Ev@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6296:
	.size	_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEEC2Ev, .-_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEEC2Ev
	.weak	_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEEC1Ev
	.set	_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEEC1Ev,_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEEC2Ev
	.section	.text._ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EEC2Ev,"axG",@progbits,_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EEC5Ev,comdat
	.align 2
	.weak	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EEC2Ev
	.type	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EEC2Ev, @function
_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EEC2Ev:
.LFB6299:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6299:
	.size	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EEC2Ev, .-_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EEC2Ev
	.weak	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EEC1Ev
	.set	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EEC1Ev,_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EEC2Ev
	.section	.text._ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8allocateEmPKv,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8allocateEmPKv,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8allocateEmPKv
	.type	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8allocateEmPKv, @function
_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8allocateEmPKv:
.LFB6328:
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
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8max_sizeEv@PLT
	cmpq	%rax, -16(%rbp)
	seta	%al
	testb	%al, %al
	je	.L540
	call	_ZSt17__throw_bad_allocv@PLT
.L540:
	movq	-16(%rbp), %rax
	salq	$4, %rax
	movq	%rax, %rdi
	call	_Znwm@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6328:
	.size	_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8allocateEmPKv, .-_ZN9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8allocateEmPKv
	.section	.text._ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERKS9_,"axG",@progbits,_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERKS9_,comdat
	.weak	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERKS9_
	.type	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERKS9_, @function
_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERKS9_:
.LFB6329:
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
	call	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERKS7_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6329:
	.size	_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERKS9_, .-_ZNSt11_Tuple_implILm0EJPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEESt14default_deleteIS5_EEE7_M_headERKS9_
	.section	.text._ZN9__gnu_cxx13new_allocatorImEC2ERKS1_,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorImEC5ERKS1_,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorImEC2ERKS1_
	.type	_ZN9__gnu_cxx13new_allocatorImEC2ERKS1_, @function
_ZN9__gnu_cxx13new_allocatorImEC2ERKS1_:
.LFB6331:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6331:
	.size	_ZN9__gnu_cxx13new_allocatorImEC2ERKS1_, .-_ZN9__gnu_cxx13new_allocatorImEC2ERKS1_
	.weak	_ZN9__gnu_cxx13new_allocatorImEC1ERKS1_
	.set	_ZN9__gnu_cxx13new_allocatorImEC1ERKS1_,_ZN9__gnu_cxx13new_allocatorImEC2ERKS1_
	.section	.text._ZN9__gnu_cxx13new_allocatorImE10deallocateEPmm,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorImE10deallocateEPmm,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorImE10deallocateEPmm
	.type	_ZN9__gnu_cxx13new_allocatorImE10deallocateEPmm, @function
_ZN9__gnu_cxx13new_allocatorImE10deallocateEPmm:
.LFB6333:
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
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdlPv@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6333:
	.size	_ZN9__gnu_cxx13new_allocatorImE10deallocateEPmm, .-_ZN9__gnu_cxx13new_allocatorImE10deallocateEPmm
	.section	.text._ZNSt6vectorImSaImEE11_S_max_sizeERKS0_,"axG",@progbits,_ZNSt6vectorImSaImEE11_S_max_sizeERKS0_,comdat
	.weak	_ZNSt6vectorImSaImEE11_S_max_sizeERKS0_
	.type	_ZNSt6vectorImSaImEE11_S_max_sizeERKS0_, @function
_ZNSt6vectorImSaImEE11_S_max_sizeERKS0_:
.LFB6334:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movabsq	$1152921504606846975, %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt16allocator_traitsISaImEE8max_sizeERKS0_@PLT
	movq	%rax, -16(%rbp)
	leaq	-16(%rbp), %rdx
	leaq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt3minImERKT_S2_S2_@PLT
	movq	(%rax), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6334:
	.size	_ZNSt6vectorImSaImEE11_S_max_sizeERKS0_, .-_ZNSt6vectorImSaImEE11_S_max_sizeERKS0_
	.section	.text._ZNKSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv,"axG",@progbits,_ZNKSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv,comdat
	.align 2
	.weak	_ZNKSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv
	.type	_ZNKSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv, @function
_ZNKSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv:
.LFB6335:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6335:
	.size	_ZNKSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv, .-_ZNKSt12_Vector_baseImSaImEE19_M_get_Tp_allocatorEv
	.section	.text._ZSt25__uninitialized_default_nIPmmET_S1_T0_,"axG",@progbits,_ZSt25__uninitialized_default_nIPmmET_S1_T0_,comdat
	.weak	_ZSt25__uninitialized_default_nIPmmET_S1_T0_
	.type	_ZSt25__uninitialized_default_nIPmmET_S1_T0_, @function
_ZSt25__uninitialized_default_nIPmmET_S1_T0_:
.LFB6336:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movb	$1, -1(%rbp)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPmmEET_S3_T0_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6336:
	.size	_ZSt25__uninitialized_default_nIPmmET_S1_T0_, .-_ZSt25__uninitialized_default_nIPmmET_S1_T0_
	.section	.text._ZSt3maxImERKT_S2_S2_,"axG",@progbits,_ZSt3maxImERKT_S2_S2_,comdat
	.weak	_ZSt3maxImERKT_S2_S2_
	.type	_ZSt3maxImERKT_S2_S2_, @function
_ZSt3maxImERKT_S2_S2_:
.LFB6337:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jnb	.L553
	movq	-16(%rbp), %rax
	jmp	.L554
.L553:
	movq	-8(%rbp), %rax
.L554:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6337:
	.size	_ZSt3maxImERKT_S2_S2_, .-_ZSt3maxImERKT_S2_S2_
	.section	.text._ZNSt16allocator_traitsISaImEE8allocateERS0_m,"axG",@progbits,_ZNSt16allocator_traitsISaImEE8allocateERS0_m,comdat
	.weak	_ZNSt16allocator_traitsISaImEE8allocateERS0_m
	.type	_ZNSt16allocator_traitsISaImEE8allocateERS0_m, @function
_ZNSt16allocator_traitsISaImEE8allocateERS0_m:
.LFB6338:
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
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx13new_allocatorImE8allocateEmPKv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6338:
	.size	_ZNSt16allocator_traitsISaImEE8allocateERS0_m, .-_ZNSt16allocator_traitsISaImEE8allocateERS0_m
	.section	.text._ZNSt6vectorImSaImEE14_S_do_relocateEPmS2_S2_RS0_St17integral_constantIbLb1EE,"axG",@progbits,_ZNSt6vectorImSaImEE14_S_do_relocateEPmS2_S2_RS0_St17integral_constantIbLb1EE,comdat
	.weak	_ZNSt6vectorImSaImEE14_S_do_relocateEPmS2_S2_RS0_St17integral_constantIbLb1EE
	.type	_ZNSt6vectorImSaImEE14_S_do_relocateEPmS2_S2_RS0_St17integral_constantIbLb1EE, @function
_ZNSt6vectorImSaImEE14_S_do_relocateEPmS2_S2_RS0_St17integral_constantIbLb1EE:
.LFB6339:
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
	movq	%rcx, -32(%rbp)
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__relocate_aIPmS0_SaImEET0_T_S3_S2_RT1_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6339:
	.size	_ZNSt6vectorImSaImEE14_S_do_relocateEPmS2_S2_RS0_St17integral_constantIbLb1EE, .-_ZNSt6vectorImSaImEE14_S_do_relocateEPmS2_S2_RS0_St17integral_constantIbLb1EE
	.section	.text._ZSt32__make_move_if_noexcept_iteratorImSt13move_iteratorIPmEET0_PT_,"axG",@progbits,_ZSt32__make_move_if_noexcept_iteratorImSt13move_iteratorIPmEET0_PT_,comdat
	.weak	_ZSt32__make_move_if_noexcept_iteratorImSt13move_iteratorIPmEET0_PT_
	.type	_ZSt32__make_move_if_noexcept_iteratorImSt13move_iteratorIPmEET0_PT_, @function
_ZSt32__make_move_if_noexcept_iteratorImSt13move_iteratorIPmEET0_PT_:
.LFB6340:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rdx
	leaq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt13move_iteratorIPmEC1ES0_@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6340:
	.size	_ZSt32__make_move_if_noexcept_iteratorImSt13move_iteratorIPmEET0_PT_, .-_ZSt32__make_move_if_noexcept_iteratorImSt13move_iteratorIPmEET0_PT_
	.section	.text._ZSt22__uninitialized_copy_aISt13move_iteratorIPmES1_mET0_T_S4_S3_RSaIT1_E,"axG",@progbits,_ZSt22__uninitialized_copy_aISt13move_iteratorIPmES1_mET0_T_S4_S3_RSaIT1_E,comdat
	.weak	_ZSt22__uninitialized_copy_aISt13move_iteratorIPmES1_mET0_T_S4_S3_RSaIT1_E
	.type	_ZSt22__uninitialized_copy_aISt13move_iteratorIPmES1_mET0_T_S4_S3_RSaIT1_E, @function
_ZSt22__uninitialized_copy_aISt13move_iteratorIPmES1_mET0_T_S4_S3_RSaIT1_E:
.LFB6341:
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
	movq	%rcx, -32(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZSt18uninitialized_copyISt13move_iteratorIPmES1_ET0_T_S4_S3_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6341:
	.size	_ZSt22__uninitialized_copy_aISt13move_iteratorIPmES1_mET0_T_S4_S3_RSaIT1_E, .-_ZSt22__uninitialized_copy_aISt13move_iteratorIPmES1_mET0_T_S4_S3_RSaIT1_E
	.section	.text._ZN9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEC2ERKS2_,"axG",@progbits,_ZN9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEC5ERKS2_,comdat
	.align 2
	.weak	_ZN9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEC2ERKS2_
	.type	_ZN9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEC2ERKS2_, @function
_ZN9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEC2ERKS2_:
.LFB6343:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6343:
	.size	_ZN9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEC2ERKS2_, .-_ZN9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEC2ERKS2_
	.weak	_ZN9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEC1ERKS2_
	.set	_ZN9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEC1ERKS2_,_ZN9__gnu_cxx17__normal_iteratorIPKmSt6vectorImSaImEEEC2ERKS2_
	.section	.text._ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERS7_,"axG",@progbits,_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERS7_,comdat
	.weak	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERS7_
	.type	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERS7_, @function
_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERS7_:
.LFB6345:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6345:
	.size	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERS7_, .-_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERS7_
	.section	.text._ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEE7_M_headERS8_,"axG",@progbits,_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEE7_M_headERS8_,comdat
	.weak	_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEE7_M_headERS8_
	.type	_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEE7_M_headERS8_, @function
_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEE7_M_headERS8_:
.LFB6346:
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
	call	_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EE7_M_headERS8_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6346:
	.size	_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEE7_M_headERS8_, .-_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEEEE7_M_headERS8_
	.section	.text._ZSt11__addressofISt14_Fwd_list_nodeIyEEPT_RS2_,"axG",@progbits,_ZSt11__addressofISt14_Fwd_list_nodeIyEEPT_RS2_,comdat
	.weak	_ZSt11__addressofISt14_Fwd_list_nodeIyEEPT_RS2_
	.type	_ZSt11__addressofISt14_Fwd_list_nodeIyEEPT_RS2_, @function
_ZSt11__addressofISt14_Fwd_list_nodeIyEEPT_RS2_:
.LFB6347:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6347:
	.size	_ZSt11__addressofISt14_Fwd_list_nodeIyEEPT_RS2_, .-_ZSt11__addressofISt14_Fwd_list_nodeIyEEPT_RS2_
	.section	.text._ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EEC2Ev,"axG",@progbits,_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EEC5Ev,comdat
	.align 2
	.weak	_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EEC2Ev
	.type	_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EEC2Ev, @function
_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EEC2Ev:
.LFB6349:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6349:
	.size	_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EEC2Ev, .-_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EEC2Ev
	.weak	_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EEC1Ev
	.set	_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EEC1Ev,_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EEC2Ev
	.section	.text._ZNK9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8max_sizeEv,"axG",@progbits,_ZNK9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8max_sizeEv,comdat
	.align 2
	.weak	_ZNK9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8max_sizeEv
	.type	_ZNK9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8max_sizeEv, @function
_ZNK9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8max_sizeEv:
.LFB6361:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movabsq	$576460752303423487, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6361:
	.size	_ZNK9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8max_sizeEv, .-_ZNK9__gnu_cxx13new_allocatorISt14_Fwd_list_nodeIyEE8max_sizeEv
	.section	.text._ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERKS7_,"axG",@progbits,_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERKS7_,comdat
	.weak	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERKS7_
	.type	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERKS7_, @function
_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERKS7_:
.LFB6362:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6362:
	.size	_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERKS7_, .-_ZNSt10_Head_baseILm0EPNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEELb0EE7_M_headERKS7_
	.section	.text._ZNSt16allocator_traitsISaImEE8max_sizeERKS0_,"axG",@progbits,_ZNSt16allocator_traitsISaImEE8max_sizeERKS0_,comdat
	.weak	_ZNSt16allocator_traitsISaImEE8max_sizeERKS0_
	.type	_ZNSt16allocator_traitsISaImEE8max_sizeERKS0_, @function
_ZNSt16allocator_traitsISaImEE8max_sizeERKS0_:
.LFB6363:
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
	call	_ZNK9__gnu_cxx13new_allocatorImE8max_sizeEv@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6363:
	.size	_ZNSt16allocator_traitsISaImEE8max_sizeERKS0_, .-_ZNSt16allocator_traitsISaImEE8max_sizeERKS0_
	.section	.text._ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPmmEET_S3_T0_,"axG",@progbits,_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPmmEET_S3_T0_,comdat
	.weak	_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPmmEET_S3_T0_
	.type	_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPmmEET_S3_T0_, @function
_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPmmEET_S3_T0_:
.LFB6364:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -8(%rbp)
	leaq	-8(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZSt6fill_nIPmmmET_S1_T0_RKT1_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6364:
	.size	_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPmmEET_S3_T0_, .-_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPmmEET_S3_T0_
	.section	.text._ZN9__gnu_cxx13new_allocatorImE8allocateEmPKv,"axG",@progbits,_ZN9__gnu_cxx13new_allocatorImE8allocateEmPKv,comdat
	.align 2
	.weak	_ZN9__gnu_cxx13new_allocatorImE8allocateEmPKv
	.type	_ZN9__gnu_cxx13new_allocatorImE8allocateEmPKv, @function
_ZN9__gnu_cxx13new_allocatorImE8allocateEmPKv:
.LFB6365:
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
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK9__gnu_cxx13new_allocatorImE8max_sizeEv@PLT
	cmpq	%rax, -16(%rbp)
	seta	%al
	testb	%al, %al
	je	.L580
	call	_ZSt17__throw_bad_allocv@PLT
.L580:
	movq	-16(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdi
	call	_Znwm@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6365:
	.size	_ZN9__gnu_cxx13new_allocatorImE8allocateEmPKv, .-_ZN9__gnu_cxx13new_allocatorImE8allocateEmPKv
	.section	.text._ZSt12__relocate_aIPmS0_SaImEET0_T_S3_S2_RT1_,"axG",@progbits,_ZSt12__relocate_aIPmS0_SaImEET0_T_S3_S2_RT1_,comdat
	.weak	_ZSt12__relocate_aIPmS0_SaImEET0_T_S3_S2_RT1_
	.type	_ZSt12__relocate_aIPmS0_SaImEET0_T_S3_S2_RT1_, @function
_ZSt12__relocate_aIPmS0_SaImEET0_T_S3_S2_RT1_:
.LFB6366:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__niter_baseIPmET_S1_@PLT
	movq	%rax, %r12
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__niter_baseIPmET_S1_@PLT
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__niter_baseIPmET_S1_@PLT
	movq	%rax, %rdi
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	_ZSt14__relocate_a_1ImmENSt9enable_ifIXsrSt24__is_bitwise_relocatableIT_vE5valueEPS2_E4typeES4_S4_S4_RSaIT0_E@PLT
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6366:
	.size	_ZSt12__relocate_aIPmS0_SaImEET0_T_S3_S2_RT1_, .-_ZSt12__relocate_aIPmS0_SaImEET0_T_S3_S2_RT1_
	.section	.text._ZNSt13move_iteratorIPmEC2ES0_,"axG",@progbits,_ZNSt13move_iteratorIPmEC5ES0_,comdat
	.align 2
	.weak	_ZNSt13move_iteratorIPmEC2ES0_
	.type	_ZNSt13move_iteratorIPmEC2ES0_, @function
_ZNSt13move_iteratorIPmEC2ES0_:
.LFB6368:
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
.LFE6368:
	.size	_ZNSt13move_iteratorIPmEC2ES0_, .-_ZNSt13move_iteratorIPmEC2ES0_
	.weak	_ZNSt13move_iteratorIPmEC1ES0_
	.set	_ZNSt13move_iteratorIPmEC1ES0_,_ZNSt13move_iteratorIPmEC2ES0_
	.section	.text._ZSt18uninitialized_copyISt13move_iteratorIPmES1_ET0_T_S4_S3_,"axG",@progbits,_ZSt18uninitialized_copyISt13move_iteratorIPmES1_ET0_T_S4_S3_,comdat
	.weak	_ZSt18uninitialized_copyISt13move_iteratorIPmES1_ET0_T_S4_S3_
	.type	_ZSt18uninitialized_copyISt13move_iteratorIPmES1_ET0_T_S4_S3_, @function
_ZSt18uninitialized_copyISt13move_iteratorIPmES1_ET0_T_S4_S3_:
.LFB6370:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movb	$1, -1(%rbp)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt20__uninitialized_copyILb1EE13__uninit_copyISt13move_iteratorIPmES3_EET0_T_S6_S5_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6370:
	.size	_ZSt18uninitialized_copyISt13move_iteratorIPmES1_ET0_T_S4_S3_, .-_ZSt18uninitialized_copyISt13move_iteratorIPmES1_ET0_T_S4_S3_
	.section	.text._ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EE7_M_headERS8_,"axG",@progbits,_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EE7_M_headERS8_,comdat
	.weak	_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EE7_M_headERS8_
	.type	_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EE7_M_headERS8_, @function
_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EE7_M_headERS8_:
.LFB6371:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6371:
	.size	_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EE7_M_headERS8_, .-_ZNSt10_Head_baseILm1ESt14default_deleteINSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEEELb1EE7_M_headERS8_
	.section	.text._ZNK9__gnu_cxx13new_allocatorImE8max_sizeEv,"axG",@progbits,_ZNK9__gnu_cxx13new_allocatorImE8max_sizeEv,comdat
	.align 2
	.weak	_ZNK9__gnu_cxx13new_allocatorImE8max_sizeEv
	.type	_ZNK9__gnu_cxx13new_allocatorImE8max_sizeEv, @function
_ZNK9__gnu_cxx13new_allocatorImE8max_sizeEv:
.LFB6374:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movabsq	$1152921504606846975, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6374:
	.size	_ZNK9__gnu_cxx13new_allocatorImE8max_sizeEv, .-_ZNK9__gnu_cxx13new_allocatorImE8max_sizeEv
	.section	.text._ZSt6fill_nIPmmmET_S1_T0_RKT1_,"axG",@progbits,_ZSt6fill_nIPmmmET_S1_T0_RKT1_,comdat
	.weak	_ZSt6fill_nIPmmmET_S1_T0_RKT1_
	.type	_ZSt6fill_nIPmmmET_S1_T0_RKT1_, @function
_ZSt6fill_nIPmmmET_S1_T0_RKT1_:
.LFB6375:
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
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__niter_baseIPmET_S1_@PLT
	movq	%rax, %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	_ZSt10__fill_n_aIPmmmEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_@PLT
	movq	%rax, %rdx
	leaq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt12__niter_wrapIPmET_RKS1_S1_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6375:
	.size	_ZSt6fill_nIPmmmET_S1_T0_RKT1_, .-_ZSt6fill_nIPmmmET_S1_T0_RKT1_
	.section	.text._ZSt12__niter_baseIPmET_S1_,"axG",@progbits,_ZSt12__niter_baseIPmET_S1_,comdat
	.weak	_ZSt12__niter_baseIPmET_S1_
	.type	_ZSt12__niter_baseIPmET_S1_, @function
_ZSt12__niter_baseIPmET_S1_:
.LFB6376:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6376:
	.size	_ZSt12__niter_baseIPmET_S1_, .-_ZSt12__niter_baseIPmET_S1_
	.section	.text._ZSt14__relocate_a_1ImmENSt9enable_ifIXsrSt24__is_bitwise_relocatableIT_vE5valueEPS2_E4typeES4_S4_S4_RSaIT0_E,"axG",@progbits,_ZSt14__relocate_a_1ImmENSt9enable_ifIXsrSt24__is_bitwise_relocatableIT_vE5valueEPS2_E4typeES4_S4_S4_RSaIT0_E,comdat
	.weak	_ZSt14__relocate_a_1ImmENSt9enable_ifIXsrSt24__is_bitwise_relocatableIT_vE5valueEPS2_E4typeES4_S4_S4_RSaIT0_E
	.type	_ZSt14__relocate_a_1ImmENSt9enable_ifIXsrSt24__is_bitwise_relocatableIT_vE5valueEPS2_E4typeES4_S4_S4_RSaIT0_E, @function
_ZSt14__relocate_a_1ImmENSt9enable_ifIXsrSt24__is_bitwise_relocatableIT_vE5valueEPS2_E4typeES4_S4_S4_RSaIT0_E:
.LFB6377:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-32(%rbp), %rax
	subq	-24(%rbp), %rax
	sarq	$3, %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jle	.L596
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memmove@PLT
.L596:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6377:
	.size	_ZSt14__relocate_a_1ImmENSt9enable_ifIXsrSt24__is_bitwise_relocatableIT_vE5valueEPS2_E4typeES4_S4_S4_RSaIT0_E, .-_ZSt14__relocate_a_1ImmENSt9enable_ifIXsrSt24__is_bitwise_relocatableIT_vE5valueEPS2_E4typeES4_S4_S4_RSaIT0_E
	.section	.text._ZNSt20__uninitialized_copyILb1EE13__uninit_copyISt13move_iteratorIPmES3_EET0_T_S6_S5_,"axG",@progbits,_ZNSt20__uninitialized_copyILb1EE13__uninit_copyISt13move_iteratorIPmES3_EET0_T_S6_S5_,comdat
	.weak	_ZNSt20__uninitialized_copyILb1EE13__uninit_copyISt13move_iteratorIPmES3_EET0_T_S6_S5_
	.type	_ZNSt20__uninitialized_copyILb1EE13__uninit_copyISt13move_iteratorIPmES3_EET0_T_S6_S5_, @function
_ZNSt20__uninitialized_copyILb1EE13__uninit_copyISt13move_iteratorIPmES3_EET0_T_S6_S5_:
.LFB6378:
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
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZSt4copyISt13move_iteratorIPmES1_ET0_T_S4_S3_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6378:
	.size	_ZNSt20__uninitialized_copyILb1EE13__uninit_copyISt13move_iteratorIPmES3_EET0_T_S6_S5_, .-_ZNSt20__uninitialized_copyILb1EE13__uninit_copyISt13move_iteratorIPmES3_EET0_T_S6_S5_
	.section	.text._ZSt10__fill_n_aIPmmmEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_,"axG",@progbits,_ZSt10__fill_n_aIPmmmEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_,comdat
	.weak	_ZSt10__fill_n_aIPmmmEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_
	.type	_ZSt10__fill_n_aIPmmmEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_, @function
_ZSt10__fill_n_aIPmmmEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_:
.LFB6379:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
.L602:
	cmpq	$0, -8(%rbp)
	je	.L601
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	subq	$1, -8(%rbp)
	addq	$8, -24(%rbp)
	jmp	.L602
.L601:
	movq	-24(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6379:
	.size	_ZSt10__fill_n_aIPmmmEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_, .-_ZSt10__fill_n_aIPmmmEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_
	.section	.text._ZSt12__niter_wrapIPmET_RKS1_S1_,"axG",@progbits,_ZSt12__niter_wrapIPmET_RKS1_S1_,comdat
	.weak	_ZSt12__niter_wrapIPmET_RKS1_S1_
	.type	_ZSt12__niter_wrapIPmET_RKS1_S1_, @function
_ZSt12__niter_wrapIPmET_RKS1_S1_:
.LFB6380:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6380:
	.size	_ZSt12__niter_wrapIPmET_RKS1_S1_, .-_ZSt12__niter_wrapIPmET_RKS1_S1_
	.section	.text._ZSt4copyISt13move_iteratorIPmES1_ET0_T_S4_S3_,"axG",@progbits,_ZSt4copyISt13move_iteratorIPmES1_ET0_T_S4_S3_,comdat
	.weak	_ZSt4copyISt13move_iteratorIPmES1_ET0_T_S4_S3_
	.type	_ZSt4copyISt13move_iteratorIPmES1_ET0_T_S4_S3_, @function
_ZSt4copyISt13move_iteratorIPmES1_ET0_T_S4_S3_:
.LFB6381:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__miter_baseIPmEDTcl12__miter_basecldtfp_4baseEEESt13move_iteratorIT_E@PLT
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__miter_baseIPmEDTcl12__miter_basecldtfp_4baseEEESt13move_iteratorIT_E@PLT
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movq	%rbx, %rsi
	movq	%rcx, %rdi
	call	_ZSt14__copy_move_a2ILb1EPmS0_ET1_T0_S2_S1_@PLT
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6381:
	.size	_ZSt4copyISt13move_iteratorIPmES1_ET0_T_S4_S3_, .-_ZSt4copyISt13move_iteratorIPmES1_ET0_T_S4_S3_
	.section	.text._ZSt12__miter_baseIPmEDTcl12__miter_basecldtfp_4baseEEESt13move_iteratorIT_E,"axG",@progbits,_ZSt12__miter_baseIPmEDTcl12__miter_basecldtfp_4baseEEESt13move_iteratorIT_E,comdat
	.weak	_ZSt12__miter_baseIPmEDTcl12__miter_basecldtfp_4baseEEESt13move_iteratorIT_E
	.type	_ZSt12__miter_baseIPmEDTcl12__miter_basecldtfp_4baseEEESt13move_iteratorIT_E, @function
_ZSt12__miter_baseIPmEDTcl12__miter_basecldtfp_4baseEEESt13move_iteratorIT_E:
.LFB6382:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt13move_iteratorIPmE4baseEv@PLT
	movq	%rax, %rdi
	call	_ZSt12__miter_baseIPmET_S1_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6382:
	.size	_ZSt12__miter_baseIPmEDTcl12__miter_basecldtfp_4baseEEESt13move_iteratorIT_E, .-_ZSt12__miter_baseIPmEDTcl12__miter_basecldtfp_4baseEEESt13move_iteratorIT_E
	.section	.text._ZSt14__copy_move_a2ILb1EPmS0_ET1_T0_S2_S1_,"axG",@progbits,_ZSt14__copy_move_a2ILb1EPmS0_ET1_T0_S2_S1_,comdat
	.weak	_ZSt14__copy_move_a2ILb1EPmS0_ET1_T0_S2_S1_
	.type	_ZSt14__copy_move_a2ILb1EPmS0_ET1_T0_S2_S1_, @function
_ZSt14__copy_move_a2ILb1EPmS0_ET1_T0_S2_S1_:
.LFB6383:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__niter_baseIPmET_S1_@PLT
	movq	%rax, %r12
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__niter_baseIPmET_S1_@PLT
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt12__niter_baseIPmET_S1_@PLT
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_ZSt13__copy_move_aILb1EPmS0_ET1_T0_S2_S1_@PLT
	movq	%rax, %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt12__niter_wrapIPmET_RKS1_S1_@PLT
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6383:
	.size	_ZSt14__copy_move_a2ILb1EPmS0_ET1_T0_S2_S1_, .-_ZSt14__copy_move_a2ILb1EPmS0_ET1_T0_S2_S1_
	.section	.text._ZNKSt13move_iteratorIPmE4baseEv,"axG",@progbits,_ZNKSt13move_iteratorIPmE4baseEv,comdat
	.align 2
	.weak	_ZNKSt13move_iteratorIPmE4baseEv
	.type	_ZNKSt13move_iteratorIPmE4baseEv, @function
_ZNKSt13move_iteratorIPmE4baseEv:
.LFB6384:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6384:
	.size	_ZNKSt13move_iteratorIPmE4baseEv, .-_ZNKSt13move_iteratorIPmE4baseEv
	.section	.text._ZSt12__miter_baseIPmET_S1_,"axG",@progbits,_ZSt12__miter_baseIPmET_S1_,comdat
	.weak	_ZSt12__miter_baseIPmET_S1_
	.type	_ZSt12__miter_baseIPmET_S1_, @function
_ZSt12__miter_baseIPmET_S1_:
.LFB6385:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6385:
	.size	_ZSt12__miter_baseIPmET_S1_, .-_ZSt12__miter_baseIPmET_S1_
	.section	.text._ZSt13__copy_move_aILb1EPmS0_ET1_T0_S2_S1_,"axG",@progbits,_ZSt13__copy_move_aILb1EPmS0_ET1_T0_S2_S1_,comdat
	.weak	_ZSt13__copy_move_aILb1EPmS0_ET1_T0_S2_S1_
	.type	_ZSt13__copy_move_aILb1EPmS0_ET1_T0_S2_S1_, @function
_ZSt13__copy_move_aILb1EPmS0_ET1_T0_S2_S1_:
.LFB6386:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movb	$1, -1(%rbp)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt11__copy_moveILb1ELb1ESt26random_access_iterator_tagE8__copy_mImEEPT_PKS3_S6_S4_@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6386:
	.size	_ZSt13__copy_move_aILb1EPmS0_ET1_T0_S2_S1_, .-_ZSt13__copy_move_aILb1EPmS0_ET1_T0_S2_S1_
	.section	.text._ZNSt11__copy_moveILb1ELb1ESt26random_access_iterator_tagE8__copy_mImEEPT_PKS3_S6_S4_,"axG",@progbits,_ZNSt11__copy_moveILb1ELb1ESt26random_access_iterator_tagE8__copy_mImEEPT_PKS3_S6_S4_,comdat
	.weak	_ZNSt11__copy_moveILb1ELb1ESt26random_access_iterator_tagE8__copy_mImEEPT_PKS3_S6_S4_
	.type	_ZNSt11__copy_moveILb1ELb1ESt26random_access_iterator_tagE8__copy_mImEEPT_PKS3_S6_S4_, @function
_ZNSt11__copy_moveILb1ELb1ESt26random_access_iterator_tagE8__copy_mImEEPT_PKS3_S6_S4_:
.LFB6387:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-32(%rbp), %rax
	subq	-24(%rbp), %rax
	sarq	$3, %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L619
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memmove@PLT
.L619:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6387:
	.size	_ZNSt11__copy_moveILb1ELb1ESt26random_access_iterator_tagE8__copy_mImEEPT_PKS3_S6_S4_, .-_ZNSt11__copy_moveILb1ELb1ESt26random_access_iterator_tagE8__copy_mImEEPT_PKS3_S6_S4_
	.weak	_ZTVN5boost10wrapexceptISt14overflow_errorEE
	.section	.data.rel.ro._ZTVN5boost10wrapexceptISt14overflow_errorEE,"awG",@progbits,_ZTVN5boost10wrapexceptISt14overflow_errorEE,comdat
	.align 8
	.type	_ZTVN5boost10wrapexceptISt14overflow_errorEE, @object
	.size	_ZTVN5boost10wrapexceptISt14overflow_errorEE, 120
_ZTVN5boost10wrapexceptISt14overflow_errorEE:
	.quad	0
	.quad	_ZTIN5boost10wrapexceptISt14overflow_errorEE
	.quad	_ZNK5boost10wrapexceptISt14overflow_errorE5cloneEv
	.quad	_ZNK5boost10wrapexceptISt14overflow_errorE7rethrowEv
	.quad	_ZN5boost10wrapexceptISt14overflow_errorED1Ev
	.quad	_ZN5boost10wrapexceptISt14overflow_errorED0Ev
	.quad	-8
	.quad	_ZTIN5boost10wrapexceptISt14overflow_errorEE
	.quad	_ZThn8_N5boost10wrapexceptISt14overflow_errorED1Ev
	.quad	_ZThn8_N5boost10wrapexceptISt14overflow_errorED0Ev
	.quad	_ZNKSt13runtime_error4whatEv
	.quad	-24
	.quad	_ZTIN5boost10wrapexceptISt14overflow_errorEE
	.quad	_ZThn24_N5boost10wrapexceptISt14overflow_errorED1Ev
	.quad	_ZThn24_N5boost10wrapexceptISt14overflow_errorED0Ev
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
.LFB6389:
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
.LFE6389:
	.size	_ZN3vuu18InvByteInCodePointD2Ev, .-_ZN3vuu18InvByteInCodePointD2Ev
	.weak	_ZN3vuu18InvByteInCodePointD1Ev
	.set	_ZN3vuu18InvByteInCodePointD1Ev,_ZN3vuu18InvByteInCodePointD2Ev
	.section	.text._ZN3vuu18InvByteInCodePointD0Ev,"axG",@progbits,_ZN3vuu18InvByteInCodePointD5Ev,comdat
	.align 2
	.weak	_ZN3vuu18InvByteInCodePointD0Ev
	.type	_ZN3vuu18InvByteInCodePointD0Ev, @function
_ZN3vuu18InvByteInCodePointD0Ev:
.LFB6391:
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
.LFE6391:
	.size	_ZN3vuu18InvByteInCodePointD0Ev, .-_ZN3vuu18InvByteInCodePointD0Ev
	.weak	_ZTVN5boost16exception_detail10clone_baseE
	.section	.data.rel.ro._ZTVN5boost16exception_detail10clone_baseE,"awG",@progbits,_ZTVN5boost16exception_detail10clone_baseE,comdat
	.align 8
	.type	_ZTVN5boost16exception_detail10clone_baseE, @object
	.size	_ZTVN5boost16exception_detail10clone_baseE, 48
_ZTVN5boost16exception_detail10clone_baseE:
	.quad	0
	.quad	_ZTIN5boost16exception_detail10clone_baseE
	.quad	__cxa_pure_virtual
	.quad	__cxa_pure_virtual
	.quad	0
	.quad	0
	.weak	_ZTVN5boost9exceptionE
	.section	.data.rel.ro._ZTVN5boost9exceptionE,"awG",@progbits,_ZTVN5boost9exceptionE,comdat
	.align 8
	.type	_ZTVN5boost9exceptionE, @object
	.size	_ZTVN5boost9exceptionE, 32
_ZTVN5boost9exceptionE:
	.quad	0
	.quad	_ZTIN5boost9exceptionE
	.quad	__cxa_pure_virtual
	.quad	__cxa_pure_virtual
	.weak	_ZTIN5boost10wrapexceptISt14overflow_errorEE
	.section	.data.rel.ro._ZTIN5boost10wrapexceptISt14overflow_errorEE,"awG",@progbits,_ZTIN5boost10wrapexceptISt14overflow_errorEE,comdat
	.align 8
	.type	_ZTIN5boost10wrapexceptISt14overflow_errorEE, @object
	.size	_ZTIN5boost10wrapexceptISt14overflow_errorEE, 72
_ZTIN5boost10wrapexceptISt14overflow_errorEE:
	.quad	_ZTVN10__cxxabiv121__vmi_class_type_infoE+16
	.quad	_ZTSN5boost10wrapexceptISt14overflow_errorEE
	.long	0
	.long	3
	.quad	_ZTIN5boost16exception_detail10clone_baseE
	.quad	2
	.quad	_ZTISt14overflow_error
	.quad	2050
	.quad	_ZTIN5boost9exceptionE
	.quad	6146
	.weak	_ZTSN5boost10wrapexceptISt14overflow_errorEE
	.section	.rodata._ZTSN5boost10wrapexceptISt14overflow_errorEE,"aG",@progbits,_ZTSN5boost10wrapexceptISt14overflow_errorEE,comdat
	.align 32
	.type	_ZTSN5boost10wrapexceptISt14overflow_errorEE, @object
	.size	_ZTSN5boost10wrapexceptISt14overflow_errorEE, 41
_ZTSN5boost10wrapexceptISt14overflow_errorEE:
	.string	"N5boost10wrapexceptISt14overflow_errorEE"
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
	.weak	_ZTIN5boost16exception_detail10clone_baseE
	.section	.data.rel.ro._ZTIN5boost16exception_detail10clone_baseE,"awG",@progbits,_ZTIN5boost16exception_detail10clone_baseE,comdat
	.align 8
	.type	_ZTIN5boost16exception_detail10clone_baseE, @object
	.size	_ZTIN5boost16exception_detail10clone_baseE, 16
_ZTIN5boost16exception_detail10clone_baseE:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSN5boost16exception_detail10clone_baseE
	.weak	_ZTSN5boost16exception_detail10clone_baseE
	.section	.rodata._ZTSN5boost16exception_detail10clone_baseE,"aG",@progbits,_ZTSN5boost16exception_detail10clone_baseE,comdat
	.align 32
	.type	_ZTSN5boost16exception_detail10clone_baseE, @object
	.size	_ZTSN5boost16exception_detail10clone_baseE, 39
_ZTSN5boost16exception_detail10clone_baseE:
	.string	"N5boost16exception_detail10clone_baseE"
	.weak	_ZTIN5boost9exceptionE
	.section	.data.rel.ro._ZTIN5boost9exceptionE,"awG",@progbits,_ZTIN5boost9exceptionE,comdat
	.align 8
	.type	_ZTIN5boost9exceptionE, @object
	.size	_ZTIN5boost9exceptionE, 16
_ZTIN5boost9exceptionE:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSN5boost9exceptionE
	.weak	_ZTSN5boost9exceptionE
	.section	.rodata._ZTSN5boost9exceptionE,"aG",@progbits,_ZTSN5boost9exceptionE,comdat
	.align 16
	.type	_ZTSN5boost9exceptionE, @object
	.size	_ZTSN5boost9exceptionE, 19
_ZTSN5boost9exceptionE:
	.string	"N5boost9exceptionE"
	.text
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB6408:
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
	jne	.L625
	cmpl	$65535, -8(%rbp)
	jne	.L625
	leaq	_ZStL8__ioinit(%rip), %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	__cxa_atexit@PLT
.L625:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6408:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.section	.text._ZN5boost10wrapexceptISt14overflow_errorEC2ERKS2_,"axG",@progbits,_ZN5boost10wrapexceptISt14overflow_errorEC5ERKS2_,comdat
	.align 2
	.weak	_ZN5boost10wrapexceptISt14overflow_errorEC2ERKS2_
	.type	_ZN5boost10wrapexceptISt14overflow_errorEC2ERKS2_, @function
_ZN5boost10wrapexceptISt14overflow_errorEC2ERKS2_:
.LFB6411:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6411
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
	call	_ZN5boost16exception_detail10clone_baseC2ERKS1_@PLT
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movq	-32(%rbp), %rdx
	addq	$8, %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt14overflow_errorC2ERKS_@PLT
	movq	-24(%rbp), %rax
	addq	$24, %rax
	movq	-32(%rbp), %rdx
	addq	$24, %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB109:
	call	_ZN5boost9exceptionC2ERKS0_@PLT
.LEHE109:
	movq	_ZTVN5boost10wrapexceptISt14overflow_errorEE@GOTPCREL(%rip), %rax
	leaq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	movq	_ZTVN5boost10wrapexceptISt14overflow_errorEE@GOTPCREL(%rip), %rax
	leaq	64(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	_ZTVN5boost10wrapexceptISt14overflow_errorEE@GOTPCREL(%rip), %rax
	leaq	104(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 24(%rax)
	jmp	.L629
.L628:
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	_ZNSt14overflow_errorD2Ev@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost16exception_detail10clone_baseD2Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB110:
	call	_Unwind_Resume@PLT
.LEHE110:
.L629:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6411:
	.section	.gcc_except_table
.LLSDA6411:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE6411-.LLSDACSB6411
.LLSDACSB6411:
	.uleb128 .LEHB109-.LFB6411
	.uleb128 .LEHE109-.LEHB109
	.uleb128 .L628-.LFB6411
	.uleb128 0
	.uleb128 .LEHB110-.LFB6411
	.uleb128 .LEHE110-.LEHB110
	.uleb128 0
	.uleb128 0
.LLSDACSE6411:
	.section	.text._ZN5boost10wrapexceptISt14overflow_errorEC2ERKS2_,"axG",@progbits,_ZN5boost10wrapexceptISt14overflow_errorEC5ERKS2_,comdat
	.size	_ZN5boost10wrapexceptISt14overflow_errorEC2ERKS2_, .-_ZN5boost10wrapexceptISt14overflow_errorEC2ERKS2_
	.weak	_ZN5boost10wrapexceptISt14overflow_errorEC1ERKS2_
	.set	_ZN5boost10wrapexceptISt14overflow_errorEC1ERKS2_,_ZN5boost10wrapexceptISt14overflow_errorEC2ERKS2_
	.section	.text._ZNK5boost10wrapexceptISt14overflow_errorE5cloneEv,"axG",@progbits,_ZNK5boost10wrapexceptISt14overflow_errorE5cloneEv,comdat
	.align 2
	.weak	_ZNK5boost10wrapexceptISt14overflow_errorE5cloneEv
	.type	_ZNK5boost10wrapexceptISt14overflow_errorE5cloneEv, @function
_ZNK5boost10wrapexceptISt14overflow_errorE5cloneEv:
.LFB6409:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6409
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -40(%rbp)
	movl	$64, %edi
.LEHB111:
	call	_Znwm@PLT
.LEHE111:
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB112:
	call	_ZN5boost10wrapexceptISt14overflow_errorEC1ERKS2_@PLT
.LEHE112:
	movq	%rbx, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	leaq	24(%rax), %rdx
	cmpq	$0, -24(%rbp)
	je	.L631
	movq	-24(%rbp), %rax
	addq	$24, %rax
	jmp	.L632
.L631:
	movl	$0, %eax
.L632:
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB113:
	call	_ZN5boost16exception_detail20copy_boost_exceptionEPNS_9exceptionEPKS1_@PLT
.LEHE113:
	movq	$0, -32(%rbp)
	movq	-24(%rbp), %rbx
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost10wrapexceptISt14overflow_errorE7deleterD1Ev@PLT
	movq	%rbx, %rax
	jmp	.L638
.L636:
	movq	%rax, %r12
	movl	$64, %esi
	movq	%rbx, %rdi
	call	_ZdlPvm@PLT
	movq	%r12, %rax
	movq	%rax, %rdi
.LEHB114:
	call	_Unwind_Resume@PLT
.L637:
	movq	%rax, %rbx
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5boost10wrapexceptISt14overflow_errorE7deleterD1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.LEHE114:
.L638:
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6409:
	.section	.gcc_except_table
.LLSDA6409:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE6409-.LLSDACSB6409
.LLSDACSB6409:
	.uleb128 .LEHB111-.LFB6409
	.uleb128 .LEHE111-.LEHB111
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB112-.LFB6409
	.uleb128 .LEHE112-.LEHB112
	.uleb128 .L636-.LFB6409
	.uleb128 0
	.uleb128 .LEHB113-.LFB6409
	.uleb128 .LEHE113-.LEHB113
	.uleb128 .L637-.LFB6409
	.uleb128 0
	.uleb128 .LEHB114-.LFB6409
	.uleb128 .LEHE114-.LEHB114
	.uleb128 0
	.uleb128 0
.LLSDACSE6409:
	.section	.text._ZNK5boost10wrapexceptISt14overflow_errorE5cloneEv,"axG",@progbits,_ZNK5boost10wrapexceptISt14overflow_errorE5cloneEv,comdat
	.size	_ZNK5boost10wrapexceptISt14overflow_errorE5cloneEv, .-_ZNK5boost10wrapexceptISt14overflow_errorE5cloneEv
	.section	.text._ZNK5boost10wrapexceptISt14overflow_errorE7rethrowEv,"axG",@progbits,_ZNK5boost10wrapexceptISt14overflow_errorE7rethrowEv,comdat
	.align 2
	.weak	_ZNK5boost10wrapexceptISt14overflow_errorE7rethrowEv
	.type	_ZNK5boost10wrapexceptISt14overflow_errorE7rethrowEv, @function
_ZNK5boost10wrapexceptISt14overflow_errorE7rethrowEv:
.LFB6413:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6413
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -24(%rbp)
	movl	$64, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB115:
	call	_ZN5boost10wrapexceptISt14overflow_errorEC1ERKS2_@PLT
.LEHE115:
	movq	_ZN5boost10wrapexceptISt14overflow_errorED1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	_ZTIN5boost10wrapexceptISt14overflow_errorEE@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB116:
	call	__cxa_throw@PLT
.L641:
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	__cxa_free_exception@PLT
	movq	%r12, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume@PLT
.LEHE116:
	.cfi_endproc
.LFE6413:
	.section	.gcc_except_table
.LLSDA6413:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE6413-.LLSDACSB6413
.LLSDACSB6413:
	.uleb128 .LEHB115-.LFB6413
	.uleb128 .LEHE115-.LEHB115
	.uleb128 .L641-.LFB6413
	.uleb128 0
	.uleb128 .LEHB116-.LFB6413
	.uleb128 .LEHE116-.LEHB116
	.uleb128 0
	.uleb128 0
.LLSDACSE6413:
	.section	.text._ZNK5boost10wrapexceptISt14overflow_errorE7rethrowEv,"axG",@progbits,_ZNK5boost10wrapexceptISt14overflow_errorE7rethrowEv,comdat
	.size	_ZNK5boost10wrapexceptISt14overflow_errorE7rethrowEv, .-_ZNK5boost10wrapexceptISt14overflow_errorE7rethrowEv
	.section	.text._ZN5boost10wrapexceptISt14overflow_errorE7deleterD2Ev,"axG",@progbits,_ZN5boost10wrapexceptISt14overflow_errorE7deleterD5Ev,comdat
	.align 2
	.weak	_ZN5boost10wrapexceptISt14overflow_errorE7deleterD2Ev
	.type	_ZN5boost10wrapexceptISt14overflow_errorE7deleterD2Ev, @function
_ZN5boost10wrapexceptISt14overflow_errorE7deleterD2Ev:
.LFB6415:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L644
	movq	(%rax), %rdx
	addq	$24, %rdx
	movq	(%rdx), %rdx
	movq	%rax, %rdi
	call	*%rdx
.L644:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6415:
	.size	_ZN5boost10wrapexceptISt14overflow_errorE7deleterD2Ev, .-_ZN5boost10wrapexceptISt14overflow_errorE7deleterD2Ev
	.weak	_ZN5boost10wrapexceptISt14overflow_errorE7deleterD1Ev
	.set	_ZN5boost10wrapexceptISt14overflow_errorE7deleterD1Ev,_ZN5boost10wrapexceptISt14overflow_errorE7deleterD2Ev
	.text
	.type	_GLOBAL__sub_I_CodepointFinder.cpp, @function
_GLOBAL__sub_I_CodepointFinder.cpp:
.LFB6417:
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
.LFE6417:
	.size	_GLOBAL__sub_I_CodepointFinder.cpp, .-_GLOBAL__sub_I_CodepointFinder.cpp
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_CodepointFinder.cpp
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (SUSE Linux) 9.3.1 20200406 [revision 6db837a5288ee3ca5ec504fbd5a765817e556ac2]"
	.section	.note.GNU-stack,"",@progbits
