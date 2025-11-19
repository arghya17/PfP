	.file	"problem4-v0.c"
# GNU C17 (GCC) version 15.2.1 20250813 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 15.2.1 20250813, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=skylake -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mno-gfni -mno-vpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mno-clwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mno-movdir64b -mno-movdiri -mno-mwaitx -mno-pconfig -mno-pku -mprfchw -mno-ptwrite -mno-rdpid -mrdrnd -mrdseed -mno-rtm -mno-serialize -msgx -mno-sha -mno-shstk -mno-tbm -mno-tsxldtrk -mno-vaes -mno-waitpkg -mno-wbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mno-hreset -mno-kl -mno-widekl -mno-avxvnni -mno-avx512fp16 -mno-avxifma -mno-avxvnniint8 -mno-avxneconvert -mno-cmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mno-avxvnniint16 -mno-sm3 -mno-sha512 -mno-sm4 -mno-apxf -mno-usermsr -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-transpose -mno-amx-fp8 -mno-movrs -mno-amx-movrs --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=6144 -mtune=skylake -masm=att -msse4 -mavx2 -O3 -std=c17 -fopenmp -fno-asynchronous-unwind-tables -fno-exceptions -fcf-protection=none
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"w"
.LC1:
	.string	"./results-v0.txt"
.LC2:
	.string	"Error in creating file !"
.LC4:
	.string	"%lf\t"
.LC5:
	.string	"%lf\n"
.LC6:
	.string	"result pnts: %ld\n"
	.text
	.p2align 4
	.globl	gridloopsearch
	.type	gridloopsearch, @function
gridloopsearch:
	pushq	%r15	#
# problem4-v0.c:136:   FILE* fptr = fopen("./results-v0.txt", "w");
	leaq	.LC0(%rip), %rsi	#,
	leaq	.LC1(%rip), %rdi	#,
# problem4-v0.c:122:     double c1010, double d10, double ey10, double kk) {
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbp	#
	pushq	%rbx	#
	subq	$1496, %rsp	#,
# problem4-v0.c:122:     double c1010, double d10, double ey10, double kk) {
	vmovsd	%xmm7, 256(%rsp)	# dd8, %sfp
	vmovsd	1552(%rsp), %xmm7	# dd9, dd9
	movq	1568(%rsp), %r12	# dd11, dd11
	vmovsd	%xmm1, 336(%rsp)	# dd2, %sfp
	movq	1592(%rsp), %r13	# dd14, dd14
	vmovsd	%xmm7, 1248(%rsp)	# dd9, %sfp
	vmovsd	1560(%rsp), %xmm7	# dd10, dd10
	vmovsd	%xmm2, 328(%rsp)	# dd3, %sfp
	vmovsd	%xmm7, 1256(%rsp)	# dd10, %sfp
	vmovsd	1576(%rsp), %xmm7	# dd12, dd12
	vmovsd	%xmm3, 320(%rsp)	# dd4, %sfp
	vmovsd	%xmm7, 1264(%rsp)	# dd12, %sfp
	vmovsd	1584(%rsp), %xmm7	# dd13, dd13
	vmovsd	%xmm4, 312(%rsp)	# dd5, %sfp
	vmovsd	%xmm5, 304(%rsp)	# dd6, %sfp
	vmovsd	%xmm0, 1320(%rsp)	# dd1, %sfp
	vmovsd	%xmm6, 280(%rsp)	# dd7, %sfp
	vmovsd	%xmm7, 1272(%rsp)	# dd13, %sfp
	vmovsd	1600(%rsp), %xmm7	# dd15, dd15
	vmovsd	1672(%rsp), %xmm6	# dd24, dd24
	vmovsd	1616(%rsp), %xmm8	# dd17, dd17
	vmovsd	1640(%rsp), %xmm9	# dd20, dd20
	vmovsd	%xmm7, 1280(%rsp)	# dd15, %sfp
	vmovsd	1608(%rsp), %xmm7	# dd16, dd16
	vmovsd	1664(%rsp), %xmm10	# dd23, dd23
	vmovsd	%xmm6, 464(%rsp)	# dd24, %sfp
	vmovsd	1696(%rsp), %xmm6	# dd27, dd27
	vmovsd	1688(%rsp), %xmm11	# dd26, dd26
	vmovsd	%xmm7, 1288(%rsp)	# dd16, %sfp
	vmovsd	1624(%rsp), %xmm7	# dd18, dd18
	movq	1712(%rsp), %rbp	# dd29, dd29
	vmovsd	%xmm6, 160(%rsp)	# dd27, %sfp
	vmovsd	1720(%rsp), %xmm6	# dd30, dd30
	vmovsd	%xmm7, 1296(%rsp)	# dd18, %sfp
	vmovsd	1632(%rsp), %xmm7	# dd19, dd19
	vmovsd	%xmm8, 248(%rsp)	# dd17, %sfp
	vmovsd	%xmm7, 1304(%rsp)	# dd19, %sfp
	vmovsd	1648(%rsp), %xmm7	# dd21, dd21
	vmovsd	%xmm9, 144(%rsp)	# dd20, %sfp
	vmovsd	%xmm7, 1312(%rsp)	# dd21, %sfp
	vmovsd	1656(%rsp), %xmm7	# dd22, dd22
	vmovsd	%xmm10, 136(%rsp)	# dd23, %sfp
	vmovsd	%xmm7, 456(%rsp)	# dd22, %sfp
	vmovsd	1680(%rsp), %xmm7	# dd25, dd25
	vmovsd	%xmm11, 128(%rsp)	# dd26, %sfp
	vmovsd	%xmm7, 152(%rsp)	# dd25, %sfp
	vmovsd	1704(%rsp), %xmm7	# dd28, dd28
	vmovsd	%xmm6, 16(%rsp)	# dd30, %sfp
	vmovsd	%xmm7, 8(%rsp)	# dd28, %sfp
	vmovsd	1728(%rsp), %xmm7	# c11, c11
	vmovsd	%xmm7, 480(%rsp)	# c11, %sfp
	vmovsd	1736(%rsp), %xmm6	# c12, c12
	vmovsd	1744(%rsp), %xmm7	# c13, c13
	vmovsd	%xmm6, 488(%rsp)	# c12, %sfp
	vmovsd	1752(%rsp), %xmm6	# c14, c14
	vmovsd	%xmm7, 496(%rsp)	# c13, %sfp
	vmovsd	1760(%rsp), %xmm7	# c15, c15
	vmovsd	%xmm6, 504(%rsp)	# c14, %sfp
	vmovsd	1768(%rsp), %xmm6	# c16, c16
	vmovsd	%xmm7, 512(%rsp)	# c15, %sfp
	vmovsd	1776(%rsp), %xmm7	# c17, c17
	vmovsd	%xmm6, 520(%rsp)	# c16, %sfp
	vmovsd	1784(%rsp), %xmm6	# c18, c18
	vmovsd	%xmm7, 528(%rsp)	# c17, %sfp
	vmovsd	1792(%rsp), %xmm7	# c19, c19
	vmovsd	%xmm6, 536(%rsp)	# c18, %sfp
	vmovsd	1800(%rsp), %xmm6	# c110, c110
	vmovsd	%xmm7, 168(%rsp)	# c19, %sfp
	vmovsd	1808(%rsp), %xmm7	# d1, d1
	vmovsd	%xmm6, 32(%rsp)	# c110, %sfp
	vmovsd	1816(%rsp), %xmm6	# ey1, ey1
	vmovsd	%xmm7, 40(%rsp)	# d1, %sfp
	vmovsd	1824(%rsp), %xmm7	# c21, c21
	vmovsd	%xmm6, 24(%rsp)	# ey1, %sfp
	vmovsd	1832(%rsp), %xmm6	# c22, c22
	vmovsd	%xmm7, 544(%rsp)	# c21, %sfp
	vmovsd	1840(%rsp), %xmm7	# c23, c23
	vmovsd	%xmm6, 552(%rsp)	# c22, %sfp
	vmovsd	1848(%rsp), %xmm6	# c24, c24
	vmovsd	%xmm7, 560(%rsp)	# c23, %sfp
	vmovsd	1856(%rsp), %xmm7	# c25, c25
	vmovsd	%xmm6, 568(%rsp)	# c24, %sfp
	vmovsd	%xmm7, 576(%rsp)	# c25, %sfp
	vmovsd	1864(%rsp), %xmm6	# c26, c26
	vmovsd	1872(%rsp), %xmm7	# c27, c27
	movq	1912(%rsp), %r14	# ey2, ey2
	vmovsd	%xmm6, 584(%rsp)	# c26, %sfp
	vmovsd	1880(%rsp), %xmm6	# c28, c28
	vmovsd	%xmm7, 592(%rsp)	# c27, %sfp
	vmovsd	1888(%rsp), %xmm7	# c29, c29
	vmovsd	%xmm6, 600(%rsp)	# c28, %sfp
	vmovsd	1896(%rsp), %xmm6	# c210, c210
	vmovsd	%xmm7, 176(%rsp)	# c29, %sfp
	vmovsd	1904(%rsp), %xmm7	# d2, d2
	vmovsd	%xmm6, 264(%rsp)	# c210, %sfp
	vmovsd	1920(%rsp), %xmm6	# c31, c31
	vmovsd	%xmm7, 272(%rsp)	# d2, %sfp
	vmovsd	1928(%rsp), %xmm7	# c32, c32
	vmovsd	%xmm6, 608(%rsp)	# c31, %sfp
	vmovsd	1936(%rsp), %xmm6	# c33, c33
	vmovsd	%xmm7, 616(%rsp)	# c32, %sfp
	vmovsd	1944(%rsp), %xmm7	# c34, c34
	vmovsd	%xmm6, 624(%rsp)	# c33, %sfp
	vmovsd	1952(%rsp), %xmm6	# c35, c35
	vmovsd	%xmm7, 632(%rsp)	# c34, %sfp
	vmovsd	1960(%rsp), %xmm7	# c36, c36
	vmovsd	%xmm6, 640(%rsp)	# c35, %sfp
	vmovsd	1968(%rsp), %xmm6	# c37, c37
	vmovsd	%xmm7, 648(%rsp)	# c36, %sfp
	vmovsd	1976(%rsp), %xmm7	# c38, c38
	vmovsd	%xmm6, 656(%rsp)	# c37, %sfp
	vmovsd	1984(%rsp), %xmm6	# c39, c39
	vmovsd	%xmm7, 664(%rsp)	# c38, %sfp
	vmovsd	1992(%rsp), %xmm7	# c310, c310
	vmovsd	%xmm6, 184(%rsp)	# c39, %sfp
	vmovsd	%xmm7, 1344(%rsp)	# c310, %sfp
	vmovsd	2000(%rsp), %xmm6	# d3, d3
	vmovsd	2016(%rsp), %xmm7	# c41, c41
	movq	2008(%rsp), %r15	# ey3, ey3
	vmovsd	%xmm6, 672(%rsp)	# d3, %sfp
	vmovsd	2024(%rsp), %xmm6	# c42, c42
	vmovsd	%xmm7, 680(%rsp)	# c41, %sfp
	vmovsd	2032(%rsp), %xmm7	# c43, c43
	vmovsd	%xmm6, 688(%rsp)	# c42, %sfp
	vmovsd	2040(%rsp), %xmm6	# c44, c44
	vmovsd	%xmm7, 696(%rsp)	# c43, %sfp
	vmovsd	2048(%rsp), %xmm7	# c45, c45
	vmovsd	%xmm6, 704(%rsp)	# c44, %sfp
	vmovsd	2056(%rsp), %xmm6	# c46, c46
	vmovsd	%xmm7, 712(%rsp)	# c45, %sfp
	vmovsd	2064(%rsp), %xmm7	# c47, c47
	vmovsd	%xmm6, 720(%rsp)	# c46, %sfp
	vmovsd	2072(%rsp), %xmm6	# c48, c48
	vmovsd	%xmm7, 728(%rsp)	# c47, %sfp
	vmovsd	2080(%rsp), %xmm7	# c49, c49
	vmovsd	%xmm6, 736(%rsp)	# c48, %sfp
	vmovsd	2088(%rsp), %xmm6	# c410, c410
	vmovsd	%xmm7, 192(%rsp)	# c49, %sfp
	vmovsd	2096(%rsp), %xmm7	# d4, d4
	vmovsd	%xmm6, 56(%rsp)	# c410, %sfp
	vmovsd	2104(%rsp), %xmm6	# ey4, ey4
	vmovsd	%xmm7, 64(%rsp)	# d4, %sfp
	vmovsd	2112(%rsp), %xmm7	# c51, c51
	vmovsd	%xmm6, 48(%rsp)	# ey4, %sfp
	vmovsd	2120(%rsp), %xmm6	# c52, c52
	vmovsd	%xmm7, 744(%rsp)	# c51, %sfp
	vmovsd	2128(%rsp), %xmm7	# c53, c53
	vmovsd	%xmm6, 752(%rsp)	# c52, %sfp
	vmovsd	%xmm7, 760(%rsp)	# c53, %sfp
	vmovsd	2136(%rsp), %xmm6	# c54, c54
	vmovsd	2144(%rsp), %xmm7	# c55, c55
	vmovsd	%xmm6, 768(%rsp)	# c54, %sfp
	vmovsd	2152(%rsp), %xmm6	# c56, c56
	vmovsd	%xmm7, 776(%rsp)	# c55, %sfp
	vmovsd	2160(%rsp), %xmm7	# c57, c57
	vmovsd	%xmm6, 784(%rsp)	# c56, %sfp
	vmovsd	2168(%rsp), %xmm6	# c58, c58
	vmovsd	%xmm7, 792(%rsp)	# c57, %sfp
	vmovsd	2176(%rsp), %xmm7	# c59, c59
	vmovsd	%xmm6, 800(%rsp)	# c58, %sfp
	vmovsd	2184(%rsp), %xmm6	# c510, c510
	vmovsd	%xmm7, 200(%rsp)	# c59, %sfp
	vmovsd	2192(%rsp), %xmm7	# d5, d5
	vmovsd	%xmm6, 288(%rsp)	# c510, %sfp
	vmovsd	2200(%rsp), %xmm6	# ey5, ey5
	vmovsd	%xmm7, 296(%rsp)	# d5, %sfp
	vmovsd	2208(%rsp), %xmm7	# c61, c61
	vmovsd	%xmm6, 72(%rsp)	# ey5, %sfp
	vmovsd	2216(%rsp), %xmm6	# c62, c62
	vmovsd	%xmm7, 808(%rsp)	# c61, %sfp
	vmovsd	2224(%rsp), %xmm7	# c63, c63
	vmovsd	%xmm6, 816(%rsp)	# c62, %sfp
	vmovsd	2232(%rsp), %xmm6	# c64, c64
	vmovsd	%xmm7, 824(%rsp)	# c63, %sfp
	vmovsd	2240(%rsp), %xmm7	# c65, c65
	vmovsd	%xmm6, 832(%rsp)	# c64, %sfp
	vmovsd	2248(%rsp), %xmm6	# c66, c66
	vmovsd	%xmm7, 840(%rsp)	# c65, %sfp
	vmovsd	2256(%rsp), %xmm7	# c67, c67
	vmovsd	%xmm6, 848(%rsp)	# c66, %sfp
	vmovsd	%xmm7, 856(%rsp)	# c67, %sfp
	vmovsd	2264(%rsp), %xmm6	# c68, c68
	vmovsd	2272(%rsp), %xmm7	# c69, c69
	vmovsd	%xmm6, 864(%rsp)	# c68, %sfp
	vmovsd	2280(%rsp), %xmm6	# c610, c610
	vmovsd	%xmm7, 208(%rsp)	# c69, %sfp
	vmovsd	2288(%rsp), %xmm7	# d6, d6
	vmovsd	%xmm6, 352(%rsp)	# c610, %sfp
	vmovsd	2296(%rsp), %xmm6	# ey6, ey6
	vmovsd	%xmm7, 360(%rsp)	# d6, %sfp
	vmovsd	2304(%rsp), %xmm7	# c71, c71
	vmovsd	%xmm6, 80(%rsp)	# ey6, %sfp
	vmovsd	2312(%rsp), %xmm6	# c72, c72
	vmovsd	%xmm7, 872(%rsp)	# c71, %sfp
	vmovsd	2320(%rsp), %xmm7	# c73, c73
	vmovsd	%xmm6, 880(%rsp)	# c72, %sfp
	vmovsd	2328(%rsp), %xmm6	# c74, c74
	vmovsd	%xmm7, 888(%rsp)	# c73, %sfp
	vmovsd	2336(%rsp), %xmm7	# c75, c75
	vmovsd	%xmm6, 896(%rsp)	# c74, %sfp
	vmovsd	2344(%rsp), %xmm6	# c76, c76
	vmovsd	%xmm7, 904(%rsp)	# c75, %sfp
	vmovsd	2352(%rsp), %xmm7	# c77, c77
	vmovsd	%xmm6, 912(%rsp)	# c76, %sfp
	vmovsd	2360(%rsp), %xmm6	# c78, c78
	vmovsd	%xmm7, 920(%rsp)	# c77, %sfp
	vmovsd	2368(%rsp), %xmm7	# c79, c79
	vmovsd	%xmm6, 928(%rsp)	# c78, %sfp
	vmovsd	2376(%rsp), %xmm6	# c710, c710
	vmovsd	%xmm7, 216(%rsp)	# c79, %sfp
	vmovsd	2384(%rsp), %xmm7	# d7, d7
	vmovsd	%xmm6, 432(%rsp)	# c710, %sfp
	vmovsd	%xmm7, 440(%rsp)	# d7, %sfp
	vmovsd	2392(%rsp), %xmm6	# ey7, ey7
	vmovsd	2400(%rsp), %xmm7	# c81, c81
	vmovsd	%xmm6, 88(%rsp)	# ey7, %sfp
	vmovsd	2408(%rsp), %xmm6	# c82, c82
	vmovsd	%xmm7, 936(%rsp)	# c81, %sfp
	vmovsd	2416(%rsp), %xmm7	# c83, c83
	vmovsd	%xmm6, 944(%rsp)	# c82, %sfp
	vmovsd	2424(%rsp), %xmm6	# c84, c84
	vmovsd	%xmm7, 952(%rsp)	# c83, %sfp
	vmovsd	2432(%rsp), %xmm7	# c85, c85
	vmovsd	%xmm6, 960(%rsp)	# c84, %sfp
	vmovsd	2440(%rsp), %xmm6	# c86, c86
	vmovsd	%xmm7, 968(%rsp)	# c85, %sfp
	vmovsd	2448(%rsp), %xmm7	# c87, c87
	vmovsd	%xmm6, 976(%rsp)	# c86, %sfp
	vmovsd	2456(%rsp), %xmm6	# c88, c88
	vmovsd	%xmm7, 984(%rsp)	# c87, %sfp
	vmovsd	2464(%rsp), %xmm7	# c89, c89
	vmovsd	%xmm6, 992(%rsp)	# c88, %sfp
	vmovsd	2472(%rsp), %xmm6	# c810, c810
	vmovsd	%xmm7, 224(%rsp)	# c89, %sfp
	vmovsd	2480(%rsp), %xmm7	# d8, d8
	vmovsd	%xmm6, 1144(%rsp)	# c810, %sfp
	vmovsd	2488(%rsp), %xmm6	# ey8, ey8
	vmovsd	%xmm7, 1152(%rsp)	# d8, %sfp
	vmovsd	2496(%rsp), %xmm7	# c91, c91
	vmovsd	%xmm6, 96(%rsp)	# ey8, %sfp
	vmovsd	2504(%rsp), %xmm6	# c92, c92
	vmovsd	%xmm7, 1000(%rsp)	# c91, %sfp
	vmovsd	2512(%rsp), %xmm7	# c93, c93
	vmovsd	%xmm6, 1008(%rsp)	# c92, %sfp
	vmovsd	%xmm7, 1016(%rsp)	# c93, %sfp
	vmovsd	2520(%rsp), %xmm6	# c94, c94
	vmovsd	2528(%rsp), %xmm7	# c95, c95
	vmovsd	%xmm6, 1024(%rsp)	# c94, %sfp
	vmovsd	2536(%rsp), %xmm6	# c96, c96
	vmovsd	%xmm7, 1032(%rsp)	# c95, %sfp
	vmovsd	2544(%rsp), %xmm7	# c97, c97
	vmovsd	%xmm6, 1040(%rsp)	# c96, %sfp
	vmovsd	2552(%rsp), %xmm6	# c98, c98
	vmovsd	%xmm7, 1048(%rsp)	# c97, %sfp
	vmovsd	2560(%rsp), %xmm7	# c99, c99
	vmovsd	%xmm6, 1056(%rsp)	# c98, %sfp
	vmovsd	2568(%rsp), %xmm6	# c910, c910
	vmovsd	%xmm7, 232(%rsp)	# c99, %sfp
	vmovsd	2576(%rsp), %xmm7	# d9, d9
	vmovsd	%xmm6, 1184(%rsp)	# c910, %sfp
	vmovsd	2584(%rsp), %xmm6	# ey9, ey9
	vmovsd	%xmm7, 1192(%rsp)	# d9, %sfp
	vmovsd	2592(%rsp), %xmm7	# c101, c101
	vmovsd	%xmm6, 104(%rsp)	# ey9, %sfp
	vmovsd	2600(%rsp), %xmm6	# c102, c102
	vmovsd	%xmm7, 1064(%rsp)	# c101, %sfp
	vmovsd	2608(%rsp), %xmm7	# c103, c103
	vmovsd	%xmm6, 1072(%rsp)	# c102, %sfp
	vmovsd	2616(%rsp), %xmm6	# c104, c104
	vmovsd	%xmm7, 1080(%rsp)	# c103, %sfp
	vmovsd	2624(%rsp), %xmm7	# c105, c105
	vmovsd	%xmm6, 1088(%rsp)	# c104, %sfp
	vmovsd	2632(%rsp), %xmm6	# c106, c106
	vmovsd	%xmm7, 1096(%rsp)	# c105, %sfp
	vmovsd	2640(%rsp), %xmm7	# c107, c107
	vmovsd	%xmm6, 1104(%rsp)	# c106, %sfp
	vmovsd	%xmm7, 1112(%rsp)	# c107, %sfp
	vmovsd	2648(%rsp), %xmm6	# c108, c108
	vmovsd	2656(%rsp), %xmm7	# c109, c109
	vmovsd	2688(%rsp), %xmm0	# kk, kk
	vmovsd	%xmm6, 1120(%rsp)	# c108, %sfp
	vmovsd	2664(%rsp), %xmm6	# c1010, c1010
	vmovsd	%xmm7, 240(%rsp)	# c109, %sfp
	vmovsd	2672(%rsp), %xmm7	# d10, d10
	vmovsd	%xmm6, 1352(%rsp)	# c1010, %sfp
	vmovsd	2680(%rsp), %xmm6	# ey10, ey10
	vmovsd	%xmm7, 1360(%rsp)	# d10, %sfp
	vmovsd	%xmm6, 112(%rsp)	# ey10, %sfp
	vmovsd	%xmm0, 120(%rsp)	# kk, %sfp
