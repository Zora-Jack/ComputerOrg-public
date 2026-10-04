
../riscv32/elf/select-sort:     file format elf32-littleriscv


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
  84:	184000ef          	jal	ra,208 <main>
  88:	05c000ef          	jal	ra,e4 <hit_good_trap>

0000008c <_halt>:
  8c:	fe010113          	addi	sp,sp,-32 # 3fe0 <a+0x3ce0>
  90:	00812e23          	sw	s0,28(sp)
  94:	02010413          	addi	s0,sp,32
  98:	fea42623          	sw	a0,-20(s0)
  9c:	000007b7          	lui	a5,0x0
  a0:	fec42703          	lw	a4,-20(s0)
  a4:	00e7a623          	sw	a4,12(a5) # c <global_result>
  a8:	0000006f          	j	a8 <_halt+0x1c>

000000ac <nemu_assert>:
  ac:	fe010113          	addi	sp,sp,-32
  b0:	00112e23          	sw	ra,28(sp)
  b4:	00812c23          	sw	s0,24(sp)
  b8:	02010413          	addi	s0,sp,32
  bc:	fea42623          	sw	a0,-20(s0)
  c0:	fec42783          	lw	a5,-20(s0)
  c4:	00079663          	bnez	a5,d0 <nemu_assert+0x24>
  c8:	00100513          	li	a0,1
  cc:	fc1ff0ef          	jal	ra,8c <_halt>
  d0:	00000013          	nop
  d4:	01c12083          	lw	ra,28(sp)
  d8:	01812403          	lw	s0,24(sp)
  dc:	02010113          	addi	sp,sp,32
  e0:	00008067          	ret

000000e4 <hit_good_trap>:
  e4:	ff010113          	addi	sp,sp,-16
  e8:	00112623          	sw	ra,12(sp)
  ec:	00812423          	sw	s0,8(sp)
  f0:	01010413          	addi	s0,sp,16
  f4:	00000513          	li	a0,0
  f8:	f95ff0ef          	jal	ra,8c <_halt>
  fc:	00000013          	nop
 100:	00c12083          	lw	ra,12(sp)
 104:	00812403          	lw	s0,8(sp)
 108:	01010113          	addi	sp,sp,16
 10c:	00008067          	ret

00000110 <select_sort>:
 110:	fe010113          	addi	sp,sp,-32
 114:	00812e23          	sw	s0,28(sp)
 118:	02010413          	addi	s0,sp,32
 11c:	fe042623          	sw	zero,-20(s0)
 120:	0cc0006f          	j	1ec <select_sort+0xdc>
 124:	fec42783          	lw	a5,-20(s0)
 128:	fef42223          	sw	a5,-28(s0)
 12c:	fec42783          	lw	a5,-20(s0)
 130:	00178793          	addi	a5,a5,1
 134:	fef42423          	sw	a5,-24(s0)
 138:	0440006f          	j	17c <select_sort+0x6c>
 13c:	fe842703          	lw	a4,-24(s0)
 140:	00271713          	slli	a4,a4,0x2
 144:	30000793          	li	a5,768
 148:	00f707b3          	add	a5,a4,a5
 14c:	0007a703          	lw	a4,0(a5)
 150:	fe442683          	lw	a3,-28(s0)
 154:	00269693          	slli	a3,a3,0x2
 158:	30000793          	li	a5,768
 15c:	00f687b3          	add	a5,a3,a5
 160:	0007a783          	lw	a5,0(a5)
 164:	00f75663          	bge	a4,a5,170 <select_sort+0x60>
 168:	fe842783          	lw	a5,-24(s0)
 16c:	fef42223          	sw	a5,-28(s0)
 170:	fe842783          	lw	a5,-24(s0)
 174:	00178793          	addi	a5,a5,1
 178:	fef42423          	sw	a5,-24(s0)
 17c:	fe842703          	lw	a4,-24(s0)
 180:	01300793          	li	a5,19
 184:	fae7dce3          	bge	a5,a4,13c <select_sort+0x2c>
 188:	fec42703          	lw	a4,-20(s0)
 18c:	00271713          	slli	a4,a4,0x2
 190:	30000793          	li	a5,768
 194:	00f707b3          	add	a5,a4,a5
 198:	0007a783          	lw	a5,0(a5)
 19c:	fef42023          	sw	a5,-32(s0)
 1a0:	fe442703          	lw	a4,-28(s0)
 1a4:	00271713          	slli	a4,a4,0x2
 1a8:	30000793          	li	a5,768
 1ac:	00f707b3          	add	a5,a4,a5
 1b0:	0007a703          	lw	a4,0(a5)
 1b4:	fec42683          	lw	a3,-20(s0)
 1b8:	00269693          	slli	a3,a3,0x2
 1bc:	30000793          	li	a5,768
 1c0:	00f687b3          	add	a5,a3,a5
 1c4:	00e7a023          	sw	a4,0(a5)
 1c8:	fe442703          	lw	a4,-28(s0)
 1cc:	00271713          	slli	a4,a4,0x2
 1d0:	30000793          	li	a5,768
 1d4:	00f707b3          	add	a5,a4,a5
 1d8:	fe042703          	lw	a4,-32(s0)
 1dc:	00e7a023          	sw	a4,0(a5)
 1e0:	fec42783          	lw	a5,-20(s0)
 1e4:	00178793          	addi	a5,a5,1
 1e8:	fef42623          	sw	a5,-20(s0)
 1ec:	fec42703          	lw	a4,-20(s0)
 1f0:	01200793          	li	a5,18
 1f4:	f2e7d8e3          	bge	a5,a4,124 <select_sort+0x14>
 1f8:	00000013          	nop
 1fc:	01c12403          	lw	s0,28(sp)
 200:	02010113          	addi	sp,sp,32
 204:	00008067          	ret

