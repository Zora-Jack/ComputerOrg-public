
../riscv32/elf/quick-sort:     file format elf32-littleriscv


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
  84:	148000ef          	jal	ra,1cc <main>
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

000000bc <partition>:
  bc:	00259793          	slli	a5,a1,0x2
  c0:	00f50333          	add	t1,a0,a5
  c4:	00032883          	lw	a7,0(t1)
  c8:	08c5d663          	bge	a1,a2,154 <partition+0x98>
  cc:	00261693          	slli	a3,a2,0x2
  d0:	00d506b3          	add	a3,a0,a3
  d4:	0006a703          	lw	a4,0(a3)
  d8:	00068813          	mv	a6,a3
  dc:	02e8dc63          	bge	a7,a4,114 <partition+0x58>
  e0:	fff60613          	addi	a2,a2,-1
  e4:	ffc80693          	addi	a3,a6,-4
  e8:	fec5c6e3          	blt	a1,a2,d4 <partition+0x18>
  ec:	00261613          	slli	a2,a2,0x2
  f0:	00c50833          	add	a6,a0,a2
  f4:	00082703          	lw	a4,0(a6)
  f8:	00f50333          	add	t1,a0,a5
  fc:	00058613          	mv	a2,a1
 100:	00e32023          	sw	a4,0(t1)
 104:	00e82023          	sw	a4,0(a6)
 108:	00060513          	mv	a0,a2
 10c:	01132023          	sw	a7,0(t1)
 110:	00008067          	ret
 114:	00f50333          	add	t1,a0,a5
 118:	00e32023          	sw	a4,0(t1)
 11c:	02c5d863          	bge	a1,a2,14c <partition+0x90>
 120:	00478793          	addi	a5,a5,4
 124:	00f507b3          	add	a5,a0,a5
 128:	00158593          	addi	a1,a1,1
 12c:	0007a703          	lw	a4,0(a5)
 130:	00078313          	mv	t1,a5
 134:	fcc588e3          	beq	a1,a2,104 <partition+0x48>
 138:	00478793          	addi	a5,a5,4
 13c:	fee8d6e3          	bge	a7,a4,128 <partition+0x6c>
 140:	00e6a023          	sw	a4,0(a3)
 144:	00259793          	slli	a5,a1,0x2
 148:	f85ff06f          	j	cc <partition+0x10>
 14c:	00058613          	mv	a2,a1
 150:	fb5ff06f          	j	104 <partition+0x48>
 154:	00058513          	mv	a0,a1
 158:	01132023          	sw	a7,0(t1)
 15c:	00008067          	ret

00000160 <quick_sort>:
 160:	06c5d463          	bge	a1,a2,1c8 <quick_sort+0x68>
 164:	ff010113          	addi	sp,sp,-16 # 3ff0 <a+0x3d64>
 168:	00812423          	sw	s0,8(sp)
 16c:	00912223          	sw	s1,4(sp)
 170:	01212023          	sw	s2,0(sp)
 174:	00112623          	sw	ra,12(sp)
 178:	00058413          	mv	s0,a1
 17c:	00060493          	mv	s1,a2
 180:	00050913          	mv	s2,a0
 184:	00040593          	mv	a1,s0
 188:	00048613          	mv	a2,s1
 18c:	00090513          	mv	a0,s2
 190:	f2dff0ef          	jal	ra,bc <partition>
 194:	00050793          	mv	a5,a0
 198:	00040593          	mv	a1,s0
 19c:	fff50613          	addi	a2,a0,-1
 1a0:	00178413          	addi	s0,a5,1
 1a4:	00090513          	mv	a0,s2
 1a8:	fb9ff0ef          	jal	ra,160 <quick_sort>
 1ac:	fc944ce3          	blt	s0,s1,184 <quick_sort+0x24>
 1b0:	00c12083          	lw	ra,12(sp)
 1b4:	00812403          	lw	s0,8(sp)
 1b8:	00412483          	lw	s1,4(sp)
 1bc:	00012903          	lw	s2,0(sp)
 1c0:	01010113          	addi	sp,sp,16
 1c4:	00008067          	ret
 1c8:	00008067          	ret

