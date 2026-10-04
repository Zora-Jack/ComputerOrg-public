
../riscv32/elf/fib:     file format elf32-littleriscv


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
  bc:	ff010113          	addi	sp,sp,-16 # 3ff0 <ans+0x3e24>
  c0:	00812423          	sw	s0,8(sp)
  c4:	12c00413          	li	s0,300
  c8:	00912223          	sw	s1,4(sp)
  cc:	01212023          	sw	s2,0(sp)
  d0:	00112623          	sw	ra,12(sp)
  d4:	0a840493          	addi	s1,s0,168
  d8:	09840913          	addi	s2,s0,152
  dc:	00442783          	lw	a5,4(s0)
  e0:	00042703          	lw	a4,0(s0)
  e4:	0004a503          	lw	a0,0(s1)
  e8:	00440413          	addi	s0,s0,4
  ec:	00e787b3          	add	a5,a5,a4
  f0:	40f50533          	sub	a0,a0,a5
  f4:	00153513          	seqz	a0,a0
  f8:	00f42223          	sw	a5,4(s0)
  fc:	00448493          	addi	s1,s1,4
 100:	f99ff0ef          	jal	ra,98 <nemu_assert>
 104:	fd241ce3          	bne	s0,s2,dc <main+0x20>
 108:	00100513          	li	a0,1
 10c:	f8dff0ef          	jal	ra,98 <nemu_assert>
 110:	00c12083          	lw	ra,12(sp)
 114:	00812403          	lw	s0,8(sp)
 118:	00412483          	lw	s1,4(sp)
 11c:	00012903          	lw	s2,0(sp)
 120:	00000513          	li	a0,0
 124:	01010113          	addi	sp,sp,16
 128:	00008067          	ret

Disassembly of section .data:

0000012c <fib>:
 12c:	0001                	nop
 12e:	0000                	unimp
 130:	0001                	nop
	...

000001cc <ans>:
 1cc:	0001                	nop
 1ce:	0000                	unimp
 1d0:	0001                	nop
 1d2:	0000                	unimp
 1d4:	0002                	c.slli64	zero
 1d6:	0000                	unimp
 1d8:	00000003          	lb	zero,0(zero) # 0 <start>
 1dc:	0005                	c.nop	1
 1de:	0000                	unimp
 1e0:	0008                	0x8
 1e2:	0000                	unimp
 1e4:	000d                	c.nop	3
 1e6:	0000                	unimp
 1e8:	0015                	c.nop	5
 1ea:	0000                	unimp
 1ec:	0022                	c.slli	zero,0x8
 1ee:	0000                	unimp
 1f0:	00000037          	lui	zero,0x0
 1f4:	0059                	c.nop	22
 1f6:	0000                	unimp
 1f8:	0090                	addi	a2,sp,64
 1fa:	0000                	unimp
 1fc:	00e9                	addi	ra,ra,26
 1fe:	0000                	unimp
 200:	0179                	addi	sp,sp,30
 202:	0000                	unimp
 204:	0262                	slli	tp,tp,0x18
 206:	0000                	unimp
 208:	000003db          	0x3db
 20c:	063d                	addi	a2,a2,15
 20e:	0000                	unimp
 210:	0a18                	addi	a4,sp,272
 212:	0000                	unimp
 214:	1055                	c.nop	-11
 216:	0000                	unimp
 218:	1a6d                	addi	s4,s4,-5
 21a:	0000                	unimp
 21c:	2ac2                	fld	fs5,16(sp)
 21e:	0000                	unimp
 220:	0000452f          	0x452f
 224:	6ff1                	lui	t6,0x1c
 226:	0000                	unimp
 228:	b520                	fsd	fs0,104(a0)
 22a:	0000                	unimp
 22c:	2511                	jal	830 <ans+0x664>
 22e:	0001                	nop
 230:	da31                	beqz	a2,184 <fib+0x58>
 232:	0001                	nop
 234:	ff42                	fsw	fa6,188(sp)
 236:	0002                	c.slli64	zero
 238:	0004d973          	csrrwi	s2,ustatus,9
 23c:	d8b5                	beqz	s1,1b0 <fib+0x84>
 23e:	b2280007          	0xb2280007
 242:	000c                	0xc
 244:	8add                	andi	a3,a3,23
 246:	0014                	0x14
 248:	3d05                	jal	78 <continued+0x68>
 24a:	0021                	c.nop	8
 24c:	c7e2                	sw	s8,204(sp)
 24e:	0035                	c.nop	13
 250:	005704e7          	jalr	s1,5(a4)
 254:	ccc9                	beqz	s1,2ee <ans+0x122>
 256:	008c                	addi	a1,sp,64
 258:	d1b0                	sw	a2,96(a1)
 25a:	9e7900e3          	beq	s2,t2,fffffc3a <ans+0xfffffa6e>
 25e:	0170                	addi	a2,sp,140
 260:	7029                	c.lui	zero,0xfffea
 262:	0254                	addi	a3,sp,260
 264:	0ea2                	slli	t4,t4,0x8
 266:	03c5                	addi	t2,t2,17
 268:	06197ecb          	fnmsub.q	ft9,fs2,ft1,ft0

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
