
../riscv32/elf/sub-longlong:     file format elf32-littleriscv


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
  84:	050000ef          	jal	ra,d4 <main>
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

000000bc <sub>:
  bc:	00050793          	mv	a5,a0
  c0:	40c50533          	sub	a0,a0,a2
  c4:	00a7b7b3          	sltu	a5,a5,a0
  c8:	40d585b3          	sub	a1,a1,a3
  cc:	40f585b3          	sub	a1,a1,a5
  d0:	00008067          	ret

Disassembly of section .text.startup:

000000d4 <main>:
  d4:	fe010113          	addi	sp,sp,-32 # 3fe0 <test_data+0x3c58>
  d8:	01212823          	sw	s2,16(sp)
  dc:	18800913          	li	s2,392
  e0:	01312623          	sw	s3,12(sp)
  e4:	20090993          	addi	s3,s2,512
  e8:	00912a23          	sw	s1,20(sp)
  ec:	01512223          	sw	s5,4(sp)
  f0:	00112e23          	sw	ra,28(sp)
  f4:	00812c23          	sw	s0,24(sp)
  f8:	01412423          	sw	s4,8(sp)
  fc:	24090493          	addi	s1,s2,576
 100:	00098a93          	mv	s5,s3
 104:	00090a13          	mv	s4,s2
 108:	00098413          	mv	s0,s3
 10c:	00042503          	lw	a0,0(s0)
 110:	000aa683          	lw	a3,0(s5)
 114:	00442583          	lw	a1,4(s0)
 118:	004aa783          	lw	a5,4(s5)
 11c:	40a68733          	sub	a4,a3,a0
 120:	004a2603          	lw	a2,4(s4)
 124:	000a2503          	lw	a0,0(s4)
 128:	00e6b6b3          	sltu	a3,a3,a4
 12c:	40b787b3          	sub	a5,a5,a1
 130:	40d787b3          	sub	a5,a5,a3
 134:	00e54533          	xor	a0,a0,a4
 138:	00f647b3          	xor	a5,a2,a5
 13c:	00f56533          	or	a0,a0,a5
 140:	00153513          	seqz	a0,a0
 144:	00840413          	addi	s0,s0,8
 148:	f51ff0ef          	jal	ra,98 <nemu_assert>
 14c:	008a0a13          	addi	s4,s4,8
 150:	fa941ee3          	bne	s0,s1,10c <main+0x38>
 154:	008a8a93          	addi	s5,s5,8
 158:	04090913          	addi	s2,s2,64
 15c:	fa8a94e3          	bne	s5,s0,104 <main+0x30>
 160:	01c12083          	lw	ra,28(sp)
 164:	01812403          	lw	s0,24(sp)
 168:	01412483          	lw	s1,20(sp)
 16c:	01012903          	lw	s2,16(sp)
 170:	00c12983          	lw	s3,12(sp)
 174:	00812a03          	lw	s4,8(sp)
 178:	00412a83          	lw	s5,4(sp)
 17c:	00000513          	li	a0,0
 180:	02010113          	addi	sp,sp,32
 184:	00008067          	ret

Disassembly of section .data:

00000188 <ans>:
	...
 190:	ffff                	0xffff
 192:	ffff                	0xffff
 194:	ffff                	0xffff
 196:	ffff                	0xffff
 198:	fffe                	fsw	ft11,252(sp)
 19a:	ffff                	0xffff
 19c:	ffff                	0xffff
 19e:	ffff                	0xffff
 1a0:	0001                	nop
 1a2:	0000                	unimp
 1a4:	0000                	unimp
 1a6:	8000                	0x8000
 1a8:	0000                	unimp
 1aa:	0000                	unimp
 1ac:	0000                	unimp
 1ae:	8000                	0x8000
 1b0:	ffff                	0xffff
 1b2:	ffff                	0xffff
 1b4:	ffff                	0xffff
 1b6:	7fff                	0x7fff
 1b8:	0002                	c.slli64	zero
 1ba:	0000                	unimp
 1bc:	0000                	unimp
 1be:	0000                	unimp
 1c0:	0001                	nop
 1c2:	0000                	unimp
 1c4:	0000                	unimp
 1c6:	0000                	unimp
 1c8:	0001                	nop
	...
 1d6:	0000                	unimp
 1d8:	ffff                	0xffff
 1da:	ffff                	0xffff
 1dc:	ffff                	0xffff
 1de:	ffff                	0xffff
 1e0:	0002                	c.slli64	zero
 1e2:	0000                	unimp
 1e4:	0000                	unimp
 1e6:	8000                	0x8000
 1e8:	0001                	nop
 1ea:	0000                	unimp
 1ec:	0000                	unimp
 1ee:	8000                	0x8000
 1f0:	0000                	unimp
 1f2:	0000                	unimp
 1f4:	0000                	unimp
 1f6:	8000                	0x8000
 1f8:	00000003          	lb	zero,0(zero) # 0 <start>
 1fc:	0000                	unimp
 1fe:	0000                	unimp
 200:	0002                	c.slli64	zero
 202:	0000                	unimp
 204:	0000                	unimp
 206:	0000                	unimp
 208:	0002                	c.slli64	zero
 20a:	0000                	unimp
 20c:	0000                	unimp
 20e:	0000                	unimp
 210:	0001                	nop
	...
 21e:	0000                	unimp
 220:	00000003          	lb	zero,0(zero) # 0 <start>
 224:	0000                	unimp
 226:	8000                	0x8000
 228:	0002                	c.slli64	zero
 22a:	0000                	unimp
 22c:	0000                	unimp
 22e:	8000                	0x8000
 230:	0001                	nop
 232:	0000                	unimp
 234:	0000                	unimp
 236:	8000                	0x8000
 238:	0004                	0x4
 23a:	0000                	unimp
 23c:	0000                	unimp
 23e:	0000                	unimp
 240:	00000003          	lb	zero,0(zero) # 0 <start>
 244:	0000                	unimp
 246:	0000                	unimp
 248:	ffff                	0xffff
 24a:	ffff                	0xffff
 24c:	ffff                	0xffff
 24e:	7fff                	0x7fff
 250:	fffe                	fsw	ft11,252(sp)
 252:	ffff                	0xffff
 254:	ffff                	0xffff
 256:	7fff                	0x7fff
 258:	fffd                	bnez	a5,256 <ans+0xce>
 25a:	ffff                	0xffff
 25c:	ffff                	0xffff
 25e:	7fff                	0x7fff
	...
 268:	ffff                	0xffff
 26a:	ffff                	0xffff
 26c:	ffff                	0xffff
 26e:	ffff                	0xffff
 270:	fffe                	fsw	ft11,252(sp)
 272:	ffff                	0xffff
 274:	ffff                	0xffff
 276:	ffff                	0xffff
 278:	0001                	nop
 27a:	0000                	unimp
 27c:	0000                	unimp
 27e:	8000                	0x8000
 280:	0000                	unimp
 282:	0000                	unimp
 284:	0000                	unimp
 286:	8000                	0x8000
 288:	0000                	unimp
 28a:	0000                	unimp
 28c:	0000                	unimp
 28e:	8000                	0x8000
 290:	ffff                	0xffff
 292:	ffff                	0xffff
 294:	ffff                	0xffff
 296:	7fff                	0x7fff
 298:	fffe                	fsw	ft11,252(sp)
 29a:	ffff                	0xffff
 29c:	ffff                	0xffff
 29e:	7fff                	0x7fff
 2a0:	0001                	nop
	...
 2ae:	0000                	unimp
 2b0:	ffff                	0xffff
 2b2:	ffff                	0xffff
 2b4:	ffff                	0xffff
 2b6:	ffff                	0xffff
 2b8:	0002                	c.slli64	zero
 2ba:	0000                	unimp
 2bc:	0000                	unimp
 2be:	8000                	0x8000
 2c0:	0001                	nop
 2c2:	0000                	unimp
 2c4:	0000                	unimp
 2c6:	8000                	0x8000
 2c8:	0001                	nop
 2ca:	0000                	unimp
 2cc:	0000                	unimp
 2ce:	8000                	0x8000
 2d0:	0000                	unimp
 2d2:	0000                	unimp
 2d4:	0000                	unimp
 2d6:	8000                	0x8000
 2d8:	ffff                	0xffff
 2da:	ffff                	0xffff
 2dc:	ffff                	0xffff
 2de:	7fff                	0x7fff
 2e0:	0002                	c.slli64	zero
 2e2:	0000                	unimp
 2e4:	0000                	unimp
 2e6:	0000                	unimp
 2e8:	0001                	nop
	...
 2f6:	0000                	unimp
 2f8:	00000003          	lb	zero,0(zero) # 0 <start>
 2fc:	0000                	unimp
 2fe:	8000                	0x8000
 300:	0002                	c.slli64	zero
 302:	0000                	unimp
 304:	0000                	unimp
 306:	8000                	0x8000
 308:	fffe                	fsw	ft11,252(sp)
 30a:	ffff                	0xffff
 30c:	ffff                	0xffff
 30e:	ffff                	0xffff
 310:	fffd                	bnez	a5,30e <ans+0x186>
 312:	ffff                	0xffff
 314:	ffff                	0xffff
 316:	ffff                	0xffff
 318:	fffc                	fsw	fa5,124(a5)
 31a:	ffff                	0xffff
 31c:	ffff                	0xffff
 31e:	ffff                	0xffff
 320:	ffff                	0xffff
 322:	ffff                	0xffff
 324:	ffff                	0xffff
 326:	7fff                	0x7fff
 328:	fffe                	fsw	ft11,252(sp)
 32a:	ffff                	0xffff
 32c:	ffff                	0xffff
 32e:	7fff                	0x7fff
 330:	fffd                	bnez	a5,32e <ans+0x1a6>
 332:	ffff                	0xffff
 334:	ffff                	0xffff
 336:	7fff                	0x7fff
	...
 340:	ffff                	0xffff
 342:	ffff                	0xffff
 344:	ffff                	0xffff
 346:	ffff                	0xffff
 348:	ffff                	0xffff
 34a:	ffff                	0xffff
 34c:	ffff                	0xffff
 34e:	ffff                	0xffff
 350:	fffe                	fsw	ft11,252(sp)
 352:	ffff                	0xffff
 354:	ffff                	0xffff
 356:	ffff                	0xffff
 358:	fffd                	bnez	a5,356 <ans+0x1ce>
 35a:	ffff                	0xffff
 35c:	ffff                	0xffff
 35e:	ffff                	0xffff
 360:	0000                	unimp
 362:	0000                	unimp
 364:	0000                	unimp
 366:	8000                	0x8000
 368:	ffff                	0xffff
 36a:	ffff                	0xffff
 36c:	ffff                	0xffff
 36e:	7fff                	0x7fff
 370:	fffe                	fsw	ft11,252(sp)
 372:	ffff                	0xffff
 374:	ffff                	0xffff
 376:	7fff                	0x7fff
 378:	0001                	nop
	...

00000388 <test_data>:
	...
 390:	0001                	nop
 392:	0000                	unimp
 394:	0000                	unimp
 396:	0000                	unimp
 398:	0002                	c.slli64	zero
 39a:	0000                	unimp
 39c:	0000                	unimp
 39e:	0000                	unimp
 3a0:	ffff                	0xffff
 3a2:	ffff                	0xffff
 3a4:	ffff                	0xffff
 3a6:	7fff                	0x7fff
 3a8:	0000                	unimp
 3aa:	0000                	unimp
 3ac:	0000                	unimp
 3ae:	8000                	0x8000
 3b0:	0001                	nop
 3b2:	0000                	unimp
 3b4:	0000                	unimp
 3b6:	8000                	0x8000
 3b8:	fffe                	fsw	ft11,252(sp)
 3ba:	ffff                	0xffff
 3bc:	ffff                	0xffff
 3be:	ffff                	0xffff
 3c0:	ffff                	0xffff
 3c2:	ffff                	0xffff
 3c4:	ffff                	0xffff
 3c6:	ffff                	0xffff

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