Disassembly of section .text.startup:

000001cc <main>:
 1cc:	fe010113          	addi	sp,sp,-32
 1d0:	01412423          	sw	s4,8(sp)
 1d4:	01300613          	li	a2,19
 1d8:	00000593          	li	a1,0
 1dc:	28c00513          	li	a0,652
 1e0:	00812c23          	sw	s0,24(sp)
 1e4:	00912a23          	sw	s1,20(sp)
 1e8:	01212823          	sw	s2,16(sp)
 1ec:	01312623          	sw	s3,12(sp)
 1f0:	00112e23          	sw	ra,28(sp)
 1f4:	28c00493          	li	s1,652
 1f8:	f69ff0ef          	jal	ra,160 <quick_sort>
 1fc:	28c00913          	li	s2,652
 200:	00000413          	li	s0,0
 204:	01400993          	li	s3,20
 208:	00092503          	lw	a0,0(s2)
 20c:	00490913          	addi	s2,s2,4
 210:	40850533          	sub	a0,a0,s0
 214:	00153513          	seqz	a0,a0
 218:	00140413          	addi	s0,s0,1
 21c:	e7dff0ef          	jal	ra,98 <nemu_assert>
 220:	ff3414e3          	bne	s0,s3,208 <main+0x3c>
 224:	00100513          	li	a0,1
 228:	e71ff0ef          	jal	ra,98 <nemu_assert>
 22c:	01300613          	li	a2,19
 230:	00000593          	li	a1,0
 234:	28c00513          	li	a0,652
 238:	f29ff0ef          	jal	ra,160 <quick_sort>
 23c:	00000413          	li	s0,0
 240:	01400913          	li	s2,20
 244:	0004a503          	lw	a0,0(s1)
 248:	00448493          	addi	s1,s1,4
 24c:	40850533          	sub	a0,a0,s0
 250:	00153513          	seqz	a0,a0
 254:	00140413          	addi	s0,s0,1
 258:	e41ff0ef          	jal	ra,98 <nemu_assert>
 25c:	ff2414e3          	bne	s0,s2,244 <main+0x78>
 260:	00100513          	li	a0,1
 264:	e35ff0ef          	jal	ra,98 <nemu_assert>
 268:	01c12083          	lw	ra,28(sp)
 26c:	01812403          	lw	s0,24(sp)
 270:	01412483          	lw	s1,20(sp)
 274:	01012903          	lw	s2,16(sp)
 278:	00c12983          	lw	s3,12(sp)
 27c:	00812a03          	lw	s4,8(sp)
 280:	00000513          	li	a0,0
 284:	02010113          	addi	sp,sp,32
 288:	00008067          	ret

Disassembly of section .data:

0000028c <a>:
 28c:	0002                	c.slli64	zero
 28e:	0000                	unimp
 290:	000c                	0xc
 292:	0000                	unimp
 294:	000e                	c.slli	zero,0x3
 296:	0000                	unimp
 298:	0006                	c.slli	zero,0x1
 29a:	0000                	unimp
 29c:	000d                	c.nop	3
 29e:	0000                	unimp
 2a0:	0000000f          	fence	unknown,unknown
 2a4:	0010                	0x10
 2a6:	0000                	unimp
 2a8:	000a                	c.slli	zero,0x2
 2aa:	0000                	unimp
 2ac:	0000                	unimp
 2ae:	0000                	unimp
 2b0:	0012                	c.slli	zero,0x4
 2b2:	0000                	unimp
 2b4:	0000000b          	0xb
 2b8:	00000013          	nop
 2bc:	0009                	c.nop	2
 2be:	0000                	unimp
 2c0:	0001                	nop
 2c2:	0000                	unimp
 2c4:	00000007          	0x7
 2c8:	0005                	c.nop	1
 2ca:	0000                	unimp
 2cc:	0004                	0x4
 2ce:	0000                	unimp
 2d0:	00000003          	lb	zero,0(zero) # 0 <start>
 2d4:	0008                	0x8
 2d6:	0000                	unimp
 2d8:	0011                	c.nop	4
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
