
../riscv32/elf/recursion:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	00000093          	li	ra,0
  14:	00000193          	li	gp,0
  18:	00000213          	li	tp,0
  1c:	00000313          	li	t1,0
  20:	00000393          	li	t2,0
  24:	00000413          	li	s0,0
  28:	00000493          	li	s1,0
  2c:	00000513          	li	a0,0
  30:	00000593          	li	a1,0
  34:	00000613          	li	a2,0
  38:	00000693          	li	a3,0
  3c:	00000713          	li	a4,0
  40:	00000793          	li	a5,0
  44:	00000813          	li	a6,0
  48:	00000893          	li	a7,0
  4c:	00000913          	li	s2,0
  50:	00000993          	li	s3,0
  54:	00000a13          	li	s4,0
  58:	00000a93          	li	s5,0
  5c:	00000b13          	li	s6,0
  60:	00000b93          	li	s7,0
  64:	00000c13          	li	s8,0
  68:	00000c93          	li	s9,0
  6c:	00000d13          	li	s10,0
  70:	00000d93          	li	s11,0
  74:	00000e13          	li	t3,0
  78:	00000e93          	li	t4,0
  7c:	00000f13          	li	t5,0
  80:	00000f93          	li	t6,0
  84:	200000ef          	jal	ra,284 <main>
  88:	1f0000ef          	jal	ra,278 <hit_good_trap>

0000008c <f0>:
  8c:	31002703          	lw	a4,784(zero) # 310 <lvl>
  90:	00b75463          	bge	a4,a1,98 <f0+0xc>
  94:	30b02823          	sw	a1,784(zero) # 310 <lvl>
  98:	31402783          	lw	a5,788(zero) # 314 <rec>
  9c:	00178793          	addi	a5,a5,1
  a0:	30f02a23          	sw	a5,788(zero) # 314 <rec>
  a4:	02a05863          	blez	a0,d4 <f0+0x48>
  a8:	00200793          	li	a5,2
  ac:	30002303          	lw	t1,768(zero) # 300 <func+0xc>
  b0:	02a7d663          	bge	a5,a0,dc <f0+0x50>
  b4:	00000793          	li	a5,0
  b8:	00200713          	li	a4,2
  bc:	ffd50513          	addi	a0,a0,-3
  c0:	00178793          	addi	a5,a5,1
  c4:	fea74ce3          	blt	a4,a0,bc <f0+0x30>
  c8:	00158593          	addi	a1,a1,1
  cc:	00078513          	mv	a0,a5
  d0:	00030067          	jr	t1
  d4:	00100513          	li	a0,1
  d8:	00008067          	ret
  dc:	00000793          	li	a5,0
  e0:	fe9ff06f          	j	c8 <f0+0x3c>

000000e4 <f1>:
  e4:	31002703          	lw	a4,784(zero) # 310 <lvl>
  e8:	00b75463          	bge	a4,a1,f0 <f1+0xc>
  ec:	30b02823          	sw	a1,784(zero) # 310 <lvl>
  f0:	31402783          	lw	a5,788(zero) # 314 <rec>
  f4:	00178793          	addi	a5,a5,1
  f8:	30f02a23          	sw	a5,788(zero) # 314 <rec>
  fc:	00a05a63          	blez	a0,110 <f1+0x2c>
 100:	2f402303          	lw	t1,756(zero) # 2f4 <func>
 104:	00158593          	addi	a1,a1,1
 108:	fff50513          	addi	a0,a0,-1
 10c:	00030067          	jr	t1
 110:	00100513          	li	a0,1
 114:	00008067          	ret

00000118 <f2>:
 118:	31002703          	lw	a4,784(zero) # 310 <lvl>
 11c:	00b75463          	bge	a4,a1,124 <f2+0xc>
 120:	30b02823          	sw	a1,784(zero) # 310 <lvl>
 124:	31402783          	lw	a5,788(zero) # 314 <rec>
 128:	00100693          	li	a3,1
 12c:	00178793          	addi	a5,a5,1
 130:	30f02a23          	sw	a5,788(zero) # 314 <rec>
 134:	02a05663          	blez	a0,160 <f2+0x48>
 138:	2f802783          	lw	a5,760(zero) # 2f8 <func+0x4>
 13c:	ff010113          	addi	sp,sp,-16 # 3ff0 <rec+0x3cdc>
 140:	00112623          	sw	ra,12(sp)
 144:	00158593          	addi	a1,a1,1
 148:	000780e7          	jalr	a5
 14c:	00c12083          	lw	ra,12(sp)
 150:	00950693          	addi	a3,a0,9
 154:	00068513          	mv	a0,a3
 158:	01010113          	addi	sp,sp,16
 15c:	00008067          	ret
 160:	00068513          	mv	a0,a3
 164:	00008067          	ret

