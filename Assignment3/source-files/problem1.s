	.file	"problem1.cpp"
# GNU C++17 (GCC) version 15.2.1 20250813 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 15.2.1 20250813, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=skylake -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mno-gfni -mno-vpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mno-clwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mno-movdir64b -mno-movdiri -mno-mwaitx -mno-pconfig -mno-pku -mprfchw -mno-ptwrite -mno-rdpid -mrdrnd -mrdseed -mno-rtm -mno-serialize -msgx -mno-sha -mno-shstk -mno-tbm -mno-tsxldtrk -mno-vaes -mno-waitpkg -mno-wbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mno-hreset -mno-kl -mno-widekl -mno-avxvnni -mno-avx512fp16 -mno-avxifma -mno-avxvnniint8 -mno-avxneconvert -mno-cmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mno-avxvnniint16 -mno-sm3 -mno-sha512 -mno-sm4 -mno-apxf -mno-usermsr -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-transpose -mno-amx-fp8 -mno-movrs -mno-amx-movrs --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=6144 -mtune=skylake -masm=att -msse4 -mavx2 -O2 -std=c++17 -fopenmp -fno-asynchronous-unwind-tables -fno-exceptions -fno-rtti -fcf-protection=none
	.text
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
# /usr/include/c++/15.2.1/bits/locale_facets.h:1094:       do_widen(char __c) const
	movl	%esi, %eax	# __c, __c
# /usr/include/c++/15.2.1/bits/locale_facets.h:1095:       { return __c; }
	ret	
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
	pushq	%rbx	#
	movq	%rdi, %rbx	# __os, __os
	subq	$16, %rsp	#,
# /usr/include/c++/15.2.1/ostream:67:     { return flush(__os.put(__os.widen('\n'))); }
	movq	(%rdi), %rax	# __os_1(D)->_vptr.basic_ostream, __os_1(D)->_vptr.basic_ostream
	movq	-24(%rax), %rax	# MEM[(long int *)_2 + -24B], MEM[(long int *)_2 + -24B]
	movq	240(%rdi,%rax), %rdi	# MEM[(const struct __ctype_type * *)_5 + 240B], _14
# /usr/include/c++/15.2.1/bits/basic_ios.h:51:       if (!__f)
	testq	%rdi, %rdi	# _14
	je	.L8	#,
# /usr/include/c++/15.2.1/bits/locale_facets.h:884: 	if (_M_widen_ok)
	cmpb	$0, 56(%rdi)	#, MEM[(const struct ctype *)_14]._M_widen_ok
	je	.L5	#,
# /usr/include/c++/15.2.1/bits/locale_facets.h:885: 	  return _M_widen[static_cast<unsigned char>(__c)];
	movsbl	67(%rdi), %esi	# MEM[(const struct ctype *)_14]._M_widen[10],
.L6:
# /usr/include/c++/15.2.1/ostream:67:     { return flush(__os.put(__os.widen('\n'))); }
	movq	%rbx, %rdi	# __os,
	call	_ZNSo3putEc@PLT	#
# /usr/include/c++/15.2.1/ostream:67:     { return flush(__os.put(__os.widen('\n'))); }
	addq	$16, %rsp	#,
# /usr/include/c++/15.2.1/ostream:89:     { return __os.flush(); }
	movq	%rax, %rdi	# _8,
# /usr/include/c++/15.2.1/ostream:67:     { return flush(__os.put(__os.widen('\n'))); }
	popq	%rbx	#
# /usr/include/c++/15.2.1/ostream:89:     { return __os.flush(); }
	jmp	_ZNSo5flushEv@PLT	#
.L5:
# /usr/include/c++/15.2.1/bits/locale_facets.h:886: 	this->_M_widen_init();
	movq	%rdi, 8(%rsp)	# _14, %sfp
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT	#
# /usr/include/c++/15.2.1/bits/locale_facets.h:887: 	return this->do_widen(__c);
	movq	8(%rsp), %rdi	# %sfp, _14
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx	#, tmp114
	movl	$10, %esi	#,
	movq	(%rdi), %rax	# MEM[(const struct ctype *)_14].D.58428._vptr.facet, MEM[(const struct ctype *)_14].D.58428._vptr.facet
	movq	48(%rax), %rax	# MEM[(int (*) () *)_27 + 48B], _28
	cmpq	%rdx, %rax	# tmp114, _28
	je	.L6	#,
	movl	$10, %esi	#,
	call	*%rax	# _28
	movsbl	%al, %esi	# _25,
	jmp	.L6	#
	.section	.text.unlikely
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0.cold, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0.cold:
.L8:
# /usr/include/c++/15.2.1/bits/basic_ios.h:52: 	__throw_bad_cast();
	call	_ZSt16__throw_bad_castv@PLT	#
	.text
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.section	.text.unlikely
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0.cold, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0.cold
.LCOLDE0:
	.text
.LHOTE0:
	.p2align 4
	.globl	_Z14stencil_3d_7ptPKdPd
	.type	_Z14stencil_3d_7ptPKdPd, @function
_Z14stencil_3d_7ptPKdPd:
	pushq	%rbp	#
	leaq	536(%rsi), %rax	#, _87
# problem1.cpp:39:         neighbors_sum += curr[(i + 1) * NY * NZ + j * NZ + k];
	vxorpd	%xmm3, %xmm3, %xmm3	# tmp143
# problem1.cpp:31: {
	movq	%rsp, %rbp	#,
	pushq	%r15	#
	leaq	34320(%rdi), %r15	#, _285
	pushq	%r14	#
	leaq	528(%rdi), %r14	#, _232
	pushq	%r13	#
	movl	$1, %r13d	#, ivtmp.182
	pushq	%r12	#
	movl	$34848, %r12d	#, ivtmp.192
	pushq	%rbx	#
	andq	$-32, %rsp	#,
	movq	%rax, -8(%rsp)	# _87, %sfp
	vbroadcastsd	.LC2(%rip), %ymm1	#, tmp165
