
../riscv32/elf/add:     file format elf32-littleriscv


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
  84:	040000ef          	jal	ra,c4 <main>
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

000000bc <add>:
  bc:	00b50533          	add	a0,a0,a1
  c0:	00008067          	ret

Disassembly of section .text.startup:

000000c4 <main>:
  c4:	fe010113          	addi	sp,sp,-32 # 3fe0 <test_data+0x3d78>
  c8:	01412423          	sw	s4,8(sp)
  cc:	16800a13          	li	s4,360
  d0:	01512223          	sw	s5,4(sp)
  d4:	100a0a93          	addi	s5,s4,256
  d8:	01212823          	sw	s2,16(sp)
  dc:	01312623          	sw	s3,12(sp)
  e0:	00112e23          	sw	ra,28(sp)
  e4:	00812c23          	sw	s0,24(sp)
  e8:	00912a23          	sw	s1,20(sp)
  ec:	120a0993          	addi	s3,s4,288
  f0:	000a8913          	mv	s2,s5
  f4:	000a0493          	mv	s1,s4
  f8:	000a8413          	mv	s0,s5
  fc:	00042703          	lw	a4,0(s0)
 100:	00092503          	lw	a0,0(s2)
 104:	0004a783          	lw	a5,0(s1)
 108:	00440413          	addi	s0,s0,4
 10c:	00e50533          	add	a0,a0,a4
 110:	40f50533          	sub	a0,a0,a5
 114:	00153513          	seqz	a0,a0
 118:	f81ff0ef          	jal	ra,98 <nemu_assert>
 11c:	00448493          	addi	s1,s1,4
 120:	fd341ee3          	bne	s0,s3,fc <main+0x38>
 124:	00100513          	li	a0,1
 128:	00490913          	addi	s2,s2,4
 12c:	f6dff0ef          	jal	ra,98 <nemu_assert>
 130:	020a0a13          	addi	s4,s4,32
 134:	fc8910e3          	bne	s2,s0,f4 <main+0x30>
 138:	00100513          	li	a0,1
 13c:	f5dff0ef          	jal	ra,98 <nemu_assert>
 140:	01c12083          	lw	ra,28(sp)
 144:	01812403          	lw	s0,24(sp)
 148:	01412483          	lw	s1,20(sp)
 14c:	01012903          	lw	s2,16(sp)
 150:	00c12983          	lw	s3,12(sp)
 154:	00812a03          	lw	s4,8(sp)
 158:	00412a83          	lw	s5,4(sp)
 15c:	00000513          	li	a0,0
 160:	02010113          	addi	sp,sp,32
 164:	00008067          	ret

Disassembly of section .data:

00000168 <ans>:
 168:	0000                	unimp
 16a:	0000                	unimp
 16c:	0001                	nop
 16e:	0000                	unimp
 170:	0002                	c.slli64	zero
 172:	0000                	unimp
 174:	ffff                	0xffff
 176:	7fff                	0x7fff
 178:	0000                	unimp
 17a:	8000                	0x8000
 17c:	0001                	nop
 17e:	8000                	0x8000
 180:	fffe                	fsw	ft11,252(sp)
 182:	ffff                	0xffff
 184:	ffff                	0xffff
 186:	ffff                	0xffff
 188:	0001                	nop
 18a:	0000                	unimp
 18c:	0002                	c.slli64	zero
 18e:	0000                	unimp
 190:	00000003          	lb	zero,0(zero) # 0 <start>
 194:	0000                	unimp
 196:	8000                	0x8000
 198:	0001                	nop
 19a:	8000                	0x8000
 19c:	0002                	c.slli64	zero
 19e:	8000                	0x8000
 1a0:	ffff                	0xffff
 1a2:	ffff                	0xffff
 1a4:	0000                	unimp
 1a6:	0000                	unimp
 1a8:	0002                	c.slli64	zero
 1aa:	0000                	unimp
 1ac:	00000003          	lb	zero,0(zero) # 0 <start>
 1b0:	0004                	0x4
 1b2:	0000                	unimp
 1b4:	0001                	nop
 1b6:	8000                	0x8000
 1b8:	0002                	c.slli64	zero
 1ba:	8000                	0x8000
 1bc:	80000003          	lb	zero,-2048(zero) # fffff800 <test_data+0xfffff598>
 1c0:	0000                	unimp
 1c2:	0000                	unimp
 1c4:	0001                	nop
 1c6:	0000                	unimp
 1c8:	ffff                	0xffff
 1ca:	7fff                	0x7fff
 1cc:	0000                	unimp
 1ce:	8000                	0x8000
 1d0:	0001                	nop
 1d2:	8000                	0x8000
 1d4:	fffe                	fsw	ft11,252(sp)
 1d6:	ffff                	0xffff
 1d8:	ffff                	0xffff
 1da:	ffff                	0xffff
 1dc:	0000                	unimp
 1de:	0000                	unimp
 1e0:	fffd                	bnez	a5,1de <ans+0x76>
 1e2:	7fff                	0x7fff
 1e4:	fffe                	fsw	ft11,252(sp)
 1e6:	7fff                	0x7fff
 1e8:	0000                	unimp
 1ea:	8000                	0x8000
 1ec:	0001                	nop
 1ee:	8000                	0x8000
 1f0:	0002                	c.slli64	zero
 1f2:	8000                	0x8000
 1f4:	ffff                	0xffff
 1f6:	ffff                	0xffff
 1f8:	0000                	unimp
 1fa:	0000                	unimp
 1fc:	0001                	nop
 1fe:	0000                	unimp
 200:	fffe                	fsw	ft11,252(sp)
 202:	7fff                	0x7fff
 204:	ffff                	0xffff
 206:	7fff                	0x7fff
 208:	0001                	nop
 20a:	8000                	0x8000
 20c:	0002                	c.slli64	zero
 20e:	8000                	0x8000
 210:	80000003          	lb	zero,-2048(zero) # fffff800 <test_data+0xfffff598>
 214:	0000                	unimp
 216:	0000                	unimp
 218:	0001                	nop
 21a:	0000                	unimp
 21c:	0002                	c.slli64	zero
 21e:	0000                	unimp
 220:	ffff                	0xffff
 222:	7fff                	0x7fff
 224:	0000                	unimp
 226:	8000                	0x8000
 228:	fffe                	fsw	ft11,252(sp)
 22a:	ffff                	0xffff
 22c:	ffff                	0xffff
 22e:	ffff                	0xffff
 230:	0000                	unimp
 232:	0000                	unimp
 234:	fffd                	bnez	a5,232 <ans+0xca>
 236:	7fff                	0x7fff
 238:	fffe                	fsw	ft11,252(sp)
 23a:	7fff                	0x7fff
 23c:	ffff                	0xffff
 23e:	7fff                	0x7fff
 240:	fffc                	fsw	fa5,124(a5)
 242:	ffff                	0xffff
 244:	fffd                	bnez	a5,242 <ans+0xda>
 246:	ffff                	0xffff
 248:	ffff                	0xffff
 24a:	ffff                	0xffff
 24c:	0000                	unimp
 24e:	0000                	unimp
 250:	0001                	nop
 252:	0000                	unimp
 254:	fffe                	fsw	ft11,252(sp)
 256:	7fff                	0x7fff
 258:	ffff                	0xffff
 25a:	7fff                	0x7fff
 25c:	0000                	unimp
 25e:	8000                	0x8000
 260:	fffd                	bnez	a5,25e <ans+0xf6>
 262:	ffff                	0xffff
 264:	fffe                	fsw	ft11,252(sp)
 266:	ffff                	0xffff

00000268 <test_data>:
 268:	0000                	unimp
 26a:	0000                	unimp
 26c:	0001                	nop
 26e:	0000                	unimp
 270:	0002                	c.slli64	zero
 272:	0000                	unimp
 274:	ffff                	0xffff
 276:	7fff                	0x7fff
 278:	0000                	unimp
 27a:	8000                	0x8000
 27c:	0001                	nop
 27e:	8000                	0x8000
 280:	fffe                	fsw	ft11,252(sp)
 282:	ffff                	0xffff
 284:	ffff                	0xffff
 286:	ffff                	0xffff

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
