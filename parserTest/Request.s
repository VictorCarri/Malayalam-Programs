	.file	"Request.cpp"
	.text
.Ltext0:
	.align 2
	.globl	_ZN7RequestC2Ev
	.type	_ZN7RequestC2Ev, @function
_ZN7RequestC2Ev:
.LFB1:
	.file 1 "cpp/Request.cpp"
	.loc 1 7 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
.LBB2:
	.loc 1 7 31
	movq	-8(%rbp), %rax
	movl	$2, (%rax)
.LBE2:
	.loc 1 9 1
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
	.loc 1 15 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	.loc 1 16 4
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, (%rax)
	.loc 1 17 1
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
	.loc 1 23 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 24 9
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 25 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_ZNK7Request10getCommandEv, .-_ZNK7Request10getCommandEv
.Letext0:
	.file 2 "./hpp/Request.hpp"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x199
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF395
	.byte	0x4
	.long	.LASF396
	.long	.LASF397
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.long	.LASF390
	.byte	0x4
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.long	0xca
	.uleb128 0x3
	.long	.LASF398
	.byte	0x7
	.byte	0x4
	.long	0xcf
	.byte	0x2
	.byte	0xb
	.byte	0x8
	.byte	0x1
	.long	0x64
	.uleb128 0x4
	.string	"FOF"
	.byte	0
	.uleb128 0x5
	.long	.LASF388
	.byte	0x1
	.uleb128 0x5
	.long	.LASF389
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.long	.LASF390
	.byte	0x2
	.byte	0x15
	.byte	0x3
	.long	.LASF392
	.byte	0x1
	.long	0x79
	.long	0x7f
	.uleb128 0x7
	.long	0xd6
	.byte	0
	.uleb128 0x6
	.long	.LASF391
	.byte	0x2
	.byte	0x1a
	.byte	0x8
	.long	.LASF393
	.byte	0x1
	.long	0x94
	.long	0x9f
	.uleb128 0x7
	.long	0xd6
	.uleb128 0x8
	.long	0x3e
	.byte	0
	.uleb128 0x9
	.long	.LASF399
	.byte	0x2
	.byte	0x1f
	.byte	0xb
	.long	.LASF400
	.long	0x3e
	.byte	0x1
	.long	0xb8
	.long	0xbe
	.uleb128 0x7
	.long	0xe1
	.byte	0
	.uleb128 0xa
	.string	"c"
	.byte	0x2
	.byte	0x22
	.byte	0xb
	.long	0x3e
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	0x31
	.uleb128 0xc
	.byte	0x4
	.byte	0x7
	.long	.LASF401
	.uleb128 0xd
	.byte	0x8
	.long	0x31
	.uleb128 0xb
	.long	0xd6
	.uleb128 0xd
	.byte	0x8
	.long	0xca
	.uleb128 0xb
	.long	0xe1
	.uleb128 0xe
	.long	0x9f
	.byte	0x1
	.byte	0x16
	.byte	0x12
	.long	0x10e
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x11b
	.uleb128 0xf
	.long	.LASF394
	.long	0xe7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.long	0x7f
	.byte	0x1
	.byte	0xe
	.byte	0x6
	.long	0x13d
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x159
	.uleb128 0xf
	.long	.LASF394
	.long	0xdc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.string	"com"
	.byte	0x1
	.byte	0xe
	.byte	0x22
	.long	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x11
	.long	0x64
	.byte	0x1
	.byte	0x7
	.byte	0x1
	.long	0x16a
	.byte	0
	.long	0x174
	.uleb128 0x12
	.long	.LASF394
	.long	0xdc
	.byte	0
	.uleb128 0x13
	.long	0x159
	.long	.LASF402
	.long	0x193
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.long	0x16a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2119
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_macro,"",@progbits
.Ldebug_macro0:
	.value	0x4
	.byte	0x2
	.long	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x5
	.uleb128 0x1
	.long	.LASF0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1
	.byte	0x5
	.uleb128 0x3
	.long	.LASF2
	.byte	0x5
	.uleb128 0x4
	.long	.LASF3
	.byte	0x5
	.uleb128 0x5
	.long	.LASF4
	.byte	0x5
	.uleb128 0x6
	.long	.LASF5
	.byte	0x5
	.uleb128 0x7
	.long	.LASF6
	.byte	0x5
	.uleb128 0x8
	.long	.LASF7
	.byte	0x5
	.uleb128 0x9
	.long	.LASF8
	.byte	0x5
	.uleb128 0xa
	.long	.LASF9
	.byte	0x5
	.uleb128 0xb
	.long	.LASF10
	.byte	0x5
	.uleb128 0xc
	.long	.LASF11
	.byte	0x5
	.uleb128 0xd
	.long	.LASF12
	.byte	0x5
	.uleb128 0xe
	.long	.LASF13
	.byte	0x5
	.uleb128 0xf
	.long	.LASF14
	.byte	0x5
	.uleb128 0x10
	.long	.LASF15
	.byte	0x5
	.uleb128 0x11
	.long	.LASF16
	.byte	0x5
	.uleb128 0x12
	.long	.LASF17
	.byte	0x5
	.uleb128 0x13
	.long	.LASF18
	.byte	0x5
	.uleb128 0x14
	.long	.LASF19
	.byte	0x5
	.uleb128 0x15
	.long	.LASF20
	.byte	0x5
	.uleb128 0x16
	.long	.LASF21
	.byte	0x5
	.uleb128 0x17
	.long	.LASF22
	.byte	0x5
	.uleb128 0x18
	.long	.LASF23
	.byte	0x5
	.uleb128 0x19
	.long	.LASF24
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF25
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF26
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF27
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF28
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF29
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF30
	.byte	0x5
	.uleb128 0x20
	.long	.LASF31
	.byte	0x5
	.uleb128 0x21
	.long	.LASF32
	.byte	0x5
	.uleb128 0x22
	.long	.LASF33
	.byte	0x5
	.uleb128 0x23
	.long	.LASF34
	.byte	0x5
	.uleb128 0x24
	.long	.LASF35
	.byte	0x5
	.uleb128 0x25
	.long	.LASF36
	.byte	0x5
	.uleb128 0x26
	.long	.LASF37
	.byte	0x5
	.uleb128 0x27
	.long	.LASF38
	.byte	0x5
	.uleb128 0x28
	.long	.LASF39
	.byte	0x5
	.uleb128 0x29
	.long	.LASF40
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF41
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF42
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF43
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF44
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF45
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF46
	.byte	0x5
	.uleb128 0x30
	.long	.LASF47
	.byte	0x5
	.uleb128 0x31
	.long	.LASF48
	.byte	0x5
	.uleb128 0x32
	.long	.LASF49
	.byte	0x5
	.uleb128 0x33
	.long	.LASF50
	.byte	0x5
	.uleb128 0x34
	.long	.LASF51
	.byte	0x5
	.uleb128 0x35
	.long	.LASF52
	.byte	0x5
	.uleb128 0x36
	.long	.LASF53
	.byte	0x5
	.uleb128 0x37
	.long	.LASF54
	.byte	0x5
	.uleb128 0x38
	.long	.LASF55
	.byte	0x5
	.uleb128 0x39
	.long	.LASF56
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF57
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF58
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF59
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF60
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF61
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF62
	.byte	0x5
	.uleb128 0x40
	.long	.LASF63
	.byte	0x5
	.uleb128 0x41
	.long	.LASF64
	.byte	0x5
	.uleb128 0x42
	.long	.LASF65
	.byte	0x5
	.uleb128 0x43
	.long	.LASF66
	.byte	0x5
	.uleb128 0x44
	.long	.LASF67
	.byte	0x5
	.uleb128 0x45
	.long	.LASF68
	.byte	0x5
	.uleb128 0x46
	.long	.LASF69
	.byte	0x5
	.uleb128 0x47
	.long	.LASF70
	.byte	0x5
	.uleb128 0x48
	.long	.LASF71
	.byte	0x5
	.uleb128 0x49
	.long	.LASF72
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF73
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF74
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF75
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF76
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF77
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF78
	.byte	0x5
	.uleb128 0x50
	.long	.LASF79
	.byte	0x5
	.uleb128 0x51
	.long	.LASF80
	.byte	0x5
	.uleb128 0x52
	.long	.LASF81
	.byte	0x5
	.uleb128 0x53
	.long	.LASF82
	.byte	0x5
	.uleb128 0x54
	.long	.LASF83
	.byte	0x5
	.uleb128 0x55
	.long	.LASF84
	.byte	0x5
	.uleb128 0x56
	.long	.LASF85
	.byte	0x5
	.uleb128 0x57
	.long	.LASF86
	.byte	0x5
	.uleb128 0x58
	.long	.LASF87
	.byte	0x5
	.uleb128 0x59
	.long	.LASF88
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF89
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF90
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF91
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF92
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF93
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF94
	.byte	0x5
	.uleb128 0x60
	.long	.LASF95
	.byte	0x5
	.uleb128 0x61
	.long	.LASF96
	.byte	0x5
	.uleb128 0x62
	.long	.LASF97
	.byte	0x5
	.uleb128 0x63
	.long	.LASF98
	.byte	0x5
	.uleb128 0x64
	.long	.LASF99
	.byte	0x5
	.uleb128 0x65
	.long	.LASF100
	.byte	0x5
	.uleb128 0x66
	.long	.LASF101
	.byte	0x5
	.uleb128 0x67
	.long	.LASF102
	.byte	0x5
	.uleb128 0x68
	.long	.LASF103
	.byte	0x5
	.uleb128 0x69
	.long	.LASF104
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF105
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF106
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF107
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF108
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF109
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF110
	.byte	0x5
	.uleb128 0x70
	.long	.LASF111
	.byte	0x5
	.uleb128 0x71
	.long	.LASF112
	.byte	0x5
	.uleb128 0x72
	.long	.LASF113
	.byte	0x5
	.uleb128 0x73
	.long	.LASF114
	.byte	0x5
	.uleb128 0x74
	.long	.LASF115
	.byte	0x5
	.uleb128 0x75
	.long	.LASF116
	.byte	0x5
	.uleb128 0x76
	.long	.LASF117
	.byte	0x5
	.uleb128 0x77
	.long	.LASF118
	.byte	0x5
	.uleb128 0x78
	.long	.LASF119
	.byte	0x5
	.uleb128 0x79
	.long	.LASF120
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF121
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF122
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF123
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF124
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF125
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF126
	.byte	0x5
	.uleb128 0x80
	.long	.LASF127
	.byte	0x5
	.uleb128 0x81
	.long	.LASF128
	.byte	0x5
	.uleb128 0x82
	.long	.LASF129
	.byte	0x5
	.uleb128 0x83
	.long	.LASF130
	.byte	0x5
	.uleb128 0x84
	.long	.LASF131
	.byte	0x5
	.uleb128 0x85
	.long	.LASF132
	.byte	0x5
	.uleb128 0x86
	.long	.LASF133
	.byte	0x5
	.uleb128 0x87
	.long	.LASF134
	.byte	0x5
	.uleb128 0x88
	.long	.LASF135
	.byte	0x5
	.uleb128 0x89
	.long	.LASF136
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF137
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF138
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF139
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF140
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF141
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF142
	.byte	0x5
	.uleb128 0x90
	.long	.LASF143
	.byte	0x5
	.uleb128 0x91
	.long	.LASF144
	.byte	0x5
	.uleb128 0x92
	.long	.LASF145
	.byte	0x5
	.uleb128 0x93
	.long	.LASF146
	.byte	0x5
	.uleb128 0x94
	.long	.LASF147
	.byte	0x5
	.uleb128 0x95
	.long	.LASF148
	.byte	0x5
	.uleb128 0x96
	.long	.LASF149
	.byte	0x5
	.uleb128 0x97
	.long	.LASF150
	.byte	0x5
	.uleb128 0x98
	.long	.LASF151
	.byte	0x5
	.uleb128 0x99
	.long	.LASF152
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF153
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF154
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF155
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF156
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF157
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF158
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF159
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF160
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF161
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF162
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF163
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF164
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF165
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF166
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF167
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF168
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF169
	.byte	0x5
	.uleb128 0xab
	.long	.LASF170
	.byte	0x5
	.uleb128 0xac
	.long	.LASF171
	.byte	0x5
	.uleb128 0xad
	.long	.LASF172
	.byte	0x5
	.uleb128 0xae
	.long	.LASF173
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF174
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF175
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF176
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF177
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF178
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF179
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF180
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF181
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF182
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF183
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF184
	.byte	0x5
	.uleb128 0xba
	.long	.LASF185
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF186
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF187
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF188
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF189
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF190
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF191
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF192
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF193
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF194
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF195
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF196
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF197
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF198
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF199
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF200
	.byte	0x5
	.uleb128 0xca
	.long	.LASF201
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF202
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF203
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF204
	.byte	0x5
	.uleb128 0xce
	.long	.LASF205
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF206
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF207
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF208
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF209
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF210
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF211
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF212
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF213
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF214
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF215
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF216
	.byte	0x5
	.uleb128 0xda
	.long	.LASF217
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF218
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF219
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF220
	.byte	0x5
	.uleb128 0xde
	.long	.LASF221
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF222
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF223
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF224
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF225
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF226
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF227
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF228
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF229
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF230
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF231
	.byte	0x5
	.uleb128 0xe9
	.long	.LASF232
	.byte	0x5
	.uleb128 0xea
	.long	.LASF233
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF234
	.byte	0x5
	.uleb128 0xec
	.long	.LASF235
	.byte	0x5
	.uleb128 0xed
	.long	.LASF236
	.byte	0x5
	.uleb128 0xee
	.long	.LASF237
	.byte	0x5
	.uleb128 0xef
	.long	.LASF238
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF239
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF240
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF241
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF242
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF243
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF244
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF245
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF246
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF247
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF248
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF249
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF250
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF251
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF252
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF253
	.byte	0x5
	.uleb128 0xff
	.long	.LASF254
	.byte	0x5
	.uleb128 0x100
	.long	.LASF255
	.byte	0x5
	.uleb128 0x101
	.long	.LASF256
	.byte	0x5
	.uleb128 0x102
	.long	.LASF257
	.byte	0x5
	.uleb128 0x103
	.long	.LASF258
	.byte	0x5
	.uleb128 0x104
	.long	.LASF259
	.byte	0x5
	.uleb128 0x105
	.long	.LASF260
	.byte	0x5
	.uleb128 0x106
	.long	.LASF261
	.byte	0x5
	.uleb128 0x107
	.long	.LASF262
	.byte	0x5
	.uleb128 0x108
	.long	.LASF263
	.byte	0x5
	.uleb128 0x109
	.long	.LASF264
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF265
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF266
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF267
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF268
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF269
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF270
	.byte	0x5
	.uleb128 0x110
	.long	.LASF271
	.byte	0x5
	.uleb128 0x111
	.long	.LASF272
	.byte	0x5
	.uleb128 0x112
	.long	.LASF273
	.byte	0x5
	.uleb128 0x113
	.long	.LASF274
	.byte	0x5
	.uleb128 0x114
	.long	.LASF275
	.byte	0x5
	.uleb128 0x115
	.long	.LASF276
	.byte	0x5
	.uleb128 0x116
	.long	.LASF277
	.byte	0x5
	.uleb128 0x117
	.long	.LASF278
	.byte	0x5
	.uleb128 0x118
	.long	.LASF279
	.byte	0x5
	.uleb128 0x119
	.long	.LASF280
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF281
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF282
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF283
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF284
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF285
	.byte	0x5
	.uleb128 0x11f
	.long	.LASF286
	.byte	0x5
	.uleb128 0x120
	.long	.LASF287
	.byte	0x5
	.uleb128 0x121
	.long	.LASF288
	.byte	0x5
	.uleb128 0x122
	.long	.LASF289
	.byte	0x5
	.uleb128 0x123
	.long	.LASF290
	.byte	0x5
	.uleb128 0x124
	.long	.LASF291
	.byte	0x5
	.uleb128 0x125
	.long	.LASF292
	.byte	0x5
	.uleb128 0x126
	.long	.LASF293
	.byte	0x5
	.uleb128 0x127
	.long	.LASF294
	.byte	0x5
	.uleb128 0x128
	.long	.LASF295
	.byte	0x5
	.uleb128 0x129
	.long	.LASF296
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF297
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF298
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF299
	.byte	0x5
	.uleb128 0x12d
	.long	.LASF300
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF301
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF302
	.byte	0x5
	.uleb128 0x130
	.long	.LASF303
	.byte	0x5
	.uleb128 0x131
	.long	.LASF304
	.byte	0x5
	.uleb128 0x132
	.long	.LASF305
	.byte	0x5
	.uleb128 0x133
	.long	.LASF306
	.byte	0x5
	.uleb128 0x134
	.long	.LASF307
	.byte	0x5
	.uleb128 0x135
	.long	.LASF308
	.byte	0x5
	.uleb128 0x136
	.long	.LASF309
	.byte	0x5
	.uleb128 0x137
	.long	.LASF310
	.byte	0x5
	.uleb128 0x138
	.long	.LASF311
	.byte	0x5
	.uleb128 0x139
	.long	.LASF312
	.byte	0x5
	.uleb128 0x13a
	.long	.LASF313
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF314
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF315
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF316
	.byte	0x5
	.uleb128 0x13e
	.long	.LASF317
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF318
	.byte	0x5
	.uleb128 0x140
	.long	.LASF319
	.byte	0x5
	.uleb128 0x141
	.long	.LASF320
	.byte	0x5
	.uleb128 0x142
	.long	.LASF321
	.byte	0x5
	.uleb128 0x143
	.long	.LASF322
	.byte	0x5
	.uleb128 0x144
	.long	.LASF323
	.byte	0x5
	.uleb128 0x145
	.long	.LASF324
	.byte	0x5
	.uleb128 0x146
	.long	.LASF325
	.byte	0x5
	.uleb128 0x147
	.long	.LASF326
	.byte	0x5
	.uleb128 0x148
	.long	.LASF327
	.byte	0x5
	.uleb128 0x149
	.long	.LASF328
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF329
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF330
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF331
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF332
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF333
	.byte	0x5
	.uleb128 0x14f
	.long	.LASF334
	.byte	0x5
	.uleb128 0x150
	.long	.LASF335
	.byte	0x5
	.uleb128 0x151
	.long	.LASF336
	.byte	0x5
	.uleb128 0x152
	.long	.LASF337
	.byte	0x5
	.uleb128 0x153
	.long	.LASF338
	.byte	0x5
	.uleb128 0x154
	.long	.LASF339
	.byte	0x5
	.uleb128 0x155
	.long	.LASF340
	.byte	0x5
	.uleb128 0x156
	.long	.LASF341
	.byte	0x5
	.uleb128 0x157
	.long	.LASF342
	.byte	0x5
	.uleb128 0x158
	.long	.LASF343
	.byte	0x5
	.uleb128 0x159
	.long	.LASF344
	.byte	0x5
	.uleb128 0x15a
	.long	.LASF345
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF346
	.byte	0x5
	.uleb128 0x15c
	.long	.LASF347
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF348
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF349
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF350
	.byte	0x5
	.uleb128 0x160
	.long	.LASF351
	.byte	0x5
	.uleb128 0x161
	.long	.LASF352
	.byte	0x5
	.uleb128 0x162
	.long	.LASF353
	.byte	0x5
	.uleb128 0x163
	.long	.LASF354
	.byte	0x5
	.uleb128 0x164
	.long	.LASF355
	.byte	0x5
	.uleb128 0x165
	.long	.LASF356
	.byte	0x5
	.uleb128 0x166
	.long	.LASF357
	.byte	0x5
	.uleb128 0x167
	.long	.LASF358
	.byte	0x5
	.uleb128 0x168
	.long	.LASF359
	.byte	0x5
	.uleb128 0x169
	.long	.LASF360
	.byte	0x5
	.uleb128 0x16a
	.long	.LASF361
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF362
	.byte	0x5
	.uleb128 0x16c
	.long	.LASF363
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF364
	.byte	0x5
	.uleb128 0x16e
	.long	.LASF365
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF366
	.byte	0x5
	.uleb128 0x170
	.long	.LASF367
	.byte	0x5
	.uleb128 0x171
	.long	.LASF368
	.byte	0x5
	.uleb128 0x172
	.long	.LASF369
	.byte	0x5
	.uleb128 0x173
	.long	.LASF370
	.byte	0x5
	.uleb128 0x174
	.long	.LASF371
	.byte	0x5
	.uleb128 0x175
	.long	.LASF372
	.byte	0x5
	.uleb128 0x176
	.long	.LASF373
	.byte	0x5
	.uleb128 0x177
	.long	.LASF374
	.byte	0x5
	.uleb128 0x178
	.long	.LASF375
	.byte	0x5
	.uleb128 0x179
	.long	.LASF376
	.byte	0x5
	.uleb128 0x17a
	.long	.LASF377
	.byte	0x5
	.uleb128 0x1
	.long	.LASF378
	.byte	0x5
	.uleb128 0x2
	.long	.LASF379
	.file 3 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x3
	.uleb128 0x3
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x3
	.uleb128 0x2
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro3
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdcpredef.h.19.006d14bbbe0dc07ba9b1ce3fdc8e40d3,comdat
.Ldebug_macro2:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF380
	.byte	0x5
	.uleb128 0x26
	.long	.LASF381
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF382
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF383
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF384
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.Request.hpp.2.441b810e720f8e644eb88a15cfa0833e,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF385
	.byte	0x5
	.uleb128 0x5
	.long	.LASF386
	.byte	0x5
	.uleb128 0x6
	.long	.LASF387
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF108:
	.string	"__EXCEPTIONS 1"