# problem4-v0.c:136:   FILE* fptr = fopen("./results-v0.txt", "w");
	call	fopen@PLT	#
# problem4-v0.c:137:   if (fptr == NULL) {
	vmovsd	120(%rsp), %xmm0	# %sfp, kk
	vmovsd	128(%rsp), %xmm11	# %sfp, dd26
	testq	%rax, %rax	# fptr
	vmovsd	136(%rsp), %xmm10	# %sfp, dd23
	vmovsd	144(%rsp), %xmm9	# %sfp, dd20
# problem4-v0.c:136:   FILE* fptr = fopen("./results-v0.txt", "w");
	movq	%rax, 1328(%rsp)	# fptr, %sfp
# problem4-v0.c:137:   if (fptr == NULL) {
	vmovsd	248(%rsp), %xmm8	# %sfp, dd17
	vmovsd	256(%rsp), %xmm7	# %sfp, dd8
	vmovsd	280(%rsp), %xmm6	# %sfp, dd7
	vmovsd	304(%rsp), %xmm5	# %sfp, dd6
	vmovsd	312(%rsp), %xmm4	# %sfp, dd5
	vmovsd	320(%rsp), %xmm3	# %sfp, dd4
	vmovsd	328(%rsp), %xmm2	# %sfp, dd3
	vmovsd	336(%rsp), %xmm1	# %sfp, dd2
	je	.L137	#,
# problem4-v0.c:167:   s1 = floor((dd2 - dd1) / dd3);
	vsubsd	1320(%rsp), %xmm1, %xmm1	# %sfp, dd2, _1
# problem4-v0.c:167:   s1 = floor((dd2 - dd1) / dd3);
	vdivsd	%xmm2, %xmm1, %xmm1	# dd3, _1, _2
	vroundsd	$9, %xmm1, %xmm1, %xmm1	#, _2, _3
# problem4-v0.c:167:   s1 = floor((dd2 - dd1) / dd3);
	vcvttsd2sil	%xmm1, %ecx	# _3, s1
# problem4-v0.c:179:   for (int r1 = 0; r1 < s1; ++r1) {
	testl	%ecx, %ecx	# s1
	jle	.L3	#,
# problem4-v0.c:168:   s2 = floor((dd5 - dd4) / dd6);
	vsubsd	%xmm3, %xmm4, %xmm1	# dd4, dd5, _4
# problem4-v0.c:168:   s2 = floor((dd5 - dd4) / dd6);
	vdivsd	%xmm5, %xmm1, %xmm1	# dd6, _4, _5
	vroundsd	$9, %xmm1, %xmm1, %xmm1	#, _5, _6
# problem4-v0.c:168:   s2 = floor((dd5 - dd4) / dd6);
	vcvttsd2sil	%xmm1, %ebx	# _6, s2
# problem4-v0.c:182:     for (int r2 = 0; r2 < s2; ++r2) {
	testl	%ebx, %ebx	# s2
	jle	.L3	#,
# problem4-v0.c:143:   e1 = kk * ey1;
	vmulsd	24(%rsp), %xmm0, %xmm4	# %sfp, kk, e1
	vxorps	%xmm15, %xmm15, %xmm15	# tmp962
# problem4-v0.c:176:   s10 = floor((dd29 - dd28) / dd30);
	vmovapd	%xmm5, %xmm1	# dd6, dd6
	movl	%ebx, %eax	# s2, s2
	xorl	%ebx, %ebx	# r1
# problem4-v0.c:143:   e1 = kk * ey1;
	vmovsd	%xmm4, 24(%rsp)	# e1, %sfp
# problem4-v0.c:144:   e2 = kk * ey2;
	vmovq	%r14, %xmm4	# ey2, ey2
	vmulsd	%xmm4, %xmm0, %xmm4	# ey2, kk, e2
	vmovsd	%xmm4, 256(%rsp)	# e2, %sfp
# problem4-v0.c:145:   e3 = kk * ey3;
	vmovq	%r15, %xmm4	# ey3, ey3
	vmulsd	%xmm4, %xmm0, %xmm13	# ey3, kk, e3
# problem4-v0.c:146:   e4 = kk * ey4;
	vmulsd	48(%rsp), %xmm0, %xmm4	# %sfp, kk, e4
	vmovsd	%xmm4, 48(%rsp)	# e4, %sfp
# problem4-v0.c:147:   e5 = kk * ey5;
	vmulsd	72(%rsp), %xmm0, %xmm4	# %sfp, kk, e5
	vmovsd	%xmm4, 280(%rsp)	# e5, %sfp
# problem4-v0.c:148:   e6 = kk * ey6;
	vmulsd	80(%rsp), %xmm0, %xmm4	# %sfp, kk, e6
	vmovsd	%xmm4, 344(%rsp)	# e6, %sfp
# problem4-v0.c:149:   e7 = kk * ey7;
	vmulsd	88(%rsp), %xmm0, %xmm4	# %sfp, kk, e7
	vmovsd	%xmm4, 424(%rsp)	# e7, %sfp
# problem4-v0.c:150:   e8 = kk * ey8;
	vmulsd	96(%rsp), %xmm0, %xmm4	# %sfp, kk, e8
	vmovsd	%xmm4, 1136(%rsp)	# e8, %sfp
# problem4-v0.c:151:   e9 = kk * ey9;
	vmulsd	104(%rsp), %xmm0, %xmm4	# %sfp, kk, e9
	vmovsd	%xmm4, 1168(%rsp)	# e9, %sfp
# problem4-v0.c:152:   e10 = kk * ey10;
	vmulsd	112(%rsp), %xmm0, %xmm4	# %sfp, kk, e10
# problem4-v0.c:169:   s3 = floor((dd8 - dd7) / dd9);
	vsubsd	%xmm6, %xmm7, %xmm0	# dd7, dd8, _7
# problem4-v0.c:170:   s4 = floor((dd11 - dd10) / dd12);
	vmovq	%r12, %xmm7	# dd11, dd11
# problem4-v0.c:169:   s3 = floor((dd8 - dd7) / dd9);
	vdivsd	1248(%rsp), %xmm0, %xmm0	# %sfp, _7, _8
	vroundsd	$9, %xmm0, %xmm0, %xmm0	#, _8, _9
# problem4-v0.c:169:   s3 = floor((dd8 - dd7) / dd9);
	vcvttsd2sil	%xmm0, %edi	# _9, s3
# problem4-v0.c:170:   s4 = floor((dd11 - dd10) / dd12);
	vsubsd	1256(%rsp), %xmm7, %xmm0	# %sfp, dd11, _10
# problem4-v0.c:171:   s5 = floor((dd14 - dd13) / dd15);
	vmovq	%r13, %xmm7	# dd14, dd14
# problem4-v0.c:176:   s10 = floor((dd29 - dd28) / dd30);
	movl	%ecx, %r13d	# s1, s1
# problem4-v0.c:152:   e10 = kk * ey10;
	vmovsd	%xmm4, 1336(%rsp)	# e10, %sfp
# problem4-v0.c:176:   s10 = floor((dd29 - dd28) / dd30);
	vmovapd	%xmm6, %xmm4	# dd7, dd7
# problem4-v0.c:170:   s4 = floor((dd11 - dd10) / dd12);
	vdivsd	1264(%rsp), %xmm0, %xmm0	# %sfp, _10, _11
	vroundsd	$9, %xmm0, %xmm0, %xmm0	#, _11, _12
# problem4-v0.c:170:   s4 = floor((dd11 - dd10) / dd12);
	vcvttsd2sil	%xmm0, %r15d	# _12, s4
# problem4-v0.c:171:   s5 = floor((dd14 - dd13) / dd15);
	vsubsd	1272(%rsp), %xmm7, %xmm0	# %sfp, dd14, _13
# problem4-v0.c:176:   s10 = floor((dd29 - dd28) / dd30);
	vmovq	%rbp, %xmm7	# dd29, dd29
# problem4-v0.c:171:   s5 = floor((dd14 - dd13) / dd15);
	vdivsd	1280(%rsp), %xmm0, %xmm0	# %sfp, _13, _14
	vroundsd	$9, %xmm0, %xmm0, %xmm0	#, _14, _15
# problem4-v0.c:171:   s5 = floor((dd14 - dd13) / dd15);
	vcvttsd2sil	%xmm0, %r14d	# _15, s5
# problem4-v0.c:172:   s6 = floor((dd17 - dd16) / dd18);
	vsubsd	1288(%rsp), %xmm8, %xmm0	# %sfp, dd17, _16
# problem4-v0.c:172:   s6 = floor((dd17 - dd16) / dd18);
	vdivsd	1296(%rsp), %xmm0, %xmm0	# %sfp, _16, _17
	vroundsd	$9, %xmm0, %xmm0, %xmm0	#, _17, _18
# problem4-v0.c:172:   s6 = floor((dd17 - dd16) / dd18);
	vcvttsd2sil	%xmm0, %esi	# _18, s6
# problem4-v0.c:173:   s7 = floor((dd20 - dd19) / dd21);
	vsubsd	1304(%rsp), %xmm9, %xmm0	# %sfp, dd20, _19
# problem4-v0.c:176:   s10 = floor((dd29 - dd28) / dd30);
	movl	%r14d, %r11d	# s5, s5
	movl	%r15d, %r14d	# s4, s4
	movl	%r11d, %r15d	# s5, s5
# problem4-v0.c:173:   s7 = floor((dd20 - dd19) / dd21);
	vdivsd	1312(%rsp), %xmm0, %xmm0	# %sfp, _19, _20
	vroundsd	$9, %xmm0, %xmm0, %xmm0	#, _20, _21
# problem4-v0.c:173:   s7 = floor((dd20 - dd19) / dd21);
	vcvttsd2sil	%xmm0, %r8d	# _21, s7
# problem4-v0.c:174:   s8 = floor((dd23 - dd22) / dd24);
	vsubsd	456(%rsp), %xmm10, %xmm0	# %sfp, dd23, _22
# problem4-v0.c:174:   s8 = floor((dd23 - dd22) / dd24);
	vdivsd	464(%rsp), %xmm0, %xmm0	# %sfp, _22, _23
	vroundsd	$9, %xmm0, %xmm0, %xmm0	#, _23, _24
# problem4-v0.c:174:   s8 = floor((dd23 - dd22) / dd24);
	vcvttsd2sil	%xmm0, %r9d	# _24, s8
# problem4-v0.c:175:   s9 = floor((dd26 - dd25) / dd27);
	vsubsd	152(%rsp), %xmm11, %xmm0	# %sfp, dd26, _25
# problem4-v0.c:175:   s9 = floor((dd26 - dd25) / dd27);
	vdivsd	160(%rsp), %xmm0, %xmm0	# %sfp, _25, _26
	vroundsd	$9, %xmm0, %xmm0, %xmm0	#, _26, _27
# problem4-v0.c:175:   s9 = floor((dd26 - dd25) / dd27);
	vcvttsd2sil	%xmm0, %r12d	# _27, s9
# problem4-v0.c:176:   s10 = floor((dd29 - dd28) / dd30);
	vsubsd	8(%rsp), %xmm7, %xmm0	# %sfp, dd29, _28
# problem4-v0.c:176:   s10 = floor((dd29 - dd28) / dd30);
	vdivsd	16(%rsp), %xmm0, %xmm0	# %sfp, _28, _29
	vroundsd	$9, %xmm0, %xmm0, %xmm0	#, _29, _30
# problem4-v0.c:176:   s10 = floor((dd29 - dd28) / dd30);
	vcvttsd2sil	%xmm0, %ebp	# _30, s10
	movq	$0, 1176(%rsp)	#, %sfp
	movl	%r9d, 388(%rsp)	# s8, %sfp
	movl	%r12d, %edx	# s9, s9
	movl	%r8d, %r12d	# s7, s7
	movl	%edx, %r8d	# s9, s9
.L67:
# problem4-v0.c:185:       for (int r3 = 0; r3 < s3; ++r3) {
	testl	%edi, %edi	# s3
	jle	.L69	#,
# problem4-v0.c:180:     x1 = dd1 + r1 * dd3;
	vcvtsi2sdl	%ebx, %xmm15, %xmm0	# r1, tmp962, tmp963
	vmulsd	%xmm2, %xmm0, %xmm0	# dd3, _31, _32
