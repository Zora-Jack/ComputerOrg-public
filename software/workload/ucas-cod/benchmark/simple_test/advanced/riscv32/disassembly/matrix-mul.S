
../riscv32/elf/matrix-mul:     file format elf32-littleriscv


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
  bc:	fd010113          	addi	sp,sp,-48 # 3fd0 <c+0x391c>
  c0:	02812423          	sw	s0,40(sp)
  c4:	20400413          	li	s0,516
  c8:	03212023          	sw	s2,32(sp)
  cc:	01312e23          	sw	s3,28(sp)
  d0:	01512a23          	sw	s5,20(sp)
  d4:	02912223          	sw	s1,36(sp)
  d8:	01412c23          	sw	s4,24(sp)
  dc:	01612823          	sw	s6,16(sp)
  e0:	01912223          	sw	s9,4(sp)
  e4:	32040493          	addi	s1,s0,800
  e8:	02112623          	sw	ra,44(sp)
  ec:	01712623          	sw	s7,12(sp)
  f0:	01812423          	sw	s8,8(sp)
  f4:	19000a13          	li	s4,400
  f8:	6b400993          	li	s3,1716
  fc:	4b040413          	addi	s0,s0,1200
 100:	39400a93          	li	s5,916
 104:	3bc00913          	li	s2,956
 108:	00100c93          	li	s9,1
 10c:	02000b13          	li	s6,32
 110:	000a8e13          	mv	t3,s5
 114:	00098c13          	mv	s8,s3
 118:	e70e0b93          	addi	s7,t3,-400
 11c:	00048893          	mv	a7,s1
 120:	00000813          	li	a6,0
 124:	000ba683          	lw	a3,0(s7)
 128:	0008a503          	lw	a0,0(a7)
 12c:	00100313          	li	t1,1
 130:	00d04463          	bgtz	a3,138 <main+0x7c>
 134:	fff00313          	li	t1,-1
 138:	41f6d793          	srai	a5,a3,0x1f
 13c:	00d7c6b3          	xor	a3,a5,a3
 140:	40f686b3          	sub	a3,a3,a5
 144:	00000593          	li	a1,0
 148:	00000793          	li	a5,0
 14c:	0016f713          	andi	a4,a3,1
 150:	00f51633          	sll	a2,a0,a5
 154:	00178793          	addi	a5,a5,1
 158:	00070463          	beqz	a4,160 <main+0xa4>
 15c:	00c585b3          	add	a1,a1,a2
 160:	4016d693          	srai	a3,a3,0x1
 164:	ff6794e3          	bne	a5,s6,14c <main+0x90>
 168:	01930463          	beq	t1,s9,170 <main+0xb4>
 16c:	40b005b3          	neg	a1,a1
 170:	00b80833          	add	a6,a6,a1
 174:	010c2023          	sw	a6,0(s8)
 178:	028b8b93          	addi	s7,s7,40
 17c:	00488893          	addi	a7,a7,4
 180:	fbcb92e3          	bne	s7,t3,124 <main+0x68>
 184:	017a07b3          	add	a5,s4,s7
 188:	e707a503          	lw	a0,-400(a5)
 18c:	004c0c13          	addi	s8,s8,4
 190:	41050533          	sub	a0,a0,a6
 194:	00153513          	seqz	a0,a0
 198:	f01ff0ef          	jal	ra,98 <nemu_assert>
 19c:	00100513          	li	a0,1
 1a0:	ef9ff0ef          	jal	ra,98 <nemu_assert>
 1a4:	004b8e13          	addi	t3,s7,4
 1a8:	f7c918e3          	bne	s2,t3,118 <main+0x5c>
 1ac:	00100513          	li	a0,1
 1b0:	02848493          	addi	s1,s1,40
 1b4:	ee5ff0ef          	jal	ra,98 <nemu_assert>
 1b8:	028a0a13          	addi	s4,s4,40
 1bc:	02898993          	addi	s3,s3,40
 1c0:	f48498e3          	bne	s1,s0,110 <main+0x54>
 1c4:	00100513          	li	a0,1
 1c8:	ed1ff0ef          	jal	ra,98 <nemu_assert>
 1cc:	02c12083          	lw	ra,44(sp)
 1d0:	02812403          	lw	s0,40(sp)
 1d4:	02412483          	lw	s1,36(sp)
 1d8:	02012903          	lw	s2,32(sp)
 1dc:	01c12983          	lw	s3,28(sp)
 1e0:	01812a03          	lw	s4,24(sp)
 1e4:	01412a83          	lw	s5,20(sp)
 1e8:	01012b03          	lw	s6,16(sp)
 1ec:	00c12b83          	lw	s7,12(sp)
 1f0:	00812c03          	lw	s8,8(sp)
 1f4:	00412c83          	lw	s9,4(sp)
 1f8:	00000513          	li	a0,0
 1fc:	03010113          	addi	sp,sp,48
 200:	00008067          	ret