.LASF211:
	.string	"__DBL_MAX__ double(1.79769313486231570814527423731704357e+308L)"
.LASF260:
	.string	"__FLT64_HAS_QUIET_NAN__ 1"
.LASF316:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF245:
	.string	"__FLT32_HAS_INFINITY__ 1"
.LASF378:
	.string	"_GNU_SOURCE 1"
.LASF251:
	.string	"__FLT64_MAX_EXP__ 1024"
.LASF298:
	.string	"__FLT64X_EPSILON__ 1.08420217248550443400745280086994171e-19F64x"
.LASF279:
	.string	"__FLT32X_MAX_EXP__ 1024"
.LASF341:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF315:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF181:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF399:
	.string	"getCommand"
.LASF233:
	.string	"__FLT32_MANT_DIG__ 24"
.LASF331:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF1:
	.string	"__cplusplus 201402L"
.LASF281:
	.string	"__FLT32X_DECIMAL_DIG__ 17"
.LASF359:
	.string	"__k8__ 1"
.LASF206:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF175:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF71:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF93:
	.string	"__cpp_delegating_constructors 200604"
.LASF282:
	.string	"__FLT32X_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF347:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF183:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF98:
	.string	"__cpp_return_type_deduction 201304"
.LASF6:
	.string	"__GNUC_MINOR__ 2"
