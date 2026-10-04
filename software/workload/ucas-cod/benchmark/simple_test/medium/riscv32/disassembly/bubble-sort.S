
../riscv32/elf/bubble-sort:     file format elf32-littleriscv


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
  84:	07c000ef          	jal	ra,100 <main>
  88:	028000ef          	jal	ra,b0 <hit_good_trap>

0000008c <_halt>:
  8c:	000007b7          	lui	a5,0x0
  90:	00a7a623          	sw	a0,12(a5) # c <global_result>
  94:	0000006f          	j	94 <_halt+0x8>

00000098 <nemu_assert>:
  98:	00051a63          	bnez	a0,ac <nemu_assert+0x14>
  9c:	000007b7          	lui	a5,0x0
  a0:	00100713          	li	a4,1
  a4:	00e7a623          	sw	a4,12(a5) # c <global_result>
  a8:	0000006f          	j	a8 <nemu_assert+0x10>
  ac:	00008067          	ret

000000b0 <hit_good_trap>:
  b0:	000007b7          	lui	a5,0x0
  b4:	0007a623          	sw	zero,12(a5) # c <global_result>
  b8:	0000006f          	j	b8 <hit_good_trap+0x8>

000000bc <bubble_sort>:
  bc:	01300593          	li	a1,19
  c0:	21c00513          	li	a0,540
  c4:	fff00813          	li	a6,-1
  c8:	00000713          	li	a4,0
  cc:	00050793          	mv	a5,a0
  d0:	02b75263          	bge	a4,a1,f4 <bubble_sort+0x38>
  d4:	0007a683          	lw	a3,0(a5)
  d8:	0047a603          	lw	a2,4(a5)
  dc:	00170713          	addi	a4,a4,1
  e0:	00d65663          	bge	a2,a3,ec <bubble_sort+0x30>
  e4:	00c7a023          	sw	a2,0(a5)
  e8:	00d7a223          	sw	a3,4(a5)
  ec:	00478793          	addi	a5,a5,4
  f0:	feb742e3          	blt	a4,a1,d4 <bubble_sort+0x18>
  f4:	fff58593          	addi	a1,a1,-1
  f8:	fd0598e3          	bne	a1,a6,c8 <bubble_sort+0xc>
  fc:	00008067          	ret

Disassembly of section .text.startup:

00000100 <main>:
 100:	fe010113          	addi	sp,sp,-32 # 3fe0 <a+0x3dc4>
 104:	01212823          	sw	s2,16(sp)
 108:	00112e23          	sw	ra,28(sp)
 10c:	00812c23          	sw	s0,24(sp)
 110:	00912a23          	sw	s1,20(sp)
 114:	01312623          	sw	s3,12(sp)
 118:	01412423          	sw	s4,8(sp)
 11c:	01300593          	li	a1,19
 120:	21c00913          	li	s2,540
 124:	fff00513          	li	a0,-1
 128:	00000713          	li	a4,0
 12c:	00090493          	mv	s1,s2
 130:	00090793          	mv	a5,s2
 134:	02b75263          	bge	a4,a1,158 <main+0x58>
 138:	0007a683          	lw	a3,0(a5)
 13c:	0047a603          	lw	a2,4(a5)
 140:	00170713          	addi	a4,a4,1
 144:	00d65663          	bge	a2,a3,150 <main+0x50>
 148:	00c7a023          	sw	a2,0(a5)
 14c:	00d7a223          	sw	a3,4(a5)
 150:	00478793          	addi	a5,a5,4
 154:	feb742e3          	blt	a4,a1,138 <main+0x38>
 158:	fff58593          	addi	a1,a1,-1
 15c:	fca596e3          	bne	a1,a0,128 <main+0x28>
 160:	00090993          	mv	s3,s2
 164:	00000413          	li	s0,0
 168:	01400a13          	li	s4,20
 16c:	0009a503          	lw	a0,0(s3)
 170:	00498993          	addi	s3,s3,4
 174:	40850533          	sub	a0,a0,s0
 178:	00153513          	seqz	a0,a0
 17c:	00140413          	addi	s0,s0,1
 180:	f19ff0ef          	jal	ra,98 <nemu_assert>
 184:	ff4414e3          	bne	s0,s4,16c <main+0x6c>
 188:	00100513          	li	a0,1
 18c:	f0dff0ef          	jal	ra,98 <nemu_assert>
 190:	01300593          	li	a1,19
 194:	fff00513          	li	a0,-1
 198:	00000713          	li	a4,0
 19c:	00090793          	mv	a5,s2
 1a0:	02b75263          	bge	a4,a1,1c4 <main+0xc4>
 1a4:	0007a683          	lw	a3,0(a5)
 1a8:	0047a603          	lw	a2,4(a5)
 1ac:	00170713          	addi	a4,a4,1
 1b0:	00d65663          	bge	a2,a3,1bc <main+0xbc>
 1b4:	00c7a023          	sw	a2,0(a5)
 1b8:	00d7a223          	sw	a3,4(a5)
 1bc:	00478793          	addi	a5,a5,4
 1c0:	feb742e3          	blt	a4,a1,1a4 <main+0xa4>
 1c4:	fff58593          	addi	a1,a1,-1
 1c8:	fca598e3          	bne	a1,a0,198 <main+0x98>
 1cc:	00000413          	li	s0,0
 1d0:	01400913          	li	s2,20
 1d4:	0004a503          	lw	a0,0(s1)
 1d8:	00448493          	addi	s1,s1,4
 1dc:	40850533          	sub	a0,a0,s0
 1e0:	00153513          	seqz	a0,a0
 1e4:	00140413          	addi	s0,s0,1
 1e8:	eb1ff0ef          	jal	ra,98 <nemu_assert>
 1ec:	ff2414e3          	bne	s0,s2,1d4 <main+0xd4>
 1f0:	00100513          	li	a0,1
 1f4:	ea5ff0ef          	jal	ra,98 <nemu_assert>
 1f8:	01c12083          	lw	ra,28(sp)
 1fc:	01812403          	lw	s0,24(sp)
 200:	01412483          	lw	s1,20(sp)
 204:	01012903          	lw	s2,16(sp)
 208:	00c12983          	lw	s3,12(sp)
 20c:	00812a03          	lw	s4,8(sp)
 210:	00000513          	li	a0,0
 214:	02010113          	addi	sp,sp,32
 218:	00008067          	ret

Disassembly of section .data:

0000021c <a>:
 21c:	0002                	c.slli64	zero
 21e:	0000                	unimp
 220:	000c                	0xc
 222:	0000                	unimp
 224:	000e                	c.slli	zero,0x3
 226:	0000                	unimp
 228:	0006                	c.slli	zero,0x1
 22a:	0000                	unimp
 22c:	000d                	c.nop	3
 22e:	0000                	unimp
 230:	0000000f          	fence	unknown,unknown
 234:	0010                	0x10
 236:	0000                	unimp
 238:	000a                	c.slli	zero,0x2
 23a:	0000                	unimp
 23c:	0000                	unimp
 23e:	0000                	unimp
 240:	0012                	c.slli	zero,0x4
 242:	0000                	unimp
 244:	0000000b          	0xb
 248:	00000013          	nop
 24c:	0009                	c.nop	2
 24e:	0000                	unimp
 250:	0001                	nop
 252:	0000                	unimp
 254:	00000007          	0x7
 258:	0005                	c.nop	1
 25a:	0000                	unimp
 25c:	0004                	0x4
 25e:	0000                	unimp
 260:	00000003          	lb	zero,0(zero) # 0 <start>
 264:	0008                	0x8
 266:	0000                	unimp
 268:	0011                	c.nop	4
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
