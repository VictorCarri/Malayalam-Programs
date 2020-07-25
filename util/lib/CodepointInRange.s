	.file	"CodepointInRange.cpp"
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.section	.text._ZStanSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStanSt13_Ios_FmtflagsS_,comdat
	.weak	_ZStanSt13_Ios_FmtflagsS_
	.type	_ZStanSt13_Ios_FmtflagsS_, @function
_ZStanSt13_Ios_FmtflagsS_:
.LFB1113:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	andl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1113:
	.size	_ZStanSt13_Ios_FmtflagsS_, .-_ZStanSt13_Ios_FmtflagsS_
	.section	.text._ZStorSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStorSt13_Ios_FmtflagsS_,comdat
	.weak	_ZStorSt13_Ios_FmtflagsS_
	.type	_ZStorSt13_Ios_FmtflagsS_, @function
_ZStorSt13_Ios_FmtflagsS_:
.LFB1114:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	orl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1114:
	.size	_ZStorSt13_Ios_FmtflagsS_, .-_ZStorSt13_Ios_FmtflagsS_
	.section	.text._ZStcoSt13_Ios_Fmtflags,"axG",@progbits,_ZStcoSt13_Ios_Fmtflags,comdat
	.weak	_ZStcoSt13_Ios_Fmtflags
	.type	_ZStcoSt13_Ios_Fmtflags, @function
_ZStcoSt13_Ios_Fmtflags:
.LFB1116:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	notl	%eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1116:
	.size	_ZStcoSt13_Ios_Fmtflags, .-_ZStcoSt13_Ios_Fmtflags
	.section	.text._ZStoRRSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStoRRSt13_Ios_FmtflagsS_,comdat
	.weak	_ZStoRRSt13_Ios_FmtflagsS_
	.type	_ZStoRRSt13_Ios_FmtflagsS_, @function
_ZStoRRSt13_Ios_FmtflagsS_:
.LFB1117:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movl	%eax, %edi
	call	_ZStorSt13_Ios_FmtflagsS_@PLT
	movq	-8(%rbp), %rdx
	movl	%eax, (%rdx)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1117:
	.size	_ZStoRRSt13_Ios_FmtflagsS_, .-_ZStoRRSt13_Ios_FmtflagsS_
	.section	.text._ZStaNRSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStaNRSt13_Ios_FmtflagsS_,comdat
	.weak	_ZStaNRSt13_Ios_FmtflagsS_
	.type	_ZStaNRSt13_Ios_FmtflagsS_, @function
_ZStaNRSt13_Ios_FmtflagsS_:
.LFB1118:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movl	%eax, %edi
	call	_ZStanSt13_Ios_FmtflagsS_@PLT
	movq	-8(%rbp), %rdx
	movl	%eax, (%rdx)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1118:
	.size	_ZStaNRSt13_Ios_FmtflagsS_, .-_ZStaNRSt13_Ios_FmtflagsS_
	.section	.text._ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_,"axG",@progbits,_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_,comdat
	.align 2
	.weak	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_
	.type	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_, @function
