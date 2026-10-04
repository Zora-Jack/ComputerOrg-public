
../riscv32/elf/max:     file format elf32-littleriscv


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
  84:	0d4000ef          	jal	ra,158 <main>
  88:	05c000ef          	jal	ra,e4 <hit_good_trap>

0000008c <_halt>:
  8c:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3d64>
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

00000110 <max>:
 110:	fd010113          	addi	sp,sp,-48
 114:	02812623          	sw	s0,44(sp)
 118:	03010413          	addi	s0,sp,48
 11c:	fca42e23          	sw	a0,-36(s0)
 120:	fcb42c23          	sw	a1,-40(s0)
 124:	fdc42703          	lw	a4,-36(s0)
 128:	fd842783          	lw	a5,-40(s0)
 12c:	00e7d863          	bge	a5,a4,13c <max+0x2c>
 130:	fdc42783          	lw	a5,-36(s0)
 134:	fef42623          	sw	a5,-20(s0)
 138:	00c0006f          	j	144 <max+0x34>
 13c:	fd842783          	lw	a5,-40(s0)
 140:	fef42623          	sw	a5,-20(s0)
 144:	fec42783          	lw	a5,-20(s0)
 148:	00078513          	mv	a0,a5
 14c:	02c12403          	lw	s0,44(sp)
 150:	03010113          	addi	sp,sp,48
 154:	00008067          	ret

00000158 <main>:
 158:	fe010113          	addi	sp,sp,-32
 15c:	00112e23          	sw	ra,28(sp)
 160:	00812c23          	sw	s0,24(sp)
 164:	02010413          	addi	s0,sp,32
 168:	fe042223          	sw	zero,-28(s0)
 16c:	fe042623          	sw	zero,-20(s0)
 170:	0b00006f          	j	220 <main+0xc8>
 174:	fe042423          	sw	zero,-24(s0)
 178:	0780006f          	j	1f0 <main+0x98>
 17c:	fec42703          	lw	a4,-20(s0)
 180:	00271713          	slli	a4,a4,0x2
 184:	25c00793          	li	a5,604
 188:	00f707b3          	add	a5,a4,a5
 18c:	0007a683          	lw	a3,0(a5)
 190:	fe842703          	lw	a4,-24(s0)
 194:	00271713          	slli	a4,a4,0x2
 198:	25c00793          	li	a5,604
 19c:	00f707b3          	add	a5,a4,a5
 1a0:	0007a783          	lw	a5,0(a5)
 1a4:	00078593          	mv	a1,a5
 1a8:	00068513          	mv	a0,a3
 1ac:	f65ff0ef          	jal	ra,110 <max>
 1b0:	00050613          	mv	a2,a0
 1b4:	fe442783          	lw	a5,-28(s0)
 1b8:	00178713          	addi	a4,a5,1
 1bc:	fee42223          	sw	a4,-28(s0)
 1c0:	00279713          	slli	a4,a5,0x2
 1c4:	27c00793          	li	a5,636
 1c8:	00f707b3          	add	a5,a4,a5
 1cc:	0007a783          	lw	a5,0(a5)
 1d0:	40f607b3          	sub	a5,a2,a5
 1d4:	0017b793          	seqz	a5,a5
 1d8:	0ff7f793          	andi	a5,a5,255
 1dc:	00078513          	mv	a0,a5
 1e0:	ecdff0ef          	jal	ra,ac <nemu_assert>
 1e4:	fe842783          	lw	a5,-24(s0)
 1e8:	00178793          	addi	a5,a5,1
 1ec:	fef42423          	sw	a5,-24(s0)
 1f0:	fe842703          	lw	a4,-24(s0)
 1f4:	00700793          	li	a5,7
 1f8:	f8e7f2e3          	bgeu	a5,a4,17c <main+0x24>
 1fc:	fe842783          	lw	a5,-24(s0)
 200:	ff878793          	addi	a5,a5,-8
 204:	0017b793          	seqz	a5,a5
 208:	0ff7f793          	andi	a5,a5,255
 20c:	00078513          	mv	a0,a5
 210:	e9dff0ef          	jal	ra,ac <nemu_assert>
 214:	fec42783          	lw	a5,-20(s0)
 218:	00178793          	addi	a5,a5,1
 21c:	fef42623          	sw	a5,-20(s0)
 220:	fec42703          	lw	a4,-20(s0)
 224:	00700793          	li	a5,7
 228:	f4e7f6e3          	bgeu	a5,a4,174 <main+0x1c>
 22c:	fec42783          	lw	a5,-20(s0)
 230:	ff878793          	addi	a5,a5,-8
 234:	0017b793          	seqz	a5,a5
 238:	0ff7f793          	andi	a5,a5,255
 23c:	00078513          	mv	a0,a5
 240:	e6dff0ef          	jal	ra,ac <nemu_assert>
 244:	00000793          	li	a5,0
 248:	00078513          	mv	a0,a5
 24c:	01c12083          	lw	ra,28(sp)
 250:	01812403          	lw	s0,24(sp)
 254:	02010113          	addi	sp,sp,32
 258:	00008067          	ret