# problem4-v0.c:180:     x1 = dd1 + r1 * dd3;
	movl	%r14d, %r10d	# s4, s4
	movl	%r15d, %r11d	# s5, s5
	movl	%esi, %r14d	# s6, s6
	movl	%r12d, %r15d	# s7, s7
	movl	%r13d, %esi	# s1, s1
	movl	%ebx, %r12d	# r1, r1
	xorl	%r13d, %r13d	# r2
	vmovq	%xmm2, %r9	# dd3, dd3
	vaddsd	1320(%rsp), %xmm0, %xmm6	# %sfp, _32, x1
	vmovsd	%xmm6, 304(%rsp)	# x1, %sfp
.L66:
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	testl	%r10d, %r10d	# s4
	jle	.L70	#,
.L140:
# problem4-v0.c:183:       x2 = dd4 + r2 * dd6;
	vcvtsi2sdl	%r13d, %xmm15, %xmm0	# r2, tmp962, tmp964
	vmulsd	%xmm1, %xmm0, %xmm0	# dd6, _33, _34
# problem4-v0.c:183:       x2 = dd4 + r2 * dd6;
	movl	%r14d, 72(%rsp)	# s6, %sfp
	movl	%r10d, %r14d	# s4, s4
	movl	%r11d, %r10d	# s5, s5
	movl	%r12d, %ecx	# r1, r1
	xorl	%ebx, %ebx	# r3
	movl	%esi, %r12d	# s1, s1
	movl	%r13d, %esi	# r2, r2
	movl	%edi, %r13d	# s3, s3
	movl	%eax, %edi	# s2, s2
	movl	72(%rsp), %r11d	# %sfp, s6
	vaddsd	%xmm3, %xmm0, %xmm6	# dd4, _34, x2
	vmovsd	%xmm6, 312(%rsp)	# x2, %sfp
.L61:
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	testl	%r10d, %r10d	# s5
	jle	.L71	#,
# problem4-v0.c:186:         x3 = dd7 + r3 * dd9;
	vcvtsi2sdl	%ebx, %xmm15, %xmm0	# r3, tmp962, tmp965
	vmulsd	1248(%rsp), %xmm0, %xmm0	# %sfp, _35, _36
# problem4-v0.c:186:         x3 = dd7 + r3 * dd9;
	movl	%r14d, 1160(%rsp)	# s4, %sfp
	movl	%ebx, %eax	# r3, r3
	movl	%r10d, 1132(%rsp)	# s5, %sfp
	movl	%edi, %r10d	# s2, s2
	movl	%r12d, %edi	# s1, s1
	movl	%ebp, %r12d	# s10, s10
	movl	%r8d, %ebp	# s9, s9
	movl	%ecx, %r8d	# r1, r1
	movl	%r15d, %ecx	# s7, s7
	movl	%r13d, %r15d	# s3, s3
	movq	1328(%rsp), %r13	# %sfp, fptr
	movl	%r11d, %edx	# s6, s6
	vmovq	%r9, %xmm2	# dd3, dd3
	xorl	%ebx, %ebx	# r4
	movl	%esi, %r9d	# r2, r2
	movl	%eax, %r11d	# r3, r3
	vaddsd	%xmm4, %xmm0, %xmm6	# dd7, _36, x3
	vmovsd	%xmm6, 320(%rsp)	# x3, %sfp
.L56:
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	testl	%edx, %edx	# s6
	jle	.L72	#,
# problem4-v0.c:189:           x4 = dd10 + r4 * dd12;
	vcvtsi2sdl	%ebx, %xmm15, %xmm0	# r4, tmp962, tmp966
	vmulsd	1264(%rsp), %xmm0, %xmm0	# %sfp, _37, _38
# problem4-v0.c:189:           x4 = dd10 + r4 * dd12;
	movl	%r12d, 72(%rsp)	# s10, %sfp
	movl	%ebp, %r12d	# s9, s9
	movl	%r15d, %esi	# s3, s3
	movl	%r11d, %r14d	# r3, r3
	movl	%r8d, %r15d	# r1, r1
	movl	%edx, %r11d	# s6, s6
	movl	%ebx, %r8d	# r4, r4
	movq	%r13, %rbx	# fptr, fptr
	xorl	%r13d, %r13d	# r5
	movl	72(%rsp), %ebp	# %sfp, s10
	vaddsd	1256(%rsp), %xmm0, %xmm6	# %sfp, _38, x4
	vmovsd	%xmm6, 328(%rsp)	# x4, %sfp
.L51:
# problem4-v0.c:197:               for (int r7 = 0; r7 < s7; ++r7) {
	testl	%ecx, %ecx	# s7
	jle	.L73	#,
# problem4-v0.c:192:             x5 = dd13 + r5 * dd15;
	vcvtsi2sdl	%r13d, %xmm15, %xmm0	# r5, tmp962, tmp967
	vmulsd	1280(%rsp), %xmm0, %xmm0	# %sfp, _39, _40
# problem4-v0.c:192:             x5 = dd13 + r5 * dd15;
	movl	%r15d, 1216(%rsp)	# r1, %sfp
	movl	%r8d, %edx	# r4, r4
	movl	%esi, 1204(%rsp)	# s3, %sfp
	movl	%r11d, %eax	# s6, s6
	movl	%r9d, %esi	# r2, r2
	movl	%ecx, %r8d	# s7, s7
	movl	%r13d, %r9d	# r5, r5
	vmovsd	%xmm13, 392(%rsp)	# e3, %sfp
	xorl	%r13d, %r13d	# r6
	movl	%r14d, %r11d	# r3, r3
	vmovsd	%xmm2, 400(%rsp)	# dd3, %sfp
	vmovsd	%xmm3, 408(%rsp)	# dd4, %sfp
	vaddsd	1272(%rsp), %xmm0, %xmm6	# %sfp, _40, x5
	vmovsd	%xmm1, 1208(%rsp)	# dd6, %sfp
	vmovsd	%xmm6, 336(%rsp)	# x5, %sfp
.L13:
# problem4-v0.c:254:                         fprintf(fptr, "%lf\n", x10);
	movl	%eax, 1200(%rsp)	# s6, %sfp
	movl	%r11d, %r14d	# r3, r3
	movl	%esi, %eax	# r2, r2
	movl	%r12d, %r11d	# s9, s9
	movl	%r10d, %esi	# s2, s2
	movl	%edx, %r12d	# r4, r4
.L46:
# problem4-v0.c:200:                 for (int r8 = 0; r8 < s8; ++r8) {
	movl	388(%rsp), %edx	# %sfp,
	testl	%edx, %edx	#
	jle	.L74	#,
# problem4-v0.c:195:               x6 = dd16 + r6 * dd18;
	vcvtsi2sdl	%r13d, %xmm15, %xmm0	# r6, tmp962, tmp968
	vmulsd	1296(%rsp), %xmm0, %xmm0	# %sfp, _41, _42
# problem4-v0.c:245:                         fprintf(fptr, "%lf\t", x1);
	movl	%edi, 1220(%rsp)	# s1, %sfp
	movl	%r11d, %r10d	# s9, s9
	movl	%esi, 1224(%rsp)	# s2, %sfp
	vmovsd	1344(%rsp), %xmm12	# %sfp, c310
	movl	%ebp, %r11d	# s10, s10
	movl	%r8d, 1164(%rsp)	# s7, %sfp
	movl	%r13d, 1228(%rsp)	# r6, %sfp
	movl	$0, 1128(%rsp)	#, %sfp
# problem4-v0.c:195:               x6 = dd16 + r6 * dd18;
	vaddsd	1288(%rsp), %xmm0, %xmm6	# %sfp, _42, x6
# problem4-v0.c:245:                         fprintf(fptr, "%lf\t", x1);
	movl	%r9d, 1232(%rsp)	# r5, %sfp
	movl	%r12d, 1236(%rsp)	# r4, %sfp
	movl	%r14d, 1240(%rsp)	# r3, %sfp
	movl	%eax, 1244(%rsp)	# r2, %sfp
	movq	%rbx, 448(%rsp)	# fptr, %sfp
# problem4-v0.c:195:               x6 = dd16 + r6 * dd18;
	vmovsd	%xmm6, 368(%rsp)	# x6, %sfp
# problem4-v0.c:245:                         fprintf(fptr, "%lf\t", x1);
	vmovsd	%xmm4, 416(%rsp)	# dd7, %sfp
.L41:
# problem4-v0.c:203:                   for (int r9 = 0; r9 < s9; ++r9) {
	testl	%r10d, %r10d	# s9
	jle	.L75	#,
# problem4-v0.c:198:                 x7 = dd19 + r7 * dd21;
	vcvtsi2sdl	1128(%rsp), %xmm15, %xmm0	# %sfp, tmp962, tmp969
	vmulsd	1312(%rsp), %xmm0, %xmm0	# %sfp, _43, _44
# problem4-v0.c:198:                 x7 = dd19 + r7 * dd21;
	movl	%r11d, %ebp	# s10, s10
	xorl	%ebx, %ebx	# r8
	vaddsd	1304(%rsp), %xmm0, %xmm7	# %sfp, _44, x7
	vmovsd	%xmm7, 376(%rsp)	# x7, %sfp
	.p2align 4,,10
	.p2align 3
.L36:
# problem4-v0.c:206:                     for (int r10 = 0; r10 < s10; ++r10) {
	testl	%ebp, %ebp	# s10
	jle	.L76	#,
# problem4-v0.c:201:                   x8 = dd22 + r8 * dd24;
	vcvtsi2sdl	%ebx, %xmm15, %xmm0	# r8, tmp962, tmp970
	vmulsd	464(%rsp), %xmm0, %xmm0	# %sfp, _45, _46
	vmovsd	368(%rsp), %xmm9	# %sfp, x6
# problem4-v0.c:238:                                  c106 * x6 + c107 * x7 + c108 * x8 + c109 * x9 + c1010 * x10 - d10);
	movl	%ebx, %r14d	# r8, r8
	vmovsd	304(%rsp), %xmm2	# %sfp, x1
	vmovsd	376(%rsp), %xmm13	# %sfp, x7
	xorl	%r9d, %r9d	# r9
	vmulsd	520(%rsp), %xmm9, %xmm7	# %sfp, x6, _60
	vmovsd	312(%rsp), %xmm10	# %sfp, x2
	vmulsd	480(%rsp), %xmm2, %xmm8	# %sfp, x1, _51
	vmovsd	328(%rsp), %xmm14	# %sfp, x4
	vmulsd	544(%rsp), %xmm2, %xmm9	# %sfp, x1, _71
	vmovsd	320(%rsp), %xmm11	# %sfp, x3
# problem4-v0.c:201:                   x8 = dd22 + r8 * dd24;
	vaddsd	456(%rsp), %xmm0, %xmm4	# %sfp, _46, x8
	vmulsd	488(%rsp), %xmm10, %xmm6	# %sfp, x2, _52
	vmovsd	336(%rsp), %xmm0	# %sfp, x5
	vmulsd	496(%rsp), %xmm11, %xmm5	# %sfp, x3, _54
	vmovsd	%xmm7, 88(%rsp)	# _60, %sfp
	vmulsd	528(%rsp), %xmm13, %xmm7	# %sfp, x7, _62
	vmovsd	%xmm4, 472(%rsp)	# x8, %sfp
	vmulsd	536(%rsp), %xmm4, %xmm13	# %sfp, x8, _64
	vmovapd	%xmm4, %xmm2	# x8, x8
	vmulsd	600(%rsp), %xmm4, %xmm4	# %sfp, x8, _84
	vmulsd	504(%rsp), %xmm14, %xmm3	# %sfp, x4, _56
# problem4-v0.c:211:                       q1 = fabs(c11 * x1 + c12 * x2 + c13 * x3 + c14 * x4 + c15 * x5 + c16 * x6 +
	vaddsd	%xmm6, %xmm8, %xmm6	# _52, _51, _53
	vmulsd	512(%rsp), %xmm0, %xmm1	# %sfp, x5, _58
	vmulsd	552(%rsp), %xmm10, %xmm10	# %sfp, x2, _72
	vmulsd	560(%rsp), %xmm11, %xmm11	# %sfp, x3, _74
	vmovsd	%xmm13, 72(%rsp)	# _64, %sfp
# problem4-v0.c:211:                       q1 = fabs(c11 * x1 + c12 * x2 + c13 * x3 + c14 * x4 + c15 * x5 + c16 * x6 +
	vaddsd	%xmm5, %xmm6, %xmm5	# _54, _53, _55
	vmovsd	%xmm4, 80(%rsp)	# _84, %sfp
	vmulsd	664(%rsp), %xmm2, %xmm4	# %sfp, x8, _104
	vmulsd	568(%rsp), %xmm14, %xmm13	# %sfp, x4, _76
	vmulsd	576(%rsp), %xmm0, %xmm14	# %sfp, x5, _78
# problem4-v0.c:211:                       q1 = fabs(c11 * x1 + c12 * x2 + c13 * x3 + c14 * x4 + c15 * x5 + c16 * x6 +
	vaddsd	%xmm3, %xmm5, %xmm3	# _56, _55, _57
# problem4-v0.c:214:                       q2 = fabs(c21 * x1 + c22 * x2 + c23 * x3 + c24 * x4 + c25 * x5 + c26 * x6 +
	vaddsd	%xmm10, %xmm9, %xmm10	# _72, _71, _73
	vmovq	%xmm4, %rdi	# _104, _104
# problem4-v0.c:211:                       q1 = fabs(c11 * x1 + c12 * x2 + c13 * x3 + c14 * x4 + c15 * x5 + c16 * x6 +
	vaddsd	%xmm1, %xmm3, %xmm1	# _58, _57, _59
	vmulsd	736(%rsp), %xmm2, %xmm4	# %sfp, x8, _124
# problem4-v0.c:214:                       q2 = fabs(c21 * x1 + c22 * x2 + c23 * x3 + c24 * x4 + c25 * x5 + c26 * x6 +
	vaddsd	%xmm11, %xmm10, %xmm11	# _74, _73, _75
# problem4-v0.c:214:                       q2 = fabs(c21 * x1 + c22 * x2 + c23 * x3 + c24 * x4 + c25 * x5 + c26 * x6 +
	vaddsd	%xmm13, %xmm11, %xmm13	# _76, _75, _77
	vmovq	%xmm4, %rdx	# _124, _124
	vmulsd	800(%rsp), %xmm2, %xmm4	# %sfp, x8, _144
# problem4-v0.c:214:                       q2 = fabs(c21 * x1 + c22 * x2 + c23 * x3 + c24 * x4 + c25 * x5 + c26 * x6 +
	vaddsd	%xmm14, %xmm13, %xmm13	# _78, _77, _79
	vmovsd	%xmm4, 104(%rsp)	# _144, %sfp
	vmulsd	864(%rsp), %xmm2, %xmm4	# %sfp, x8, _164
	vmulsd	928(%rsp), %xmm2, %xmm0	# %sfp, x8, _184
# problem4-v0.c:214:                       q2 = fabs(c21 * x1 + c22 * x2 + c23 * x3 + c24 * x4 + c25 * x5 + c26 * x6 +
	vmovsd	368(%rsp), %xmm9	# %sfp, x6
# problem4-v0.c:214:                       q2 = fabs(c21 * x1 + c22 * x2 + c23 * x3 + c24 * x4 + c25 * x5 + c26 * x6 +
	vmovsd	376(%rsp), %xmm8	# %sfp, x7
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vmovsd	304(%rsp), %xmm6	# %sfp, x1
# problem4-v0.c:214:                       q2 = fabs(c21 * x1 + c22 * x2 + c23 * x3 + c24 * x4 + c25 * x5 + c26 * x6 +
	vmulsd	584(%rsp), %xmm9, %xmm14	# %sfp, x6, _80
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vmovsd	328(%rsp), %xmm5	# %sfp, x4
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vmovsd	336(%rsp), %xmm3	# %sfp, x5
	vmovsd	%xmm0, 120(%rsp)	# _184, %sfp
	vmulsd	992(%rsp), %xmm2, %xmm0	# %sfp, x8, _204
# problem4-v0.c:214:                       q2 = fabs(c21 * x1 + c22 * x2 + c23 * x3 + c24 * x4 + c25 * x5 + c26 * x6 +
	vaddsd	%xmm14, %xmm13, %xmm14	# _80, _79, _81
	vmovsd	%xmm0, 128(%rsp)	# _204, %sfp
	vmulsd	1056(%rsp), %xmm2, %xmm0	# %sfp, x8, _224
	vmulsd	1120(%rsp), %xmm2, %xmm2	# %sfp, x8, _244
	vmovq	%xmm0, %rsi	# _224, _224
# problem4-v0.c:211:                       q1 = fabs(c11 * x1 + c12 * x2 + c13 * x3 + c14 * x4 + c15 * x5 + c16 * x6 +
	vaddsd	88(%rsp), %xmm1, %xmm0	# %sfp, _59, _61
	vmovq	%xmm2, %rax	# _244, _244
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vmovsd	320(%rsp), %xmm2	# %sfp, x3
# problem4-v0.c:211:                       q1 = fabs(c11 * x1 + c12 * x2 + c13 * x3 + c14 * x4 + c15 * x5 + c16 * x6 +
	vaddsd	%xmm7, %xmm0, %xmm0	# _62, _61, _63
# problem4-v0.c:212:                                 c17 * x7 + c18 * x8 + c19 * x9 + c110 * x10 - d1);
	vaddsd	72(%rsp), %xmm0, %xmm7	# %sfp, _63, _65
# problem4-v0.c:214:                       q2 = fabs(c21 * x1 + c22 * x2 + c23 * x3 + c24 * x4 + c25 * x5 + c26 * x6 +
	vmulsd	592(%rsp), %xmm8, %xmm0	# %sfp, x7, _82
