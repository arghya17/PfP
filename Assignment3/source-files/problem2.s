	.file	"problem2.cpp"
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
	movq	(%rdi), %rax	# MEM[(const struct ctype *)_14].D.56861._vptr.facet, MEM[(const struct ctype *)_14].D.56861._vptr.facet
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
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"\t"
.LC2:
	.string	"\n"
	.text
	.p2align 4
	.globl	_Z11print_arrayPKi
	.type	_Z11print_arrayPKi, @function
_Z11print_arrayPKi:
	pushq	%rbp	#
	leaq	262144(%rdi), %rbp	#, _22
	pushq	%rbx	#
	movq	%rdi, %rbx	# ivtmp.108, ivtmp.108
	subq	$8, %rsp	#,
	.p2align 4,,10
	.p2align 3
.L11:
# problem2.cpp:26:     cout << array[i] << "\t";
	movl	(%rbx), %esi	# MEM[(const int *)_20], MEM[(const int *)_20]
	leaq	_ZSt4cout(%rip), %rdi	#,
# problem2.cpp:24:   for (int i = 0; i < N; i++)
	addq	$4, %rbx	#, ivtmp.108
# problem2.cpp:26:     cout << array[i] << "\t";
	call	_ZNSolsEi@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC1(%rip), %rsi	#,
	movq	%rax, %rdi	# _5,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# problem2.cpp:24:   for (int i = 0; i < N; i++)
	cmpq	%rbp, %rbx	# _22, ivtmp.108
	jne	.L11	#,