.L11:
	movq	-8(%rsp), %rax	# %sfp, _87
	leaq	(%r14,%r12), %rdx	#, ivtmp.168
# problem1.cpp:34:     for (int j = 1; j < NY - 1; ++j)
	leaq	(%r15,%r12), %rbx	#, _34
	leaq	(%rax,%r12), %rcx	#, ivtmp.175
	.p2align 4,,10
	.p2align 3
.L15:
	leaq	8(%rdx), %r11	#, vectp.104
	leaq	16(%rdx), %r10	#, vectp.111
# problem1.cpp:31: {
	xorl	%eax, %eax	# ivtmp.140
	leaq	-520(%rdx), %r9	#, vectp.114
	leaq	536(%rdx), %r8	#, vectp.117
	leaq	-34840(%rdx), %rdi	#, vectp.120
	leaq	34856(%rdx), %rsi	#, vectp.123
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L12:
# problem1.cpp:39:         neighbors_sum += curr[(i + 1) * NY * NZ + j * NZ + k];
	vaddpd	(%rsi,%rax), %ymm3, %ymm0	# MEM <const vector(4) double> [(const double *)vectp.123_208 + ivtmp.140_5 * 1], tmp143, vect_neighbors_sum_69.125_199
# problem1.cpp:47:             W_OWN * curr[i * NY * NZ + j * NZ + k] +
	vmulpd	(%r11,%rax), %ymm1, %ymm2	# MEM <const vector(4) double> [(const double *)vectp.104_259 + ivtmp.140_5 * 1], tmp165, vect__52.106_251
# problem1.cpp:40:         neighbors_sum += curr[(i - 1) * NY * NZ + j * NZ + k];
	vaddpd	(%rdi,%rax), %ymm0, %ymm0	# MEM <const vector(4) double> [(const double *)vectp.120_217 + ivtmp.140_5 * 1], vect_neighbors_sum_69.125_199, vect_neighbors_sum_70.126_198
# problem1.cpp:41:         neighbors_sum += curr[i * NY * NZ + (j + 1) * NZ + k];
	vaddpd	(%r8,%rax), %ymm0, %ymm0	# MEM <const vector(4) double> [(const double *)vectp.117_226 + ivtmp.140_5 * 1], vect_neighbors_sum_70.126_198, vect_neighbors_sum_71.127_197
# problem1.cpp:42:         neighbors_sum += curr[i * NY * NZ + (j - 1) * NZ + k];
	vaddpd	(%r9,%rax), %ymm0, %ymm0	# MEM <const vector(4) double> [(const double *)vectp.114_235 + ivtmp.140_5 * 1], vect_neighbors_sum_71.127_197, vect_neighbors_sum_72.128_196
# problem1.cpp:43:         neighbors_sum += curr[i * NY * NZ + j * NZ + (k + 1)];
	vaddpd	(%r10,%rax), %ymm0, %ymm0	# MEM <const vector(4) double> [(const double *)vectp.111_243 + ivtmp.140_5 * 1], vect_neighbors_sum_72.128_196, vect_neighbors_sum_73.129_195
# problem1.cpp:44:         neighbors_sum += curr[i * NY * NZ + j * NZ + (k - 1)];
	vaddpd	(%rdx,%rax), %ymm0, %ymm0	# MEM <const vector(4) double> [(const double *)vectp.108_250 + ivtmp.140_5 * 1], vect_neighbors_sum_73.129_195, vect_neighbors_sum_74.130_194
# problem1.cpp:46:         next[i * NY * NZ + j * NZ + k] =
	vfmadd132pd	%ymm1, %ymm2, %ymm0	# tmp165, vect__52.106_251, tmp140
	vmovupd	%ymm0, (%rcx,%rax)	# tmp140, MEM <vector(4) double> [(double *)vectp.134_191 + ivtmp.140_5 * 1]
	addq	$32, %rax	#, ivtmp.140
	cmpq	$512, %rax	#, ivtmp.140
	jne	.L12	#,
# problem1.cpp:34:     for (int j = 1; j < NY - 1; ++j)
	addq	$528, %rdx	#, ivtmp.168
	addq	$528, %rcx	#, ivtmp.175
	cmpq	%rbx, %rdx	# _34, ivtmp.168
	jne	.L15	#,
# problem1.cpp:32:   for (int i = 1; i < NX - 1; ++i)
	incq	%r13	# ivtmp.182
	addq	$34848, %r12	#, ivtmp.192
	cmpq	$65, %r13	#, ivtmp.182
	jne	.L11	#,
	vzeroupper
# problem1.cpp:52: }
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	ret	
	.size	_Z14stencil_3d_7ptPKdPd, .-_Z14stencil_3d_7ptPKdPd
	.p2align 4
	.globl	_Z22stencil_3d_7pt_method1PKdPd
	.type	_Z22stencil_3d_7pt_method1PKdPd, @function
_Z22stencil_3d_7pt_method1PKdPd:
	pushq	%r12	#
	vmovsd	.LC2(%rip), %xmm1	#, tmp143
# problem1.cpp:57:   for (int i = 1; i < NX - 1; ++i)
	movl	$1, %r12d	#, _88
# problem1.cpp:64:         neighbors_sum += curr[(i + 1) * NY * NZ + j * NZ + k];
	vxorpd	%xmm2, %xmm2, %xmm2	# tmp136
# problem1.cpp:55: {
	pushq	%rbp	#
	leaq	35376(%rsi), %rbp	#, ivtmp.257
	pushq	%rbx	#
	leaq	34848(%rdi), %rbx	#, ivtmp.251
.L20:
	incq	%r12	# _88
	leaq	35376(%rbx), %r8	#, ivtmp.228
	leaq	-34320(%rbx), %rdi	#, ivtmp.231