.LASF383:
	.string	"__STDC_ISO_10646__ 201706L"
.LASF148:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF401:
	.string	"unsigned int"
.LASF88:
	.string	"__cpp_attributes 200809"
.LASF255:
	.string	"__FLT64_MIN__ 2.22507385850720138309023271733240406e-308F64"
.LASF126:
	.string	"__LONG_LONG_WIDTH__ 64"
.LASF200:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F"
.LASF41:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF5:
	.string	"__GNUC__ 8"
.LASF386:
	.string	"GETCOM_FUNC getCommand"
.LASF168:
	.string	"__UINT64_C(c) c ## UL"
.LASF162:
	.string	"__UINT8_C(c) c"
.LASF204:
	.string	"__DBL_MANT_DIG__ 53"
.LASF240:
	.string	"__FLT32_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF395:
	.string	"GNU C++14 8.2.1 20180831 [gcc-8-branch revision 264010] -mtune=generic -march=x86-64 -ggdb3"
.LASF113:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF45:
	.string	"__INT16_TYPE__ short int"
.LASF377:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF219:
	.string	"__LDBL_DIG__ 18"
.LASF293:
	.string	"__FLT64X_MAX_EXP__ 16384"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF97:
	.string	"__cpp_alias_templates 200704"
.LASF51:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF173:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF52:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF247:
	.string	"__FLT64_MANT_DIG__ 53"