# problem4-v0.c:212:                                 c17 * x7 + c18 * x8 + c19 * x9 + c110 * x10 - d1);
	vmovsd	%xmm7, 72(%rsp)	# _65, %sfp
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vmovsd	312(%rsp), %xmm7	# %sfp, x2
# problem4-v0.c:214:                       q2 = fabs(c21 * x1 + c22 * x2 + c23 * x3 + c24 * x4 + c25 * x5 + c26 * x6 +
	vaddsd	%xmm0, %xmm14, %xmm14	# _82, _81, _83
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vmulsd	616(%rsp), %xmm7, %xmm1	# %sfp, x2, _92
	vmulsd	608(%rsp), %xmm6, %xmm0	# %sfp, x1, _91
# problem4-v0.c:215:                                 c27 * x7 + c28 * x8 + c29 * x9 + c210 * x10 - d2);
	vaddsd	80(%rsp), %xmm14, %xmm13	# %sfp, _83, _85
# problem4-v0.c:218:                                 c37 * x7 + c38 * x8 + c39 * x9 + c310 * x10 - d3);
	vmovq	%rdi, %xmm14	# _104, _104
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vaddsd	%xmm1, %xmm0, %xmm1	# _92, _91, _93
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vmulsd	624(%rsp), %xmm2, %xmm0	# %sfp, x3, _94
# problem4-v0.c:215:                                 c27 * x7 + c28 * x8 + c29 * x9 + c210 * x10 - d2);
	vmovsd	%xmm13, 80(%rsp)	# _85, %sfp
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vmulsd	648(%rsp), %xmm9, %xmm13	# %sfp, x6, _100
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vaddsd	%xmm0, %xmm1, %xmm0	# _94, _93, _95
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vmulsd	632(%rsp), %xmm5, %xmm1	# %sfp, x4, _96
	vaddsd	%xmm1, %xmm0, %xmm1	# _96, _95, _97
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vmulsd	640(%rsp), %xmm3, %xmm0	# %sfp, x5, _98
	vaddsd	%xmm0, %xmm1, %xmm0	# _98, _97, _99
# problem4-v0.c:220:                       q4 = fabs(c41 * x1 + c42 * x2 + c43 * x3 + c44 * x4 + c45 * x5 + c46 * x6 +
	vmulsd	688(%rsp), %xmm7, %xmm1	# %sfp, x2, _112
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vaddsd	%xmm13, %xmm0, %xmm13	# _100, _99, _101
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vmulsd	656(%rsp), %xmm8, %xmm0	# %sfp, x7, _102
	vaddsd	%xmm0, %xmm13, %xmm13	# _102, _101, _103
# problem4-v0.c:220:                       q4 = fabs(c41 * x1 + c42 * x2 + c43 * x3 + c44 * x4 + c45 * x5 + c46 * x6 +
	vmulsd	680(%rsp), %xmm6, %xmm0	# %sfp, x1, _111
# problem4-v0.c:218:                                 c37 * x7 + c38 * x8 + c39 * x9 + c310 * x10 - d3);
	vaddsd	%xmm14, %xmm13, %xmm11	# _104, _103, _105
# problem4-v0.c:221:                                 c47 * x7 + c48 * x8 + c49 * x9 + c410 * x10 - d4);
	vmovq	%rdx, %xmm14	# _124, _124
# problem4-v0.c:220:                       q4 = fabs(c41 * x1 + c42 * x2 + c43 * x3 + c44 * x4 + c45 * x5 + c46 * x6 +
	vaddsd	%xmm1, %xmm0, %xmm1	# _112, _111, _113
# problem4-v0.c:220:                       q4 = fabs(c41 * x1 + c42 * x2 + c43 * x3 + c44 * x4 + c45 * x5 + c46 * x6 +
	vmulsd	696(%rsp), %xmm2, %xmm0	# %sfp, x3, _114
# problem4-v0.c:218:                                 c37 * x7 + c38 * x8 + c39 * x9 + c310 * x10 - d3);
	vmovsd	%xmm11, 88(%rsp)	# _105, %sfp
# problem4-v0.c:220:                       q4 = fabs(c41 * x1 + c42 * x2 + c43 * x3 + c44 * x4 + c45 * x5 + c46 * x6 +
	vaddsd	%xmm0, %xmm1, %xmm0	# _114, _113, _115
# problem4-v0.c:220:                       q4 = fabs(c41 * x1 + c42 * x2 + c43 * x3 + c44 * x4 + c45 * x5 + c46 * x6 +
	vmulsd	704(%rsp), %xmm5, %xmm1	# %sfp, x4, _116
	vaddsd	%xmm1, %xmm0, %xmm1	# _116, _115, _117
# problem4-v0.c:220:                       q4 = fabs(c41 * x1 + c42 * x2 + c43 * x3 + c44 * x4 + c45 * x5 + c46 * x6 +
	vmulsd	712(%rsp), %xmm3, %xmm0	# %sfp, x5, _118
# problem4-v0.c:220:                       q4 = fabs(c41 * x1 + c42 * x2 + c43 * x3 + c44 * x4 + c45 * x5 + c46 * x6 +
	vmulsd	720(%rsp), %xmm9, %xmm11	# %sfp, x6, _120
# problem4-v0.c:222:                       q5 = fabs(c51 * x1 + c52 * x2 + c53 * x3 + c54 * x4 + c55 * x5 + c56 * x6 +
	vmulsd	784(%rsp), %xmm9, %xmm10	# %sfp, x6, _140
# problem4-v0.c:220:                       q4 = fabs(c41 * x1 + c42 * x2 + c43 * x3 + c44 * x4 + c45 * x5 + c46 * x6 +
	vaddsd	%xmm0, %xmm1, %xmm0	# _118, _117, _119
# problem4-v0.c:222:                       q5 = fabs(c51 * x1 + c52 * x2 + c53 * x3 + c54 * x4 + c55 * x5 + c56 * x6 +
	vmulsd	752(%rsp), %xmm7, %xmm1	# %sfp, x2, _132
# problem4-v0.c:220:                       q4 = fabs(c41 * x1 + c42 * x2 + c43 * x3 + c44 * x4 + c45 * x5 + c46 * x6 +
	vaddsd	%xmm11, %xmm0, %xmm11	# _120, _119, _121
# problem4-v0.c:220:                       q4 = fabs(c41 * x1 + c42 * x2 + c43 * x3 + c44 * x4 + c45 * x5 + c46 * x6 +
	vmulsd	728(%rsp), %xmm8, %xmm0	# %sfp, x7, _122
	vaddsd	%xmm0, %xmm11, %xmm11	# _122, _121, _123
# problem4-v0.c:222:                       q5 = fabs(c51 * x1 + c52 * x2 + c53 * x3 + c54 * x4 + c55 * x5 + c56 * x6 +
	vmulsd	744(%rsp), %xmm6, %xmm0	# %sfp, x1, _131
# problem4-v0.c:221:                                 c47 * x7 + c48 * x8 + c49 * x9 + c410 * x10 - d4);
	vaddsd	%xmm14, %xmm11, %xmm11	# _124, _123, _125
# problem4-v0.c:222:                       q5 = fabs(c51 * x1 + c52 * x2 + c53 * x3 + c54 * x4 + c55 * x5 + c56 * x6 +
	vaddsd	%xmm1, %xmm0, %xmm1	# _132, _131, _133
# problem4-v0.c:222:                       q5 = fabs(c51 * x1 + c52 * x2 + c53 * x3 + c54 * x4 + c55 * x5 + c56 * x6 +
	vmulsd	760(%rsp), %xmm2, %xmm0	# %sfp, x3, _134
# problem4-v0.c:221:                                 c47 * x7 + c48 * x8 + c49 * x9 + c410 * x10 - d4);
	vmovsd	%xmm11, 96(%rsp)	# _125, %sfp
# problem4-v0.c:222:                       q5 = fabs(c51 * x1 + c52 * x2 + c53 * x3 + c54 * x4 + c55 * x5 + c56 * x6 +
	vaddsd	%xmm0, %xmm1, %xmm0	# _134, _133, _135
# problem4-v0.c:222:                       q5 = fabs(c51 * x1 + c52 * x2 + c53 * x3 + c54 * x4 + c55 * x5 + c56 * x6 +
	vmulsd	768(%rsp), %xmm5, %xmm1	# %sfp, x4, _136
	vaddsd	%xmm1, %xmm0, %xmm1	# _136, _135, _137
# problem4-v0.c:222:                       q5 = fabs(c51 * x1 + c52 * x2 + c53 * x3 + c54 * x4 + c55 * x5 + c56 * x6 +
	vmulsd	776(%rsp), %xmm3, %xmm0	# %sfp, x5, _138
	vaddsd	%xmm0, %xmm1, %xmm0	# _138, _137, _139
# problem4-v0.c:222:                       q5 = fabs(c51 * x1 + c52 * x2 + c53 * x3 + c54 * x4 + c55 * x5 + c56 * x6 +
	vaddsd	%xmm10, %xmm0, %xmm10	# _140, _139, _141
# problem4-v0.c:222:                       q5 = fabs(c51 * x1 + c52 * x2 + c53 * x3 + c54 * x4 + c55 * x5 + c56 * x6 +
	vmulsd	792(%rsp), %xmm8, %xmm0	# %sfp, x7, _142
	vaddsd	%xmm0, %xmm10, %xmm10	# _142, _141, _143
# problem4-v0.c:225:                       q6 = fabs(c61 * x1 + c62 * x2 + c63 * x3 + c64 * x4 + c65 * x5 + c66 * x6 +
	vmulsd	808(%rsp), %xmm6, %xmm0	# %sfp, x1, _151
# problem4-v0.c:223:                                 c57 * x7 + c58 * x8 + c59 * x9 + c510 * x10 - d5);
	vaddsd	104(%rsp), %xmm10, %xmm1	# %sfp, _143, _145
# problem4-v0.c:225:                       q6 = fabs(c61 * x1 + c62 * x2 + c63 * x3 + c64 * x4 + c65 * x5 + c66 * x6 +
	vmovapd	%xmm8, %xmm10	# x7, x7
# problem4-v0.c:225:                       q6 = fabs(c61 * x1 + c62 * x2 + c63 * x3 + c64 * x4 + c65 * x5 + c66 * x6 +
	vmovapd	%xmm9, %xmm8	# x6, x6
	vmulsd	848(%rsp), %xmm9, %xmm9	# %sfp, x6, _160
# problem4-v0.c:223:                                 c57 * x7 + c58 * x8 + c59 * x9 + c510 * x10 - d5);
	vmovsd	%xmm1, 104(%rsp)	# _145, %sfp
# problem4-v0.c:225:                       q6 = fabs(c61 * x1 + c62 * x2 + c63 * x3 + c64 * x4 + c65 * x5 + c66 * x6 +
	vmulsd	816(%rsp), %xmm7, %xmm1	# %sfp, x2, _152
	vaddsd	%xmm1, %xmm0, %xmm1	# _152, _151, _153
# problem4-v0.c:225:                       q6 = fabs(c61 * x1 + c62 * x2 + c63 * x3 + c64 * x4 + c65 * x5 + c66 * x6 +
	vmulsd	824(%rsp), %xmm2, %xmm0	# %sfp, x3, _154
	vaddsd	%xmm0, %xmm1, %xmm0	# _154, _153, _155
# problem4-v0.c:225:                       q6 = fabs(c61 * x1 + c62 * x2 + c63 * x3 + c64 * x4 + c65 * x5 + c66 * x6 +
	vmulsd	832(%rsp), %xmm5, %xmm1	# %sfp, x4, _156
	vaddsd	%xmm1, %xmm0, %xmm1	# _156, _155, _157
# problem4-v0.c:225:                       q6 = fabs(c61 * x1 + c62 * x2 + c63 * x3 + c64 * x4 + c65 * x5 + c66 * x6 +
	vmulsd	840(%rsp), %xmm3, %xmm0	# %sfp, x5, _158
	vaddsd	%xmm0, %xmm1, %xmm0	# _158, _157, _159
# problem4-v0.c:228:                       q7 = fabs(c71 * x1 + c72 * x2 + c73 * x3 + c74 * x4 + c75 * x5 + c76 * x6 +
	vmulsd	880(%rsp), %xmm7, %xmm1	# %sfp, x2, _172
# problem4-v0.c:225:                       q6 = fabs(c61 * x1 + c62 * x2 + c63 * x3 + c64 * x4 + c65 * x5 + c66 * x6 +
	vaddsd	%xmm9, %xmm0, %xmm9	# _160, _159, _161
# problem4-v0.c:225:                       q6 = fabs(c61 * x1 + c62 * x2 + c63 * x3 + c64 * x4 + c65 * x5 + c66 * x6 +
	vmulsd	856(%rsp), %xmm10, %xmm0	# %sfp, x7, _162
	vaddsd	%xmm0, %xmm9, %xmm9	# _162, _161, _163
# problem4-v0.c:228:                       q7 = fabs(c71 * x1 + c72 * x2 + c73 * x3 + c74 * x4 + c75 * x5 + c76 * x6 +
	vmulsd	872(%rsp), %xmm6, %xmm0	# %sfp, x1, _171
# problem4-v0.c:226:                                 c67 * x7 + c68 * x8 + c69 * x9 + c610 * x10 - d6);
	vaddsd	%xmm4, %xmm9, %xmm4	# _164, _163, _165
# problem4-v0.c:228:                       q7 = fabs(c71 * x1 + c72 * x2 + c73 * x3 + c74 * x4 + c75 * x5 + c76 * x6 +
	vmovapd	%xmm8, %xmm9	# x6, x6
	vmulsd	912(%rsp), %xmm8, %xmm8	# %sfp, x6, _180
# problem4-v0.c:228:                       q7 = fabs(c71 * x1 + c72 * x2 + c73 * x3 + c74 * x4 + c75 * x5 + c76 * x6 +
	vaddsd	%xmm1, %xmm0, %xmm1	# _172, _171, _173
# problem4-v0.c:228:                       q7 = fabs(c71 * x1 + c72 * x2 + c73 * x3 + c74 * x4 + c75 * x5 + c76 * x6 +
	vmulsd	888(%rsp), %xmm2, %xmm0	# %sfp, x3, _174
# problem4-v0.c:226:                                 c67 * x7 + c68 * x8 + c69 * x9 + c610 * x10 - d6);
	vmovsd	%xmm4, 112(%rsp)	# _165, %sfp
# problem4-v0.c:228:                       q7 = fabs(c71 * x1 + c72 * x2 + c73 * x3 + c74 * x4 + c75 * x5 + c76 * x6 +
	vmovapd	%xmm7, %xmm4	# x2, x2
# problem4-v0.c:228:                       q7 = fabs(c71 * x1 + c72 * x2 + c73 * x3 + c74 * x4 + c75 * x5 + c76 * x6 +
	vaddsd	%xmm0, %xmm1, %xmm0	# _174, _173, _175
# problem4-v0.c:228:                       q7 = fabs(c71 * x1 + c72 * x2 + c73 * x3 + c74 * x4 + c75 * x5 + c76 * x6 +
	vmulsd	896(%rsp), %xmm5, %xmm1	# %sfp, x4, _176
	vaddsd	%xmm1, %xmm0, %xmm1	# _176, _175, _177
# problem4-v0.c:228:                       q7 = fabs(c71 * x1 + c72 * x2 + c73 * x3 + c74 * x4 + c75 * x5 + c76 * x6 +
	vmulsd	904(%rsp), %xmm3, %xmm0	# %sfp, x5, _178
	vaddsd	%xmm0, %xmm1, %xmm0	# _178, _177, _179
# problem4-v0.c:231:                       q8 = fabs(c81 * x1 + c82 * x2 + c83 * x3 + c84 * x4 + c85 * x5 + c86 * x6 +
	vmulsd	944(%rsp), %xmm4, %xmm1	# %sfp, x2, _192
# problem4-v0.c:228:                       q7 = fabs(c71 * x1 + c72 * x2 + c73 * x3 + c74 * x4 + c75 * x5 + c76 * x6 +
	vaddsd	%xmm8, %xmm0, %xmm8	# _180, _179, _181
# problem4-v0.c:228:                       q7 = fabs(c71 * x1 + c72 * x2 + c73 * x3 + c74 * x4 + c75 * x5 + c76 * x6 +
	vmulsd	920(%rsp), %xmm10, %xmm0	# %sfp, x7, _182
	vaddsd	%xmm0, %xmm8, %xmm8	# _182, _181, _183
# problem4-v0.c:231:                       q8 = fabs(c81 * x1 + c82 * x2 + c83 * x3 + c84 * x4 + c85 * x5 + c86 * x6 +
	vmulsd	936(%rsp), %xmm6, %xmm0	# %sfp, x1, _191
# problem4-v0.c:229:                                 c77 * x7 + c78 * x8 + c79 * x9 + c710 * x10 - d7);
	vaddsd	120(%rsp), %xmm8, %xmm7	# %sfp, _183, _185
# problem4-v0.c:231:                       q8 = fabs(c81 * x1 + c82 * x2 + c83 * x3 + c84 * x4 + c85 * x5 + c86 * x6 +
	vaddsd	%xmm1, %xmm0, %xmm1	# _192, _191, _193
# problem4-v0.c:229:                                 c77 * x7 + c78 * x8 + c79 * x9 + c710 * x10 - d7);
	vmovsd	%xmm7, 120(%rsp)	# _185, %sfp
# problem4-v0.c:231:                       q8 = fabs(c81 * x1 + c82 * x2 + c83 * x3 + c84 * x4 + c85 * x5 + c86 * x6 +
	vmulsd	952(%rsp), %xmm2, %xmm0	# %sfp, x3, _194
# problem4-v0.c:238:                                  c106 * x6 + c107 * x7 + c108 * x8 + c109 * x9 + c1010 * x10 - d10);
	vmovsd	392(%rsp), %xmm14	# %sfp, e3