_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_:
.LFB1147:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, %edi
	call	_ZStcoSt13_Ios_Fmtflags@PLT
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	addq	$24, %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZStaNRSt13_Ios_FmtflagsS_@PLT
	movl	-32(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_ZStanSt13_Ios_FmtflagsS_@PLT
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	addq	$24, %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZStoRRSt13_Ios_FmtflagsS_@PLT
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1147:
	.size	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_, .-_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_
	.section	.text._ZSt3hexRSt8ios_base,"axG",@progbits,_ZSt3hexRSt8ios_base,comdat
	.weak	_ZSt3hexRSt8ios_base
	.type	_ZSt3hexRSt8ios_base, @function
_ZSt3hexRSt8ios_base:
.LFB1175:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$74, %edx
	movl	$8, %esi
	movq	%rax, %rdi
	call	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1175:
	.size	_ZSt3hexRSt8ios_base, .-_ZSt3hexRSt8ios_base
	.section	.rodata
	.type	_ZStL13allocator_arg, @object
	.size	_ZStL13allocator_arg, 1
_ZStL13allocator_arg:
	.zero	1
	.type	_ZStL6ignore, @object
	.size	_ZStL6ignore, 1
_ZStL6ignore:
	.zero	1
	.align 8
.LC0:
	.string	"vuu::CodepointInRange::CodepointInRange: the end codepoint ("
.LC1:
	.string	") is <= the start codepoint ("
.LC2:
	.string	")"
	.text
	.align 2
	.globl	_ZN3vuu16CodepointInRangeC2Eyy
	.type	_ZN3vuu16CodepointInRangeC2Eyy, @function
_ZN3vuu16CodepointInRangeC2Eyy:
.LFB2120:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2120
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$448, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -440(%rbp)
	movq	%rsi, -448(%rbp)
	movq	%rdx, -456(%rbp)
	movq	-440(%rbp), %rax
	movq	-448(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-440(%rbp), %rax
	movq	-456(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-440(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-440(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	ja	.L23
	leaq	-432(%rbp), %rax
	movq	%rax, %rdi
.LEHB0:
	call	_ZNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEC1Ev@PLT
.LEHE0:
	leaq	-432(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
.LEHB1:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movq	_ZSt3hexRSt8ios_base@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSt8ios_baseS0_E@PLT
	movq	%rax, %rdx
	movq	-456(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEy@PLT
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movq	-440(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEy@PLT
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
.LEHE1:
	movl	$16, %edi
	call	__cxa_allocate_exception@PLT
	movq	%rax, %rbx
	leaq	-48(%rbp), %rax
	leaq	-432(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB2:
	call	_ZNKSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEE3strEv@PLT
.LEHE2:
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB3:
	call	_ZNSt16invalid_argumentC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.LEHE3:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	_ZNSt16invalid_argumentD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	_ZTISt16invalid_argument@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB4:
	call	__cxa_throw@PLT
.LEHE4:
.L22:
	movq	%rax, %r12
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT
	jmp	.L18
.L21:
	movq	%rax, %r12
.L18:
	movq	%rbx, %rdi
	call	__cxa_free_exception@PLT
	movq	%r12, %rbx
	jmp	.L19
.L20:
	movq	%rax, %rbx
.L19:
	leaq	-432(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev@PLT
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB5:
	call	_Unwind_Resume@PLT
.LEHE5:
.L23:
	nop
	addq	$448, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2120:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA2120:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2120-.LLSDACSB2120
.LLSDACSB2120:
	.uleb128 .LEHB0-.LFB2120
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB2120
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L20-.LFB2120
	.uleb128 0
	.uleb128 .LEHB2-.LFB2120
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L21-.LFB2120
	.uleb128 0
	.uleb128 .LEHB3-.LFB2120
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L22-.LFB2120
	.uleb128 0
	.uleb128 .LEHB4-.LFB2120
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L20-.LFB2120
	.uleb128 0
	.uleb128 .LEHB5-.LFB2120
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE2120:
	.text
	.size	_ZN3vuu16CodepointInRangeC2Eyy, .-_ZN3vuu16CodepointInRangeC2Eyy
	.globl	_ZN3vuu16CodepointInRangeC1Eyy
	.set	_ZN3vuu16CodepointInRangeC1Eyy,_ZN3vuu16CodepointInRangeC2Eyy
	.align 2
	.globl	_ZNK3vuu16CodepointInRangeclEy
	.type	_ZNK3vuu16CodepointInRangeclEy, @function
_ZNK3vuu16CodepointInRangeclEy:
.LFB2122:
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
	cmpq	%rax, -16(%rbp)
	jb	.L25
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, -16(%rbp)
	ja	.L25
	movl	$1, %eax
	jmp	.L26
.L25:
	movl	$0, %eax
.L26:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2122:
	.size	_ZNK3vuu16CodepointInRangeclEy, .-_ZNK3vuu16CodepointInRangeclEy
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.ident	"GCC: (SUSE Linux) 9.3.1 20200406 [revision 6db837a5288ee3ca5ec504fbd5a765817e556ac2]"
	.section	.note.GNU-stack,"",@progbits
