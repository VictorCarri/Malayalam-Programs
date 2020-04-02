	.file	"Reply.cpp"
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
.LC0:
	.string	"MPP/1.1 400 Bad Request"
	.align 8
.LC1:
	.string	"MPP/1.1 401 Unrecognised Protocol Major Version Number"
	.align 8
.LC2:
	.string	"MPP/1.1 402 Unrecognised Protocol Minor Version Number"
	.align 8
.LC3:
	.string	"MPP/1.1 403 Unrecognised Protocol Patch NUmber"
.LC4:
	.string	"MPP/1.1 404 Unrecognised Verb"
	.text
	.align 2
	.globl	_ZN5Reply11getFCStringB5cxx11ENS_11FailureCodeE
	.type	_ZN5Reply11getFCStringB5cxx11ENS_11FailureCodeE, @function
_ZN5Reply11getFCStringB5cxx11ENS_11FailureCodeE:
.LFB1006:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA1006
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$264, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -264(%rbp)
	movl	%esi, -268(%rbp)
	movq	-264(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev
	movl	-268(%rbp), %eax
	cmpl	$4, %eax
	ja	.L21
	movl	%eax, %eax
	movq	.L4(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L4:
	.quad	.L8
	.quad	.L7
	.quad	.L6
	.quad	.L5
	.quad	.L3
	.text
.L8:
	leaq	-209(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-209(%rbp), %rdx
	leaq	-256(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
.LEHB0:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE0:
	leaq	-256(%rbp), %rdx
	movq	-264(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEOS4_
	leaq	-256(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-209(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L2
.L7:
	leaq	-161(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-161(%rbp), %rdx
	leaq	-208(%rbp), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
.LEHB1:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE1:
	leaq	-208(%rbp), %rdx
	movq	-264(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEOS4_
	leaq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-161(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L2
.L6:
	leaq	-113(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-113(%rbp), %rdx
	leaq	-160(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
.LEHB2:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE2:
	leaq	-160(%rbp), %rdx
	movq	-264(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEOS4_
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-113(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L2
.L5:
	leaq	-65(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-65(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
.LEHB3:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE3:
	leaq	-112(%rbp), %rdx
	movq	-264(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEOS4_
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-65(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L2
.L3:
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-17(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
.LEHB4:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE4:
	leaq	-64(%rbp), %rdx
	movq	-264(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEOS4_
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	nop
.L2:
	jmp	.L21
.L16:
	movq	%rax, %rbx
	leaq	-209(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L11
.L17:
	movq	%rax, %rbx
	leaq	-161(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L11
.L18:
	movq	%rax, %rbx
	leaq	-113(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L11
.L19:
	movq	%rax, %rbx
	leaq	-65(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L11
.L20:
	movq	%rax, %rbx
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
.L11:
	movq	-264(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB5:
	call	_Unwind_Resume
.LEHE5:
.L21:
	nop
	movq	-264(%rbp), %rax
	addq	$264, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1006:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1006:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1006-.LLSDACSB1006
.LLSDACSB1006:
	.uleb128 .LEHB0-.LFB1006
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L16-.LFB1006
	.uleb128 0
	.uleb128 .LEHB1-.LFB1006
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L17-.LFB1006
	.uleb128 0
	.uleb128 .LEHB2-.LFB1006
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L18-.LFB1006
	.uleb128 0
	.uleb128 .LEHB3-.LFB1006
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L19-.LFB1006
	.uleb128 0
	.uleb128 .LEHB4-.LFB1006
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L20-.LFB1006
	.uleb128 0
	.uleb128 .LEHB5-.LFB1006
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE1006:
	.text
	.size	_ZN5Reply11getFCStringB5cxx11ENS_11FailureCodeE, .-_ZN5Reply11getFCStringB5cxx11ENS_11FailureCodeE
	.ident	"GCC: (SUSE Linux) 8.2.1 20180831 [gcc-8-branch revision 264010]"
	.section	.note.GNU-stack,"",@progbits
