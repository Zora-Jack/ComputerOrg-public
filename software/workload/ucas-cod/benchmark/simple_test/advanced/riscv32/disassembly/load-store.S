
../riscv32/elf/load-store:     file format elf32-littleriscv


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
  84:	038000ef          	jal	ra,bc <main>
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

Disassembly of section .text.startup:

000000bc <main>:
  bc:	fe010113          	addi	sp,sp,-32 # 3fe0 <sh_ans+0x3d04>
  c0:	00812c23          	sw	s0,24(sp)
  c4:	00912a23          	sw	s1,20(sp)
  c8:	27800493          	li	s1,632
  cc:	01212823          	sw	s2,16(sp)
  d0:	01312623          	sw	s3,12(sp)
  d4:	01412423          	sw	s4,8(sp)
  d8:	27800913          	li	s2,632
  dc:	00112e23          	sw	ra,28(sp)
  e0:	01448993          	addi	s3,s1,20
  e4:	01048a13          	addi	s4,s1,16
  e8:	27800413          	li	s0,632
  ec:	00041503          	lh	a0,0(s0)
  f0:	0009a783          	lw	a5,0(s3)
  f4:	00240413          	addi	s0,s0,2
  f8:	00498993          	addi	s3,s3,4
  fc:	40f50533          	sub	a0,a0,a5
 100:	00153513          	seqz	a0,a0
 104:	f95ff0ef          	jal	ra,98 <nemu_assert>
 108:	ff4412e3          	bne	s0,s4,ec <main+0x30>
 10c:	03490413          	addi	s0,s2,52
 110:	0004d503          	lhu	a0,0(s1)
 114:	00042783          	lw	a5,0(s0)
 118:	00248493          	addi	s1,s1,2
 11c:	00440413          	addi	s0,s0,4
 120:	40f50533          	sub	a0,a0,a5
 124:	00153513          	seqz	a0,a0
 128:	f71ff0ef          	jal	ra,98 <nemu_assert>
 12c:	ff4492e3          	bne	s1,s4,110 <main+0x54>
 130:	00294703          	lbu	a4,2(s2)
 134:	00194683          	lbu	a3,1(s2)
 138:	00394783          	lbu	a5,3(s2)
 13c:	00494503          	lbu	a0,4(s2)
 140:	00871713          	slli	a4,a4,0x8
 144:	00d76733          	or	a4,a4,a3
 148:	01079793          	slli	a5,a5,0x10
 14c:	05492683          	lw	a3,84(s2)
 150:	00e7e7b3          	or	a5,a5,a4
 154:	01851513          	slli	a0,a0,0x18
 158:	00f56533          	or	a0,a0,a5
 15c:	40a68533          	sub	a0,a3,a0
 160:	00153513          	seqz	a0,a0
 164:	f35ff0ef          	jal	ra,98 <nemu_assert>
 168:	00694703          	lbu	a4,6(s2)
 16c:	00594683          	lbu	a3,5(s2)
 170:	00794783          	lbu	a5,7(s2)
 174:	00894503          	lbu	a0,8(s2)
 178:	00871713          	slli	a4,a4,0x8
 17c:	00d76733          	or	a4,a4,a3
 180:	01079793          	slli	a5,a5,0x10
 184:	05892683          	lw	a3,88(s2)
 188:	00e7e7b3          	or	a5,a5,a4
 18c:	01851513          	slli	a0,a0,0x18
 190:	00f56533          	or	a0,a0,a5
 194:	40a68533          	sub	a0,a3,a0
 198:	00153513          	seqz	a0,a0
 19c:	efdff0ef          	jal	ra,98 <nemu_assert>
 1a0:	00a94703          	lbu	a4,10(s2)
 1a4:	00994683          	lbu	a3,9(s2)
 1a8:	00b94783          	lbu	a5,11(s2)
 1ac:	00c94503          	lbu	a0,12(s2)
 1b0:	00871713          	slli	a4,a4,0x8
 1b4:	00d76733          	or	a4,a4,a3
 1b8:	01079793          	slli	a5,a5,0x10
 1bc:	05c92683          	lw	a3,92(s2)
 1c0:	00e7e7b3          	or	a5,a5,a4
 1c4:	01851513          	slli	a0,a0,0x18
 1c8:	00f56533          	or	a0,a0,a5
 1cc:	40d50533          	sub	a0,a0,a3
 1d0:	00153513          	seqz	a0,a0
 1d4:	ec5ff0ef          	jal	ra,98 <nemu_assert>
 1d8:	00e94703          	lbu	a4,14(s2)
 1dc:	00d94683          	lbu	a3,13(s2)
 1e0:	00f94783          	lbu	a5,15(s2)
 1e4:	01094503          	lbu	a0,16(s2)
 1e8:	00871713          	slli	a4,a4,0x8
 1ec:	00d76733          	or	a4,a4,a3
 1f0:	01079793          	slli	a5,a5,0x10
 1f4:	06092683          	lw	a3,96(s2)
 1f8:	00e7e7b3          	or	a5,a5,a4
 1fc:	01851513          	slli	a0,a0,0x18
 200:	00f56533          	or	a0,a0,a5
 204:	40a68533          	sub	a0,a3,a0
 208:	00153513          	seqz	a0,a0
 20c:	e8dff0ef          	jal	ra,98 <nemu_assert>
 210:	06490493          	addi	s1,s2,100
 214:	00100413          	li	s0,1
 218:	00100a13          	li	s4,1
 21c:	01100993          	li	s3,17
 220:	008a17b3          	sll	a5,s4,s0
 224:	0004a503          	lw	a0,0(s1)
 228:	fff7c793          	not	a5,a5
 22c:	01079793          	slli	a5,a5,0x10
 230:	0107d793          	srli	a5,a5,0x10
 234:	00890733          	add	a4,s2,s0
 238:	40f50533          	sub	a0,a0,a5
 23c:	00240413          	addi	s0,s0,2
 240:	00153513          	seqz	a0,a0
 244:	fef71fa3          	sh	a5,-1(a4)
 248:	00448493          	addi	s1,s1,4
 24c:	e4dff0ef          	jal	ra,98 <nemu_assert>
 250:	fd3418e3          	bne	s0,s3,220 <main+0x164>
 254:	01c12083          	lw	ra,28(sp)
 258:	01812403          	lw	s0,24(sp)
 25c:	01412483          	lw	s1,20(sp)
 260:	01012903          	lw	s2,16(sp)
 264:	00c12983          	lw	s3,12(sp)
 268:	00812a03          	lw	s4,8(sp)
 26c:	00000513          	li	a0,0
 270:	02010113          	addi	sp,sp,32
 274:	00008067          	ret