# problem1.cpp:55: {
	movq	%rbp, %rcx	# ivtmp.257, ivtmp.236
	leaq	1056(%rbx), %rsi	#, ivtmp.234
	movq	%rbx, %r10	# ivtmp.251, ivtmp.225
	leaq	33792(%rbx), %r11	#, _204
	.p2align 4,,10
	.p2align 3
.L24:
	movq	%r10, %r9	# ivtmp.225, ivtmp.225
	addq	$528, %r10	#, ivtmp.225
	movl	$1, %eax	#, ivtmp.203
	movq	%r10, %rdx	# ivtmp.225, ivtmp.211
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L21:
# problem1.cpp:64:         neighbors_sum += curr[(i + 1) * NY * NZ + j * NZ + k];
	vaddsd	(%r8,%rax,8), %xmm2, %xmm0	# MEM[(const double *)_273 + ivtmp.203_256 * 8], tmp136, neighbors_sum
# problem1.cpp:61:       for (int k = 1; k < NZ - 1; ++k)
	addq	$8, %rdx	#, ivtmp.211
# problem1.cpp:65:         neighbors_sum += curr[(i - 1) * NY * NZ + j * NZ + k];
	vaddsd	(%rdi,%rax,8), %xmm0, %xmm0	# MEM[(const double *)_271 + ivtmp.203_256 * 8], neighbors_sum, neighbors_sum
# problem1.cpp:66:         neighbors_sum += curr[i * NY * NZ + (j + 1) * NZ + k];
	vaddsd	(%rsi,%rax,8), %xmm0, %xmm0	# MEM[(const double *)_269 + ivtmp.203_256 * 8], neighbors_sum, neighbors_sum
# problem1.cpp:67:         neighbors_sum += curr[i * NY * NZ + (j - 1) * NZ + k];
	vaddsd	(%r9,%rax,8), %xmm0, %xmm0	# MEM[(const double *)_266 + ivtmp.203_256 * 8], neighbors_sum, neighbors_sum
# problem1.cpp:68:         neighbors_sum += curr[i * NY * NZ + j * NZ + (k + 1)];
	vaddsd	8(%rdx), %xmm0, %xmm0	# MEM[(const double *)_263 + 16B], neighbors_sum, neighbors_sum
# problem1.cpp:69:         neighbors_sum += curr[i * NY * NZ + j * NZ + (k - 1)];
	vaddsd	-8(%rdx), %xmm0, %xmm0	# MEM[(const double *)_263], neighbors_sum, neighbors_sum_74
# problem1.cpp:73:             W_NEIGHBORS * neighbors_sum;
	vmulsd	%xmm1, %xmm0, %xmm0	# tmp143, neighbors_sum_74, _53
# problem1.cpp:71:         next[i * NY * NZ + j * NZ + k] =
	vfmadd231sd	(%rdx), %xmm1, %xmm0	# MEM[(const double *)_263 + 8B], tmp143, tmp137
	vmovsd	%xmm0, (%rcx,%rax,8)	# tmp137, MEM[(double *)_260 + ivtmp.203_256 * 8]
# problem1.cpp:61:       for (int k = 1; k < NZ - 1; ++k)
	incq	%rax	# ivtmp.203
	cmpq	$65, %rax	#, ivtmp.203
	jne	.L21	#,
# problem1.cpp:59:     for (int j = 1; j < NY - 1; ++j)
	addq	$528, %r8	#, ivtmp.228
	addq	$528, %rdi	#, ivtmp.231
	addq	$528, %rsi	#, ivtmp.234
	addq	$528, %rcx	#, ivtmp.236
	cmpq	%r10, %r11	# ivtmp.225, _204
	jne	.L24	#,
# problem1.cpp:57:   for (int i = 1; i < NX - 1; ++i)
	addq	$34848, %rbx	#, ivtmp.251
	addq	$34848, %rbp	#, ivtmp.257
	cmpq	$65, %r12	#, _88
	jne	.L20	#,
# problem1.cpp:77: }
	popq	%rbx	#
	popq	%rbp	#
	popq	%r12	#
	ret	
	.size	_Z22stencil_3d_7pt_method1PKdPd, .-_Z22stencil_3d_7pt_method1PKdPd
	.p2align 4
	.globl	_Z22stencil_3d_7pt_method2PKdPd
	.type	_Z22stencil_3d_7pt_method2PKdPd, @function
_Z22stencil_3d_7pt_method2PKdPd:
	pushq	%rbp	#
	leaq	34328(%rdi), %rax	#, _325
	movq	%rsp, %rbp	#,
	pushq	%r15	#
	leaq	536(%rdi), %r15	#, _87
	pushq	%r14	#
	leaq	536(%rsi), %r14	#, _324
	pushq	%r13	#
	xorl	%r13d, %r13d	# ivtmp.338
	pushq	%r12	#
	movl	$34848, %r12d	#, ivtmp.349
	pushq	%rbx	#
	andq	$-32, %rsp	#,
	movq	%rax, -8(%rsp)	# _325, %sfp
	vbroadcastsd	.LC2(%rip), %ymm1	#, tmp164
.L31:
# problem1.cpp:88:     for (int j = 1; j < NY - 1; ++j)
	movq	-8(%rsp), %rax	# %sfp, _325
	leaq	(%r15,%r12), %rdx	#, ivtmp.325
	leaq	(%r14,%r12), %rsi	#, ivtmp.334
	incq	%r13	# ivtmp.338
	leaq	(%rax,%r12), %rbx	#, _43
	.p2align 4,,10
	.p2align 3
.L30:
	movq	%rdx, %rcx	# ivtmp.325, vectp.267
	leaq	34848(%rdx), %r11	#, vectp.271
	leaq	-34848(%rdx), %r10	#, vectp.274