Disassembly of section .data:

0000025c <test_data>:
 25c:	0000                	unimp
 25e:	0000                	unimp
 260:	0001                	nop
 262:	0000                	unimp
 264:	0002                	c.slli64	zero
 266:	0000                	unimp
 268:	ffff                	0xffff
 26a:	7fff                	0x7fff
 26c:	0000                	unimp
 26e:	8000                	0x8000
 270:	0001                	nop
 272:	8000                	0x8000
 274:	fffe                	fsw	ft11,252(sp)
 276:	ffff                	0xffff
 278:	ffff                	0xffff
 27a:	ffff                	0xffff

0000027c <ans>:
 27c:	0000                	unimp
 27e:	0000                	unimp
 280:	0001                	nop
 282:	0000                	unimp
 284:	0002                	c.slli64	zero
 286:	0000                	unimp
 288:	ffff                	0xffff
 28a:	7fff                	0x7fff
	...
 29c:	0001                	nop
 29e:	0000                	unimp
 2a0:	0001                	nop
 2a2:	0000                	unimp
 2a4:	0002                	c.slli64	zero
 2a6:	0000                	unimp
 2a8:	ffff                	0xffff
 2aa:	7fff                	0x7fff
 2ac:	0001                	nop
 2ae:	0000                	unimp
 2b0:	0001                	nop
 2b2:	0000                	unimp
 2b4:	0001                	nop
 2b6:	0000                	unimp
 2b8:	0001                	nop
 2ba:	0000                	unimp
 2bc:	0002                	c.slli64	zero
 2be:	0000                	unimp
 2c0:	0002                	c.slli64	zero
 2c2:	0000                	unimp
 2c4:	0002                	c.slli64	zero
 2c6:	0000                	unimp
 2c8:	ffff                	0xffff
 2ca:	7fff                	0x7fff
 2cc:	0002                	c.slli64	zero
 2ce:	0000                	unimp
 2d0:	0002                	c.slli64	zero
 2d2:	0000                	unimp
 2d4:	0002                	c.slli64	zero
 2d6:	0000                	unimp
 2d8:	0002                	c.slli64	zero
 2da:	0000                	unimp
 2dc:	ffff                	0xffff
 2de:	7fff                	0x7fff
 2e0:	ffff                	0xffff
 2e2:	7fff                	0x7fff
 2e4:	ffff                	0xffff
 2e6:	7fff                	0x7fff
 2e8:	ffff                	0xffff
 2ea:	7fff                	0x7fff
 2ec:	ffff                	0xffff
 2ee:	7fff                	0x7fff
 2f0:	ffff                	0xffff
 2f2:	7fff                	0x7fff
 2f4:	ffff                	0xffff
 2f6:	7fff                	0x7fff
 2f8:	ffff                	0xffff
 2fa:	7fff                	0x7fff
 2fc:	0000                	unimp
 2fe:	0000                	unimp
 300:	0001                	nop
 302:	0000                	unimp
 304:	0002                	c.slli64	zero
 306:	0000                	unimp
 308:	ffff                	0xffff
 30a:	7fff                	0x7fff
 30c:	0000                	unimp
 30e:	8000                	0x8000
 310:	0001                	nop
 312:	8000                	0x8000
 314:	fffe                	fsw	ft11,252(sp)
 316:	ffff                	0xffff
 318:	ffff                	0xffff
 31a:	ffff                	0xffff
 31c:	0000                	unimp
 31e:	0000                	unimp
 320:	0001                	nop
 322:	0000                	unimp
 324:	0002                	c.slli64	zero
 326:	0000                	unimp
 328:	ffff                	0xffff
 32a:	7fff                	0x7fff
 32c:	0001                	nop
 32e:	8000                	0x8000
 330:	0001                	nop
 332:	8000                	0x8000
 334:	fffe                	fsw	ft11,252(sp)
 336:	ffff                	0xffff
 338:	ffff                	0xffff
 33a:	ffff                	0xffff
 33c:	0000                	unimp
 33e:	0000                	unimp
 340:	0001                	nop
 342:	0000                	unimp
 344:	0002                	c.slli64	zero
 346:	0000                	unimp
 348:	ffff                	0xffff
 34a:	7fff                	0x7fff
 34c:	fffe                	fsw	ft11,252(sp)
 34e:	ffff                	0xffff
 350:	fffe                	fsw	ft11,252(sp)
 352:	ffff                	0xffff
 354:	fffe                	fsw	ft11,252(sp)
 356:	ffff                	0xffff
 358:	ffff                	0xffff
 35a:	ffff                	0xffff
 35c:	0000                	unimp
 35e:	0000                	unimp
 360:	0001                	nop
 362:	0000                	unimp
 364:	0002                	c.slli64	zero
 366:	0000                	unimp
 368:	ffff                	0xffff
 36a:	7fff                	0x7fff
 36c:	ffff                	0xffff
 36e:	ffff                	0xffff
 370:	ffff                	0xffff
 372:	ffff                	0xffff
 374:	ffff                	0xffff
 376:	ffff                	0xffff
 378:	ffff                	0xffff
 37a:	ffff                	0xffff

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