Disassembly of section .data:

00000204 <b>:
 204:	ffd0                	fsw	fa2,60(a5)
 206:	ffff                	0xffff
 208:	ffba                	fsw	fa4,252(sp)
 20a:	ffff                	0xffff
 20c:	ffd8                	fsw	fa4,60(a5)
 20e:	ffff                	0xffff
 210:	ffae                	fsw	fa1,252(sp)
 212:	ffff                	0xffff
 214:	ffb6                	fsw	fa3,252(sp)
 216:	ffff                	0xffff
 218:	ffc1                	bnez	a5,1b0 <main+0xf4>
 21a:	ffff                	0xffff
 21c:	ffc5                	bnez	a5,1d4 <main+0x118>
 21e:	ffff                	0xffff
 220:	ffb8                	fsw	fa4,120(a5)
 222:	ffff                	0xffff
 224:	ff9c                	fsw	fa5,56(a5)
 226:	ffff                	0xffff
 228:	ffb8                	fsw	fa4,120(a5)
 22a:	ffff                	0xffff
 22c:	0005                	c.nop	1
 22e:	0000                	unimp
 230:	ffac                	fsw	fa1,120(a5)
 232:	ffff                	0xffff
 234:	001c                	0x1c
 236:	0000                	unimp
 238:	0038                	addi	a4,sp,8
 23a:	0000                	unimp
 23c:	003c                	addi	a5,sp,8
 23e:	0000                	unimp
 240:	ffdf ffff ffd6      	0xffd6ffffffdf
 246:	ffff                	0xffff
 248:	ffce                	fsw	fs3,252(sp)
 24a:	ffff                	0xffff
 24c:	ffad                	bnez	a5,1c6 <main+0x10a>
 24e:	ffff                	0xffff
 250:	ffad                	bnez	a5,1ca <main+0x10e>
 252:	ffff                	0xffff
 254:	fffffffb          	0xfffffffb
 258:	0005                	c.nop	1
 25a:	0000                	unimp
 25c:	0030                	addi	a2,sp,8
 25e:	0000                	unimp
 260:	0000004b          	fnmsub.s	ft0,ft0,ft0,ft0,rne
 264:	ffb2                	fsw	fa2,252(sp)
 266:	ffff                	0xffff
 268:	fffffff7          	0xfffffff7
 26c:	0009                	c.nop	2
 26e:	0000                	unimp
 270:	0002                	c.slli64	zero
 272:	0000                	unimp
 274:	0058                	addi	a4,sp,4
 276:	0000                	unimp
 278:	0046                	c.slli	zero,0x11
 27a:	0000                	unimp
 27c:	0045                	c.nop	17
 27e:	0000                	unimp
 280:	00000017          	auipc	zero,0x0
 284:	0042                	c.slli	zero,0x10
 286:	0000                	unimp
 288:	0042                	c.slli	zero,0x10
 28a:	0000                	unimp
 28c:	fff5                	bnez	a5,288 <b+0x84>
 28e:	ffff                	0xffff
 290:	0032                	c.slli	zero,0xc
 292:	0000                	unimp
 294:	00000043          	fmadd.s	ft0,ft0,ft0,ft0,rne
 298:	0012                	c.slli	zero,0x4
 29a:	0000                	unimp
 29c:	ffc6                	fsw	fa7,252(sp)
 29e:	ffff                	0xffff
 2a0:	004c                	addi	a1,sp,4
 2a2:	0000                	unimp
 2a4:	001e                	c.slli	zero,0x7
 2a6:	0000                	unimp
 2a8:	002d                	c.nop	11
 2aa:	0000                	unimp
 2ac:	0020                	addi	s0,sp,8
 2ae:	0000                	unimp
 2b0:	0019                	c.nop	6
 2b2:	0000                	unimp
 2b4:	ffffffb7          	lui	t6,0xfffff
 2b8:	0039                	c.nop	14
 2ba:	0000                	unimp
 2bc:	ffbd                	bnez	a5,23a <b+0x36>
 2be:	ffff                	0xffff
 2c0:	fff2                	fsw	ft8,252(sp)
 2c2:	ffff                	0xffff
 2c4:	0035                	c.nop	13
 2c6:	0000                	unimp
 2c8:	ffdf ffff 0062      	0x62ffffffdf
 2ce:	0000                	unimp
 2d0:	ffaa                	fsw	fa0,252(sp)
 2d2:	ffff                	0xffff
 2d4:	ffc1                	bnez	a5,26c <b+0x68>
 2d6:	ffff                	0xffff
 2d8:	0050                	addi	a2,sp,4
 2da:	0000                	unimp
 2dc:	ffffffd3          	0xffffffd3
 2e0:	ffa8                	fsw	fa0,120(a5)
 2e2:	ffff                	0xffff
 2e4:	0050                	addi	a2,sp,4
 2e6:	0000                	unimp
 2e8:	ffc0                	fsw	fs0,60(a5)
 2ea:	ffff                	0xffff
 2ec:	003a                	c.slli	zero,0xe
 2ee:	0000                	unimp
 2f0:	ffac                	fsw	fa1,120(a5)
 2f2:	ffff                	0xffff
 2f4:	ffc9                	bnez	a5,28e <b+0x8a>
 2f6:	ffff                	0xffff
 2f8:	ffd9                	bnez	a5,296 <b+0x92>
 2fa:	ffff                	0xffff
 2fc:	fffffff3          	csrrci	t6,0xfff,31
 300:	ffe5                	bnez	a5,2f8 <b+0xf4>
 302:	ffff                	0xffff
 304:	ffffffdb          	0xffffffdb
 308:	0008                	0x8
 30a:	0000                	unimp
 30c:	ffa0                	fsw	fs0,120(a5)
 30e:	ffff                	0xffff
 310:	0054                	addi	a3,sp,4
 312:	0000                	unimp
 314:	ffffffa7          	0xffffffa7
 318:	001f 0000 ffae      	0xffae0000001f
 31e:	ffff                	0xffff
 320:	003a                	c.slli	zero,0xe
 322:	0000                	unimp
 324:	0051                	c.nop	20
 326:	0000                	unimp
 328:	ffffffd7          	0xffffffd7
 32c:	ffc6                	fsw	fa7,252(sp)
 32e:	ffff                	0xffff
 330:	0024                	addi	s1,sp,8
 332:	0000                	unimp
 334:	004c                	addi	a1,sp,4
 336:	0000                	unimp
 338:	ffb1                	bnez	a5,294 <b+0x90>
 33a:	ffff                	0xffff
 33c:	ffffffe3          	bgeu	t6,t6,33a <b+0x136>
 340:	00000017          	auipc	zero,0x0
 344:	0056                	c.slli	zero,0x15
 346:	0000                	unimp
 348:	ffd2                	fsw	fs4,252(sp)
 34a:	ffff                	0xffff
 34c:	0010                	0x10
 34e:	0000                	unimp
 350:	ffee                	fsw	fs11,252(sp)
 352:	ffff                	0xffff
 354:	0051                	c.nop	20
 356:	0000                	unimp
 358:	005a                	c.slli	zero,0x16
 35a:	0000                	unimp
 35c:	00000023          	sb	zero,0(zero) # 0 <start>
 360:	ffa6                	fsw	fs1,252(sp)
 362:	ffff                	0xffff
 364:	0000002b          	0x2b
 368:	00000037          	lui	zero,0x0
 36c:	ffda                	fsw	fs6,252(sp)
 36e:	ffff                	0xffff
 370:	ffed                	bnez	a5,36a <b+0x166>
 372:	ffff                	0xffff
 374:	ffd8                	fsw	fa4,60(a5)
 376:	ffff                	0xffff
 378:	0052                	c.slli	zero,0x14
 37a:	0000                	unimp
 37c:	ffb4                	fsw	fa3,120(a5)
 37e:	ffff                	0xffff
 380:	0039                	c.nop	14
 382:	0000                	unimp
 384:	ffffffe3          	bgeu	t6,t6,382 <b+0x17e>
 388:	fffe                	fsw	ft11,252(sp)
 38a:	ffff                	0xffff
 38c:	0000004f          	fnmadd.s	ft0,ft0,ft0,ft0,rne
 390:	ffd0                	fsw	fa2,60(a5)
 392:	ffff                	0xffff