# problem1.cpp:80: {
	xorl	%eax, %eax	# ivtmp.302
	addq	$528, %rdx	#, ivtmp.325
	leaq	-528(%rcx), %r9	#, vectp.282
	leaq	8(%rcx), %r8	#, vectp.286
	leaq	-8(%rcx), %rdi	#, vectp.290
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L29:
# problem1.cpp:101:             W_NEIGHBORS * (curr[idx_ip1j + k] +
	vmovupd	(%r11,%rax), %ymm0	# MEM <const vector(4) double> [(const double *)vectp.271_278 + ivtmp.302_73 * 1], vect__32.272_269
# problem1.cpp:101:             W_NEIGHBORS * (curr[idx_ip1j + k] +
	vaddpd	(%r10,%rax), %ymm0, %ymm0	# MEM <const vector(4) double> [(const double *)vectp.274_268 + ivtmp.302_73 * 1], vect__32.272_269, vect__38.276_258
# problem1.cpp:102:                            curr[idx_im1j + k] +
	vaddpd	(%rdx,%rax), %ymm0, %ymm0	# MEM <const vector(4) double> [(const double *)vectp.278_257 + ivtmp.302_73 * 1], vect__38.276_258, vect__44.280_247
# problem1.cpp:103:                            curr[idx_ijp1 + k] +
	vaddpd	(%r9,%rax), %ymm0, %ymm0	# MEM <const vector(4) double> [(const double *)vectp.282_246 + ivtmp.302_73 * 1], vect__44.280_247, vect__50.284_236
# problem1.cpp:104:                            curr[idx_ijm1 + k] +
	vaddpd	(%r8,%rax), %ymm0, %ymm0	# MEM <const vector(4) double> [(const double *)vectp.286_235 + ivtmp.302_73 * 1], vect__50.284_236, vect__55.288_225
# problem1.cpp:105:                            curr[idx_ij + k + 1] +
	vaddpd	(%rdi,%rax), %ymm0, %ymm0	# MEM <const vector(4) double> [(const double *)vectp.290_224 + ivtmp.302_73 * 1], vect__55.288_225, vect__59.292_215
# problem1.cpp:101:             W_NEIGHBORS * (curr[idx_ip1j + k] +
	vmulpd	%ymm1, %ymm0, %ymm0	# tmp164, vect__59.292_215, vect__60.293_214
# problem1.cpp:99:         next[idx_ij + k] =
	vfmadd231pd	(%rcx,%rax), %ymm1, %ymm0	# MEM <const vector(4) double> [(const double *)vectp.267_289 + ivtmp.302_73 * 1], tmp164, tmp141
	vmovupd	%ymm0, (%rsi,%rax)	# tmp141, MEM <vector(4) double> [(double *)vectp.296_212 + ivtmp.302_73 * 1]
	addq	$32, %rax	#, ivtmp.302
	cmpq	$512, %rax	#, ivtmp.302
	jne	.L29	#,
# problem1.cpp:88:     for (int j = 1; j < NY - 1; ++j)
	addq	$528, %rsi	#, ivtmp.334
	cmpq	%rbx, %rdx	# _43, ivtmp.325
	jne	.L30	#,
# problem1.cpp:82:   for (int i = 1; i < NX - 1; ++i)
	addq	$34848, %r12	#, ivtmp.349
	cmpq	$64, %r13	#, ivtmp.338
	jne	.L31	#,
	vzeroupper
# problem1.cpp:110: }
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	ret	
	.size	_Z22stencil_3d_7pt_method2PKdPd, .-_Z22stencil_3d_7pt_method2PKdPd
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"Scalar kernel time: "
.LC6:
	.string	" ms"
.LC7:
	.string	"Final value at center: "
.LC8:
	.string	"\n"
.LC9:
	.string	"Total sum : "
.LC10:
	.string	"\nRunning Method 1 version\n"
.LC11:
	.string	" final scalar assertion is "
.LC12:
	.string	" total_sum assertion is "
.LC13:
	.string	"\nRunning Method 2 version\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	pushq	%r15	#
# problem1.cpp:113:   auto *grid1 = new double[TOTAL_SIZE];
	movl	$2299968, %edi	#,
# problem1.cpp:112: {
	pushq	%r14	#
	pushq	%r13	#
# problem1.cpp:125:   auto start = HR::now();
	movl	$100, %r13d	#, ivtmp_37
# problem1.cpp:112: {
	pushq	%r12	#
	pushq	%rbp	#
	pushq	%rbx	#
	subq	$24, %rsp	#,
# problem1.cpp:113:   auto *grid1 = new double[TOTAL_SIZE];
	call	_Znam@PLT	#
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	movl	$2299968, %edx	#,
	xorl	%esi, %esi	#
	movq	%rax, %rdi	# grid1,
# problem1.cpp:113:   auto *grid1 = new double[TOTAL_SIZE];
	movq	%rax, %r12	#, grid1
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	call	memset@PLT	#
# problem1.cpp:115:   grid1[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
	movq	.LC4(%rip), %rax	#, tmp376
# problem1.cpp:117:   auto *grid2 = new double[TOTAL_SIZE];
	movl	$2299968, %edi	#,
# problem1.cpp:121:   double *current_grid = grid1;
	movq	%r12, %r14	# grid1, next_grid
# problem1.cpp:115:   grid1[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
	movq	%rax, 1167672(%r12)	# tmp376, MEM[(double *)grid1_46 + 1167672B]
# problem1.cpp:117:   auto *grid2 = new double[TOTAL_SIZE];
	call	_Znam@PLT	#
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	movl	$2299968, %edx	#,
	xorl	%esi, %esi	#
	movq	%rax, %rdi	# grid2,
# problem1.cpp:117:   auto *grid2 = new double[TOTAL_SIZE];
	movq	%rax, %rbp	#, grid2
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	call	memset@PLT	#
# problem1.cpp:119:   grid2[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
	movq	.LC4(%rip), %rax	#, tmp377
# problem1.cpp:122:   double *next_grid = grid2;
	movq	%rbp, %rbx	# grid2, current_grid