.LASF58:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF66:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF384:
	.string	"__STDC_NO_THREADS__ 1"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF227:
	.string	"__LDBL_MIN__ 3.36210314311209350626267781732175260e-4932L"
.LASF372:
	.string	"linux 1"
.LASF236:
	.string	"__FLT32_MIN_10_EXP__ (-37)"
.LASF215:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF55:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF117:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF65:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF132:
	.string	"__GLIBCXX_BITSIZE_INT_N_0 128"
.LASF393:
	.string	"_ZN7Request10setCommandENS_7CommandE"
.LASF111:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF248:
	.string	"__FLT64_DIG__ 15"
.LASF60:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF390:
	.string	"Request"
.LASF86:
	.string	"__cpp_static_assert 200410"
.LASF81:
	.string	"__cpp_raw_strings 200710"
.LASF345:
	.string	"__SIZEOF_INT128__ 16"
.LASF274:
	.string	"__FLT128_HAS_QUIET_NAN__ 1"
.LASF268:
	.string	"__FLT128_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF135:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF54:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF154:
	.string	"__INT_LEAST16_WIDTH__ 16"
.LASF244:
	.string	"__FLT32_HAS_DENORM__ 1"
.LASF374:
	.string	"__unix__ 1"
.LASF328:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF291:
	.string	"__FLT64X_MIN_EXP__ (-16381)"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF191:
	.string	"__FLT_DIG__ 6"