00000394 <ans>:
 394:	fffffadb          	0xfffffadb
 398:	0000288b          	0x288b
 39c:	ffffe943          	fmadd.q	fs2,ft11,ft11,ft11,unknown
 3a0:	c80e                	sw	gp,16(sp)
 3a2:	ffff                	0xffff
 3a4:	ef16                	fsw	ft5,156(sp)
 3a6:	ffff                	0xffff
 3a8:	f3d6                	fsw	fs5,228(sp)
 3aa:	ffff                	0xffff
 3ac:	d92c                	sw	a1,112(a0)
 3ae:	ffff                	0xffff
 3b0:	1b79                	addi	s6,s6,-2
 3b2:	0000                	unimp
 3b4:	f8a5                	bnez	s1,324 <b+0x120>
 3b6:	ffff                	0xffff
 3b8:	e875                	bnez	s0,4ac <ans+0x118>
 3ba:	ffff                	0xffff
 3bc:	a136                	fsd	fa3,128(sp)
 3be:	ffff                	0xffff
 3c0:	fffffca3          	0xfffffca3
 3c4:	0fcc                	addi	a1,sp,980
 3c6:	0000                	unimp
 3c8:	b290                	fsd	fa2,32(a3)
 3ca:	ffff                	0xffff
 3cc:	ff21                	bnez	a4,324 <b+0x120>
 3ce:	ffff                	0xffff
 3d0:	0376                	slli	t1,t1,0x1d
 3d2:	0000                	unimp
 3d4:	d12c                	sw	a1,96(a0)
 3d6:	ffff                	0xffff
 3d8:	e6d6                	fsw	fs5,76(sp)
 3da:	ffff                	0xffff
 3dc:	c9ea                	sw	s10,208(sp)
 3de:	ffff                	0xffff
 3e0:	fbe2                	fsw	fs8,244(sp)
 3e2:	ffff                	0xffff
 3e4:	00002637          	lui	a2,0x2
 3e8:	e45f ffff fc6a      	0xfc6affffe45f
 3ee:	ffff                	0xffff
 3f0:	e8e9                	bnez	s1,4c2 <ans+0x12e>
 3f2:	ffff                	0xffff
 3f4:	fc39                	bnez	s0,352 <b+0x14e>
 3f6:	ffff                	0xffff
 3f8:	e444                	fsw	fs1,12(s0)
 3fa:	ffff                	0xffff
 3fc:	390d                	jal	2e <continued+0x1e>
 3fe:	0000                	unimp
 400:	e27c                	fsw	fa5,68(a2)
 402:	ffff                	0xffff
 404:	f291                	bnez	a3,308 <b+0x104>
 406:	ffff                	0xffff
 408:	00002587          	flw	fa1,0(zero) # 0 <start>
 40c:	3e6c                	fld	fa1,248(a2)
 40e:	0000                	unimp
 410:	fdf8                	fsw	fa4,124(a1)
 412:	ffff                	0xffff
 414:	ffffcc0f          	0xffffcc0f
 418:	00003ac3          	fmadd.s	fs5,ft0,ft0,ft0,rup
 41c:	1829                	addi	a6,a6,-22
 41e:	0000                	unimp
 420:	f1ba                	fsw	fa4,224(sp)
 422:	ffff                	0xffff
 424:	052d                	addi	a0,a0,11
 426:	0000                	unimp
 428:	1061                	c.nop	-8
 42a:	0000                	unimp
 42c:	421d                	li	tp,7
 42e:	0000                	unimp
 430:	ba9f ffff 0a06      	0xa06ffffba9f
 436:	0000                	unimp
 438:	00000c73          	0xc73
 43c:	2808                	fld	fa0,16(s0)
 43e:	0000                	unimp
 440:	1ef5                	addi	t4,t4,-3
 442:	0000                	unimp
 444:	18ae                	slli	a7,a7,0x2b
 446:	0000                	unimp
 448:	058d                	addi	a1,a1,3
 44a:	0000                	unimp
 44c:	3938                	fld	fa4,112(a0)
 44e:	0000                	unimp
 450:	02bc                	addi	a5,sp,328
 452:	0000                	unimp
 454:	d05f ffff 043b      	0x43bffffd05f
 45a:	0000                	unimp
 45c:	cec5                	beqz	a3,514 <ans+0x180>
 45e:	ffff                	0xffff
 460:	4a3e                	lw	s4,204(sp)
 462:	0000                	unimp
 464:	51d8                	lw	a4,36(a1)
 466:	0000                	unimp
 468:	000048a7          	fsq	ft0,17(zero) # 11 <continued+0x1>
 46c:	f9fd                	bnez	a1,462 <ans+0xce>
 46e:	ffff                	0xffff
 470:	1440                	addi	s0,sp,548
 472:	0000                	unimp
 474:	4400                	lw	s0,8(s0)
 476:	0000                	unimp
 478:	1a54                	addi	a3,sp,308
 47a:	0000                	unimp
 47c:	1878                	addi	a4,sp,60
 47e:	0000                	unimp
 480:	3b0a                	fld	fs6,160(sp)
 482:	0000                	unimp
 484:	ce55                	beqz	a2,540 <a+0x1c>
 486:	ffff                	0xffff
 488:	3b11                	jal	19c <main+0xe0>
 48a:	0000                	unimp
 48c:	000026eb          	0x26eb
 490:	ffffca6b          	0xffffca6b
 494:	0000096b          	0x96b
 498:	f76c                	fsw	fa1,108(a4)
 49a:	ffff                	0xffff
 49c:	00001803          	lh	a6,0(zero) # 0 <start>
 4a0:	f95e                	fsw	fs7,176(sp)
 4a2:	ffff                	0xffff
 4a4:	fffff2c3          	fmadd.q	ft5,ft11,ft11,ft11
 4a8:	2008                	fld	fa0,0(s0)
 4aa:	0000                	unimp
 4ac:	b5c1                	j	36c <b+0x168>
 4ae:	ffff                	0xffff
 4b0:	3081                	jal	fffffcf0 <c+0xfffff63c>
 4b2:	0000                	unimp
 4b4:	0000165b          	0x165b
 4b8:	ffffd3d3          	0xffffd3d3
 4bc:	b4d6                	fsd	fs5,104(sp)
 4be:	ffff                	0xffff
 4c0:	3d7c                	fld	fa5,248(a0)
 4c2:	0000                	unimp
 4c4:	f131                	bnez	a0,408 <ans+0x74>
 4c6:	ffff                	0xffff
 4c8:	fffff093          	andi	ra,t6,-1
 4cc:	ccb6                	sw	a3,88(sp)
 4ce:	ffff                	0xffff
 4d0:	ffffffeb          	0xffffffeb
 4d4:	ffffcef3          	0xffffcef3
 4d8:	e8ae                	fsw	fa1,80(sp)
 4da:	ffff                	0xffff
 4dc:	d2ce                	sw	s3,100(sp)
 4de:	ffff                	0xffff
 4e0:	ffffdd37          	lui	s10,0xffffd
 4e4:	00002fc3          	fmadd.s	ft11,ft0,ft0,ft0,rdn
 4e8:	1e86                	slli	t4,t4,0x21
 4ea:	0000                	unimp
 4ec:	ec1a                	fsw	ft6,24(sp)
 4ee:	ffff                	0xffff
 4f0:	11b4                	addi	a3,sp,232
 4f2:	0000                	unimp
 4f4:	0000042f          	0x42f
 4f8:	fffffae3          	bgeu	t6,t6,4ec <ans+0x158>
 4fc:	f475                	bnez	s0,4e8 <ans+0x154>
 4fe:	ffff                	0xffff
 500:	24a5                	jal	768 <c+0xb4>
 502:	0000                	unimp
 504:	18e4                	addi	s1,sp,124
 506:	0000                	unimp
 508:	e50e                	fsw	ft3,136(sp)
 50a:	ffff                	0xffff
 50c:	239d                	jal	a72 <c+0x3be>
 50e:	0000                	unimp
 510:	1679                	addi	a2,a2,-2
 512:	0000                	unimp
 514:	512a                	lw	sp,168(sp)
 516:	0000                	unimp
 518:	ffffec4b          	fnmsub.q	fs8,ft11,ft11,ft11,unknown
 51c:	00000417          	auipc	s0,0x0
 520:	2f52                	fld	ft10,272(sp)
	...

