
../riscv32/elf/min3:     file format elf32-littleriscv


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
  84:	0ec000ef          	jal	ra,170 <main>
  88:	05c000ef          	jal	ra,e4 <hit_good_trap>

0000008c <_halt>:
  8c:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3d10>
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

00000110 <min3>:
 110:	fd010113          	addi	sp,sp,-48
 114:	02812623          	sw	s0,44(sp)
 118:	03010413          	addi	s0,sp,48
 11c:	fca42e23          	sw	a0,-36(s0)
 120:	fcb42c23          	sw	a1,-40(s0)
 124:	fcc42a23          	sw	a2,-44(s0)
 128:	fdc42703          	lw	a4,-36(s0)
 12c:	fd842783          	lw	a5,-40(s0)
 130:	00f75863          	bge	a4,a5,140 <min3+0x30>
 134:	fdc42783          	lw	a5,-36(s0)
 138:	fef42623          	sw	a5,-20(s0)
 13c:	00c0006f          	j	148 <min3+0x38>
 140:	fd842783          	lw	a5,-40(s0)
 144:	fef42623          	sw	a5,-20(s0)
 148:	fd442703          	lw	a4,-44(s0)
 14c:	fec42783          	lw	a5,-20(s0)
 150:	00f75663          	bge	a4,a5,15c <min3+0x4c>
 154:	fd442783          	lw	a5,-44(s0)
 158:	fef42623          	sw	a5,-20(s0)
 15c:	fec42783          	lw	a5,-20(s0)
 160:	00078513          	mv	a0,a5
 164:	02c12403          	lw	s0,44(sp)
 168:	03010113          	addi	sp,sp,48
 16c:	00008067          	ret

00000170 <main>:
 170:	fe010113          	addi	sp,sp,-32
 174:	00112e23          	sw	ra,28(sp)
 178:	00812c23          	sw	s0,24(sp)
 17c:	02010413          	addi	s0,sp,32
 180:	fe042023          	sw	zero,-32(s0)
 184:	fe042623          	sw	zero,-20(s0)
 188:	0fc0006f          	j	284 <main+0x114>
 18c:	fe042423          	sw	zero,-24(s0)
 190:	0c40006f          	j	254 <main+0xe4>
 194:	fe042223          	sw	zero,-28(s0)
 198:	08c0006f          	j	224 <main+0xb4>
 19c:	fec42703          	lw	a4,-20(s0)
 1a0:	00271713          	slli	a4,a4,0x2
 1a4:	2c000793          	li	a5,704
 1a8:	00f707b3          	add	a5,a4,a5
 1ac:	0007a683          	lw	a3,0(a5)
 1b0:	fe842703          	lw	a4,-24(s0)
 1b4:	00271713          	slli	a4,a4,0x2
 1b8:	2c000793          	li	a5,704
 1bc:	00f707b3          	add	a5,a4,a5
 1c0:	0007a583          	lw	a1,0(a5)
 1c4:	fe442703          	lw	a4,-28(s0)
 1c8:	00271713          	slli	a4,a4,0x2
 1cc:	2c000793          	li	a5,704
 1d0:	00f707b3          	add	a5,a4,a5
 1d4:	0007a783          	lw	a5,0(a5)
 1d8:	00078613          	mv	a2,a5
 1dc:	00068513          	mv	a0,a3
 1e0:	f31ff0ef          	jal	ra,110 <min3>
 1e4:	00050613          	mv	a2,a0
 1e8:	fe042783          	lw	a5,-32(s0)
 1ec:	00178713          	addi	a4,a5,1
 1f0:	fee42023          	sw	a4,-32(s0)
 1f4:	00279713          	slli	a4,a5,0x2
 1f8:	2d000793          	li	a5,720
 1fc:	00f707b3          	add	a5,a4,a5
 200:	0007a783          	lw	a5,0(a5)
 204:	40f607b3          	sub	a5,a2,a5
 208:	0017b793          	seqz	a5,a5
 20c:	0ff7f793          	andi	a5,a5,255
 210:	00078513          	mv	a0,a5
 214:	e99ff0ef          	jal	ra,ac <nemu_assert>
 218:	fe442783          	lw	a5,-28(s0)
 21c:	00178793          	addi	a5,a5,1
 220:	fef42223          	sw	a5,-28(s0)
 224:	fe442703          	lw	a4,-28(s0)
 228:	00300793          	li	a5,3
 22c:	f6e7f8e3          	bgeu	a5,a4,19c <main+0x2c>
 230:	fe442783          	lw	a5,-28(s0)
 234:	ffc78793          	addi	a5,a5,-4
 238:	0017b793          	seqz	a5,a5
 23c:	0ff7f793          	andi	a5,a5,255
 240:	00078513          	mv	a0,a5
 244:	e69ff0ef          	jal	ra,ac <nemu_assert>
 248:	fe842783          	lw	a5,-24(s0)
 24c:	00178793          	addi	a5,a5,1
 250:	fef42423          	sw	a5,-24(s0)
 254:	fe842703          	lw	a4,-24(s0)
 258:	00300793          	li	a5,3
 25c:	f2e7fce3          	bgeu	a5,a4,194 <main+0x24>
 260:	fe842783          	lw	a5,-24(s0)
 264:	ffc78793          	addi	a5,a5,-4
 268:	0017b793          	seqz	a5,a5
 26c:	0ff7f793          	andi	a5,a5,255
 270:	00078513          	mv	a0,a5
 274:	e39ff0ef          	jal	ra,ac <nemu_assert>
 278:	fec42783          	lw	a5,-20(s0)
 27c:	00178793          	addi	a5,a5,1
 280:	fef42623          	sw	a5,-20(s0)
 284:	fec42703          	lw	a4,-20(s0)
 288:	00300793          	li	a5,3
 28c:	f0e7f0e3          	bgeu	a5,a4,18c <main+0x1c>
 290:	fec42783          	lw	a5,-20(s0)
 294:	ffc78793          	addi	a5,a5,-4
 298:	0017b793          	seqz	a5,a5
 29c:	0ff7f793          	andi	a5,a5,255
 2a0:	00078513          	mv	a0,a5
 2a4:	e09ff0ef          	jal	ra,ac <nemu_assert>
 2a8:	00000793          	li	a5,0
 2ac:	00078513          	mv	a0,a5
 2b0:	01c12083          	lw	ra,28(sp)
 2b4:	01812403          	lw	s0,24(sp)
 2b8:	02010113          	addi	sp,sp,32
 2bc:	00008067          	ret