# problem4-v0.c:231:                       q8 = fabs(c81 * x1 + c82 * x2 + c83 * x3 + c84 * x4 + c85 * x5 + c86 * x6 +
	vmulsd	976(%rsp), %xmm9, %xmm7	# %sfp, x6, _200
# problem4-v0.c:238:                                  c106 * x6 + c107 * x7 + c108 * x8 + c109 * x9 + c1010 * x10 - d10);
	movq	416(%rsp), %r11	# %sfp, dd7
# problem4-v0.c:231:                       q8 = fabs(c81 * x1 + c82 * x2 + c83 * x3 + c84 * x4 + c85 * x5 + c86 * x6 +
	vaddsd	%xmm0, %xmm1, %xmm0	# _194, _193, _195
# problem4-v0.c:231:                       q8 = fabs(c81 * x1 + c82 * x2 + c83 * x3 + c84 * x4 + c85 * x5 + c86 * x6 +
	vmulsd	960(%rsp), %xmm5, %xmm1	# %sfp, x4, _196
	vaddsd	%xmm1, %xmm0, %xmm1	# _196, _195, _197
# problem4-v0.c:231:                       q8 = fabs(c81 * x1 + c82 * x2 + c83 * x3 + c84 * x4 + c85 * x5 + c86 * x6 +
	vmulsd	968(%rsp), %xmm3, %xmm0	# %sfp, x5, _198
	vaddsd	%xmm0, %xmm1, %xmm0	# _198, _197, _199
# problem4-v0.c:234:                       q9 = fabs(c91 * x1 + c92 * x2 + c93 * x3 + c94 * x4 + c95 * x5 + c96 * x6 +
	vmulsd	1008(%rsp), %xmm4, %xmm1	# %sfp, x2, _212
# problem4-v0.c:231:                       q8 = fabs(c81 * x1 + c82 * x2 + c83 * x3 + c84 * x4 + c85 * x5 + c86 * x6 +
	vaddsd	%xmm7, %xmm0, %xmm7	# _200, _199, _201
# problem4-v0.c:231:                       q8 = fabs(c81 * x1 + c82 * x2 + c83 * x3 + c84 * x4 + c85 * x5 + c86 * x6 +
	vmulsd	984(%rsp), %xmm10, %xmm0	# %sfp, x7, _202
	vaddsd	%xmm0, %xmm7, %xmm7	# _202, _201, _203
# problem4-v0.c:234:                       q9 = fabs(c91 * x1 + c92 * x2 + c93 * x3 + c94 * x4 + c95 * x5 + c96 * x6 +
	vmulsd	1000(%rsp), %xmm6, %xmm0	# %sfp, x1, _211
# problem4-v0.c:232:                                 c87 * x7 + c88 * x8 + c89 * x9 + c810 * x10 - d8);
	vaddsd	128(%rsp), %xmm7, %xmm7	# %sfp, _203, _205
# problem4-v0.c:234:                       q9 = fabs(c91 * x1 + c92 * x2 + c93 * x3 + c94 * x4 + c95 * x5 + c96 * x6 +
	vaddsd	%xmm1, %xmm0, %xmm1	# _212, _211, _213
# problem4-v0.c:234:                       q9 = fabs(c91 * x1 + c92 * x2 + c93 * x3 + c94 * x4 + c95 * x5 + c96 * x6 +
	vmulsd	1016(%rsp), %xmm2, %xmm0	# %sfp, x3, _214
# problem4-v0.c:232:                                 c87 * x7 + c88 * x8 + c89 * x9 + c810 * x10 - d8);
	vmovsd	%xmm7, 128(%rsp)	# _205, %sfp
# problem4-v0.c:234:                       q9 = fabs(c91 * x1 + c92 * x2 + c93 * x3 + c94 * x4 + c95 * x5 + c96 * x6 +
	vmovapd	%xmm6, %xmm7	# x1, x1
# problem4-v0.c:234:                       q9 = fabs(c91 * x1 + c92 * x2 + c93 * x3 + c94 * x4 + c95 * x5 + c96 * x6 +
	vmulsd	1040(%rsp), %xmm9, %xmm6	# %sfp, x6, _220
# problem4-v0.c:234:                       q9 = fabs(c91 * x1 + c92 * x2 + c93 * x3 + c94 * x4 + c95 * x5 + c96 * x6 +
	vaddsd	%xmm0, %xmm1, %xmm0	# _214, _213, _215
# problem4-v0.c:234:                       q9 = fabs(c91 * x1 + c92 * x2 + c93 * x3 + c94 * x4 + c95 * x5 + c96 * x6 +
	vmulsd	1024(%rsp), %xmm5, %xmm1	# %sfp, x4, _216
	vaddsd	%xmm1, %xmm0, %xmm1	# _216, _215, _217
# problem4-v0.c:234:                       q9 = fabs(c91 * x1 + c92 * x2 + c93 * x3 + c94 * x4 + c95 * x5 + c96 * x6 +
	vmulsd	1032(%rsp), %xmm3, %xmm0	# %sfp, x5, _218
	vaddsd	%xmm0, %xmm1, %xmm0	# _218, _217, _219
# problem4-v0.c:235:                                 c97 * x7 + c98 * x8 + c99 * x9 + c910 * x10 - d9);
	vmovq	%rsi, %xmm1	# _224, _224
# problem4-v0.c:234:                       q9 = fabs(c91 * x1 + c92 * x2 + c93 * x3 + c94 * x4 + c95 * x5 + c96 * x6 +
	vaddsd	%xmm6, %xmm0, %xmm6	# _220, _219, _221
# problem4-v0.c:234:                       q9 = fabs(c91 * x1 + c92 * x2 + c93 * x3 + c94 * x4 + c95 * x5 + c96 * x6 +
	vmulsd	1048(%rsp), %xmm10, %xmm0	# %sfp, x7, _222
	vaddsd	%xmm0, %xmm6, %xmm6	# _222, _221, _223
# problem4-v0.c:237:                       q10 = fabs(c101 * x1 + c102 * x2 + c103 * x3 + c104 * x4 + c105 * x5 +
	vmulsd	1064(%rsp), %xmm7, %xmm0	# %sfp, x1, _231
# problem4-v0.c:238:                                  c106 * x6 + c107 * x7 + c108 * x8 + c109 * x9 + c1010 * x10 - d10);
	vmovsd	672(%rsp), %xmm7	# %sfp, d3
# problem4-v0.c:235:                                 c97 * x7 + c98 * x8 + c99 * x9 + c910 * x10 - d9);
	vaddsd	%xmm1, %xmm6, %xmm6	# _224, _223, _225
# problem4-v0.c:237:                       q10 = fabs(c101 * x1 + c102 * x2 + c103 * x3 + c104 * x4 + c105 * x5 +
	vmulsd	1072(%rsp), %xmm4, %xmm1	# %sfp, x2, _232
# problem4-v0.c:235:                                 c97 * x7 + c98 * x8 + c99 * x9 + c910 * x10 - d9);
	vmovsd	%xmm6, 136(%rsp)	# _225, %sfp
# problem4-v0.c:238:                                  c106 * x6 + c107 * x7 + c108 * x8 + c109 * x9 + c1010 * x10 - d10);
	vmovq	%rax, %xmm6	# _244, _244
# problem4-v0.c:237:                       q10 = fabs(c101 * x1 + c102 * x2 + c103 * x3 + c104 * x4 + c105 * x5 +
	vaddsd	%xmm1, %xmm0, %xmm1	# _232, _231, _233
# problem4-v0.c:237:                       q10 = fabs(c101 * x1 + c102 * x2 + c103 * x3 + c104 * x4 + c105 * x5 +
	vmulsd	1080(%rsp), %xmm2, %xmm0	# %sfp, x3, _234
	vaddsd	%xmm0, %xmm1, %xmm0	# _234, _233, _235
# problem4-v0.c:237:                       q10 = fabs(c101 * x1 + c102 * x2 + c103 * x3 + c104 * x4 + c105 * x5 +
	vmulsd	1088(%rsp), %xmm5, %xmm1	# %sfp, x4, _236
# problem4-v0.c:237:                       q10 = fabs(c101 * x1 + c102 * x2 + c103 * x3 + c104 * x4 + c105 * x5 +
	vmulsd	1104(%rsp), %xmm9, %xmm5	# %sfp, x6, _240
# problem4-v0.c:237:                       q10 = fabs(c101 * x1 + c102 * x2 + c103 * x3 + c104 * x4 + c105 * x5 +
	vaddsd	%xmm1, %xmm0, %xmm1	# _236, _235, _237
# problem4-v0.c:237:                       q10 = fabs(c101 * x1 + c102 * x2 + c103 * x3 + c104 * x4 + c105 * x5 +
	vmulsd	1096(%rsp), %xmm3, %xmm0	# %sfp, x5, _238
	vaddsd	%xmm0, %xmm1, %xmm0	# _238, _237, _239
# problem4-v0.c:237:                       q10 = fabs(c101 * x1 + c102 * x2 + c103 * x3 + c104 * x4 + c105 * x5 +
	vaddsd	%xmm5, %xmm0, %xmm5	# _240, _239, _241
# problem4-v0.c:238:                                  c106 * x6 + c107 * x7 + c108 * x8 + c109 * x9 + c1010 * x10 - d10);
	vmulsd	1112(%rsp), %xmm10, %xmm0	# %sfp, x7, _242
	vaddsd	%xmm0, %xmm5, %xmm5	# _242, _241, _243
# problem4-v0.c:238:                                  c106 * x6 + c107 * x7 + c108 * x8 + c109 * x9 + c1010 * x10 - d10);
	vaddsd	%xmm6, %xmm5, %xmm5	# _244, _243, _245
	vmovsd	%xmm5, 144(%rsp)	# _245, %sfp
	.p2align 4,,10
	.p2align 3
.L31:
# problem4-v0.c:204:                     x9 = dd25 + r9 * dd27;
	vcvtsi2sdl	%r9d, %xmm15, %xmm3	# r9, tmp962, tmp971
	vmulsd	160(%rsp), %xmm3, %xmm3	# %sfp, _47, _48
# problem4-v0.c:206:                     for (int r10 = 0; r10 < s10; ++r10) {
	xorl	%ebx, %ebx	# r10
# problem4-v0.c:204:                     x9 = dd25 + r9 * dd27;
	vaddsd	152(%rsp), %xmm3, %xmm3	# %sfp, _48, x9
# problem4-v0.c:238:                                  c106 * x6 + c107 * x7 + c108 * x8 + c109 * x9 + c1010 * x10 - d10);
	vmulsd	240(%rsp), %xmm3, %xmm1	# %sfp, x9, _246
# problem4-v0.c:206:                     for (int r10 = 0; r10 < s10; ++r10) {
	vmovsd	%xmm3, 248(%rsp)	# x9, %sfp
# problem4-v0.c:212:                                 c17 * x7 + c18 * x8 + c19 * x9 + c110 * x10 - d1);
	vmulsd	168(%rsp), %xmm3, %xmm6	# %sfp, x9, _66
# problem4-v0.c:215:                                 c27 * x7 + c28 * x8 + c29 * x9 + c210 * x10 - d2);
	vmulsd	176(%rsp), %xmm3, %xmm8	# %sfp, x9, _86
# problem4-v0.c:218:                                 c37 * x7 + c38 * x8 + c39 * x9 + c310 * x10 - d3);
	vmulsd	184(%rsp), %xmm3, %xmm4	# %sfp, x9, _106
# problem4-v0.c:221:                                 c47 * x7 + c48 * x8 + c49 * x9 + c410 * x10 - d4);
	vmulsd	192(%rsp), %xmm3, %xmm2	# %sfp, x9, _126
# problem4-v0.c:223:                                 c57 * x7 + c58 * x8 + c59 * x9 + c510 * x10 - d5);
	vmulsd	200(%rsp), %xmm3, %xmm13	# %sfp, x9, _146
# problem4-v0.c:238:                                  c106 * x6 + c107 * x7 + c108 * x8 + c109 * x9 + c1010 * x10 - d10);
	vaddsd	144(%rsp), %xmm1, %xmm1	# %sfp, _246, _247
# problem4-v0.c:226:                                 c67 * x7 + c68 * x8 + c69 * x9 + c610 * x10 - d6);
	vmulsd	208(%rsp), %xmm3, %xmm11	# %sfp, x9, _166
# problem4-v0.c:212:                                 c17 * x7 + c18 * x8 + c19 * x9 + c110 * x10 - d1);
	vaddsd	72(%rsp), %xmm6, %xmm6	# %sfp, _66, _67
# problem4-v0.c:229:                                 c77 * x7 + c78 * x8 + c79 * x9 + c710 * x10 - d7);
	vmulsd	216(%rsp), %xmm3, %xmm10	# %sfp, x9, _186
# problem4-v0.c:215:                                 c27 * x7 + c28 * x8 + c29 * x9 + c210 * x10 - d2);
	vaddsd	80(%rsp), %xmm8, %xmm8	# %sfp, _86, _87
# problem4-v0.c:232:                                 c87 * x7 + c88 * x8 + c89 * x9 + c810 * x10 - d8);
	vmulsd	224(%rsp), %xmm3, %xmm9	# %sfp, x9, _206
# problem4-v0.c:218:                                 c37 * x7 + c38 * x8 + c39 * x9 + c310 * x10 - d3);
	vaddsd	88(%rsp), %xmm4, %xmm4	# %sfp, _106, _107
# problem4-v0.c:238:                                  c106 * x6 + c107 * x7 + c108 * x8 + c109 * x9 + c1010 * x10 - d10);
	vmovq	%xmm1, %r15	# _247, _247
# problem4-v0.c:235:                                 c97 * x7 + c98 * x8 + c99 * x9 + c910 * x10 - d9);
	vmulsd	232(%rsp), %xmm3, %xmm5	# %sfp, x9, _226
# problem4-v0.c:221:                                 c47 * x7 + c48 * x8 + c49 * x9 + c410 * x10 - d4);
	vaddsd	96(%rsp), %xmm2, %xmm2	# %sfp, _126, _127
# problem4-v0.c:223:                                 c57 * x7 + c58 * x8 + c59 * x9 + c510 * x10 - d5);
	vaddsd	104(%rsp), %xmm13, %xmm13	# %sfp, _146, _147
# problem4-v0.c:226:                                 c67 * x7 + c68 * x8 + c69 * x9 + c610 * x10 - d6);
	vaddsd	112(%rsp), %xmm11, %xmm11	# %sfp, _166, _167
# problem4-v0.c:229:                                 c77 * x7 + c78 * x8 + c79 * x9 + c710 * x10 - d7);
	vaddsd	120(%rsp), %xmm10, %xmm10	# %sfp, _186, _187
# problem4-v0.c:232:                                 c87 * x7 + c88 * x8 + c89 * x9 + c810 * x10 - d8);
	vaddsd	128(%rsp), %xmm9, %xmm9	# %sfp, _206, _207
# problem4-v0.c:235:                                 c97 * x7 + c98 * x8 + c99 * x9 + c910 * x10 - d9);
	vaddsd	136(%rsp), %xmm5, %xmm5	# %sfp, _226, _227
	.p2align 4,,10
	.p2align 3
.L30:
# problem4-v0.c:207:                       x10 = dd28 + r10 * dd30;
	vcvtsi2sdl	%ebx, %xmm15, %xmm1	# r10, tmp962, tmp972
	vmulsd	16(%rsp), %xmm1, %xmm1	# %sfp, _49, _50
# problem4-v0.c:240:                       if ((q1 <= e1) && (q2 <= e2) && (q3 <= e3) && (q4 <= e4) && (q5 <= e5) &&
	vmovsd	24(%rsp), %xmm3	# %sfp, e1
# problem4-v0.c:207:                       x10 = dd28 + r10 * dd30;
	vaddsd	8(%rsp), %xmm1, %xmm1	# %sfp, _50, x10
# problem4-v0.c:212:                                 c17 * x7 + c18 * x8 + c19 * x9 + c110 * x10 - d1);
	vmulsd	32(%rsp), %xmm1, %xmm0	# %sfp, x10, _68
# problem4-v0.c:212:                                 c17 * x7 + c18 * x8 + c19 * x9 + c110 * x10 - d1);
	vaddsd	%xmm6, %xmm0, %xmm0	# _67, _68, _69
# problem4-v0.c:212:                                 c17 * x7 + c18 * x8 + c19 * x9 + c110 * x10 - d1);
	vsubsd	40(%rsp), %xmm0, %xmm0	# %sfp, _69, _70
# problem4-v0.c:211:                       q1 = fabs(c11 * x1 + c12 * x2 + c13 * x3 + c14 * x4 + c15 * x5 + c16 * x6 +
	vandpd	.LC3(%rip), %xmm0, %xmm0	#, _70, q1_379
# problem4-v0.c:240:                       if ((q1 <= e1) && (q2 <= e2) && (q3 <= e3) && (q4 <= e4) && (q5 <= e5) &&
	vcomisd	%xmm0, %xmm3	# q1_379, e1
	jb	.L19	#,
# problem4-v0.c:215:                                 c27 * x7 + c28 * x8 + c29 * x9 + c210 * x10 - d2);
	vmulsd	264(%rsp), %xmm1, %xmm0	# %sfp, x10, _88
# problem4-v0.c:240:                       if ((q1 <= e1) && (q2 <= e2) && (q3 <= e3) && (q4 <= e4) && (q5 <= e5) &&
	vmovsd	256(%rsp), %xmm3	# %sfp, e2
# problem4-v0.c:215:                                 c27 * x7 + c28 * x8 + c29 * x9 + c210 * x10 - d2);
	vaddsd	%xmm8, %xmm0, %xmm0	# _87, _88, _89
