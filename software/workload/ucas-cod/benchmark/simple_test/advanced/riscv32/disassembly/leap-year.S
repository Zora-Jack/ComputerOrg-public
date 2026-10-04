
../riscv32/elf/leap-year:     file format elf32-littleriscv


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
  84:	098000ef          	jal	ra,11c <main>
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

000000bc <is_leap_year>:
  bc:	00300713          	li	a4,3
  c0:	00050793          	mv	a5,a0
  c4:	04a75863          	bge	a4,a0,114 <is_leap_year+0x58>
  c8:	00357713          	andi	a4,a0,3
  cc:	02071263          	bnez	a4,f0 <is_leap_year+0x34>
  d0:	06300713          	li	a4,99
  d4:	02f75c63          	bge	a4,a5,10c <is_leap_year+0x50>
  d8:	00078713          	mv	a4,a5
  dc:	06300693          	li	a3,99
  e0:	f9c70713          	addi	a4,a4,-100
  e4:	fee6cee3          	blt	a3,a4,e0 <is_leap_year+0x24>
  e8:	00100513          	li	a0,1
  ec:	00071e63          	bnez	a4,108 <is_leap_year+0x4c>
  f0:	18f00693          	li	a3,399
  f4:	18f00713          	li	a4,399
  f8:	00f6d663          	bge	a3,a5,104 <is_leap_year+0x48>
  fc:	e7078793          	addi	a5,a5,-400
 100:	fef74ee3          	blt	a4,a5,fc <is_leap_year+0x40>
 104:	0017b513          	seqz	a0,a5
 108:	00008067          	ret
 10c:	00078713          	mv	a4,a5
 110:	fd9ff06f          	j	e8 <is_leap_year+0x2c>
 114:	00050713          	mv	a4,a0
 118:	fb5ff06f          	j	cc <is_leap_year+0x10>

Disassembly of section .text.startup:

0000011c <main>:
 11c:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3e28>
 120:	01312623          	sw	s3,12(sp)
 124:	00812c23          	sw	s0,24(sp)
 128:	00912a23          	sw	s1,20(sp)
 12c:	01212823          	sw	s2,16(sp)
 130:	01412423          	sw	s4,8(sp)
 134:	00112e23          	sw	ra,28(sp)
 138:	1b800993          	li	s3,440
 13c:	75e00493          	li	s1,1886
 140:	18f00413          	li	s0,399
 144:	06300913          	li	s2,99
 148:	7db00a13          	li	s4,2011
 14c:	0034f713          	andi	a4,s1,3
 150:	00448793          	addi	a5,s1,4
 154:	00071c63          	bnez	a4,16c <main+0x50>
 158:	00078713          	mv	a4,a5
 15c:	f9c70713          	addi	a4,a4,-100
 160:	fee94ee3          	blt	s2,a4,15c <main+0x40>
 164:	00100693          	li	a3,1
 168:	00071863          	bnez	a4,178 <main+0x5c>
 16c:	e7078793          	addi	a5,a5,-400
 170:	fef44ee3          	blt	s0,a5,16c <main+0x50>
 174:	0017b693          	seqz	a3,a5
 178:	0009a503          	lw	a0,0(s3)
 17c:	00148493          	addi	s1,s1,1
 180:	00498993          	addi	s3,s3,4
 184:	40d50533          	sub	a0,a0,a3
 188:	00153513          	seqz	a0,a0
 18c:	f0dff0ef          	jal	ra,98 <nemu_assert>
 190:	fb449ee3          	bne	s1,s4,14c <main+0x30>
 194:	01c12083          	lw	ra,28(sp)
 198:	01812403          	lw	s0,24(sp)
 19c:	01412483          	lw	s1,20(sp)
 1a0:	01012903          	lw	s2,16(sp)
 1a4:	00c12983          	lw	s3,12(sp)
 1a8:	00812a03          	lw	s4,8(sp)
 1ac:	00000513          	li	a0,0
 1b0:	02010113          	addi	sp,sp,32
 1b4:	00008067          	ret

Disassembly of section .data:

000001b8 <ans>:
	...
 1c0:	0001                	nop
	...
 1ce:	0000                	unimp
 1d0:	0001                	nop
	...
 1ee:	0000                	unimp
 1f0:	0001                	nop
	...
 1fe:	0000                	unimp
 200:	0001                	nop
	...
 20e:	0000                	unimp
 210:	0001                	nop
	...
 21e:	0000                	unimp
 220:	0001                	nop
	...
 22e:	0000                	unimp
 230:	0001                	nop
	...
 23e:	0000                	unimp
 240:	0001                	nop
	...
 24e:	0000                	unimp
 250:	0001                	nop
	...
 25e:	0000                	unimp
 260:	0001                	nop
	...
 26e:	0000                	unimp
 270:	0001                	nop
	...
 27e:	0000                	unimp
 280:	0001                	nop
	...
 28e:	0000                	unimp
 290:	0001                	nop
	...
 29e:	0000                	unimp
 2a0:	0001                	nop
	...
 2ae:	0000                	unimp
 2b0:	0001                	nop
	...
 2be:	0000                	unimp
 2c0:	0001                	nop
	...
 2ce:	0000                	unimp
 2d0:	0001                	nop
	...
 2de:	0000                	unimp
 2e0:	0001                	nop
	...
 2ee:	0000                	unimp
 2f0:	0001                	nop
	...
 2fe:	0000                	unimp
 300:	0001                	nop
	...
 30e:	0000                	unimp
 310:	0001                	nop
	...
 31e:	0000                	unimp
 320:	0001                	nop
	...
 32e:	0000                	unimp
 330:	0001                	nop
	...
 33e:	0000                	unimp
 340:	0001                	nop
	...
 34e:	0000                	unimp
 350:	0001                	nop
	...
 35e:	0000                	unimp
 360:	0001                	nop
	...
 36e:	0000                	unimp
 370:	0001                	nop
	...
 37e:	0000                	unimp
 380:	0001                	nop
	...
 38e:	0000                	unimp
 390:	0001                	nop
	...
 39e:	0000                	unimp
 3a0:	0001                	nop
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