# problem1.cpp:119:   grid2[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
	movq	%rax, 1167672(%rbp)	# tmp377, MEM[(double *)grid2_49 + 1167672B]
# problem1.cpp:125:   auto start = HR::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
	movq	%rax, %r15	#, start
	jmp	.L37	#
	.p2align 4,,10
	.p2align 3
.L45:
	movq	%r14, %rax	# next_grid, next_grid
	movq	%rbx, %r14	# current_grid, next_grid
	movq	%rax, %rbx	# next_grid, current_grid
.L37:
# problem1.cpp:128:     stencil_3d_7pt(current_grid, next_grid);
	movq	%rbx, %rsi	# current_grid,
	movq	%r14, %rdi	# next_grid,
	call	_Z14stencil_3d_7ptPKdPd	#
# problem1.cpp:126:   for (int t = 0; t < TIMESTEPS; t++)
	decl	%r13d	# ivtmp_37
	jne	.L45	#,
# problem1.cpp:131:   auto end = HR::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
# /usr/include/c++/15.2.1/bits/chrono.h:218: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	movabsq	$4835703278458516699, %rdx	#, tmp224
# problem1.cpp:133:   cout << "Scalar kernel time: " << duration << " ms" << endl;
	leaq	.LC5(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
# /usr/include/c++/15.2.1/bits/chrono.h:720: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	subq	%r15, %rax	# start, end
	movq	%rax, %rcx	# end, _135
# /usr/include/c++/15.2.1/bits/chrono.h:218: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	imulq	%rdx	# tmp224
	sarq	$63, %rcx	#, tmp226
	sarq	$18, %rdx	#, tmp225
	subq	%rcx, %rdx	# tmp226, tmp225
	movq	%rdx, %r13	# tmp225, _134
# problem1.cpp:133:   cout << "Scalar kernel time: " << duration << " ms" << endl;
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:175:       { return _M_insert(__n); }
	movq	%r13, %rsi	# _134,
	movq	%rax, %rdi	# _1,
	call	_ZNSo9_M_insertIlEERSoT_@PLT	#
# problem1.cpp:133:   cout << "Scalar kernel time: " << duration << " ms" << endl;
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _133,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:121: 	return __pf(*this);
	movq	%rax, %rdi	# _2,
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0	#
# problem1.cpp:135:   double final = current_grid[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)];
	vmovsd	1167672(%rbx), %xmm1	# MEM[(double *)next_grid_269 + 1167672B], final
# problem1.cpp:137:   cout << "Final value at center: " << final << "\n";
	leaq	.LC7(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
# problem1.cpp:135:   double final = current_grid[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)];
	vmovsd	%xmm1, (%rsp)	# final, %sfp
# problem1.cpp:137:   cout << "Final value at center: " << final << "\n";
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:232:       { return _M_insert(__f); }
	vmovsd	(%rsp), %xmm0	# %sfp,
	movq	%rax, %rdi	# _3,
	call	_ZNSo9_M_insertIdEERSoT_@PLT	#
# problem1.cpp:137:   cout << "Final value at center: " << final << "\n";
	leaq	.LC8(%rip), %rsi	#,
	movq	%rax, %rdi	# _132,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
	movq	%rbx, %rax	# current_grid, ivtmp.413
	leaq	2299968(%rbx), %rdx	#, _13
# problem1.cpp:138:   double total_sum = 0.0;
	vxorpd	%xmm0, %xmm0, %xmm0	# total_sum
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L38:
	vaddsd	(%rax), %xmm0, %xmm0	# BIT_FIELD_REF <MEM <vector(4) double> [(double *)_182], 64, 0>, total_sum, stmp_total_sum_111.382
	addq	$32, %rax	#, ivtmp.413
	vaddsd	-24(%rax), %xmm0, %xmm0	# BIT_FIELD_REF <MEM <vector(4) double> [(double *)_182], 64, 64>, stmp_total_sum_111.382, stmp_total_sum_111.382
# problem1.cpp:141:     total_sum += current_grid[i];
	vaddsd	-16(%rax), %xmm0, %xmm0	# BIT_FIELD_REF <MEM <vector(4) double> [(double *)_182], 64, 128>, stmp_total_sum_111.382, stmp_total_sum_111.382_119
	vaddsd	-8(%rax), %xmm0, %xmm0	# BIT_FIELD_REF <MEM <vector(4) double> [(double *)_182], 64, 192>, stmp_total_sum_111.382_119, total_sum
	cmpq	%rax, %rdx	# ivtmp.413, _13
	jne	.L38	#,
# problem1.cpp:144:   cout << "Total sum : " << total_sum << "\n";
	leaq	.LC9(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
	vmovsd	%xmm0, 8(%rsp)	# total_sum, %sfp
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:232:       { return _M_insert(__f); }
	vmovsd	8(%rsp), %xmm0	# %sfp, total_sum
	movq	%rax, %rdi	# _7,
	call	_ZNSo9_M_insertIdEERSoT_@PLT	#
# problem1.cpp:144:   cout << "Total sum : " << total_sum << "\n";
	leaq	.LC8(%rip), %rsi	#,
	movq	%rax, %rdi	# _136,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# problem1.cpp:149:   delete[] grid1;
	movq	%r12, %rdi	# grid1,
	call	_ZdaPv@PLT	#
# problem1.cpp:150:   delete[] grid2;
	movq	%rbp, %rdi	# grid2,
# problem1.cpp:163:   start = HR::now();
	movl	$100, %ebp	#, ivtmp_130
# problem1.cpp:150:   delete[] grid2;
	call	_ZdaPv@PLT	#
# problem1.cpp:152:   cout << "\nRunning Method 1 version\n";
	leaq	.LC10(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# problem1.cpp:154:   grid1 = new double[TOTAL_SIZE];
	movl	$2299968, %edi	#,
	call	_Znam@PLT	#
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	movl	$2299968, %edx	#,
	xorl	%esi, %esi	#
	movq	%rax, %rdi	# grid1,
# problem1.cpp:154:   grid1 = new double[TOTAL_SIZE];
	movq	%rax, %r14	#, grid1
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	call	memset@PLT	#
# problem1.cpp:156:   grid1[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
	movq	.LC4(%rip), %rax	#, tmp382
# problem1.cpp:158:   grid2 = new double[TOTAL_SIZE];
	movl	$2299968, %edi	#,
# problem1.cpp:161:   current_grid = grid1;
	movq	%r14, %r12	# grid1, current_grid
# problem1.cpp:156:   grid1[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
	movq	%rax, 1167672(%r14)	# tmp382, MEM[(double *)grid1_64 + 1167672B]
# problem1.cpp:158:   grid2 = new double[TOTAL_SIZE];
	call	_Znam@PLT	#
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	movl	$2299968, %edx	#,
	xorl	%esi, %esi	#
	movq	%rax, %rdi	# grid2,
# problem1.cpp:158:   grid2 = new double[TOTAL_SIZE];
	movq	%rax, %r13	#, grid2
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	call	memset@PLT	#
# problem1.cpp:160:   grid2[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
	movq	.LC4(%rip), %rax	#, tmp383
# problem1.cpp:162:   next_grid = grid2;
	movq	%r13, %rbx	# grid2, current_grid
# problem1.cpp:160:   grid2[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
	movq	%rax, 1167672(%r13)	# tmp383, MEM[(double *)grid2_67 + 1167672B]
# problem1.cpp:163:   start = HR::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
	movq	%rax, %r15	#, start
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L46:
	movq	%r12, %rax	# current_grid, current_grid
	movq	%rbx, %r12	# current_grid, current_grid
	movq	%rax, %rbx	# current_grid, current_grid
.L39:
# problem1.cpp:166:     stencil_3d_7pt_method1(current_grid, next_grid);
	movq	%rbx, %rsi	# current_grid,
	movq	%r12, %rdi	# current_grid,
	call	_Z22stencil_3d_7pt_method1PKdPd	#
# problem1.cpp:164:   for (int t = 0; t < TIMESTEPS; t++)
	decl	%ebp	# ivtmp_130
	jne	.L46	#,
# problem1.cpp:169:   end = HR::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
# /usr/include/c++/15.2.1/bits/chrono.h:218: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	movabsq	$4835703278458516699, %rdx	#, tmp253
# problem1.cpp:171:   cout << "Scalar kernel time: " << duration << " ms" << endl;
	leaq	.LC5(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
# /usr/include/c++/15.2.1/bits/chrono.h:720: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	subq	%r15, %rax	# start, end
	movq	%rax, %rcx	# end, _142
# /usr/include/c++/15.2.1/bits/chrono.h:218: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	imulq	%rdx	# tmp253
	sarq	$63, %rcx	#, tmp255
	sarq	$18, %rdx	#, tmp254
	subq	%rcx, %rdx	# tmp255, tmp254
	movq	%rdx, %r12	# tmp254, _141
# problem1.cpp:171:   cout << "Scalar kernel time: " << duration << " ms" << endl;
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:175:       { return _M_insert(__n); }
	movq	%r12, %rsi	# _141,
	movq	%rax, %rdi	# _8,
	call	_ZNSo9_M_insertIlEERSoT_@PLT	#
# problem1.cpp:171:   cout << "Scalar kernel time: " << duration << " ms" << endl;
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _140,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:121: 	return __pf(*this);
	movq	%rax, %rdi	# _9,
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0	#
# problem1.cpp:173:   final = current_grid[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)];
	movq	1167672(%rbx), %r12	# MEM[(double *)next_grid_270 + 1167672B], final
# problem1.cpp:174:   cout << "Final value at center: " << final << " final scalar assertion is " << (final_scalar == final) << "\n";
	leaq	.LC7(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:232:       { return _M_insert(__f); }
	movq	%rax, %rdi	# _10,
	vmovq	%r12, %xmm0	# final,
	call	_ZNSo9_M_insertIdEERSoT_@PLT	#
# problem1.cpp:174:   cout << "Final value at center: " << final << " final scalar assertion is " << (final_scalar == final) << "\n";
	leaq	.LC11(%rip), %rsi	#,
	movq	%rax, %rdi	# _139,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# problem1.cpp:174:   cout << "Final value at center: " << final << " final scalar assertion is " << (final_scalar == final) << "\n";
	vmovsd	(%rsp), %xmm2	# %sfp, final
	vmovq	%r12, %xmm3	# final, final
	xorl	%esi, %esi	# tmp265
# /usr/include/c++/15.2.1/bits/ostream.h:183:       { return _M_insert(__n); }
	movq	%rax, %rdi	# _11,
# problem1.cpp:174:   cout << "Final value at center: " << final << " final scalar assertion is " << (final_scalar == final) << "\n";
	vucomisd	%xmm3, %xmm2	# final, final
	setnp	%sil	#, tmp265
	cmovne	%ebp, %esi	# tmp265,, ivtmp_130, _12
# /usr/include/c++/15.2.1/bits/ostream.h:183:       { return _M_insert(__n); }
	call	_ZNSo9_M_insertIbEERSoT_@PLT	#
# problem1.cpp:174:   cout << "Final value at center: " << final << " final scalar assertion is " << (final_scalar == final) << "\n";
	leaq	.LC8(%rip), %rsi	#,
	movq	%rax, %rdi	# _138,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
	leaq	2299968(%rbx), %rax	#, _123
# problem1.cpp:175:   total_sum = 0.0;
	vxorpd	%xmm0, %xmm0, %xmm0	# total_sum
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L40:
	vaddsd	(%rbx), %xmm0, %xmm0	# BIT_FIELD_REF <MEM <vector(4) double> [(double *)_184], 64, 0>, total_sum, stmp_total_sum_107.378
	addq	$32, %rbx	#, ivtmp.402
	vaddsd	-24(%rbx), %xmm0, %xmm0	# BIT_FIELD_REF <MEM <vector(4) double> [(double *)_184], 64, 64>, stmp_total_sum_107.378, stmp_total_sum_107.378
# problem1.cpp:178:     total_sum += current_grid[i];
	vaddsd	-16(%rbx), %xmm0, %xmm0	# BIT_FIELD_REF <MEM <vector(4) double> [(double *)_184], 64, 128>, stmp_total_sum_107.378, stmp_total_sum_107.378_167
	vaddsd	-8(%rbx), %xmm0, %xmm0	# BIT_FIELD_REF <MEM <vector(4) double> [(double *)_184], 64, 192>, stmp_total_sum_107.378_167, total_sum
	cmpq	%rax, %rbx	# _123, ivtmp.402
	jne	.L40	#,
# problem1.cpp:181:   cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";
	leaq	.LC9(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
	vmovsd	%xmm0, 8(%rsp)	# total_sum, %sfp
# problem1.cpp:200:   start = HR::now();
	movl	$100, %ebp	#, ivtmp_20
# problem1.cpp:181:   cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:232:       { return _M_insert(__f); }
	vmovsd	8(%rsp), %xmm0	# %sfp, total_sum
	movq	%rax, %rdi	# _16,
	call	_ZNSo9_M_insertIdEERSoT_@PLT	#
# problem1.cpp:181:   cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";
	leaq	.LC12(%rip), %rsi	#,
	movq	%rax, %rdi	# _145,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# problem1.cpp:181:   cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";
	vmovsd	8(%rsp), %xmm0	# %sfp, total_sum
	xorl	%esi, %esi	# _18
# /usr/include/c++/15.2.1/bits/ostream.h:183:       { return _M_insert(__n); }
	movq	%rax, %rdi	# _17,
# problem1.cpp:181:   cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";
	vucomisd	%xmm0, %xmm0	# total_sum, total_sum
	setnp	%sil	#, _18
# /usr/include/c++/15.2.1/bits/ostream.h:183:       { return _M_insert(__n); }
	call	_ZNSo9_M_insertIbEERSoT_@PLT	#
# problem1.cpp:181:   cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";
	leaq	.LC8(%rip), %rsi	#,
	movq	%rax, %rdi	# _144,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# problem1.cpp:186:   delete[] grid1;
	movq	%r14, %rdi	# grid1,
	call	_ZdaPv@PLT	#
# problem1.cpp:187:   delete[] grid2;
	movq	%r13, %rdi	# grid2,
	call	_ZdaPv@PLT	#
# problem1.cpp:189:   cout << "\nRunning Method 2 version\n";
	leaq	.LC13(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# problem1.cpp:191:   grid1 = new double[TOTAL_SIZE];
	movl	$2299968, %edi	#,
	call	_Znam@PLT	#
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	movl	$2299968, %edx	#,
	xorl	%esi, %esi	#
	movq	%rax, %rdi	# grid1,
# problem1.cpp:191:   grid1 = new double[TOTAL_SIZE];
	movq	%rax, %r14	#, grid1
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	call	memset@PLT	#
# problem1.cpp:193:   grid1[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
	movq	.LC4(%rip), %rax	#, tmp389
# problem1.cpp:195:   grid2 = new double[TOTAL_SIZE];
	movl	$2299968, %edi	#,
# problem1.cpp:198:   current_grid = grid1;
	movq	%r14, %r12	# grid1, current_grid
# problem1.cpp:193:   grid1[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
	movq	%rax, 1167672(%r14)	# tmp389, MEM[(double *)grid1_85 + 1167672B]
# problem1.cpp:195:   grid2 = new double[TOTAL_SIZE];
	call	_Znam@PLT	#
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	movl	$2299968, %edx	#,
	xorl	%esi, %esi	#
	movq	%rax, %rdi	# grid2,
# problem1.cpp:195:   grid2 = new double[TOTAL_SIZE];
	movq	%rax, %r13	#, grid2
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	call	memset@PLT	#
# problem1.cpp:197:   grid2[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
	movq	.LC4(%rip), %rax	#, tmp390
# problem1.cpp:199:   next_grid = grid2;
	movq	%r13, %rbx	# grid2, current_grid
# problem1.cpp:197:   grid2[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
	movq	%rax, 1167672(%r13)	# tmp390, MEM[(double *)grid2_88 + 1167672B]
# problem1.cpp:200:   start = HR::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
	movq	%rax, %r15	#, start
	jmp	.L42	#
	.p2align 4,,10
	.p2align 3
.L47:
	movq	%r12, %rax	# current_grid, current_grid
	movq	%rbx, %r12	# current_grid, current_grid
	movq	%rax, %rbx	# current_grid, current_grid
.L42:
# problem1.cpp:203:     stencil_3d_7pt_method2(current_grid, next_grid);
	movq	%rbx, %rsi	# current_grid,
	movq	%r12, %rdi	# current_grid,
	call	_Z22stencil_3d_7pt_method2PKdPd	#
# problem1.cpp:201:   for (int t = 0; t < TIMESTEPS; t++)
	decl	%ebp	# ivtmp_20
	jne	.L47	#,
# problem1.cpp:206:   end = HR::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
# /usr/include/c++/15.2.1/bits/chrono.h:218: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	movabsq	$4835703278458516699, %rdx	#, tmp295
# problem1.cpp:208:   cout << "Scalar kernel time: " << duration << " ms" << endl;
	leaq	.LC5(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
# /usr/include/c++/15.2.1/bits/chrono.h:720: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	subq	%r15, %rax	# start, end
	movq	%rax, %rcx	# end, _151
# /usr/include/c++/15.2.1/bits/chrono.h:218: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	imulq	%rdx	# tmp295
	sarq	$63, %rcx	#, tmp297
	sarq	$18, %rdx	#, tmp296
	subq	%rcx, %rdx	# tmp297, tmp296
	movq	%rdx, %r12	# tmp296, _150
# problem1.cpp:208:   cout << "Scalar kernel time: " << duration << " ms" << endl;
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:175:       { return _M_insert(__n); }
	movq	%r12, %rsi	# _150,
	movq	%rax, %rdi	# _21,
	call	_ZNSo9_M_insertIlEERSoT_@PLT	#
# problem1.cpp:208:   cout << "Scalar kernel time: " << duration << " ms" << endl;
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _149,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:121: 	return __pf(*this);
	movq	%rax, %rdi	# _22,
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0	#
# problem1.cpp:210:   final = current_grid[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)];
	movq	1167672(%rbx), %r12	# MEM[(double *)next_grid_271 + 1167672B], final
# problem1.cpp:211:   cout << "Final value at center: " << final << " final scalar assertion is " << (final_scalar == final) << "\n";
	leaq	.LC7(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:232:       { return _M_insert(__f); }
	movq	%rax, %rdi	# _23,
	vmovq	%r12, %xmm0	# final,
	call	_ZNSo9_M_insertIdEERSoT_@PLT	#
# problem1.cpp:211:   cout << "Final value at center: " << final << " final scalar assertion is " << (final_scalar == final) << "\n";
	leaq	.LC11(%rip), %rsi	#,
	movq	%rax, %rdi	# _148,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# problem1.cpp:211:   cout << "Final value at center: " << final << " final scalar assertion is " << (final_scalar == final) << "\n";
	vmovsd	(%rsp), %xmm4	# %sfp, final
	vmovq	%r12, %xmm5	# final, final
	xorl	%esi, %esi	# tmp307
# /usr/include/c++/15.2.1/bits/ostream.h:183:       { return _M_insert(__n); }
	movq	%rax, %rdi	# _24,
# problem1.cpp:211:   cout << "Final value at center: " << final << " final scalar assertion is " << (final_scalar == final) << "\n";
	vucomisd	%xmm5, %xmm4	# final, final
	setnp	%sil	#, tmp307
	cmovne	%ebp, %esi	# tmp307,, ivtmp_20, _25
# /usr/include/c++/15.2.1/bits/ostream.h:183:       { return _M_insert(__n); }
	call	_ZNSo9_M_insertIbEERSoT_@PLT	#
# problem1.cpp:211:   cout << "Final value at center: " << final << " final scalar assertion is " << (final_scalar == final) << "\n";
	leaq	.LC8(%rip), %rsi	#,
	movq	%rax, %rdi	# _147,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
	leaq	2299968(%rbx), %rax	#, _234
# problem1.cpp:212:   total_sum = 0.0;
	vxorpd	%xmm0, %xmm0, %xmm0	# total_sum
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L43:
	vaddsd	(%rbx), %xmm0, %xmm0	# BIT_FIELD_REF <MEM <vector(4) double> [(double *)_236], 64, 0>, total_sum, stmp_total_sum_103.374
	addq	$32, %rbx	#, ivtmp.389
	vaddsd	-24(%rbx), %xmm0, %xmm0	# BIT_FIELD_REF <MEM <vector(4) double> [(double *)_236], 64, 64>, stmp_total_sum_103.374, stmp_total_sum_103.374
# problem1.cpp:215:     total_sum += current_grid[i];
	vaddsd	-16(%rbx), %xmm0, %xmm0	# BIT_FIELD_REF <MEM <vector(4) double> [(double *)_236], 64, 128>, stmp_total_sum_103.374, stmp_total_sum_103.374_250
	vaddsd	-8(%rbx), %xmm0, %xmm0	# BIT_FIELD_REF <MEM <vector(4) double> [(double *)_236], 64, 192>, stmp_total_sum_103.374_250, total_sum
	cmpq	%rax, %rbx	# _234, ivtmp.389
	jne	.L43	#,
# problem1.cpp:218:   cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";
	leaq	.LC9(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
	vmovsd	%xmm0, (%rsp)	# total_sum, %sfp
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:232:       { return _M_insert(__f); }
	vmovsd	(%rsp), %xmm0	# %sfp, total_sum
	movq	%rax, %rdi	# _29,
	call	_ZNSo9_M_insertIdEERSoT_@PLT	#
# problem1.cpp:218:   cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";
	leaq	.LC12(%rip), %rsi	#,
	movq	%rax, %rdi	# _154,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# problem1.cpp:218:   cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";
	vmovsd	(%rsp), %xmm0	# %sfp, total_sum
	xorl	%esi, %esi	# _31
# /usr/include/c++/15.2.1/bits/ostream.h:183:       { return _M_insert(__n); }
	movq	%rax, %rdi	# _30,
# problem1.cpp:218:   cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";
	vucomisd	%xmm0, %xmm0	# total_sum, total_sum
	setnp	%sil	#, _31
# /usr/include/c++/15.2.1/bits/ostream.h:183:       { return _M_insert(__n); }
	call	_ZNSo9_M_insertIbEERSoT_@PLT	#
# problem1.cpp:218:   cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";
	leaq	.LC8(%rip), %rsi	#,
	movq	%rax, %rdi	# _153,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# problem1.cpp:223:   delete[] grid1;
	movq	%r14, %rdi	# grid1,
	call	_ZdaPv@PLT	#
# problem1.cpp:224:   delete[] grid2;
	movq	%r13, %rdi	# grid2,
	call	_ZdaPv@PLT	#
# problem1.cpp:227: }
	addq	$24, %rsp	#,
	xorl	%eax, %eax	#
	popq	%rbx	#
	popq	%rbp	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	ret	
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	-1840700270
	.long	1069697316
	.align 8
.LC4:
	.long	0
	.long	1079574528
	.ident	"GCC: (GNU) 15.2.1 20250813"
	.section	.note.GNU-stack,"",@progbits