.LASF172:
	.string	"__INT_FAST16_WIDTH__ 64"
.LASF306:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF184:
	.string	"__GCC_IEC_559 2"
.LASF263:
	.string	"__FLT128_MIN_EXP__ (-16381)"
.LASF106:
	.string	"__cpp_sized_deallocation 201309"
.LASF246:
	.string	"__FLT32_HAS_QUIET_NAN__ 1"
.LASF163:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF180:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF161:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF318:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF37:
	.string	"__WCHAR_TYPE__ int"
.LASF141:
	.string	"__INT8_MAX__ 0x7f"
.LASF322:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF265:
	.string	"__FLT128_MAX_EXP__ 16384"
.LASF189:
	.string	"__FLT_RADIX__ 2"
.LASF285:
	.string	"__FLT32X_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F32x"
.LASF105:
	.string	"__cpp_digit_separators 201309"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF217:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF229:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951L"
.LASF259:
	.string	"__FLT64_HAS_INFINITY__ 1"
.LASF177:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF356:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF222:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF39:
	.string	"__INTMAX_TYPE__ long int"
.LASF103:
	.string	"__cpp_aggregate_nsdmi 201304"
.LASF68:
	.string	"__INTPTR_TYPE__ long int"
.LASF314:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF90:
	.string	"__cpp_rvalue_references 200610"