# problem4-v0.c:215:                                 c27 * x7 + c28 * x8 + c29 * x9 + c210 * x10 - d2);
	vsubsd	272(%rsp), %xmm0, %xmm0	# %sfp, _89, _90
# problem4-v0.c:214:                       q2 = fabs(c21 * x1 + c22 * x2 + c23 * x3 + c24 * x4 + c25 * x5 + c26 * x6 +
	vandpd	.LC3(%rip), %xmm0, %xmm0	#, _90, q2_391
# problem4-v0.c:240:                       if ((q1 <= e1) && (q2 <= e2) && (q3 <= e3) && (q4 <= e4) && (q5 <= e5) &&
	vcomisd	%xmm0, %xmm3	# q2_391, e2
	jb	.L19	#,
# problem4-v0.c:218:                                 c37 * x7 + c38 * x8 + c39 * x9 + c310 * x10 - d3);
	vmulsd	%xmm12, %xmm1, %xmm0	# c310, x10, _108
# problem4-v0.c:218:                                 c37 * x7 + c38 * x8 + c39 * x9 + c310 * x10 - d3);
	vaddsd	%xmm4, %xmm0, %xmm0	# _107, _108, _109
# problem4-v0.c:218:                                 c37 * x7 + c38 * x8 + c39 * x9 + c310 * x10 - d3);
	vsubsd	%xmm7, %xmm0, %xmm0	# d3, _109, _110
# problem4-v0.c:217:                       q3 = fabs(c31 * x1 + c32 * x2 + c33 * x3 + c34 * x4 + c35 * x5 + c36 * x6 +
	vandpd	.LC3(%rip), %xmm0, %xmm0	#, _110, q3_403
# problem4-v0.c:240:                       if ((q1 <= e1) && (q2 <= e2) && (q3 <= e3) && (q4 <= e4) && (q5 <= e5) &&
	vcomisd	%xmm0, %xmm14	# q3_403, e3
	jb	.L19	#,
# problem4-v0.c:221:                                 c47 * x7 + c48 * x8 + c49 * x9 + c410 * x10 - d4);
	vmulsd	56(%rsp), %xmm1, %xmm0	# %sfp, x10, _128
# problem4-v0.c:240:                       if ((q1 <= e1) && (q2 <= e2) && (q3 <= e3) && (q4 <= e4) && (q5 <= e5) &&
	vmovsd	48(%rsp), %xmm3	# %sfp, e4
# problem4-v0.c:221:                                 c47 * x7 + c48 * x8 + c49 * x9 + c410 * x10 - d4);
	vaddsd	%xmm2, %xmm0, %xmm0	# _127, _128, _129
# problem4-v0.c:221:                                 c47 * x7 + c48 * x8 + c49 * x9 + c410 * x10 - d4);
	vsubsd	64(%rsp), %xmm0, %xmm0	# %sfp, _129, _130
# problem4-v0.c:220:                       q4 = fabs(c41 * x1 + c42 * x2 + c43 * x3 + c44 * x4 + c45 * x5 + c46 * x6 +
	vandpd	.LC3(%rip), %xmm0, %xmm0	#, _130, q4_415
# problem4-v0.c:240:                       if ((q1 <= e1) && (q2 <= e2) && (q3 <= e3) && (q4 <= e4) && (q5 <= e5) &&
	vcomisd	%xmm0, %xmm3	# q4_415, e4
	jb	.L19	#,
# problem4-v0.c:223:                                 c57 * x7 + c58 * x8 + c59 * x9 + c510 * x10 - d5);
	vmulsd	288(%rsp), %xmm1, %xmm0	# %sfp, x10, _148
# problem4-v0.c:240:                       if ((q1 <= e1) && (q2 <= e2) && (q3 <= e3) && (q4 <= e4) && (q5 <= e5) &&
	vmovsd	280(%rsp), %xmm3	# %sfp, e5
# problem4-v0.c:223:                                 c57 * x7 + c58 * x8 + c59 * x9 + c510 * x10 - d5);
	vaddsd	%xmm13, %xmm0, %xmm0	# _147, _148, _149
# problem4-v0.c:223:                                 c57 * x7 + c58 * x8 + c59 * x9 + c510 * x10 - d5);
	vsubsd	296(%rsp), %xmm0, %xmm0	# %sfp, _149, _150
# problem4-v0.c:222:                       q5 = fabs(c51 * x1 + c52 * x2 + c53 * x3 + c54 * x4 + c55 * x5 + c56 * x6 +
	vandpd	.LC3(%rip), %xmm0, %xmm0	#, _150, q5_427
# problem4-v0.c:240:                       if ((q1 <= e1) && (q2 <= e2) && (q3 <= e3) && (q4 <= e4) && (q5 <= e5) &&
	vcomisd	%xmm0, %xmm3	# q5_427, e5
	jb	.L19	#,
# problem4-v0.c:226:                                 c67 * x7 + c68 * x8 + c69 * x9 + c610 * x10 - d6);
	vmulsd	352(%rsp), %xmm1, %xmm0	# %sfp, x10, _168
# problem4-v0.c:240:                       if ((q1 <= e1) && (q2 <= e2) && (q3 <= e3) && (q4 <= e4) && (q5 <= e5) &&
	vmovsd	344(%rsp), %xmm3	# %sfp, e6
# problem4-v0.c:226:                                 c67 * x7 + c68 * x8 + c69 * x9 + c610 * x10 - d6);
	vaddsd	%xmm11, %xmm0, %xmm0	# _167, _168, _169
# problem4-v0.c:226:                                 c67 * x7 + c68 * x8 + c69 * x9 + c610 * x10 - d6);
	vsubsd	360(%rsp), %xmm0, %xmm0	# %sfp, _169, _170
# problem4-v0.c:225:                       q6 = fabs(c61 * x1 + c62 * x2 + c63 * x3 + c64 * x4 + c65 * x5 + c66 * x6 +
	vandpd	.LC3(%rip), %xmm0, %xmm0	#, _170, q6_439
# problem4-v0.c:240:                       if ((q1 <= e1) && (q2 <= e2) && (q3 <= e3) && (q4 <= e4) && (q5 <= e5) &&
	vcomisd	%xmm0, %xmm3	# q6_439, e6
	jb	.L19	#,
# problem4-v0.c:229:                                 c77 * x7 + c78 * x8 + c79 * x9 + c710 * x10 - d7);
	vmulsd	432(%rsp), %xmm1, %xmm0	# %sfp, x10, _188
# problem4-v0.c:241:                           (q6 <= e6) && (q7 <= e7) && (q8 <= e8) && (q9 <= e9) && (q10 <= e10)) {
	vmovsd	424(%rsp), %xmm3	# %sfp, e7
# problem4-v0.c:229:                                 c77 * x7 + c78 * x8 + c79 * x9 + c710 * x10 - d7);
	vaddsd	%xmm10, %xmm0, %xmm0	# _187, _188, _189
# problem4-v0.c:229:                                 c77 * x7 + c78 * x8 + c79 * x9 + c710 * x10 - d7);
	vsubsd	440(%rsp), %xmm0, %xmm0	# %sfp, _189, _190
# problem4-v0.c:228:                       q7 = fabs(c71 * x1 + c72 * x2 + c73 * x3 + c74 * x4 + c75 * x5 + c76 * x6 +
	vandpd	.LC3(%rip), %xmm0, %xmm0	#, _190, q7_451
# problem4-v0.c:241:                           (q6 <= e6) && (q7 <= e7) && (q8 <= e8) && (q9 <= e9) && (q10 <= e10)) {
	vcomisd	%xmm0, %xmm3	# q7_451, e7
	jb	.L19	#,
# problem4-v0.c:232:                                 c87 * x7 + c88 * x8 + c89 * x9 + c810 * x10 - d8);
	vmulsd	1144(%rsp), %xmm1, %xmm0	# %sfp, x10, _208
# problem4-v0.c:241:                           (q6 <= e6) && (q7 <= e7) && (q8 <= e8) && (q9 <= e9) && (q10 <= e10)) {
	vmovsd	1136(%rsp), %xmm3	# %sfp, e8
# problem4-v0.c:232:                                 c87 * x7 + c88 * x8 + c89 * x9 + c810 * x10 - d8);
	vaddsd	%xmm9, %xmm0, %xmm0	# _207, _208, _209
# problem4-v0.c:232:                                 c87 * x7 + c88 * x8 + c89 * x9 + c810 * x10 - d8);
	vsubsd	1152(%rsp), %xmm0, %xmm0	# %sfp, _209, _210
# problem4-v0.c:231:                       q8 = fabs(c81 * x1 + c82 * x2 + c83 * x3 + c84 * x4 + c85 * x5 + c86 * x6 +
	vandpd	.LC3(%rip), %xmm0, %xmm0	#, _210, q8_463
# problem4-v0.c:241:                           (q6 <= e6) && (q7 <= e7) && (q8 <= e8) && (q9 <= e9) && (q10 <= e10)) {
	vcomisd	%xmm0, %xmm3	# q8_463, e8
	jb	.L19	#,
# problem4-v0.c:235:                                 c97 * x7 + c98 * x8 + c99 * x9 + c910 * x10 - d9);
	vmulsd	1184(%rsp), %xmm1, %xmm0	# %sfp, x10, _228
# problem4-v0.c:241:                           (q6 <= e6) && (q7 <= e7) && (q8 <= e8) && (q9 <= e9) && (q10 <= e10)) {
	vmovsd	1168(%rsp), %xmm3	# %sfp, e9
# problem4-v0.c:235:                                 c97 * x7 + c98 * x8 + c99 * x9 + c910 * x10 - d9);
	vaddsd	%xmm5, %xmm0, %xmm0	# _227, _228, _229
# problem4-v0.c:235:                                 c97 * x7 + c98 * x8 + c99 * x9 + c910 * x10 - d9);
	vsubsd	1192(%rsp), %xmm0, %xmm0	# %sfp, _229, _230
# problem4-v0.c:234:                       q9 = fabs(c91 * x1 + c92 * x2 + c93 * x3 + c94 * x4 + c95 * x5 + c96 * x6 +
	vandpd	.LC3(%rip), %xmm0, %xmm0	#, _230, q9_475
# problem4-v0.c:241:                           (q6 <= e6) && (q7 <= e7) && (q8 <= e8) && (q9 <= e9) && (q10 <= e10)) {
	vcomisd	%xmm0, %xmm3	# q9_475, e9
	jb	.L19	#,
# problem4-v0.c:238:                                  c106 * x6 + c107 * x7 + c108 * x8 + c109 * x9 + c1010 * x10 - d10);
	vmulsd	1352(%rsp), %xmm1, %xmm0	# %sfp, x10, _248
# problem4-v0.c:238:                                  c106 * x6 + c107 * x7 + c108 * x8 + c109 * x9 + c1010 * x10 - d10);
	vmovq	%r15, %xmm3	# _247, _247
	vaddsd	%xmm3, %xmm0, %xmm0	# _247, _248, _249
# problem4-v0.c:241:                           (q6 <= e6) && (q7 <= e7) && (q8 <= e8) && (q9 <= e9) && (q10 <= e10)) {
	vmovsd	1336(%rsp), %xmm3	# %sfp, e10
# problem4-v0.c:238:                                  c106 * x6 + c107 * x7 + c108 * x8 + c109 * x9 + c1010 * x10 - d10);
	vsubsd	1360(%rsp), %xmm0, %xmm0	# %sfp, _249, _250
# problem4-v0.c:237:                       q10 = fabs(c101 * x1 + c102 * x2 + c103 * x3 + c104 * x4 + c105 * x5 +
	vandpd	.LC3(%rip), %xmm0, %xmm0	#, _250, q10_487
# problem4-v0.c:241:                           (q6 <= e6) && (q7 <= e7) && (q8 <= e8) && (q9 <= e9) && (q10 <= e10)) {
	vcomisd	%xmm0, %xmm3	# q10_487, e10
	jnb	.L138	#,
	.p2align 4,,10
	.p2align 3
.L19:
# problem4-v0.c:206:                     for (int r10 = 0; r10 < s10; ++r10) {
	incl	%ebx	# r10
# problem4-v0.c:206:                     for (int r10 = 0; r10 < s10; ++r10) {
	cmpl	%ebx, %ebp	# r10, s10
	jne	.L30	#,
# problem4-v0.c:203:                   for (int r9 = 0; r9 < s9; ++r9) {
	incl	%r9d	# r9
# problem4-v0.c:203:                   for (int r9 = 0; r9 < s9; ++r9) {
	cmpl	%r9d, %r10d	# r9, s9
	jne	.L31	#,
# problem4-v0.c:200:                 for (int r8 = 0; r8 < s8; ++r8) {
	leal	1(%r14), %ebx	#, r8
# problem4-v0.c:200:                 for (int r8 = 0; r8 < s8; ++r8) {
	cmpl	%ebx, 388(%rsp)	# r8, %sfp
	jne	.L36	#,
.L121:
	movl	%ebp, %r11d	# s10, s10
.L35:
# problem4-v0.c:197:               for (int r7 = 0; r7 < s7; ++r7) {
	incl	1128(%rsp)	# %sfp
	movl	1128(%rsp), %eax	# %sfp, r7
# problem4-v0.c:197:               for (int r7 = 0; r7 < s7; ++r7) {
	cmpl	%eax, 1164(%rsp)	# r7, %sfp
	jne	.L41	#,
	movl	1228(%rsp), %r13d	# %sfp, r6
	movl	1200(%rsp), %eax	# %sfp, s6
	movl	%r10d, %r12d	# s9, s9
	movl	%r11d, %ebp	# s10, s10
	movl	1220(%rsp), %edi	# %sfp, s1
	movl	1164(%rsp), %r8d	# %sfp, s7
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	incl	%r13d	# r6
	movl	1224(%rsp), %r10d	# %sfp, s2
	movl	1232(%rsp), %r9d	# %sfp, r5
	movl	1236(%rsp), %edx	# %sfp, r4
	movl	1240(%rsp), %r11d	# %sfp, r3
	movl	1244(%rsp), %esi	# %sfp, r2
	vmovsd	416(%rsp), %xmm4	# %sfp, dd7
	movq	448(%rsp), %rbx	# %sfp, fptr
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	cmpl	%r13d, %eax	# r6, s6
	jne	.L13	#,
.L123:
	movl	%r9d, %r13d	# r5, r5
	vmovsd	392(%rsp), %xmm13	# %sfp, e3
	movl	%esi, %r9d	# r2, r2
	movl	1216(%rsp), %r15d	# %sfp, r1
	movl	1204(%rsp), %esi	# %sfp, s3
	vmovsd	400(%rsp), %xmm2	# %sfp, dd3
	movl	%r8d, %ecx	# s7, s7
	movl	%r11d, %r14d	# r3, r3
	vmovsd	408(%rsp), %xmm3	# %sfp, dd4
	vmovsd	1208(%rsp), %xmm1	# %sfp, dd6
	movl	%edx, %r8d	# r4, r4
	movl	%eax, %r11d	# s6, s6
.L45:
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	incl	%r13d	# r5
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	cmpl	%r13d, 1132(%rsp)	# r5, %sfp
	jne	.L51	#,
	movl	%ebp, %eax	# s10, s10
	movq	%rbx, %r13	# fptr, fptr
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	leal	1(%r8), %ebx	#, r4
	movl	%r11d, %edx	# s6, s6
	movl	%r12d, %ebp	# s9, s9
	movl	%r15d, %r8d	# r1, r1
	movl	%r14d, %r11d	# r3, r3
	movl	%esi, %r15d	# s3, s3
	movl	%eax, %r12d	# s10, s10
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	cmpl	%ebx, 1160(%rsp)	# r4, %sfp
	jne	.L56	#,
.L125:
	movl	%r15d, %r13d	# s3, s3
	movl	1160(%rsp), %r14d	# %sfp, s4
	movl	%ecx, %r15d	# s7, s7
	movl	%r8d, %ecx	# r1, r1
	movl	%ebp, %r8d	# s9, s9
	movl	%r12d, %ebp	# s10, s10
	movl	%edi, %r12d	# s1, s1
	movl	%r10d, %edi	# s2, s2
	movl	1132(%rsp), %r10d	# %sfp, s5
	movl	%r11d, %ebx	# r3, r3
	movl	%r9d, %esi	# r2, r2
	movl	%edx, %r11d	# s6, s6
	vmovq	%xmm2, %r9	# dd3, dd3
.L55:
# problem4-v0.c:185:       for (int r3 = 0; r3 < s3; ++r3) {
	incl	%ebx	# r3
# problem4-v0.c:185:       for (int r3 = 0; r3 < s3; ++r3) {
	cmpl	%ebx, %r13d	# r3, s3
	jne	.L61	#,
	movl	%r11d, %edx	# s6, s6
	movl	%edi, %eax	# s2, s2
	movl	%r13d, %edi	# s3, s3
	movl	%r10d, %r11d	# s5, s5
# problem4-v0.c:182:     for (int r2 = 0; r2 < s2; ++r2) {
	leal	1(%rsi), %r13d	#, r2
	movl	%r14d, %r10d	# s4, s4
	movl	%r12d, %esi	# s1, s1
	movl	%edx, %r14d	# s6, s6
	movl	%ecx, %r12d	# r1, r1
# problem4-v0.c:182:     for (int r2 = 0; r2 < s2; ++r2) {
	cmpl	%r13d, %eax	# r2, s2
	jne	.L66	#,
.L127:
	movl	%esi, %r13d	# s1, s1
	movl	%r12d, %ebx	# r1, r1
	movl	%r14d, %esi	# s6, s6
	movl	%r15d, %r12d	# s7, s7
	movl	%r10d, %r14d	# s4, s4
	movl	%r11d, %r15d	# s5, s5
	vmovq	%r9, %xmm2	# dd3, dd3
