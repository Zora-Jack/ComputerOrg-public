
../riscv32/elf/pascal:     file format elf32-littleriscv


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
  bc:	ff010113          	addi	sp,sp,-16 # 3ff0 <a+0x3df8>
  c0:	00812423          	sw	s0,8(sp)
  c4:	1f800713          	li	a4,504
  c8:	01212023          	sw	s2,0(sp)
  cc:	00100793          	li	a5,1
  d0:	1f800893          	li	a7,504
  d4:	00112623          	sw	ra,12(sp)
  d8:	00912223          	sw	s1,4(sp)
  dc:	00f72223          	sw	a5,4(a4)
  e0:	1ef02c23          	sw	a5,504(zero) # 1f8 <a>
  e4:	20000593          	li	a1,512
  e8:	1f800413          	li	s0,504
  ec:	07c88913          	addi	s2,a7,124
  f0:	00100713          	li	a4,1
  f4:	1fc00513          	li	a0,508
  f8:	00100813          	li	a6,1
  fc:	00050793          	mv	a5,a0
 100:	00100693          	li	a3,1
 104:	0080006f          	j	10c <main+0x50>
 108:	0007a703          	lw	a4,0(a5)
 10c:	00d70633          	add	a2,a4,a3
 110:	00c7a023          	sw	a2,0(a5)
 114:	00478793          	addi	a5,a5,4
 118:	00070693          	mv	a3,a4
 11c:	feb796e3          	bne	a5,a1,108 <main+0x4c>
 120:	0105a023          	sw	a6,0(a1)
 124:	00458593          	addi	a1,a1,4
 128:	01258663          	beq	a1,s2,134 <main+0x78>
 12c:	0048a703          	lw	a4,4(a7)
 130:	fcdff06f          	j	fc <main+0x40>
 134:	17c00493          	li	s1,380
 138:	00042503          	lw	a0,0(s0)
 13c:	0004a783          	lw	a5,0(s1)
 140:	00440413          	addi	s0,s0,4
 144:	00448493          	addi	s1,s1,4
 148:	40f50533          	sub	a0,a0,a5
 14c:	00153513          	seqz	a0,a0
 150:	f49ff0ef          	jal	ra,98 <nemu_assert>
 154:	ff2412e3          	bne	s0,s2,138 <main+0x7c>
 158:	00100513          	li	a0,1
 15c:	f3dff0ef          	jal	ra,98 <nemu_assert>
 160:	00c12083          	lw	ra,12(sp)
 164:	00812403          	lw	s0,8(sp)
 168:	00412483          	lw	s1,4(sp)
 16c:	00012903          	lw	s2,0(sp)
 170:	00000513          	li	a0,0
 174:	01010113          	addi	sp,sp,16
 178:	00008067          	ret

Disassembly of section .data:

0000017c <ans>:
 17c:	0001                	nop
 17e:	0000                	unimp
 180:	001e                	c.slli	zero,0x7
 182:	0000                	unimp
 184:	000001b3          	add	gp,zero,zero
 188:	0fdc                	addi	a5,sp,980
 18a:	0000                	unimp
 18c:	6b0d                	lui	s6,0x3
 18e:	0000                	unimp
 190:	2caa                	fld	fs9,136(sp)
 192:	0002                	c.slli64	zero
 194:	00090f6f          	jal	t5,90194 <a+0x8ff9c>
 198:	1058                	addi	a4,sp,36
 19a:	001f 4efd 0059      	0x594efd001f
 1a0:	4f4e                	lw	t5,208(sp)
 1a2:	00da                	slli	ra,ra,0x16
 1a4:	01ca7357          	0x1ca7357
 1a8:	8be4                	0x8be4
 1aa:	0341                	addi	t1,t1,16
 1ac:	c829                	beqz	s0,1fe <a+0x6>
 1ae:	63ea0527          	0x63ea0527
 1b2:	f9530723          	sb	s5,-114(t1)
 1b6:	08aa                	slli	a7,a7,0xa
 1b8:	e7d0                	fsw	fa2,12(a5)
 1ba:	093e                	slli	s2,s2,0xf
 1bc:	08aaf953          	fsub.s	fs2,fs5,fa0
 1c0:	63ea                	flw	ft7,152(sp)
 1c2:	c8290723          	sb	sp,-882(s2)
 1c6:	8be40527          	0x8be40527
 1ca:	0341                	addi	t1,t1,16
 1cc:	01ca7357          	0x1ca7357
 1d0:	4f4e                	lw	t5,208(sp)
 1d2:	00da                	slli	ra,ra,0x16
 1d4:	4efd                	li	t4,31
 1d6:	0059                	c.nop	22
 1d8:	1058                	addi	a4,sp,36
 1da:	001f 0f6f 0009      	0x90f6f001f
 1e0:	2caa                	fld	fs9,136(sp)
 1e2:	0002                	c.slli64	zero
 1e4:	6b0d                	lui	s6,0x3
 1e6:	0000                	unimp
 1e8:	0fdc                	addi	a5,sp,980
 1ea:	0000                	unimp
 1ec:	000001b3          	add	gp,zero,zero
 1f0:	001e                	c.slli	zero,0x7
 1f2:	0000                	unimp
 1f4:	0001                	nop
	...

Disassembly of section .bss:

000001f8 <a>:
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