.LASF131:
	.string	"__GLIBCXX_TYPE_INT_N_0 __int128"
.LASF361:
	.string	"__MMX__ 1"
.LASF290:
	.string	"__FLT64X_DIG__ 18"
.LASF160:
	.string	"__INT_LEAST64_WIDTH__ 64"
.LASF252:
	.string	"__FLT64_MAX_10_EXP__ 308"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF348:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF317:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF46:
	.string	"__INT32_TYPE__ int"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF360:
	.string	"__code_model_small__ 1"
.LASF300:
	.string	"__FLT64X_HAS_DENORM__ 1"
.LASF351:
	.string	"__x86_64 1"
.LASF96:
	.string	"__cpp_ref_qualifiers 200710"
.LASF72:
	.string	"__GXX_WEAK__ 1"
.LASF382:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF292:
	.string	"__FLT64X_MIN_10_EXP__ (-4931)"
.LASF138:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF266:
	.string	"__FLT128_MAX_10_EXP__ 4932"
.LASF269:
	.string	"__FLT128_MIN__ 3.36210314311209350626267781732175260e-4932F128"
.LASF170:
	.string	"__INT_FAST8_WIDTH__ 8"
.LASF250:
	.string	"__FLT64_MIN_10_EXP__ (-307)"
.LASF94:
	.string	"__cpp_nsdmi 200809"
.LASF350:
	.string	"__amd64__ 1"
.LASF239:
	.string	"__FLT32_DECIMAL_DIG__ 9"
.LASF262:
	.string	"__FLT128_DIG__ 33"
.LASF49:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF127:
	.string	"__WCHAR_WIDTH__ 32"
.LASF333:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF115:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF57:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF195:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF284:
	.string	"__FLT32X_EPSILON__ 2.22044604925031308084726333618164062e-16F32x"
.LASF84:
	.string	"__cpp_lambdas 200907"
.LASF133:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF253:
	.string	"__FLT64_DECIMAL_DIG__ 17"
.LASF330:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF79:
	.string	"__cpp_runtime_arrays 198712"
.LASF35:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF226:
	.string	"__LDBL_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF188:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF396:
	.string	"cpp/Request.cpp"
.LASF83:
	.string	"__cpp_user_defined_literals 200809"
.LASF207:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF235:
	.string	"__FLT32_MIN_EXP__ (-125)"
.LASF110:
	.string	"__GXX_ABI_VERSION 1013"
.LASF273:
	.string	"__FLT128_HAS_INFINITY__ 1"
.LASF107:
	.string	"__cpp_threadsafe_static_init 200806"
.LASF234:
	.string	"__FLT32_DIG__ 6"
.LASF258:
	.string	"__FLT64_HAS_DENORM__ 1"
.LASF186:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF286:
	.string	"__FLT32X_HAS_DENORM__ 1"
.LASF352:
	.string	"__x86_64__ 1"
.LASF397:
	.string	"/home/victor/Programming/CPP/malayalam/MalayalamPluralisationServer/parserTest"
.LASF99:
	.string	"__cpp_init_captures 201304"
.LASF296:
	.string	"__FLT64X_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF336:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF391:
	.string	"setCommand"
.LASF158:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF151:
	.string	"__INT_LEAST8_WIDTH__ 8"
.LASF145:
	.string	"__UINT8_MAX__ 0xff"
.LASF146:
	.string	"__UINT16_MAX__ 0xffff"