.L65:
# problem4-v0.c:179:   for (int r1 = 0; r1 < s1; ++r1) {
	incl	%ebx	# r1
# problem4-v0.c:179:   for (int r1 = 0; r1 < s1; ++r1) {
	cmpl	%ebx, %r13d	# r1, s1
	jne	.L67	#,
.L68:
# problem4-v0.c:267:   fclose(fptr);
	movq	1328(%rsp), %rdi	# %sfp,
	call	fclose@PLT	#
# problem4-v0.c:268:   printf("result pnts: %ld\n", pnts);
	movq	1176(%rsp), %rsi	# %sfp,
# problem4-v0.c:271: }
	addq	$1496, %rsp	#,
# problem4-v0.c:268:   printf("result pnts: %ld\n", pnts);
	leaq	.LC6(%rip), %rdi	#,
# problem4-v0.c:271: }
	popq	%rbx	#
# problem4-v0.c:268:   printf("result pnts: %ld\n", pnts);
	xorl	%eax, %eax	#
# problem4-v0.c:271: }
	popq	%rbp	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
# problem4-v0.c:268:   printf("result pnts: %ld\n", pnts);
	jmp	printf@PLT	#
.L138:
# problem4-v0.c:245:                         fprintf(fptr, "%lf\t", x1);
	vmovsd	304(%rsp), %xmm0	# %sfp,
	movq	448(%rsp), %rdi	# %sfp,
	leaq	.LC4(%rip), %rsi	#,
	movl	$1, %eax	#,
	movq	%r11, 1480(%rsp)	# dd7, %sfp
	movl	%r9d, 1460(%rsp)	# r9, %sfp
	movl	%r10d, 1456(%rsp)	# s9, %sfp
	vmovsd	%xmm7, 1472(%rsp)	# d3, %sfp
	vmovsd	%xmm12, 1464(%rsp)	# c310, %sfp
	vmovsd	%xmm14, 1448(%rsp)	# e3, %sfp
	vmovsd	%xmm5, 1440(%rsp)	# _227, %sfp
	vmovsd	%xmm9, 1432(%rsp)	# _207, %sfp
	vmovsd	%xmm10, 1424(%rsp)	# _187, %sfp
	vmovsd	%xmm11, 1416(%rsp)	# _167, %sfp
	vmovsd	%xmm13, 1408(%rsp)	# _147, %sfp
	vmovsd	%xmm2, 1400(%rsp)	# _127, %sfp
	vmovsd	%xmm4, 1392(%rsp)	# _107, %sfp
	vmovsd	%xmm8, 1384(%rsp)	# _87, %sfp
	vmovsd	%xmm6, 1376(%rsp)	# _67, %sfp
	vmovsd	%xmm1, 1368(%rsp)	# x10, %sfp
# problem4-v0.c:242:                         pnts = pnts + 1;
	incq	1176(%rsp)	# %sfp
# problem4-v0.c:245:                         fprintf(fptr, "%lf\t", x1);
	call	fprintf@PLT	#
# problem4-v0.c:246:                         fprintf(fptr, "%lf\t", x2);
	vmovsd	312(%rsp), %xmm0	# %sfp,
	movq	448(%rsp), %rdi	# %sfp,
	leaq	.LC4(%rip), %rsi	#,
	movl	$1, %eax	#,
	call	fprintf@PLT	#
# problem4-v0.c:247:                         fprintf(fptr, "%lf\t", x3);
	vmovsd	320(%rsp), %xmm0	# %sfp,
	movq	448(%rsp), %rdi	# %sfp,
	leaq	.LC4(%rip), %rsi	#,
	movl	$1, %eax	#,
	call	fprintf@PLT	#
# problem4-v0.c:248:                         fprintf(fptr, "%lf\t", x4);
	vmovsd	328(%rsp), %xmm0	# %sfp,
	movq	448(%rsp), %rdi	# %sfp,
	leaq	.LC4(%rip), %rsi	#,
	movl	$1, %eax	#,
	call	fprintf@PLT	#
# problem4-v0.c:249:                         fprintf(fptr, "%lf\t", x5);
	vmovsd	336(%rsp), %xmm0	# %sfp,
	movq	448(%rsp), %rdi	# %sfp,
	leaq	.LC4(%rip), %rsi	#,
	movl	$1, %eax	#,
	call	fprintf@PLT	#
# problem4-v0.c:250:                         fprintf(fptr, "%lf\t", x6);
	vmovsd	368(%rsp), %xmm0	# %sfp,
	movq	448(%rsp), %rdi	# %sfp,
	leaq	.LC4(%rip), %rsi	#,
	movl	$1, %eax	#,
	call	fprintf@PLT	#
# problem4-v0.c:251:                         fprintf(fptr, "%lf\t", x7);
	vmovsd	376(%rsp), %xmm0	# %sfp,
	movq	448(%rsp), %rdi	# %sfp,
	leaq	.LC4(%rip), %rsi	#,
	movl	$1, %eax	#,
	call	fprintf@PLT	#
# problem4-v0.c:252:                         fprintf(fptr, "%lf\t", x8);
	vmovsd	472(%rsp), %xmm0	# %sfp,
	movq	448(%rsp), %rdi	# %sfp,
	leaq	.LC4(%rip), %rsi	#,
	movl	$1, %eax	#,
	call	fprintf@PLT	#
# problem4-v0.c:253:                         fprintf(fptr, "%lf\t", x9);
	vmovsd	248(%rsp), %xmm0	# %sfp,
	movq	448(%rsp), %rdi	# %sfp,
	leaq	.LC4(%rip), %rsi	#,
	movl	$1, %eax	#,
	call	fprintf@PLT	#
# problem4-v0.c:254:                         fprintf(fptr, "%lf\n", x10);
	vmovsd	1368(%rsp), %xmm0	# %sfp,
	movq	448(%rsp), %rdi	# %sfp,
	leaq	.LC5(%rip), %rsi	#,
	movl	$1, %eax	#,
	call	fprintf@PLT	#
	movq	1480(%rsp), %r11	# %sfp, dd7
	vmovsd	1472(%rsp), %xmm7	# %sfp, d3
	vxorps	%xmm15, %xmm15, %xmm15	# tmp962
	vmovsd	1464(%rsp), %xmm12	# %sfp, c310
	movl	1460(%rsp), %r9d	# %sfp, r9
	movl	1456(%rsp), %r10d	# %sfp, s9
	vmovsd	1448(%rsp), %xmm14	# %sfp, e3
	vmovsd	1440(%rsp), %xmm5	# %sfp, _227
	vmovsd	1432(%rsp), %xmm9	# %sfp, _207
	vmovsd	1424(%rsp), %xmm10	# %sfp, _187
	vmovsd	1416(%rsp), %xmm11	# %sfp, _167
	vmovsd	1408(%rsp), %xmm13	# %sfp, _147
	vmovsd	1400(%rsp), %xmm2	# %sfp, _127
	vmovsd	1392(%rsp), %xmm4	# %sfp, _107
	vmovsd	1384(%rsp), %xmm8	# %sfp, _87
	vmovsd	1376(%rsp), %xmm6	# %sfp, _67
	jmp	.L19	#
.L76:
# problem4-v0.c:206:                     for (int r10 = 0; r10 < s10; ++r10) {
	xorl	%edx, %edx	# r9
.L18:
# problem4-v0.c:203:                   for (int r9 = 0; r9 < s9; ++r9) {
	leal	1(%rdx), %eax	#, r9_854
# problem4-v0.c:203:                   for (int r9 = 0; r9 < s9; ++r9) {
	cmpl	%eax, %r10d	# r9_854, s9
	je	.L139	#,
# problem4-v0.c:203:                   for (int r9 = 0; r9 < s9; ++r9) {
	addl	$2, %edx	#, r9
# problem4-v0.c:203:                   for (int r9 = 0; r9 < s9; ++r9) {
	cmpl	%edx, %r10d	# r9, s9
	jne	.L18	#,
# problem4-v0.c:200:                 for (int r8 = 0; r8 < s8; ++r8) {
	incl	%ebx	# r8
# problem4-v0.c:200:                 for (int r8 = 0; r8 < s8; ++r8) {
	cmpl	%ebx, 388(%rsp)	# r8, %sfp
	jne	.L36	#,
	movl	%ebp, %r11d	# s10, s10
.L129:
# problem4-v0.c:197:               for (int r7 = 0; r7 < s7; ++r7) {
	incl	1128(%rsp)	# %sfp
	movl	1128(%rsp), %eax	# %sfp, r7
# problem4-v0.c:197:               for (int r7 = 0; r7 < s7; ++r7) {
	cmpl	%eax, 1164(%rsp)	# r7, %sfp
	jne	.L41	#,
	movl	1220(%rsp), %edi	# %sfp, s1
	movl	1224(%rsp), %esi	# %sfp, s2
	movl	%r11d, %ebp	# s10, s10
	movl	%r10d, %r11d	# s9, s9
	movl	1164(%rsp), %r8d	# %sfp, s7
	movl	1228(%rsp), %r13d	# %sfp, r6
	movl	1232(%rsp), %r9d	# %sfp, r5
	movl	1236(%rsp), %r12d	# %sfp, r4
	movl	1240(%rsp), %r14d	# %sfp, r3
	movl	1244(%rsp), %eax	# %sfp, r2
	vmovsd	416(%rsp), %xmm4	# %sfp, dd7
	movq	448(%rsp), %rbx	# %sfp, fptr
.L40:
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	incl	%r13d	# r6
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	cmpl	%r13d, 1200(%rsp)	# r6, %sfp
	jne	.L46	#,
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	leal	1(%r9), %r13d	#, r5
	movl	%esi, %r10d	# s2, s2
	movl	%r8d, %ecx	# s7, s7
	vmovsd	392(%rsp), %xmm13	# %sfp, e3
	movl	%r12d, %r8d	# r4, r4
	movl	1204(%rsp), %esi	# %sfp, s3
	movl	%r11d, %r12d	# s9, s9
	movl	1216(%rsp), %r15d	# %sfp, r1
	movl	1200(%rsp), %r11d	# %sfp, s6
	vmovsd	400(%rsp), %xmm2	# %sfp, dd3
	movl	%eax, %r9d	# r2, r2
	vmovsd	408(%rsp), %xmm3	# %sfp, dd4
	vmovsd	1208(%rsp), %xmm1	# %sfp, dd6
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	cmpl	%r13d, 1132(%rsp)	# r5, %sfp
	jne	.L51	#,
.L124:
	movl	%ebp, %eax	# s10, s10
	movl	%r11d, %edx	# s6, s6
	movl	%r12d, %ebp	# s9, s9
	movq	%rbx, %r13	# fptr, fptr
	movl	%r14d, %r11d	# r3, r3
	movl	%r8d, %ebx	# r4, r4
	movl	%eax, %r12d	# s10, s10
	movl	%r15d, %r8d	# r1, r1
	movl	%esi, %r15d	# s3, s3
.L50:
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	incl	%ebx	# r4
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	cmpl	%ebx, 1160(%rsp)	# r4, %sfp
	jne	.L56	#,
	movl	%r15d, %r13d	# s3, s3
# problem4-v0.c:185:       for (int r3 = 0; r3 < s3; ++r3) {
	leal	1(%r11), %ebx	#, r3
	movl	%ecx, %r15d	# s7, s7
	movl	%r9d, %esi	# r2, r2
	movl	%r8d, %ecx	# r1, r1
	movl	1160(%rsp), %r14d	# %sfp, s4
	movl	%ebp, %r8d	# s9, s9
	movl	%edx, %r11d	# s6, s6
	movl	%r12d, %ebp	# s10, s10
	vmovq	%xmm2, %r9	# dd3, dd3
	movl	%edi, %r12d	# s1, s1
	movl	%r10d, %edi	# s2, s2
	movl	1132(%rsp), %r10d	# %sfp, s5
# problem4-v0.c:185:       for (int r3 = 0; r3 < s3; ++r3) {
	cmpl	%ebx, %r13d	# r3, s3
	jne	.L61	#,
.L126:
	movl	%r11d, %edx	# s6, s6
	movl	%edi, %eax	# s2, s2
	movl	%r10d, %r11d	# s5, s5
	movl	%r13d, %edi	# s3, s3
	movl	%r14d, %r10d	# s4, s4
	movl	%esi, %r13d	# r2, r2
	movl	%edx, %r14d	# s6, s6
	movl	%r12d, %esi	# s1, s1
	movl	%ecx, %r12d	# r1, r1
.L60:
# problem4-v0.c:182:     for (int r2 = 0; r2 < s2; ++r2) {
	incl	%r13d	# r2
# problem4-v0.c:182:     for (int r2 = 0; r2 < s2; ++r2) {
	cmpl	%r13d, %eax	# r2, s2
	je	.L127	#,
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	testl	%r10d, %r10d	# s4
	jg	.L140	#,
.L70:
	xorl	%edx, %edx	# r3
.L6:
# problem4-v0.c:185:       for (int r3 = 0; r3 < s3; ++r3) {
	leal	1(%rdx), %ecx	#, r3_784
# problem4-v0.c:185:       for (int r3 = 0; r3 < s3; ++r3) {
	cmpl	%ecx, %edi	# r3_784, s3
	je	.L60	#,
# problem4-v0.c:185:       for (int r3 = 0; r3 < s3; ++r3) {
	addl	$2, %edx	#, r3
# problem4-v0.c:185:       for (int r3 = 0; r3 < s3; ++r3) {
	cmpl	%edx, %edi	# r3, s3
	jne	.L6	#,
	jmp	.L60	#
.L139:
# problem4-v0.c:200:                 for (int r8 = 0; r8 < s8; ++r8) {
	incl	%ebx	# r8
# problem4-v0.c:200:                 for (int r8 = 0; r8 < s8; ++r8) {
	cmpl	%ebx, 388(%rsp)	# r8, %sfp
	jne	.L36	#,
	jmp	.L121	#
.L75:
# problem4-v0.c:203:                   for (int r9 = 0; r9 < s9; ++r9) {
	xorl	%eax, %eax	# r8
.L16:
# problem4-v0.c:200:                 for (int r8 = 0; r8 < s8; ++r8) {
	leal	1(%rax), %esi	#, r8_844
# problem4-v0.c:200:                 for (int r8 = 0; r8 < s8; ++r8) {
	cmpl	%esi, 388(%rsp)	# r8_844, %sfp
	je	.L129	#,
# problem4-v0.c:200:                 for (int r8 = 0; r8 < s8; ++r8) {
	addl	$2, %eax	#, r8
# problem4-v0.c:200:                 for (int r8 = 0; r8 < s8; ++r8) {
	cmpl	%eax, 388(%rsp)	# r8, %sfp
	jne	.L16	#,
	jmp	.L35	#
.L74:
	xorl	%edx, %edx	# r7
# problem4-v0.c:197:               for (int r7 = 0; r7 < s7; ++r7) {
	leal	1(%rdx), %ecx	#, r7_832
# problem4-v0.c:197:               for (int r7 = 0; r7 < s7; ++r7) {
	cmpl	%ecx, %r8d	# r7_832, s7
	je	.L141	#,
.L43:
# problem4-v0.c:197:               for (int r7 = 0; r7 < s7; ++r7) {
	addl	$2, %edx	#, r7
# problem4-v0.c:197:               for (int r7 = 0; r7 < s7; ++r7) {
	cmpl	%edx, %r8d	# r7, s7
	je	.L40	#,
# problem4-v0.c:197:               for (int r7 = 0; r7 < s7; ++r7) {
	leal	1(%rdx), %ecx	#, r7_832
# problem4-v0.c:197:               for (int r7 = 0; r7 < s7; ++r7) {
	cmpl	%ecx, %r8d	# r7_832, s7
	jne	.L43	#,
.L141:
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	movl	%esi, %r10d	# s2, s2
	movl	%eax, %esi	# r2, r2
	movl	1200(%rsp), %eax	# %sfp, s6
	incl	%r13d	# r6
	movl	%r12d, %edx	# r4, r4
	movl	%r11d, %r12d	# s9, s9
	movl	%r14d, %r11d	# r3, r3
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	cmpl	%r13d, %eax	# r6, s6
	jne	.L13	#,
	jmp	.L123	#
.L73:
# problem4-v0.c:197:               for (int r7 = 0; r7 < s7; ++r7) {
	xorl	%eax, %eax	# r6
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	leal	1(%rax), %edx	#, r6_820
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	cmpl	%edx, %r11d	# r6_820, s6
	je	.L142	#,
.L48:
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	addl	$2, %eax	#, r6
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	cmpl	%eax, %r11d	# r6, s6
	je	.L45	#,
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	leal	1(%rax), %edx	#, r6_820
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	cmpl	%edx, %r11d	# r6_820, s6
	jne	.L48	#,
.L142:
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	incl	%r13d	# r5
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	cmpl	%r13d, 1132(%rsp)	# r5, %sfp
	jne	.L51	#,
	jmp	.L124	#
.L72:
# problem4-v0.c:194:             for (int r6 = 0; r6 < s6; ++r6) {
	xorl	%eax, %eax	# r5
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	leal	1(%rax), %esi	#, r5_808
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	cmpl	%esi, 1132(%rsp)	# r5_808, %sfp
	je	.L143	#,
.L53:
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	addl	$2, %eax	#, r5
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	cmpl	%eax, 1132(%rsp)	# r5, %sfp
	je	.L50	#,
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	leal	1(%rax), %esi	#, r5_808
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	cmpl	%esi, 1132(%rsp)	# r5_808, %sfp
	jne	.L53	#,
.L143:
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	incl	%ebx	# r4
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	cmpl	%ebx, 1160(%rsp)	# r4, %sfp
	jne	.L56	#,
	jmp	.L125	#