00000208 <main>:
 208:	fe010113          	addi	sp,sp,-32
 20c:	00112e23          	sw	ra,28(sp)
 210:	00812c23          	sw	s0,24(sp)
 214:	02010413          	addi	s0,sp,32
 218:	ef9ff0ef          	jal	ra,110 <select_sort>
 21c:	fe042623          	sw	zero,-20(s0)
 220:	03c0006f          	j	25c <main+0x54>
 224:	fec42703          	lw	a4,-20(s0)
 228:	00271713          	slli	a4,a4,0x2
 22c:	30000793          	li	a5,768
 230:	00f707b3          	add	a5,a4,a5
 234:	0007a783          	lw	a5,0(a5)
 238:	fec42703          	lw	a4,-20(s0)
 23c:	40f707b3          	sub	a5,a4,a5
 240:	0017b793          	seqz	a5,a5
 244:	0ff7f793          	andi	a5,a5,255
 248:	00078513          	mv	a0,a5
 24c:	e61ff0ef          	jal	ra,ac <nemu_assert>
 250:	fec42783          	lw	a5,-20(s0)
 254:	00178793          	addi	a5,a5,1
 258:	fef42623          	sw	a5,-20(s0)
 25c:	fec42703          	lw	a4,-20(s0)
 260:	01300793          	li	a5,19
 264:	fce7d0e3          	bge	a5,a4,224 <main+0x1c>
 268:	fec42783          	lw	a5,-20(s0)
 26c:	fec78793          	addi	a5,a5,-20
 270:	0017b793          	seqz	a5,a5
 274:	0ff7f793          	andi	a5,a5,255
 278:	00078513          	mv	a0,a5
 27c:	e31ff0ef          	jal	ra,ac <nemu_assert>
 280:	e91ff0ef          	jal	ra,110 <select_sort>
 284:	fe042623          	sw	zero,-20(s0)
 288:	03c0006f          	j	2c4 <main+0xbc>
 28c:	fec42703          	lw	a4,-20(s0)
 290:	00271713          	slli	a4,a4,0x2
 294:	30000793          	li	a5,768
 298:	00f707b3          	add	a5,a4,a5
 29c:	0007a783          	lw	a5,0(a5)
 2a0:	fec42703          	lw	a4,-20(s0)
 2a4:	40f707b3          	sub	a5,a4,a5
 2a8:	0017b793          	seqz	a5,a5
 2ac:	0ff7f793          	andi	a5,a5,255
 2b0:	00078513          	mv	a0,a5
 2b4:	df9ff0ef          	jal	ra,ac <nemu_assert>
 2b8:	fec42783          	lw	a5,-20(s0)
 2bc:	00178793          	addi	a5,a5,1
 2c0:	fef42623          	sw	a5,-20(s0)
 2c4:	fec42703          	lw	a4,-20(s0)
 2c8:	01300793          	li	a5,19
 2cc:	fce7d0e3          	bge	a5,a4,28c <main+0x84>
 2d0:	fec42783          	lw	a5,-20(s0)
 2d4:	fec78793          	addi	a5,a5,-20
 2d8:	0017b793          	seqz	a5,a5
 2dc:	0ff7f793          	andi	a5,a5,255
 2e0:	00078513          	mv	a0,a5
 2e4:	dc9ff0ef          	jal	ra,ac <nemu_assert>
 2e8:	00000793          	li	a5,0
 2ec:	00078513          	mv	a0,a5
 2f0:	01c12083          	lw	ra,28(sp)
 2f4:	01812403          	lw	s0,24(sp)
 2f8:	02010113          	addi	sp,sp,32
 2fc:	00008067          	ret

Disassembly of section .data:

00000300 <a>:
 300:	0002                	c.slli64	zero
 302:	0000                	unimp
 304:	000c                	0xc
 306:	0000                	unimp
 308:	000e                	c.slli	zero,0x3
 30a:	0000                	unimp
 30c:	0006                	c.slli	zero,0x1
 30e:	0000                	unimp
 310:	000d                	c.nop	3
 312:	0000                	unimp
 314:	0000000f          	fence	unknown,unknown
 318:	0010                	0x10
 31a:	0000                	unimp
 31c:	000a                	c.slli	zero,0x2
 31e:	0000                	unimp
 320:	0000                	unimp
 322:	0000                	unimp
 324:	0012                	c.slli	zero,0x4
 326:	0000                	unimp
 328:	0000000b          	0xb
 32c:	00000013          	nop
 330:	0009                	c.nop	2
 332:	0000                	unimp
 334:	0001                	nop
 336:	0000                	unimp
 338:	00000007          	0x7
 33c:	0005                	c.nop	1
 33e:	0000                	unimp
 340:	0004                	0x4
 342:	0000                	unimp
 344:	00000003          	lb	zero,0(zero) # 0 <start>
 348:	0008                	0x8
 34a:	0000                	unimp
 34c:	0011                	c.nop	4
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