.LASF213:
	.string	"__DBL_EPSILON__ double(2.22044604925031308084726333618164062e-16L)"
.LASF63:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF147:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF137:
	.string	"__INTMAX_WIDTH__ 64"
.LASF307:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF120:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF53:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF237:
	.string	"__FLT32_MAX_EXP__ 128"
.LASF369:
	.string	"__gnu_linux__ 1"
.LASF326:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF150:
	.string	"__INT8_C(c) c"
.LASF334:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF149:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF17:
	.string	"__LP64__ 1"
.LASF339:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF276:
	.string	"__FLT32X_DIG__ 15"
.LASF275:
	.string	"__FLT32X_MANT_DIG__ 53"
.LASF16:
	.string	"_LP64 1"
.LASF294:
	.string	"__FLT64X_MAX_10_EXP__ 4932"
.LASF332:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF179:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF92:
	.string	"__cpp_initializer_lists 200806"
.LASF254:
	.string	"__FLT64_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF379:
	.string	"DEBUG 1"
.LASF367:
	.string	"__SEG_FS 1"
.LASF357:
	.string	"__GCC_ASM_FLAG_OUTPUTS__ 1"
.LASF167:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF327:
	.string	"__NO_INLINE__ 1"
.LASF376:
	.string	"__ELF__ 1"
.LASF283:
	.string	"__FLT32X_MIN__ 2.22507385850720138309023271733240406e-308F32x"
.LASF69:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF153:
	.string	"__INT16_C(c) c"
.LASF152:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF308:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF309:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF302:
	.string	"__FLT64X_HAS_QUIET_NAN__ 1"
.LASF202:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF0:
	.string	"__STDC__ 1"
.LASF363:
	.string	"__SSE2__ 1"
.LASF208:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF101:
	.string	"__cpp_constexpr 201304"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF80:
	.string	"__cpp_unicode_characters 200704"
.LASF38:
	.string	"__WINT_TYPE__ unsigned int"
.LASF142:
	.string	"__INT16_MAX__ 0x7fff"
.LASF102:
	.string	"__cpp_decltype_auto 201304"
.LASF122:
	.string	"__SCHAR_WIDTH__ 8"
.LASF166:
	.string	"__UINT32_C(c) c ## U"
.LASF62:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 1"
.LASF76:
	.string	"__GXX_EXPERIMENTAL_CXX0X__ 1"
.LASF119:
	.string	"__WINT_MIN__ 0U"
.LASF218:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF228:
	.string	"__LDBL_EPSILON__ 1.08420217248550443400745280086994171e-19L"
.LASF109:
	.string	"__cpp_exceptions 199711"
.LASF231:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF185:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF139:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF346:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF264:
	.string	"__FLT128_MIN_10_EXP__ (-4931)"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF329:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF303:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF243:
	.string	"__FLT32_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F32"
.LASF311:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF178:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF143:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF164:
	.string	"__UINT16_C(c) c"
.LASF144:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF82:
	.string	"__cpp_unicode_literals 200710"
.LASF368:
	.string	"__SEG_GS 1"
.LASF365:
	.string	"__SSE_MATH__ 1"
.LASF40:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF319:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF394:
	.string	"this"
.LASF199:
	.string	"__FLT_EPSILON__ 1.19209289550781250000000000000000000e-7F"
.LASF140:
	.string	"__SIG_ATOMIC_WIDTH__ 32"
.LASF100:
	.string	"__cpp_generic_lambdas 201304"
.LASF112:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF196:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF220:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF128:
	.string	"__WINT_WIDTH__ 32"
.LASF297:
	.string	"__FLT64X_MIN__ 3.36210314311209350626267781732175260e-4932F64x"
.LASF169:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF324:
	.string	"__REGISTER_PREFIX__ "
.LASF242:
	.string	"__FLT32_EPSILON__ 1.19209289550781250000000000000000000e-7F32"
.LASF114:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF312:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF87:
	.string	"__cpp_decltype 200707"
.LASF278:
	.string	"__FLT32X_MIN_10_EXP__ (-307)"
.LASF78:
	.string	"__cpp_hex_float 201603"
.LASF136:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF42:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF301:
	.string	"__FLT64X_HAS_INFINITY__ 1"
.LASF75:
	.string	"__cpp_rtti 199711"
.LASF320:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF277:
	.string	"__FLT32X_MIN_EXP__ (-1021)"
.LASF19:
	.string	"__SIZEOF_LONG__ 8"
.LASF182:
	.string	"__INTPTR_WIDTH__ 64"
.LASF34:
	.string	"__GNUG__ 8"
.LASF64:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF156:
	.string	"__INT32_C(c) c"
.LASF232:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF44:
	.string	"__INT8_TYPE__ signed char"
.LASF118:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF370:
	.string	"__linux 1"
.LASF392:
	.string	"_ZN7RequestC4Ev"
.LASF50:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF398:
	.string	"Command"
.LASF270:
	.string	"__FLT128_EPSILON__ 1.92592994438723585305597794258492732e-34F128"
.LASF212:
	.string	"__DBL_MIN__ double(2.22507385850720138309023271733240406e-308L)"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF48:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF123:
	.string	"__SHRT_WIDTH__ 16"