Disassembly of section .data:

00000278 <mem>:
 278:	0000                	unimp
 27a:	0258                	addi	a4,sp,260
 27c:	4abc                	lw	a5,80(a3)
 27e:	7fff                	0x7fff
 280:	8000                	0x8000
 282:	8100                	0x8100
 284:	abcd                	j	876 <sh_ans+0x59a>
 286:	ffff                	0xffff
 288:	0000                	unimp
	...

0000028c <lh_ans>:
 28c:	0000                	unimp
 28e:	0000                	unimp
 290:	0258                	addi	a4,sp,260
 292:	0000                	unimp
 294:	4abc                	lw	a5,80(a3)
 296:	0000                	unimp
 298:	7fff                	0x7fff
 29a:	0000                	unimp
 29c:	8000                	0x8000
 29e:	ffff                	0xffff
 2a0:	8100                	0x8100
 2a2:	ffff                	0xffff
 2a4:	abcd                	j	896 <sh_ans+0x5ba>
 2a6:	ffff                	0xffff
 2a8:	ffff                	0xffff
 2aa:	ffff                	0xffff

000002ac <lhu_ans>:
 2ac:	0000                	unimp
 2ae:	0000                	unimp
 2b0:	0258                	addi	a4,sp,260
 2b2:	0000                	unimp
 2b4:	4abc                	lw	a5,80(a3)
 2b6:	0000                	unimp
 2b8:	7fff                	0x7fff
 2ba:	0000                	unimp
 2bc:	8000                	0x8000
 2be:	0000                	unimp
 2c0:	8100                	0x8100
 2c2:	0000                	unimp
 2c4:	abcd                	j	8b6 <sh_ans+0x5da>
 2c6:	0000                	unimp
 2c8:	ffff                	0xffff
	...

000002cc <lwlr_ans>:
 2cc:	5800                	lw	s0,48(s0)
 2ce:	bc02                	fsd	ft0,56(sp)
 2d0:	ff4a                	fsw	fs2,188(sp)
 2d2:	007f                	0x7f
 2d4:	0080                	addi	s0,sp,64
 2d6:	cd81                	beqz	a1,2ee <sh_ans+0x12>
 2d8:	00ffffab          	0xffffab

000002dc <sh_ans>:
 2dc:	fffd                	bnez	a5,2da <lwlr_ans+0xe>
 2de:	0000                	unimp
 2e0:	0000fff7          	0xfff7
 2e4:	ffdf 0000 ff7f      	0xff7f0000ffdf
 2ea:	0000                	unimp
 2ec:	fdff                	0xfdff
 2ee:	0000                	unimp
 2f0:	f7ff                	0xf7ff
 2f2:	0000                	unimp
 2f4:	dfff                	0xdfff
 2f6:	0000                	unimp
 2f8:	7fff                	0x7fff
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