# problem2.cpp:29: }
	addq	$8, %rsp	#,
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	leaq	.LC2(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
	movl	$1, %edx	#,
# problem2.cpp:29: }
	popq	%rbx	#
	popq	%rbp	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	jmp	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
	.size	_Z11print_arrayPKi, .-_Z11print_arrayPKi
	.section	.rodata.str1.1
.LC3:
	.string	"Values ["
.LC4:
	.string	":"
.LC5:
	.string	"]: "
.LC6:
	.string	" "
	.text
	.p2align 4
	.globl	_Z13print128i_u32Dv2_xi
	.type	_Z13print128i_u32Dv2_xi, @function
_Z13print128i_u32Dv2_xi:
	pushq	%rbp	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$8, %edx	#,
	leaq	.LC3(%rip), %rsi	#,
# problem2.cpp:32: {
	pushq	%rbx	#
	movl	%edi, %ebx	# start, start
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	leaq	_ZSt4cout(%rip), %rdi	#,
# problem2.cpp:32: {
	subq	$24, %rsp	#,
# problem2.cpp:32: {
	vmovdqa	%xmm0, (%rsp)	# var, %sfp
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# problem2.cpp:35:   cout << "Values [" << start << ":" << start + 3 << "]: " << val[0] << " "
	movl	%ebx, %esi	# start,
	leaq	_ZSt4cout(%rip), %rdi	#,
	call	_ZNSolsEi@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC4(%rip), %rsi	#,
# problem2.cpp:35:   cout << "Values [" << start << ":" << start + 3 << "]: " << val[0] << " "
	movq	%rax, %rbp	#, _2
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movq	%rax, %rdi	# _2,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# problem2.cpp:35:   cout << "Values [" << start << ":" << start + 3 << "]: " << val[0] << " "
	leal	3(%rbx), %esi	#, _4
	movq	%rbp, %rdi	# _2,
	call	_ZNSolsEi@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$3, %edx	#,
	leaq	.LC5(%rip), %rsi	#,
	movq	%rax, %rdi	# _5,
# problem2.cpp:35:   cout << "Values [" << start << ":" << start + 3 << "]: " << val[0] << " "
	movq	%rax, %rbx	#, _5
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movl	(%rsp), %esi	# %sfp, _32
	movq	%rbx, %rdi	# _5,
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _33,
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movq	%rax, %rbx	#, _33
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movl	4(%rsp), %esi	# %sfp, _30
	movq	%rbx, %rdi	# _33,
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _31,
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movq	%rax, %rbx	#, _31
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movl	8(%rsp), %esi	# %sfp, _28
	movq	%rbx, %rdi	# _31,
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _29,
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movq	%rax, %rbx	#, _29
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movl	12(%rsp), %esi	# %sfp, _26
	movq	%rbx, %rdi	# _29,
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# problem2.cpp:37: }
	addq	$24, %rsp	#,
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC2(%rip), %rsi	#,
# problem2.cpp:37: }
	popq	%rbx	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movq	%rax, %rdi	# _27,
# problem2.cpp:37: }
	popq	%rbp	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	jmp	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
	.size	_Z13print128i_u32Dv2_xi, .-_Z13print128i_u32Dv2_xi
	.p2align 4
	.globl	_Z13print256i_u32Dv4_xi
	.type	_Z13print256i_u32Dv4_xi, @function
_Z13print256i_u32Dv4_xi:
	pushq	%rbp	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$8, %edx	#,
	leaq	.LC3(%rip), %rsi	#,
# problem2.cpp:39: {
	movq	%rsp, %rbp	#,
	pushq	%r12	#
	pushq	%rbx	#
	movl	%edi, %ebx	# start, start
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	leaq	_ZSt4cout(%rip), %rdi	#,
# problem2.cpp:39: {
	andq	$-32, %rsp	#,
	subq	$64, %rsp	#,
# problem2.cpp:39: {
	vmovdqa	%ymm0, (%rsp)	# var, %sfp
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	vzeroupper
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# problem2.cpp:42:   cout << "Values [" << start << ":" << start + 8 << "]: " << val[0] << " "
	movl	%ebx, %esi	# start,
	leaq	_ZSt4cout(%rip), %rdi	#,
	call	_ZNSolsEi@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC4(%rip), %rsi	#,
# problem2.cpp:42:   cout << "Values [" << start << ":" << start + 8 << "]: " << val[0] << " "
	movq	%rax, %r12	#, _2
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movq	%rax, %rdi	# _2,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# problem2.cpp:42:   cout << "Values [" << start << ":" << start + 8 << "]: " << val[0] << " "
	leal	8(%rbx), %esi	#, _4
	movq	%r12, %rdi	# _2,
	call	_ZNSolsEi@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$3, %edx	#,
	leaq	.LC5(%rip), %rsi	#,
	movq	%rax, %rdi	# _5,
# problem2.cpp:42:   cout << "Values [" << start << ":" << start + 8 << "]: " << val[0] << " "
	movq	%rax, %rbx	#, _5
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	vmovdqa	(%rsp), %ymm3	# %sfp, tmp179
	movq	%rbx, %rdi	# _5,
	vmovdqa	%xmm3, 48(%rsp)	# tmp179, %sfp
	movl	48(%rsp), %esi	# %sfp, _52
	vzeroupper
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _53,
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movq	%rax, %rbx	#, _53
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movl	52(%rsp), %esi	# %sfp, _50
	movq	%rbx, %rdi	# _53,
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _51,
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movq	%rax, %rbx	#, _51
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movl	56(%rsp), %esi	# %sfp, _48
	movq	%rbx, %rdi	# _51,
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _49,
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movq	%rax, %rbx	#, _49
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movl	60(%rsp), %esi	# %sfp, _46
	movq	%rbx, %rdi	# _49,
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _47,
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movq	%rax, %rbx	#, _47
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	vmovdqa	(%rsp), %ymm4	# %sfp, tmp185
	movq	%rbx, %rdi	# _47,
	vextracti128	$0x1, %ymm4, 48(%rsp)	# tmp185, %sfp
	movl	48(%rsp), %esi	# %sfp, _44
	vzeroupper
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _45,
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movq	%rax, %rbx	#, _45
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movl	52(%rsp), %esi	# %sfp, _42
	movq	%rbx, %rdi	# _45,
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _43,
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movq	%rax, %rbx	#, _43
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movl	56(%rsp), %esi	# %sfp, _40
	movq	%rbx, %rdi	# _43,
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _41,
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movq	%rax, %rbx	#, _41
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:204: 	return _M_insert(static_cast<unsigned long>(__n));
	movl	60(%rsp), %esi	# %sfp, _38
	movq	%rbx, %rdi	# _41,
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# problem2.cpp:46: }
	leaq	-16(%rbp), %rsp	#,
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC2(%rip), %rsi	#,
# problem2.cpp:46: }
	popq	%rbx	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movq	%rax, %rdi	# _39,
# problem2.cpp:46: }
	popq	%r12	#
	popq	%rbp	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	jmp	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
	.size	_Z13print256i_u32Dv4_xi, .-_Z13print256i_u32Dv4_xi
	.section	.rodata.str1.1
.LC7:
	.string	"Values [0:1]: "
	.text
	.p2align 4
	.globl	_Z13print128i_u64Dv2_x
	.type	_Z13print128i_u64Dv2_x, @function
_Z13print128i_u64Dv2_x:
	pushq	%rbx	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$14, %edx	#,
	leaq	.LC7(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
# problem2.cpp:49: {
	subq	$16, %rsp	#,
# problem2.cpp:49: {
	vmovdqa	%xmm0, (%rsp)	# var, %sfp
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:179:       { return _M_insert(__n); }
	movq	(%rsp), %rsi	# %sfp, _4
	leaq	_ZSt4cout(%rip), %rdi	#,
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC6(%rip), %rsi	#,
	movq	%rax, %rdi	# _11,
# /usr/include/c++/15.2.1/bits/ostream.h:179:       { return _M_insert(__n); }
	movq	%rax, %rbx	#, _11
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:179:       { return _M_insert(__n); }
	movq	8(%rsp), %rsi	# %sfp, _2
	movq	%rbx, %rdi	# _11,
	call	_ZNSo9_M_insertImEERSoT_@PLT	#
# problem2.cpp:53: }
	addq	$16, %rsp	#,
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	movl	$1, %edx	#,
	leaq	.LC2(%rip), %rsi	#,
	movq	%rax, %rdi	# _10,
# problem2.cpp:53: }
	popq	%rbx	#
# /usr/include/c++/15.2.1/bits/ostream.h:739: 	__ostream_insert(__out, __s,
	jmp	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
	.size	_Z13print128i_u64Dv2_x, .-_Z13print128i_u64Dv2_x
	.p2align 4
	.globl	_Z11ref_versionPiS_
	.type	_Z11ref_versionPiS_, @function
_Z11ref_versionPiS_:
# problem2.cpp:59:   dest = static_cast<int *>(__builtin_assume_aligned(dest, ALIGN));
	xorl	%eax, %eax	# ivtmp.131
# problem2.cpp:61:   int tmp = 0;
	xorl	%edx, %edx	# <retval>
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L21:
# problem2.cpp:64:     tmp += source[i];
	addl	(%rdi,%rax), %edx	# MEM[(int *)source_10 + ivtmp.131_6 * 1], <retval>
# problem2.cpp:65:     dest[i] = tmp;
	movl	%edx, (%rsi,%rax)	# <retval>, MEM[(int *)dest_12 + ivtmp.131_6 * 1]
# problem2.cpp:62:   for (int i = 0; i < N; i++)
	addq	$4, %rax	#, ivtmp.131
	cmpq	$262144, %rax	#, ivtmp.131
	jne	.L21	#,
# problem2.cpp:68: }
	movl	%edx, %eax	# <retval>,
	ret	
	.size	_Z11ref_versionPiS_, .-_Z11ref_versionPiS_
	.p2align 4
	.globl	_Z11omp_versionPKiPi
	.type	_Z11omp_versionPKiPi, @function
_Z11omp_versionPKiPi:
# problem2.cpp:73:   dest = static_cast<int *>(__builtin_assume_aligned(dest, ALIGN));
	vpxor	%xmm3, %xmm3, %xmm3	# D__lsm0.150
# problem2.cpp:80: #pragma omp scan inclusive(tmp)
	vpcmpeqd	%ymm4, %ymm4, %ymm4	# tmp125
	vmovdqa	.LC8(%rip), %ymm5	#, tmp128
# problem2.cpp:73:   dest = static_cast<int *>(__builtin_assume_aligned(dest, ALIGN));
	xorl	%eax, %eax	# ivtmp.155
# problem2.cpp:80: #pragma omp scan inclusive(tmp)
	vmovdqa	%ymm3, %ymm2	#, tmp112
	vpsrld	$29, %ymm4, %ymm4	#, tmp125, tmp124
	.p2align 4,,10
	.p2align 3
.L24:
# problem2.cpp:79:     tmp += source[i];
	vmovdqa	(%rdi,%rax), %ymm1	# MEM <const vector(8) int> [(const int *)source_7 + ivtmp.155_40 * 1], vect__21.139
# problem2.cpp:80: #pragma omp scan inclusive(tmp)
	vpermd	%ymm1, %ymm5, %ymm0	# vect__21.139, tmp128, tmp113
	vpblendd	$1, %ymm2, %ymm0, %ymm0	#, tmp112, tmp113, _55
	vpaddd	%ymm1, %ymm0, %ymm0	# vect__21.139, _55, _56
	vpermq	$144, %ymm0, %ymm1	#, _56, tmp119
	vpblendd	$3, %ymm2, %ymm1, %ymm1	#, tmp112, tmp119, _57
	vpaddd	%ymm0, %ymm1, %ymm1	# _56, _57, _58
	vinserti128	$1, %xmm1, %ymm2, %ymm0	# _58, tmp112, _59
	vpaddd	%ymm1, %ymm0, %ymm0	# _58, _59, _60
	vpaddd	%ymm3, %ymm0, %ymm0	# D__lsm0.150, _60, _61
# problem2.cpp:81:     dest[i] = tmp;
	vmovdqa	%ymm0, (%rsi,%rax)	# _61, MEM <vector(8) int> [(int *)dest_9 + ivtmp.155_40 * 1]
	addq	$32, %rax	#, ivtmp.155
# problem2.cpp:80: #pragma omp scan inclusive(tmp)
	vpermd	%ymm0, %ymm4, %ymm3	# _61, tmp124, D__lsm0.150
	cmpq	$262144, %rax	#, ivtmp.155
	jne	.L24	#,
# problem2.cpp:83:   return tmp;
	vextracti128	$0x1, %ymm0, %xmm0	# _61, tmp127
	vpextrd	$3, %xmm0, %eax	#, tmp127, _2
	vzeroupper
# problem2.cpp:84: }
	ret	
	.size	_Z11omp_versionPKiPi, .-_Z11omp_versionPKiPi
	.p2align 4
	.globl	_Z12sse4_versionPKiPi
	.type	_Z12sse4_versionPKiPi, @function
_Z12sse4_versionPKiPi:
# problem2.cpp:91:   dest = static_cast<int *>(__builtin_assume_aligned(dest, ALIGN));
	xorl	%eax, %eax	# ivtmp.175
# problem2.cpp:95:   __m128i offset = _mm_setzero_si128();
	vpxor	%xmm2, %xmm2, %xmm2	# offset
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L27:
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/emmintrin.h:701:   return *__P;
	vmovdqa	(%rdi,%rax), %xmm1	# MEM[(const __m128i * {ref-all})source_9 + ivtmp.175_54 * 1], _29
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/emmintrin.h:1236:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm1, %xmm0	#, _29, tmp117
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/emmintrin.h:1073:   return (__m128i) ((__v4su)__A + (__v4su)__B);
	vpaddd	%xmm0, %xmm1, %xmm1	# tmp117, _29, _26
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/emmintrin.h:1236:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$8, %xmm1, %xmm0	#, _26, tmp119
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/emmintrin.h:1073:   return (__m128i) ((__v4su)__A + (__v4su)__B);
	vpaddd	%xmm2, %xmm0, %xmm0	# offset, tmp119, _37
	vpaddd	%xmm1, %xmm0, %xmm0	# _26, _37, _16
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/emmintrin.h:737:   *__P = __B;
	vmovdqa	%xmm0, (%rsi,%rax)	# _16, MEM[(__m128i * {ref-all})dest_11 + ivtmp.175_54 * 1]
# problem2.cpp:98:   for (int i = 0; i < N; i += stride)
	addq	$16, %rax	#, ivtmp.175
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/emmintrin.h:1487:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	vpshufd	$255, %xmm0, %xmm2	#, _16, offset
# problem2.cpp:98:   for (int i = 0; i < N; i += stride)
	cmpq	$262144, %rax	#, ivtmp.175
	jne	.L27	#,
# problem2.cpp:129:   return dest[N - 1];
	movl	262140(%rsi), %eax	# MEM[(int *)dest_11 + 262140B], MEM[(int *)dest_11 + 262140B]
# problem2.cpp:130: }
	ret	
	.size	_Z12sse4_versionPKiPi, .-_Z12sse4_versionPKiPi
	.p2align 4
	.globl	_Z12avx2_versionPKiPi
	.type	_Z12avx2_versionPKiPi, @function
_Z12avx2_versionPKiPi:
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avx2intrin.h:1046:   return (__m256i) __builtin_ia32_permvarsi256 ((__v8si)__X, (__v8si)__Y);
	vpcmpeqd	%ymm2, %ymm2, %ymm2	# tmp144
	vmovdqa	.LC10(%rip), %ymm8	#, tmp151
	vmovdqa	.LC11(%rip), %ymm7	#, tmp152
# problem2.cpp:135:   dest = static_cast<int *>(__builtin_assume_aligned(dest, ALIGN));
	xorl	%eax, %eax	# ivtmp.190
	vmovdqa	.LC12(%rip), %ymm6	#, tmp147
	vmovdqa	.LC13(%rip), %ymm5	#, tmp148
# problem2.cpp:136:   __m256i offset = _mm256_setzero_si256();
	vpxor	%xmm9, %xmm9, %xmm9	# offset
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avx2intrin.h:1046:   return (__m256i) __builtin_ia32_permvarsi256 ((__v8si)__X, (__v8si)__Y);
	vpsrld	$29, %ymm2, %ymm2	#, tmp144, tmp143
	vmovdqa	.LC14(%rip), %ymm4	#, tmp149
	vmovdqa	.LC15(%rip), %ymm3	#, tmp150
	.p2align 4,,10
	.p2align 3
.L30:
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avxintrin.h:861:   return *__P;
	vmovdqa	(%rdi,%rax), %ymm1	# MEM[(const __m256i * {ref-all})source_9 + ivtmp.190_87 * 1], _40
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avx2intrin.h:1046:   return (__m256i) __builtin_ia32_permvarsi256 ((__v8si)__X, (__v8si)__Y);
	vpermd	%ymm1, %ymm8, %ymm0	# _40, tmp151, tmp128
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avx2intrin.h:181:   return (__m256i) ((__v4du)__A & (__v4du)__B);
	vpand	%ymm0, %ymm7, %ymm0	# tmp128, tmp152, _37
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avx2intrin.h:121:   return (__m256i) ((__v8su)__A + (__v8su)__B);
	vpaddd	%ymm1, %ymm0, %ymm0	# _40, _37, _35
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avx2intrin.h:1046:   return (__m256i) __builtin_ia32_permvarsi256 ((__v8si)__X, (__v8si)__Y);
	vpermd	%ymm0, %ymm6, %ymm1	# _35, tmp147, tmp132
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avx2intrin.h:181:   return (__m256i) ((__v4du)__A & (__v4du)__B);
	vpand	%ymm1, %ymm5, %ymm1	# tmp132, tmp148, _30
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avx2intrin.h:121:   return (__m256i) ((__v8su)__A + (__v8su)__B);
	vpaddd	%ymm1, %ymm0, %ymm0	# _30, _35, _28
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avx2intrin.h:1046:   return (__m256i) __builtin_ia32_permvarsi256 ((__v8si)__X, (__v8si)__Y);
	vpermd	%ymm0, %ymm4, %ymm1	# _28, tmp149, tmp136
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avx2intrin.h:181:   return (__m256i) ((__v4du)__A & (__v4du)__B);
	vpand	%ymm1, %ymm3, %ymm1	# tmp136, tmp150, _14
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avx2intrin.h:121:   return (__m256i) ((__v8su)__A + (__v8su)__B);
	vpaddd	%ymm9, %ymm1, %ymm1	# offset, _14, _48
	vpaddd	%ymm0, %ymm1, %ymm0	# _28, _48, _19
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avxintrin.h:867:   *__P = __A;
	vmovdqa	%ymm0, (%rsi,%rax)	# _19, MEM[(__m256i * {ref-all})dest_11 + ivtmp.190_87 * 1]
# problem2.cpp:139:   for (int i = 0; i < N; i += stride)
	addq	$32, %rax	#, ivtmp.190
# /usr/lib/gcc/x86_64-pc-linux-gnu/15.2.1/include/avx2intrin.h:1046:   return (__m256i) __builtin_ia32_permvarsi256 ((__v8si)__X, (__v8si)__Y);
	vpermd	%ymm0, %ymm2, %ymm9	# _19, tmp143, offset
# problem2.cpp:139:   for (int i = 0; i < N; i += stride)
	cmpq	$262144, %rax	#, ivtmp.190
	jne	.L30	#,
# problem2.cpp:167:   return dest[N - 1];
	movl	262140(%rsi), %eax	# MEM[(int *)dest_11 + 262140B], MEM[(int *)dest_11 + 262140B]
	vzeroupper
# problem2.cpp:168: }
	ret	
	.size	_Z12avx2_versionPKiPi, .-_Z12avx2_versionPKiPi
	.section	.rodata.str1.1
.LC16:
	.string	"Serial version: "
.LC17:
	.string	" time: "
.LC18:
	.string	"OMP result is wrong!\n"
.LC19:
	.string	"int main()"
.LC20:
	.string	"problem2.cpp"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC21:
	.string	"val_ser == val_omp || printf(\"OMP result is wrong!\\n\")"
	.section	.rodata.str1.1
.LC22:
	.string	"OMP version: "
.LC23:
	.string	"SSE result is wrong!\n"
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"val_ser == val_sse || printf(\"SSE result is wrong!\\n\")"
	.section	.rodata.str1.1
.LC25:
	.string	"SSE version: "
.LC26:
	.string	"AVX2 result is wrong!\n"
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"val_ser == val_avx2 || printf(\"AVX2 result is wrong!\\n\")"
	.section	.rodata.str1.1
.LC28:
	.string	"AVX2 version: "
	.section	.text.unlikely
.LCOLDB29:
	.section	.text.startup,"ax",@progbits
.LHOTB29:
	.p2align 4
	.globl	main
	.type	main, @function
main:
	pushq	%r15	#
# problem2.cpp:172:   int *array = static_cast<int *>(aligned_alloc(ALIGN, N * sizeof(int)));
	movl	$262144, %esi	#,
	movl	$32, %edi	#,
# problem2.cpp:171: {
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbp	#
	pushq	%rbx	#
	subq	$24, %rsp	#,
# problem2.cpp:172:   int *array = static_cast<int *>(aligned_alloc(ALIGN, N * sizeof(int)));
	call	aligned_alloc@PLT	#
	movq	%rax, %r15	#, array
# problem2.cpp:173:   std::fill(array, array + N, 1);
	leaq	262144(%rax), %rdx	#, _1
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L33:
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	movl	$1, (%rax)	#, MEM[(int *)__first_145]
# /usr/include/c++/15.2.1/bits/stl_algobase.h:924:       for (; __first != __last; ++__first)
	addq	$8, %rax	#, __first
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	movl	$1, -4(%rax)	#, MEM[(int *)__first_145]
# /usr/include/c++/15.2.1/bits/stl_algobase.h:924:       for (; __first != __last; ++__first)
	cmpq	%rax, %rdx	# __first, _1
	jne	.L33	#,
# problem2.cpp:174:   int *ref_res = static_cast<int *>(aligned_alloc(ALIGN, N * sizeof(int)));
	movl	$262144, %esi	#,
	movl	$32, %edi	#,
# problem2.cpp:61:   int tmp = 0;
	xorl	%ebx, %ebx	# tmp
# problem2.cpp:174:   int *ref_res = static_cast<int *>(aligned_alloc(ALIGN, N * sizeof(int)));
	call	aligned_alloc@PLT	#
	movq	%rax, %r12	#, ref_res
# problem2.cpp:176:   HRTimer start = HR::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
	movq	%rax, %r13	#, start
	xorl	%eax, %eax	# ivtmp.210
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L34:
# problem2.cpp:64:     tmp += source[i];
	addl	(%r15,%rax), %ebx	# MEM[(int *)array_25 + ivtmp.210_121 * 1], tmp
# problem2.cpp:65:     dest[i] = tmp;
	movl	%ebx, (%r12,%rax)	# tmp, MEM[(int *)ref_res_27 + ivtmp.210_121 * 1]
# problem2.cpp:62:   for (int i = 0; i < N; i++)
	addq	$4, %rax	#, ivtmp.210
# problem2.cpp:64:     tmp += source[i];
	movl	%ebx, %ebp	# tmp, tmp_96
# problem2.cpp:62:   for (int i = 0; i < N; i++)
	cmpq	$262144, %rax	#, ivtmp.210
	jne	.L34	#,
# problem2.cpp:178:   HRTimer end = HR::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
# /usr/include/c++/15.2.1/bits/chrono.h:218: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	movabsq	$2361183241434822607, %rdx	#, tmp156
# problem2.cpp:180:   cout << "Serial version: " << val_ser << " time: " << duration << endl;
	leaq	_ZSt4cout(%rip), %rdi	#,
# /usr/include/c++/15.2.1/bits/chrono.h:720: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	subq	%r13, %rax	# start, end
	movq	%rax, %rsi	# end, _87
# /usr/include/c++/15.2.1/bits/chrono.h:218: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	imulq	%rdx	# tmp156
	sarq	$63, %rsi	#, tmp158
	sarq	$7, %rdx	#, tmp157
	subq	%rsi, %rdx	# tmp158, tmp157
# problem2.cpp:180:   cout << "Serial version: " << val_ser << " time: " << duration << endl;
	leaq	.LC16(%rip), %rsi	#,
# /usr/include/c++/15.2.1/bits/chrono.h:218: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	movq	%rdx, %r12	# tmp157, _86
# problem2.cpp:180:   cout << "Serial version: " << val_ser << " time: " << duration << endl;
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# problem2.cpp:180:   cout << "Serial version: " << val_ser << " time: " << duration << endl;
	movl	%ebx, %esi	# tmp,
	movq	%rax, %rdi	# _3,
	call	_ZNSolsEi@PLT	#
# problem2.cpp:180:   cout << "Serial version: " << val_ser << " time: " << duration << endl;
	leaq	.LC17(%rip), %rsi	#,
	movq	%rax, %rdi	# _4,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:175:       { return _M_insert(__n); }
	movq	%r12, %rsi	# _86,
	movq	%rax, %rdi	# _5,
	call	_ZNSo9_M_insertIlEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:121: 	return __pf(*this);
	movq	%rax, %rdi	# _85,
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0	#
# problem2.cpp:182:   int *omp_res = static_cast<int *>(aligned_alloc(ALIGN, N * sizeof(int)));
	movl	$262144, %esi	#,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
	movq	%rax, %r13	#, tmp220
# problem2.cpp:184:   start = HR::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
# problem2.cpp:185:   int val_omp = omp_version(array, omp_res);
	movq	%r13, %rsi	# tmp220,
	movq	%r15, %rdi	# array,
# problem2.cpp:184:   start = HR::now();
	movq	%rax, 8(%rsp)	#, %sfp
# problem2.cpp:185:   int val_omp = omp_version(array, omp_res);
	call	_Z11omp_versionPKiPi	#
	movl	%eax, %r14d	#, val_omp
# problem2.cpp:186:   end = HR::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
	movq	%rax, %r12	#, end
# problem2.cpp:188:   assert(val_ser == val_omp || printf("OMP result is wrong!\n"));
	cmpl	%ebx, %r14d	# tmp, val_omp
	je	.L35	#,
# problem2.cpp:188:   assert(val_ser == val_omp || printf("OMP result is wrong!\n"));
	xorl	%eax, %eax	#
	leaq	.LC18(%rip), %rdi	#,
	call	printf@PLT	#
# problem2.cpp:188:   assert(val_ser == val_omp || printf("OMP result is wrong!\n"));
	testl	%eax, %eax	# _7
	je	.L41	#,
.L35:
# problem2.cpp:189:   cout << "OMP version: " << val_omp << " time: " << duration << endl;
	leaq	.LC22(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# problem2.cpp:189:   cout << "OMP version: " << val_omp << " time: " << duration << endl;
	movl	%r14d, %esi	# val_omp,
	movq	%rax, %rdi	# _8,
	call	_ZNSolsEi@PLT	#
# problem2.cpp:189:   cout << "OMP version: " << val_omp << " time: " << duration << endl;
	leaq	.LC17(%rip), %rsi	#,
	movq	%rax, %rdi	# _9,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/chrono.h:720: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	subq	8(%rsp), %r12	# %sfp, _100
# problem2.cpp:189:   cout << "OMP version: " << val_omp << " time: " << duration << endl;
	movq	%rax, %rdi	#, _10
# /usr/include/c++/15.2.1/bits/chrono.h:218: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	movabsq	$2361183241434822607, %rax	#, tmp248
	imulq	%r12	# _100
	sarq	$63, %r12	#, tmp175
	sarq	$7, %rdx	#, tmp174
	subq	%r12, %rdx	# tmp175, tmp174
	movq	%rdx, %rsi	# tmp174, _99
# /usr/include/c++/15.2.1/bits/ostream.h:175:       { return _M_insert(__n); }
	call	_ZNSo9_M_insertIlEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:121: 	return __pf(*this);
	movq	%rax, %rdi	# _101,
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0	#
# problem2.cpp:190:   free(omp_res);
	movq	%r13, %rdi	# tmp220,
	call	free@PLT	#
# problem2.cpp:192:   int *sse_res = static_cast<int *>(aligned_alloc(ALIGN, N * sizeof(int)));
	movl	$262144, %esi	#,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	xorl	%esi, %esi	#
	movl	$262144, %edx	#,
	movq	%rax, %rdi	# tmp229,
# problem2.cpp:192:   int *sse_res = static_cast<int *>(aligned_alloc(ALIGN, N * sizeof(int)));
	movq	%rax, %rbx	#, tmp229
# /usr/include/c++/15.2.1/bits/stl_algobase.h:925: 	*__first = __val;
	call	memset@PLT	#
# problem2.cpp:194:   start = HR::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
# problem2.cpp:195:   int val_sse = sse4_version(array, sse_res);
	movq	%rbx, %rsi	# tmp229,
	movq	%r15, %rdi	# array,
# problem2.cpp:194:   start = HR::now();
	movq	%rax, %r13	#, start
# problem2.cpp:195:   int val_sse = sse4_version(array, sse_res);
	call	_Z12sse4_versionPKiPi	#
	movl	%eax, %r14d	#, val_sse
# problem2.cpp:196:   end = HR::now();
	vzeroupper
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
	movq	%rax, %r12	#, end
# problem2.cpp:198:   assert(val_ser == val_sse || printf("SSE result is wrong!\n"));
	cmpl	%ebp, %r14d	# tmp_96, val_sse
	je	.L36	#,
# problem2.cpp:198:   assert(val_ser == val_sse || printf("SSE result is wrong!\n"));
	xorl	%eax, %eax	#
	leaq	.LC23(%rip), %rdi	#,
	call	printf@PLT	#
# problem2.cpp:198:   assert(val_ser == val_sse || printf("SSE result is wrong!\n"));
	testl	%eax, %eax	# _12
	je	.L42	#,
.L36:
# problem2.cpp:199:   cout << "SSE version: " << val_sse << " time: " << duration << endl;
	leaq	.LC25(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# problem2.cpp:199:   cout << "SSE version: " << val_sse << " time: " << duration << endl;
	movl	%r14d, %esi	# val_sse,
	movq	%rax, %rdi	# _13,
	call	_ZNSolsEi@PLT	#
# problem2.cpp:199:   cout << "SSE version: " << val_sse << " time: " << duration << endl;
	leaq	.LC17(%rip), %rsi	#,
	movq	%rax, %rdi	# _14,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/chrono.h:720: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	movq	%r12, %rsi	# end, end
	subq	%r13, %rsi	# start, end
# problem2.cpp:199:   cout << "SSE version: " << val_sse << " time: " << duration << endl;
	movq	%rax, %rdi	#, _15
# /usr/include/c++/15.2.1/bits/chrono.h:218: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	movabsq	$2361183241434822607, %rax	#, tmp249
	imulq	%rsi	# _103
	movq	%rsi, %rax	# _103, _103
	sarq	$63, %rax	#, _103
	sarq	$7, %rdx	#, tmp192
	subq	%rax, %rdx	# tmp193, tmp192
	movq	%rdx, %rsi	# tmp192, _102
# /usr/include/c++/15.2.1/bits/ostream.h:175:       { return _M_insert(__n); }
	call	_ZNSo9_M_insertIlEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:121: 	return __pf(*this);
	movq	%rax, %rdi	# _104,
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0	#
# problem2.cpp:200:   free(sse_res);
	movq	%rbx, %rdi	# tmp229,
	call	free@PLT	#
# problem2.cpp:202:   int *avx2_res = static_cast<int *>(aligned_alloc(ALIGN, N * sizeof(int)));
	movl	$262144, %esi	#,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
	movq	%rax, %rbx	#, tmp238
# problem2.cpp:204:   start = HR::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
# problem2.cpp:205:   int val_avx2 = avx2_version(array, avx2_res);
	movq	%rbx, %rsi	# tmp238,
	movq	%r15, %rdi	# array,
# problem2.cpp:204:   start = HR::now();
	movq	%rax, %r13	#, start
# problem2.cpp:205:   int val_avx2 = avx2_version(array, avx2_res);
	call	_Z12avx2_versionPKiPi	#
	movl	%eax, %r14d	#, val_avx2
# problem2.cpp:206:   end = HR::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
	movq	%rax, %r12	#, end
# problem2.cpp:208:   assert(val_ser == val_avx2 || printf("AVX2 result is wrong!\n"));
	cmpl	%ebp, %r14d	# tmp_96, val_avx2
	je	.L37	#,
# problem2.cpp:208:   assert(val_ser == val_avx2 || printf("AVX2 result is wrong!\n"));
	xorl	%eax, %eax	#
	leaq	.LC26(%rip), %rdi	#,
	call	printf@PLT	#
# problem2.cpp:208:   assert(val_ser == val_avx2 || printf("AVX2 result is wrong!\n"));
	testl	%eax, %eax	# _16
	je	.L43	#,
.L37:
# problem2.cpp:209:   cout << "AVX2 version: " << val_avx2 << " time: " << duration << endl;
	leaq	.LC28(%rip), %rsi	#,
	leaq	_ZSt4cout(%rip), %rdi	#,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# problem2.cpp:209:   cout << "AVX2 version: " << val_avx2 << " time: " << duration << endl;
	movl	%r14d, %esi	# val_avx2,
	movq	%rax, %rdi	# _17,
	call	_ZNSolsEi@PLT	#
# problem2.cpp:209:   cout << "AVX2 version: " << val_avx2 << " time: " << duration << endl;
	leaq	.LC17(%rip), %rsi	#,
	movq	%rax, %rdi	# _18,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# /usr/include/c++/15.2.1/bits/chrono.h:720: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	movq	%r12, %rcx	# end, end
# problem2.cpp:209:   cout << "AVX2 version: " << val_avx2 << " time: " << duration << endl;
	movq	%rax, %rdi	#, _19
# /usr/include/c++/15.2.1/bits/chrono.h:720: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	subq	%r13, %rcx	# start, end
# /usr/include/c++/15.2.1/bits/chrono.h:218: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	movabsq	$2361183241434822607, %rax	#, tmp250
	imulq	%rcx	# _106
	sarq	$63, %rcx	#, tmp207
	sarq	$7, %rdx	#, tmp206
	movq	%rdx, %rsi	# tmp206, tmp206
	subq	%rcx, %rsi	# tmp207, tmp206
# /usr/include/c++/15.2.1/bits/ostream.h:175:       { return _M_insert(__n); }
	call	_ZNSo9_M_insertIlEERSoT_@PLT	#
# /usr/include/c++/15.2.1/bits/ostream.h:121: 	return __pf(*this);
	movq	%rax, %rdi	# _107,
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0	#
# problem2.cpp:210:   free(avx2_res);
	movq	%rbx, %rdi	# tmp238,
	call	free@PLT	#
# problem2.cpp:212: }
	addq	$24, %rsp	#,
	xorl	%eax, %eax	#
	popq	%rbx	#
	popq	%rbp	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	ret	
	.section	.text.unlikely
	.type	main.cold, @function
main.cold:
.L41:
# problem2.cpp:188:   assert(val_ser == val_omp || printf("OMP result is wrong!\n"));
	leaq	.LC19(%rip), %rcx	#,
	movl	$188, %edx	#,
	leaq	.LC20(%rip), %rsi	#,
	leaq	.LC21(%rip), %rdi	#,
	call	__assert_fail@PLT	#
.L43:
# problem2.cpp:208:   assert(val_ser == val_avx2 || printf("AVX2 result is wrong!\n"));
	leaq	.LC19(%rip), %rcx	#,
	movl	$208, %edx	#,
	leaq	.LC20(%rip), %rsi	#,
	leaq	.LC27(%rip), %rdi	#,
	call	__assert_fail@PLT	#
.L42:
# problem2.cpp:198:   assert(val_ser == val_sse || printf("SSE result is wrong!\n"));
	leaq	.LC19(%rip), %rcx	#,
	movl	$198, %edx	#,
	leaq	.LC20(%rip), %rsi	#,
	leaq	.LC24(%rip), %rdi	#,
	call	__assert_fail@PLT	#
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE29:
	.section	.text.startup
.LHOTE29:
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC8:
	.long	0
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.align 32
.LC10:
	.long	7
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.align 32
.LC11:
	.quad	-4294967296
	.quad	-1
	.quad	-1
	.quad	-1
	.align 32
.LC12:
	.long	6
	.long	7
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.align 32
.LC13:
	.quad	0
	.quad	-1
	.quad	-1
	.quad	-1
	.align 32
.LC14:
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	2
	.long	3
	.align 32
.LC15:
	.quad	0
	.quad	0
	.quad	-1
	.quad	-1
	.ident	"GCC: (GNU) 15.2.1 20250813"
	.section	.note.GNU-stack,"",@progbits