.LASF366:
	.string	"__SSE2_MATH__ 1"
.LASF134:
	.string	"__INTMAX_C(c) c ## L"
.LASF174:
	.string	"__INT_FAST32_WIDTH__ 64"
.LASF400:
	.string	"_ZNK7Request10getCommandEv"
.LASF33:
	.string	"__SIZEOF_POINTER__ 8"
.LASF256:
	.string	"__FLT64_EPSILON__ 2.22044604925031308084726333618164062e-16F64"
.LASF289:
	.string	"__FLT64X_MANT_DIG__ 64"
.LASF116:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF190:
	.string	"__FLT_MANT_DIG__ 24"
.LASF124:
	.string	"__INT_WIDTH__ 32"
.LASF225:
	.string	"__LDBL_DECIMAL_DIG__ 21"
.LASF342:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF388:
	.string	"ISSING"
.LASF77:
	.string	"__cpp_binary_literals 201304"
.LASF325:
	.string	"__USER_LABEL_PREFIX__ "
.LASF335:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF73:
	.string	"__DEPRECATED 1"
.LASF373:
	.string	"__unix 1"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF355:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF130:
	.string	"__SIZE_WIDTH__ 64"
.LASF70:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF85:
	.string	"__cpp_range_based_for 200907"
.LASF125:
	.string	"__LONG_WIDTH__ 64"
.LASF358:
	.string	"__k8 1"
.LASF340:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF194:
	.string	"__FLT_MAX_EXP__ 128"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF261:
	.string	"__FLT128_MANT_DIG__ 113"
.LASF304:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF305:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF47:
	.string	"__INT64_TYPE__ long int"
.LASF198:
	.string	"__FLT_MIN__ 1.17549435082228750796873653722224568e-38F"
.LASF387:
	.string	"SETCOM_FUNC setCommand"
.LASF89:
	.string	"__cpp_rvalue_reference 200610"
.LASF364:
	.string	"__FXSR__ 1"
.LASF157:
	.string	"__INT_LEAST32_WIDTH__ 32"
.LASF56:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF8:
	.string	"__VERSION__ \"8.2.1 20180831 [gcc-8-branch revision 264010]\""
.LASF221:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF171:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF59:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF121:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF249:
	.string	"__FLT64_MIN_EXP__ (-1021)"
.LASF337:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF295:
	.string	"__FLT64X_DECIMAL_DIG__ 21"
.LASF95:
	.string	"__cpp_inheriting_constructors 201511"
.LASF193:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF104:
	.string	"__cpp_variable_templates 201304"
.LASF187:
	.string	"__FLT_EVAL_METHOD_TS_18661_3__ 0"
.LASF216:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF159:
	.string	"__INT64_C(c) c ## L"
.LASF343:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF74:
	.string	"__GXX_RTTI 1"
.LASF197:
	.string	"__FLT_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF203:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF36:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF61:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF381:
	.string	"__STDC_IEC_559__ 1"
.LASF323:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF385:
	.string	"REQUEST_HPP "
.LASF380:
	.string	"_STDC_PREDEF_H 1"
.LASF353:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF288:
	.string	"__FLT32X_HAS_QUIET_NAN__ 1"
.LASF209:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF338:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF402:
	.string	"_ZN7RequestC2Ev"
.LASF362:
	.string	"__SSE__ 1"
.LASF287:
	.string	"__FLT32X_HAS_INFINITY__ 1"
.LASF271:
	.string	"__FLT128_DENORM_MIN__ 6.47517511943802511092443895822764655e-4966F128"
.LASF192:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF354:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF321:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF389:
	.string	"INVALID"
.LASF91:
	.string	"__cpp_variadic_templates 200704"
.LASF165:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF280:
	.string	"__FLT32X_MAX_10_EXP__ 308"
.LASF349:
	.string	"__amd64 1"
.LASF371:
	.string	"__linux__ 1"
.LASF257:
	.string	"__FLT64_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F64"
.LASF214:
	.string	"__DBL_DENORM_MIN__ double(4.94065645841246544176568792868221372e-324L)"
.LASF238:
	.string	"__FLT32_MAX_10_EXP__ 38"
.LASF267:
	.string	"__FLT128_DECIMAL_DIG__ 36"
.LASF129:
	.string	"__PTRDIFF_WIDTH__ 64"
.LASF155:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF67:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF223:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF313:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF241:
	.string	"__FLT32_MIN__ 1.17549435082228750796873653722224568e-38F32"
.LASF375:
	.string	"unix 1"
.LASF344:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF43:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF299:
	.string	"__FLT64X_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951F64x"
.LASF272:
	.string	"__FLT128_HAS_DENORM__ 1"
.LASF210:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF230:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF205:
	.string	"__DBL_DIG__ 15"
.LASF310:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF201:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF176:
	.string	"__INT_FAST64_WIDTH__ 64"
.LASF224:
	.string	"__DECIMAL_DIG__ 21"
	.ident	"GCC: (SUSE Linux) 8.2.1 20180831 [gcc-8-branch revision 264010]"
	.section	.note.GNU-stack,"",@progbits