00000168 <f3>:
 168:	31002703          	lw	a4,784(zero) # 310 <lvl>
 16c:	fe010113          	addi	sp,sp,-32
 170:	00112e23          	sw	ra,28(sp)
 174:	00812c23          	sw	s0,24(sp)
 178:	00912a23          	sw	s1,20(sp)
 17c:	01212823          	sw	s2,16(sp)
 180:	01312623          	sw	s3,12(sp)
 184:	00b75463          	bge	a4,a1,18c <f3+0x24>
 188:	30b02823          	sw	a1,784(zero) # 310 <lvl>
 18c:	31402783          	lw	a5,788(zero) # 314 <rec>
 190:	00100413          	li	s0,1
 194:	00178793          	addi	a5,a5,1
 198:	30f02a23          	sw	a5,788(zero) # 314 <rec>
 19c:	08a05c63          	blez	a0,234 <f3+0xcc>
 1a0:	2f400993          	li	s3,756
 1a4:	0089a783          	lw	a5,8(s3)
 1a8:	40155913          	srai	s2,a0,0x1
 1ac:	00158493          	addi	s1,a1,1
 1b0:	00048593          	mv	a1,s1
 1b4:	00090513          	mv	a0,s2
 1b8:	000780e7          	jalr	a5
 1bc:	00000413          	li	s0,0
 1c0:	00000793          	li	a5,0
 1c4:	00300693          	li	a3,3
 1c8:	02000593          	li	a1,32
 1cc:	0016f713          	andi	a4,a3,1
 1d0:	00f51633          	sll	a2,a0,a5
 1d4:	00178793          	addi	a5,a5,1
 1d8:	00070463          	beqz	a4,1e0 <f3+0x78>
 1dc:	00c40433          	add	s0,s0,a2
 1e0:	4016d693          	srai	a3,a3,0x1
 1e4:	feb794e3          	bne	a5,a1,1cc <f3+0x64>
 1e8:	0089a783          	lw	a5,8(s3)
 1ec:	00048593          	mv	a1,s1
 1f0:	00090513          	mv	a0,s2
 1f4:	000780e7          	jalr	a5
 1f8:	00000793          	li	a5,0
 1fc:	00200713          	li	a4,2
 200:	00000613          	li	a2,0
 204:	02000593          	li	a1,32
 208:	00178793          	addi	a5,a5,1
 20c:	00f516b3          	sll	a3,a0,a5
 210:	40175713          	srai	a4,a4,0x1
 214:	00b78e63          	beq	a5,a1,230 <f3+0xc8>
 218:	fe0708e3          	beqz	a4,208 <f3+0xa0>
 21c:	00178793          	addi	a5,a5,1
 220:	00d60633          	add	a2,a2,a3
 224:	40175713          	srai	a4,a4,0x1
 228:	00f516b3          	sll	a3,a0,a5
 22c:	feb796e3          	bne	a5,a1,218 <f3+0xb0>
 230:	00c40433          	add	s0,s0,a2
 234:	00040513          	mv	a0,s0
 238:	01c12083          	lw	ra,28(sp)
 23c:	01812403          	lw	s0,24(sp)
 240:	01412483          	lw	s1,20(sp)
 244:	01012903          	lw	s2,16(sp)
 248:	00c12983          	lw	s3,12(sp)
 24c:	02010113          	addi	sp,sp,32
 250:	00008067          	ret

00000254 <_halt>:
 254:	000007b7          	lui	a5,0x0
 258:	00a7a623          	sw	a0,12(a5) # c <global_result>
 25c:	0000006f          	j	25c <_halt+0x8>

00000260 <nemu_assert>:
 260:	00051a63          	bnez	a0,274 <nemu_assert+0x14>
 264:	000007b7          	lui	a5,0x0
 268:	00100713          	li	a4,1
 26c:	00e7a623          	sw	a4,12(a5) # c <global_result>
 270:	0000006f          	j	270 <nemu_assert+0x10>
 274:	00008067          	ret

00000278 <hit_good_trap>:
 278:	000007b7          	lui	a5,0x0
 27c:	0007a623          	sw	zero,12(a5) # c <global_result>
 280:	0000006f          	j	280 <hit_good_trap+0x8>

Disassembly of section .text.startup:

00000284 <main>:
 284:	ff010113          	addi	sp,sp,-16
 288:	00812423          	sw	s0,8(sp)
 28c:	2f400413          	li	s0,756
 290:	00042783          	lw	a5,0(s0)
 294:	00004537          	lui	a0,0x4
 298:	00112623          	sw	ra,12(sp)
 29c:	00000593          	li	a1,0
 2a0:	82350513          	addi	a0,a0,-2013 # 3823 <rec+0x350f>
 2a4:	000780e7          	jalr	a5
 2a8:	01042783          	lw	a5,16(s0)
 2ac:	40a78533          	sub	a0,a5,a0
 2b0:	00153513          	seqz	a0,a0
 2b4:	fadff0ef          	jal	ra,260 <nemu_assert>
 2b8:	01442503          	lw	a0,20(s0)
 2bc:	31402783          	lw	a5,788(zero) # 314 <rec>
 2c0:	40f50533          	sub	a0,a0,a5
 2c4:	00153513          	seqz	a0,a0
 2c8:	f99ff0ef          	jal	ra,260 <nemu_assert>
 2cc:	01842503          	lw	a0,24(s0)
 2d0:	31002783          	lw	a5,784(zero) # 310 <lvl>
 2d4:	40f50533          	sub	a0,a0,a5
 2d8:	00153513          	seqz	a0,a0
 2dc:	f85ff0ef          	jal	ra,260 <nemu_assert>
 2e0:	00c12083          	lw	ra,12(sp)
 2e4:	00812403          	lw	s0,8(sp)
 2e8:	00000513          	li	a0,0
 2ec:	01010113          	addi	sp,sp,16
 2f0:	00008067          	ret

Disassembly of section .data:

000002f4 <func>:
 2f4:	008c                	addi	a1,sp,64
 2f6:	0000                	unimp
 2f8:	00e4                	addi	s1,sp,76
 2fa:	0000                	unimp
 2fc:	0118                	addi	a4,sp,128
 2fe:	0000                	unimp
 300:	0168                	addi	a0,sp,140
	...

00000304 <ans>:
 304:	957e                	add	a0,a0,t6
 306:	0000                	unimp
 308:	00da                	slli	ra,ra,0x16
 30a:	0000                	unimp
 30c:	0014                	0x14
	...

Disassembly of section .sbss:

00000310 <lvl>:
 310:	0000                	unimp
	...

00000314 <rec>:
 314:	0000                	unimp
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
