	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	PI
	.section	.rodata
	.align 8
	.type	PI, @object
	.size	PI, 8
PI:
	.long	1413551940
	.long	1074340347
	.globl	start
	.bss
	.align 8
	.type	start, @object
	.size	start, 8
start:
	.zero	8
	.globl	end
	.align 8
	.type	end, @object
	.size	end, 8
end:
	.zero	8
	.section	.rodata
.LC3:
	.string	"cos is %lf\n"
.LC5:
	.string	"Estimated time is %f seconds\n"
	.text
	.globl	find_cos
	.type	find_cos, @function
find_cos:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	movsd	QWORD PTR -40[rbp], xmm0
	mov	QWORD PTR -48[rbp], rdi
	call	clock@PLT
	mov	QWORD PTR start[rip], rax
	movsd	xmm0, QWORD PTR .LC0[rip]
	movapd	xmm1, xmm0
	addsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC0[rip]
	movapd	xmm2, xmm0
	addsd	xmm2, xmm0
	movsd	xmm0, QWORD PTR -40[rbp]
	divsd	xmm0, xmm2
	cvttsd2si	eax, xmm0
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -40[rbp]
	mulsd	xmm0, xmm0
	movsd	QWORD PTR -32[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	movsd	QWORD PTR -16[rbp], xmm0
	mov	DWORD PTR -20[rbp], 0
	mov	DWORD PTR -24[rbp], 1
	jmp	.L2
.L3:
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR -8[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -16[rbp]
	mulsd	xmm0, QWORD PTR -32[rbp]
	movsd	QWORD PTR -16[rbp], xmm0
	mov	eax, DWORD PTR -20[rbp]
	lea	edx, 1[rax]
	mov	eax, DWORD PTR -20[rbp]
	add	eax, 2
	imul	eax, edx
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movsd	xmm0, QWORD PTR -16[rbp]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	add	DWORD PTR -20[rbp], 2
	neg	DWORD PTR -24[rbp]
.L2:
	cmp	DWORD PTR -20[rbp], 99
	jle	.L3
	call	clock@PLT
	mov	QWORD PTR end[rip], rax
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR end[rip]
	mov	rdx, QWORD PTR start[rip]
	sub	rax, rdx
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movq	rdx, xmm0
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	nop
	leave
	ret
	.size	find_cos, .-find_cos
	.section	.rodata
.LC6:
	.string	"%lf"
	.text
	.globl	start_default
	.type	start_default, @function
start_default:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	lea	rdx, -8[rbp]
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC6[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rdi, rdx
	movq	xmm0, rax
	call	find_cos
	nop
	leave
	ret
	.size	start_default, .-start_default
	.section	.rodata
.LC7:
	.string	"input x is %lf\n"
	.text
	.globl	start_rand
	.type	start_rand, @function
start_rand:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	QWORD PTR -8[rbp], xmm0
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC7[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rdx
	movq	xmm0, rax
	call	find_cos
	nop
	leave
	ret
	.size	start_rand, .-start_rand
	.section	.rodata
.LC8:
	.string	"-f"
.LC9:
	.string	"r"
.LC10:
	.string	"w"
.LC11:
	.string	"Incorrect input"
.LC12:
	.string	"-r"
.LC13:
	.string	"Incorrect input!"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	mov	rax, QWORD PTR stdin[rip]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR stdout[rip]
	mov	QWORD PTR -16[rbp], rax
	cmp	DWORD PTR -20[rbp], 1
	jne	.L7
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	start_default
	jmp	.L8
.L7:
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L9
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC9[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	je	.L10
	cmp	QWORD PTR -16[rbp], 0
	jne	.L11
.L10:
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L12
.L11:
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	start_default
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L8
.L9:
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC12[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L13
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	start_rand
	jmp	.L8
.L13:
	lea	rax, .LC13[rip]
	mov	rdi, rax
	call	puts@PLT
.L8:
	mov	eax, 0
.L12:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	1413551940
	.long	1074340347
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