00000524 <a>:
 524:	001f 0000 ffb7      	0xffb70000001f
 52a:	ffff                	0xffff
 52c:	ffbd                	bnez	a5,4aa <ans+0x116>
 52e:	ffff                	0xffff
 530:	ffe4                	fsw	fs1,124(a5)
 532:	ffff                	0xffff
 534:	00000057          	0x57
 538:	ffffffef          	jal	t6,536 <a+0x12>
 53c:	fff1                	bnez	a5,518 <ans+0x184>
 53e:	ffff                	0xffff
 540:	ffdd                	bnez	a5,4fe <ans+0x16a>
 542:	ffff                	0xffff
 544:	ffffffcb          	fnmsub.q	ft11,ft11,ft11,ft11
 548:	ffca                	fsw	fs2,252(sp)
 54a:	ffff                	0xffff
 54c:	0034                	addi	a3,sp,8
 54e:	0000                	unimp
 550:	0024                	addi	s1,sp,8
 552:	0000                	unimp
 554:	0009                	c.nop	2
 556:	0000                	unimp
 558:	ffa5                	bnez	a5,4d0 <ans+0x13c>
 55a:	ffff                	0xffff
 55c:	ffe5                	bnez	a5,554 <a+0x30>
 55e:	ffff                	0xffff
 560:	ffb2                	fsw	fa2,252(sp)
 562:	ffff                	0xffff
 564:	002a                	c.slli	zero,0xa
 566:	0000                	unimp
 568:	0052                	c.slli	zero,0x14
 56a:	0000                	unimp
 56c:	00000013          	nop
 570:	fffa                	fsw	ft10,252(sp)
 572:	ffff                	0xffff
 574:	0029                	c.nop	10
 576:	0000                	unimp
 578:	ffc8                	fsw	fa0,60(a5)
 57a:	ffff                	0xffff
 57c:	001f 0000 0020      	0x200000001f
 582:	0000                	unimp
 584:	ffcc                	fsw	fa1,60(a5)
 586:	ffff                	0xffff
 588:	004a                	c.slli	zero,0x12
 58a:	0000                	unimp
 58c:	001c                	0x1c
 58e:	0000                	unimp
 590:	0014                	0x14
 592:	0000                	unimp
 594:	00000037          	lui	zero,0x0
 598:	ffb8                	fsw	fa4,120(a5)
 59a:	ffff                	0xffff
 59c:	ffc5                	bnez	a5,554 <a+0x30>
 59e:	ffff                	0xffff
 5a0:	0002                	c.slli64	zero
 5a2:	0000                	unimp
 5a4:	ffb1                	bnez	a5,500 <ans+0x16c>
 5a6:	ffff                	0xffff
 5a8:	fff8                	fsw	fa4,124(a5)
 5aa:	ffff                	0xffff
 5ac:	002c                	addi	a1,sp,8
 5ae:	0000                	unimp
 5b0:	00000037          	lui	zero,0x0
 5b4:	ffad                	bnez	a5,52e <a+0xa>
 5b6:	ffff                	0xffff
 5b8:	ffa1                	bnez	a5,510 <ans+0x17c>
 5ba:	ffff                	0xffff
 5bc:	ffffffd3          	0xffffffd3
 5c0:	0032                	c.slli	zero,0xc
 5c2:	0000                	unimp
 5c4:	ffa1                	bnez	a5,51c <ans+0x188>
 5c6:	ffff                	0xffff
 5c8:	003d                	c.nop	15
 5ca:	0000                	unimp
 5cc:	ffc1                	bnez	a5,564 <a+0x40>
 5ce:	ffff                	0xffff
 5d0:	003e                	c.slli	zero,0xf
 5d2:	0000                	unimp
 5d4:	fff0                	fsw	fa2,124(a5)
 5d6:	ffff                	0xffff
 5d8:	0034                	addi	a3,sp,8
 5da:	0000                	unimp
 5dc:	0028                	addi	a0,sp,8
 5de:	0000                	unimp
 5e0:	005c                	addi	a5,sp,4
 5e2:	0000                	unimp
 5e4:	ffe0                	fsw	fs0,124(a5)
 5e6:	ffff                	0xffff
 5e8:	ffe6                	fsw	fs9,252(sp)
 5ea:	ffff                	0xffff
 5ec:	ff9d                	bnez	a5,52a <a+0x6>
 5ee:	ffff                	0xffff
 5f0:	0034                	addi	a3,sp,8
 5f2:	0000                	unimp
 5f4:	0060                	addi	s0,sp,12
 5f6:	0000                	unimp
 5f8:	0000003f ffffffb5 	0xffffffb50000003f
 600:	ffb6                	fsw	fa3,252(sp)
 602:	ffff                	0xffff
 604:	ffae                	fsw	fa1,252(sp)
 606:	ffff                	0xffff
 608:	0052                	c.slli	zero,0x14
 60a:	0000                	unimp
 60c:	ffa1                	bnez	a5,564 <a+0x40>
 60e:	ffff                	0xffff
 610:	002a                	c.slli	zero,0xa
 612:	0000                	unimp
 614:	0000000b          	0xb
 618:	ffea                	fsw	fs10,252(sp)
 61a:	ffff                	0xffff
 61c:	0000001b          	0x1b
 620:	ffe5                	bnez	a5,618 <a+0xf4>
 622:	ffff                	0xffff
 624:	ffe5                	bnez	a5,61c <a+0xf8>
 626:	ffff                	0xffff
 628:	ffb4                	fsw	fa3,120(a5)
 62a:	ffff                	0xffff
 62c:	ffb9                	bnez	a5,58a <a+0x66>
 62e:	ffff                	0xffff
 630:	003a                	c.slli	zero,0xe
 632:	0000                	unimp
 634:	ffd8                	fsw	fa4,60(a5)
 636:	ffff                	0xffff
 638:	ffffffbf 0000005b 	0x5bffffffbf
 640:	ffffffcb          	fnmsub.q	ft11,ft11,ft11,ft11
 644:	ffbd                	bnez	a5,5c2 <a+0x9e>
 646:	ffff                	0xffff
 648:	0048                	addi	a0,sp,4
 64a:	0000                	unimp
 64c:	0024                	addi	s1,sp,8
 64e:	0000                	unimp
 650:	ffffffb3          	0xffffffb3
 654:	fffd                	bnez	a5,652 <a+0x12e>
 656:	ffff                	0xffff
 658:	005d                	c.nop	23
 65a:	0000                	unimp
 65c:	ffe8                	fsw	fa0,124(a5)
 65e:	ffff                	0xffff
 660:	0061                	c.nop	24
 662:	0000                	unimp
 664:	ffcc                	fsw	fa1,60(a5)
 666:	ffff                	0xffff
 668:	fff5                	bnez	a5,664 <a+0x140>
 66a:	ffff                	0xffff
 66c:	ffffffb3          	0xffffffb3
 670:	ffffffa3          	0xffffffa3
 674:	ffa4                	fsw	fs1,120(a5)
 676:	ffff                	0xffff
 678:	ffe8                	fsw	fa0,124(a5)
 67a:	ffff                	0xffff
 67c:	0046                	c.slli	zero,0x11
 67e:	0000                	unimp
 680:	0012                	c.slli	zero,0x4
 682:	0000                	unimp
 684:	0038                	addi	a4,sp,8
 686:	0000                	unimp
 688:	0058                	addi	a4,sp,4
 68a:	0000                	unimp
 68c:	ffd5                	bnez	a5,648 <a+0x124>
 68e:	ffff                	0xffff
 690:	ffffffd7          	0xffffffd7
 694:	ffe6                	fsw	fs9,252(sp)
 696:	ffff                	0xffff
 698:	0000000b          	0xb
 69c:	ffac                	fsw	fa1,120(a5)
 69e:	ffff                	0xffff
 6a0:	fff2                	fsw	ft8,252(sp)
 6a2:	ffff                	0xffff
 6a4:	ffffffd7          	0xffffffd7
 6a8:	00000053          	fadd.s	ft0,ft0,ft0,rne
 6ac:	0000001b          	0x1b
 6b0:	fff5                	bnez	a5,6ac <a+0x188>
 6b2:	ffff                	0xffff

Disassembly of section .bss:

000006b4 <c>:
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