Disassembly of section .data:

000002c0 <test_data>:
 2c0:	0000                	unimp
 2c2:	0000                	unimp
 2c4:	ffff                	0xffff
 2c6:	7fff                	0x7fff
 2c8:	0000                	unimp
 2ca:	8000                	0x8000
 2cc:	ffff                	0xffff
 2ce:	ffff                	0xffff

000002d0 <ans>:
	...
 2d8:	0000                	unimp
 2da:	8000                	0x8000
 2dc:	ffff                	0xffff
 2de:	ffff                	0xffff
	...
 2e8:	0000                	unimp
 2ea:	8000                	0x8000
 2ec:	ffff                	0xffff
 2ee:	ffff                	0xffff
 2f0:	0000                	unimp
 2f2:	8000                	0x8000
 2f4:	0000                	unimp
 2f6:	8000                	0x8000
 2f8:	0000                	unimp
 2fa:	8000                	0x8000
 2fc:	0000                	unimp
 2fe:	8000                	0x8000
 300:	ffff                	0xffff
 302:	ffff                	0xffff
 304:	ffff                	0xffff
 306:	ffff                	0xffff
 308:	0000                	unimp
 30a:	8000                	0x8000
 30c:	ffff                	0xffff
 30e:	ffff                	0xffff
	...
 318:	0000                	unimp
 31a:	8000                	0x8000
 31c:	ffff                	0xffff
 31e:	ffff                	0xffff
 320:	0000                	unimp
 322:	0000                	unimp
 324:	ffff                	0xffff
 326:	7fff                	0x7fff
 328:	0000                	unimp
 32a:	8000                	0x8000
 32c:	ffff                	0xffff
 32e:	ffff                	0xffff
 330:	0000                	unimp
 332:	8000                	0x8000
 334:	0000                	unimp
 336:	8000                	0x8000
 338:	0000                	unimp
 33a:	8000                	0x8000
 33c:	0000                	unimp
 33e:	8000                	0x8000
 340:	ffff                	0xffff
 342:	ffff                	0xffff
 344:	ffff                	0xffff
 346:	ffff                	0xffff
 348:	0000                	unimp
 34a:	8000                	0x8000
 34c:	ffff                	0xffff
 34e:	ffff                	0xffff
 350:	0000                	unimp
 352:	8000                	0x8000
 354:	0000                	unimp
 356:	8000                	0x8000
 358:	0000                	unimp
 35a:	8000                	0x8000
 35c:	0000                	unimp
 35e:	8000                	0x8000
 360:	0000                	unimp
 362:	8000                	0x8000
 364:	0000                	unimp
 366:	8000                	0x8000
 368:	0000                	unimp
 36a:	8000                	0x8000
 36c:	0000                	unimp
 36e:	8000                	0x8000
 370:	0000                	unimp
 372:	8000                	0x8000
 374:	0000                	unimp
 376:	8000                	0x8000
 378:	0000                	unimp
 37a:	8000                	0x8000
 37c:	0000                	unimp
 37e:	8000                	0x8000
 380:	0000                	unimp
 382:	8000                	0x8000
 384:	0000                	unimp
 386:	8000                	0x8000
 388:	0000                	unimp
 38a:	8000                	0x8000
 38c:	0000                	unimp
 38e:	8000                	0x8000
 390:	ffff                	0xffff
 392:	ffff                	0xffff
 394:	ffff                	0xffff
 396:	ffff                	0xffff
 398:	0000                	unimp
 39a:	8000                	0x8000
 39c:	ffff                	0xffff
 39e:	ffff                	0xffff
 3a0:	ffff                	0xffff
 3a2:	ffff                	0xffff
 3a4:	ffff                	0xffff
 3a6:	ffff                	0xffff
 3a8:	0000                	unimp
 3aa:	8000                	0x8000
 3ac:	ffff                	0xffff
 3ae:	ffff                	0xffff
 3b0:	0000                	unimp
 3b2:	8000                	0x8000
 3b4:	0000                	unimp
 3b6:	8000                	0x8000
 3b8:	0000                	unimp
 3ba:	8000                	0x8000
 3bc:	0000                	unimp
 3be:	8000                	0x8000
 3c0:	ffff                	0xffff
 3c2:	ffff                	0xffff
 3c4:	ffff                	0xffff
 3c6:	ffff                	0xffff
 3c8:	0000                	unimp
 3ca:	8000                	0x8000
 3cc:	ffff                	0xffff
 3ce:	ffff                	0xffff

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