.L71:
# problem4-v0.c:191:           for (int r5 = 0; r5 < s5; ++r5) {
	xorl	%eax, %eax	# r4
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	leal	1(%rax), %edx	#, r4_796
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	cmpl	%edx, %r14d	# r4_796, s4
	je	.L144	#,
.L58:
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	addl	$2, %eax	#, r4
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	cmpl	%eax, %r14d	# r4, s4
	je	.L55	#,
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	leal	1(%rax), %edx	#, r4_796
# problem4-v0.c:188:         for (int r4 = 0; r4 < s4; ++r4) {
	cmpl	%edx, %r14d	# r4_796, s4
	jne	.L58	#,
.L144:
# problem4-v0.c:185:       for (int r3 = 0; r3 < s3; ++r3) {
	incl	%ebx	# r3
# problem4-v0.c:185:       for (int r3 = 0; r3 < s3; ++r3) {
	cmpl	%ebx, %r13d	# r3, s3
	jne	.L61	#,
	jmp	.L126	#
.L69:
	xorl	%edx, %edx	# r2
.L4:
# problem4-v0.c:182:     for (int r2 = 0; r2 < s2; ++r2) {
	leal	1(%rdx), %ecx	#, r2_772
# problem4-v0.c:182:     for (int r2 = 0; r2 < s2; ++r2) {
	cmpl	%ecx, %eax	# r2_772, s2
	je	.L65	#,
# problem4-v0.c:182:     for (int r2 = 0; r2 < s2; ++r2) {
	addl	$2, %edx	#, r2
# problem4-v0.c:182:     for (int r2 = 0; r2 < s2; ++r2) {
	cmpl	%edx, %eax	# r2, s2
	jne	.L4	#,
	jmp	.L65	#
.L3:
# problem4-v0.c:185:       for (int r3 = 0; r3 < s3; ++r3) {
	movq	$0, 1176(%rsp)	#, %sfp
	jmp	.L68	#
.L137:
# problem4-v0.c:138:     printf("Error in creating file !");
	leaq	.LC2(%rip), %rdi	#,
	call	printf@PLT	#
# problem4-v0.c:139:     exit(1);
	movl	$1, %edi	#,
	call	exit@PLT	#
	.size	gridloopsearch, .-gridloopsearch
	.section	.rodata.str1.1
.LC7:
	.string	"r"
.LC8:
	.string	"./disp.txt"
.LC9:
	.string	"Error: could not open file"
.LC10:
	.string	"%lf"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC11:
	.string	"Error: fscanf failed while reading disp.txt"
	.section	.rodata.str1.1
.LC12:
	.string	"./grid.txt"
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"Error: fscanf failed while reading grid.txt"
	.section	.rodata.str1.1
.LC16:
	.string	"Total time = %f seconds\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	pushq	%r13	#
# problem4-v0.c:43:   FILE* fp = fopen("./disp.txt", "r");
	leaq	.LC7(%rip), %rsi	#,
	leaq	.LC8(%rip), %rdi	#,
# problem4-v0.c:39: int main() {
	pushq	%r12	#
	pushq	%rbp	#
	pushq	%rbx	#
	subq	$8, %rsp	#,
# problem4-v0.c:43:   FILE* fp = fopen("./disp.txt", "r");
	call	fopen@PLT	#
# problem4-v0.c:44:   if (fp == NULL) {
	testq	%rax, %rax	# fp
	je	.L146	#,
	leaq	a(%rip), %rbx	#, tmp457
	movq	%rax, %r12	#, fp
	movq	%rbx, %rbp	# tmp457, ivtmp.62
	jmp	.L147	#
	.p2align 4,,10
	.p2align 3
.L149:
# problem4-v0.c:50:     if (!fscanf(fp, "%lf", &a[i])) {
	movq	%rbp, %rdx	# ivtmp.62,
	leaq	.LC10(%rip), %rsi	#,
	movq	%r12, %rdi	# fp,
	xorl	%eax, %eax	#
	call	__isoc99_fscanf@PLT	#
# problem4-v0.c:50:     if (!fscanf(fp, "%lf", &a[i])) {
	addq	$8, %rbp	#, ivtmp.62
	testl	%eax, %eax	# _2
	je	.L161	#,
.L147:
# problem4-v0.c:49:   while (!feof(fp)) {
	movq	%r12, %rdi	# fp,
	call	feof@PLT	#
# problem4-v0.c:49:   while (!feof(fp)) {
	testl	%eax, %eax	# _3
	je	.L149	#,
# problem4-v0.c:56:   fclose(fp);
	movq	%r12, %rdi	# fp,
	call	fclose@PLT	#
# problem4-v0.c:60:   FILE* fpq = fopen("./grid.txt", "r");
	leaq	.LC7(%rip), %rsi	#,
	leaq	.LC12(%rip), %rdi	#,
	call	fopen@PLT	#
	movq	%rax, %r12	#, fpq
# problem4-v0.c:61:   if (fpq == NULL) {
	testq	%rax, %rax	# fpq
	je	.L146	#,
	leaq	b(%rip), %r13	#, tmp458
	movq	%r13, %rbp	# tmp458, ivtmp.54
	jmp	.L150	#
	.p2align 4,,10
	.p2align 3
.L151:
# problem4-v0.c:67:     if (!fscanf(fpq, "%lf", &b[j])) {
	movq	%rbp, %rdx	# ivtmp.54,
	leaq	.LC10(%rip), %rsi	#,
	movq	%r12, %rdi	# fpq,
	xorl	%eax, %eax	#
	call	__isoc99_fscanf@PLT	#
# problem4-v0.c:67:     if (!fscanf(fpq, "%lf", &b[j])) {
	addq	$8, %rbp	#, ivtmp.54
	testl	%eax, %eax	# _5
	je	.L162	#,
.L150:
# problem4-v0.c:66:   while (!feof(fpq)) {
	movq	%r12, %rdi	# fpq,
	call	feof@PLT	#
# problem4-v0.c:66:   while (!feof(fpq)) {
	testl	%eax, %eax	# _6
	je	.L151	#,
# problem4-v0.c:73:   fclose(fpq);
	movq	%r12, %rdi	# fpq,
	call	fclose@PLT	#
# problem4-v0.c:79:   clock_gettime(CLOCK_MONOTONIC_RAW, &begin_grid);
	leaq	begin_grid(%rip), %rsi	#,
	movl	$4, %edi	#,
	call	clock_gettime@PLT	#
# problem4-v0.c:80:   gridloopsearch(b[0], b[1], b[2], b[3], b[4], b[5], b[6], b[7], b[8], b[9], b[10], b[11], b[12],
	subq	$8, %rsp	#,
	movabsq	$4599075939470750515, %rax	#,
	pushq	%rax	#
	pushq	952(%rbx)	# a[119]
	pushq	944(%rbx)	# a[118]
	pushq	936(%rbx)	# a[117]
	pushq	928(%rbx)	# a[116]
	pushq	920(%rbx)	# a[115]
	pushq	912(%rbx)	# a[114]
	pushq	904(%rbx)	# a[113]
	pushq	896(%rbx)	# a[112]
	pushq	888(%rbx)	# a[111]
	pushq	880(%rbx)	# a[110]
	pushq	872(%rbx)	# a[109]
	pushq	864(%rbx)	# a[108]
	pushq	856(%rbx)	# a[107]
	pushq	848(%rbx)	# a[106]
	pushq	840(%rbx)	# a[105]
	pushq	832(%rbx)	# a[104]
	pushq	824(%rbx)	# a[103]
	pushq	816(%rbx)	# a[102]
	pushq	808(%rbx)	# a[101]
	pushq	800(%rbx)	# a[100]
	pushq	792(%rbx)	# a[99]
	pushq	784(%rbx)	# a[98]
	pushq	776(%rbx)	# a[97]
	pushq	768(%rbx)	# a[96]
	pushq	760(%rbx)	# a[95]
	pushq	752(%rbx)	# a[94]
	pushq	744(%rbx)	# a[93]
	pushq	736(%rbx)	# a[92]
	pushq	728(%rbx)	# a[91]
	pushq	720(%rbx)	# a[90]
	pushq	712(%rbx)	# a[89]
	pushq	704(%rbx)	# a[88]
	pushq	696(%rbx)	# a[87]
	pushq	688(%rbx)	# a[86]
	pushq	680(%rbx)	# a[85]
	pushq	672(%rbx)	# a[84]
	pushq	664(%rbx)	# a[83]
	pushq	656(%rbx)	# a[82]
	pushq	648(%rbx)	# a[81]
	pushq	640(%rbx)	# a[80]
	pushq	632(%rbx)	# a[79]
	pushq	624(%rbx)	# a[78]
	pushq	616(%rbx)	# a[77]
	pushq	608(%rbx)	# a[76]
	pushq	600(%rbx)	# a[75]
	pushq	592(%rbx)	# a[74]
	pushq	584(%rbx)	# a[73]
	pushq	576(%rbx)	# a[72]
	pushq	568(%rbx)	# a[71]
	pushq	560(%rbx)	# a[70]
	pushq	552(%rbx)	# a[69]
	pushq	544(%rbx)	# a[68]
	pushq	536(%rbx)	# a[67]
	pushq	528(%rbx)	# a[66]
	pushq	520(%rbx)	# a[65]
	pushq	512(%rbx)	# a[64]
	pushq	504(%rbx)	# a[63]
	pushq	496(%rbx)	# a[62]
	pushq	488(%rbx)	# a[61]
	pushq	480(%rbx)	# a[60]
	pushq	472(%rbx)	# a[59]
	pushq	464(%rbx)	# a[58]
	pushq	456(%rbx)	# a[57]
	pushq	448(%rbx)	# a[56]
	pushq	440(%rbx)	# a[55]
	pushq	432(%rbx)	# a[54]
	pushq	424(%rbx)	# a[53]
	pushq	416(%rbx)	# a[52]
	pushq	408(%rbx)	# a[51]
	pushq	400(%rbx)	# a[50]
	pushq	392(%rbx)	# a[49]
	pushq	384(%rbx)	# a[48]
	pushq	376(%rbx)	# a[47]
	pushq	368(%rbx)	# a[46]
	pushq	360(%rbx)	# a[45]
	pushq	352(%rbx)	# a[44]
	pushq	344(%rbx)	# a[43]
	pushq	336(%rbx)	# a[42]
	pushq	328(%rbx)	# a[41]
	pushq	320(%rbx)	# a[40]
	pushq	312(%rbx)	# a[39]
	pushq	304(%rbx)	# a[38]
	pushq	296(%rbx)	# a[37]
	pushq	288(%rbx)	# a[36]
	pushq	280(%rbx)	# a[35]
	pushq	272(%rbx)	# a[34]
	pushq	264(%rbx)	# a[33]
	pushq	256(%rbx)	# a[32]
	pushq	248(%rbx)	# a[31]
	pushq	240(%rbx)	# a[30]
	pushq	232(%rbx)	# a[29]
	pushq	224(%rbx)	# a[28]
	pushq	216(%rbx)	# a[27]
	pushq	208(%rbx)	# a[26]
	pushq	200(%rbx)	# a[25]
	pushq	192(%rbx)	# a[24]
	pushq	184(%rbx)	# a[23]
	pushq	176(%rbx)	# a[22]
	pushq	168(%rbx)	# a[21]
	pushq	160(%rbx)	# a[20]
	pushq	152(%rbx)	# a[19]
	pushq	144(%rbx)	# a[18]
	pushq	136(%rbx)	# a[17]
	pushq	128(%rbx)	# a[16]
	pushq	120(%rbx)	# a[15]
	pushq	112(%rbx)	# a[14]
	pushq	104(%rbx)	# a[13]
	pushq	96(%rbx)	# a[12]
	pushq	88(%rbx)	# a[11]
	pushq	80(%rbx)	# a[10]
	pushq	72(%rbx)	# a[9]
	pushq	64(%rbx)	# a[8]
	pushq	56(%rbx)	# a[7]
	pushq	48(%rbx)	# a[6]
	pushq	40(%rbx)	# a[5]
	pushq	32(%rbx)	# a[4]
	pushq	24(%rbx)	# a[3]
	pushq	16(%rbx)	# a[2]
	pushq	8(%rbx)	# a[1]
	pushq	(%rbx)	# a[0]
	pushq	232(%r13)	# b[29]
	pushq	224(%r13)	# b[28]
	pushq	216(%r13)	# b[27]
	pushq	208(%r13)	# b[26]
	pushq	200(%r13)	# b[25]
	pushq	192(%r13)	# b[24]
	pushq	184(%r13)	# b[23]
	pushq	176(%r13)	# b[22]
	pushq	168(%r13)	# b[21]
	pushq	160(%r13)	# b[20]
	pushq	152(%r13)	# b[19]
	pushq	144(%r13)	# b[18]
	pushq	136(%r13)	# b[17]
	pushq	128(%r13)	# b[16]
	pushq	120(%r13)	# b[15]
	pushq	112(%r13)	# b[14]
	pushq	104(%r13)	# b[13]
	pushq	96(%r13)	# b[12]
	pushq	88(%r13)	# b[11]
	pushq	80(%r13)	# b[10]
	pushq	72(%r13)	# b[9]
	pushq	64(%r13)	# b[8]
	vmovsd	56+b(%rip), %xmm7	# b[7],
	vmovsd	48+b(%rip), %xmm6	# b[6],
	vmovsd	40+b(%rip), %xmm5	# b[5],
	vmovsd	32+b(%rip), %xmm4	# b[4],
	vmovsd	24+b(%rip), %xmm3	# b[3],
	vmovsd	16+b(%rip), %xmm2	# b[2],
	vmovsd	8+b(%rip), %xmm1	# b[1],
	vmovsd	b(%rip), %xmm0	# b[0],
	call	gridloopsearch	#
# problem4-v0.c:93:   clock_gettime(CLOCK_MONOTONIC_RAW, &end_main);
	addq	$1152, %rsp	#,
	leaq	end_main(%rip), %rsi	#,
	movl	$4, %edi	#,
	call	clock_gettime@PLT	#
# problem4-v0.c:94:   printf("Total time = %f seconds\n", (end_main.tv_nsec - begin_grid.tv_nsec) / NSEC_SEC_MUL +
	movq	8+end_main(%rip), %rax	# end_main.tv_nsec, end_main.tv_nsec
# problem4-v0.c:94:   printf("Total time = %f seconds\n", (end_main.tv_nsec - begin_grid.tv_nsec) / NSEC_SEC_MUL +
	vxorps	%xmm8, %xmm8, %xmm8	# tmp467
# problem4-v0.c:94:   printf("Total time = %f seconds\n", (end_main.tv_nsec - begin_grid.tv_nsec) / NSEC_SEC_MUL +
	leaq	.LC16(%rip), %rdi	#,
# problem4-v0.c:94:   printf("Total time = %f seconds\n", (end_main.tv_nsec - begin_grid.tv_nsec) / NSEC_SEC_MUL +
	subq	8+begin_grid(%rip), %rax	# begin_grid.tv_nsec, _159
# problem4-v0.c:94:   printf("Total time = %f seconds\n", (end_main.tv_nsec - begin_grid.tv_nsec) / NSEC_SEC_MUL +
	vcvtsi2sdq	%rax, %xmm8, %xmm0	# _159, tmp467, tmp468
# problem4-v0.c:95:                                           (end_main.tv_sec - begin_grid.tv_sec));
	movq	end_main(%rip), %rax	# end_main.tv_sec, end_main.tv_sec
# problem4-v0.c:94:   printf("Total time = %f seconds\n", (end_main.tv_nsec - begin_grid.tv_nsec) / NSEC_SEC_MUL +
	vdivsd	.LC15(%rip), %xmm0, %xmm0	#, _160, _161
# problem4-v0.c:95:                                           (end_main.tv_sec - begin_grid.tv_sec));
	subq	begin_grid(%rip), %rax	# begin_grid.tv_sec, _164
# problem4-v0.c:94:   printf("Total time = %f seconds\n", (end_main.tv_nsec - begin_grid.tv_nsec) / NSEC_SEC_MUL +
	vcvtsi2sdq	%rax, %xmm8, %xmm8	# _164, tmp467, tmp469
	vaddsd	%xmm8, %xmm0, %xmm0	# _165, _161, _166
	movl	$1, %eax	#,
	call	printf@PLT	#
# problem4-v0.c:97:   return EXIT_SUCCESS;
	xorl	%eax, %eax	# <retval>
.L145:
# problem4-v0.c:98: }
	addq	$8, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	popq	%r12	#
	popq	%r13	#
	ret	
.L161:
# problem4-v0.c:51:       printf("Error: fscanf failed while reading disp.txt\n");
	leaq	.LC11(%rip), %rdi	#,
	call	puts@PLT	#
# problem4-v0.c:52:       exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L162:
# problem4-v0.c:68:       printf("Error: fscanf failed while reading grid.txt\n");
	leaq	.LC13(%rip), %rdi	#,
	call	puts@PLT	#
# problem4-v0.c:69:       exit(EXIT_FAILURE);
	movl	$1, %edi	#,
	call	exit@PLT	#
.L146:
# problem4-v0.c:45:     printf("Error: could not open file\n");
	leaq	.LC9(%rip), %rdi	#,
	call	puts@PLT	#
# problem4-v0.c:46:     return 1;
	movl	$1, %eax	#, <retval>
	jmp	.L145	#
	.size	main, .-main
	.globl	b
	.bss
	.align 32
	.type	b, @object
	.size	b, 240
b:
	.zero	240
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 960
a:
	.zero	960
	.globl	end_main
	.align 16
	.type	end_main, @object
	.size	end_main, 16
end_main:
	.zero	16
	.globl	begin_grid
	.align 16
	.type	begin_grid, @object
	.size	begin_grid, 16
begin_grid:
	.zero	16
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC15:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 15.2.1 20250813"
	.section	.note.GNU-stack,"",@progbits
