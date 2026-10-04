
../riscv32/elf/switch:     file format elf32-littleriscv


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
  84:	05c000ef          	jal	ra,e0 <main>
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

000000bc <switch_case>:
  bc:	00c00793          	li	a5,12
  c0:	00a7ec63          	bltu	a5,a0,d8 <switch_case+0x1c>
  c4:	17400793          	li	a5,372
  c8:	00251513          	slli	a0,a0,0x2
  cc:	00a78533          	add	a0,a5,a0
  d0:	00052503          	lw	a0,0(a0)
  d4:	00008067          	ret
  d8:	fff00513          	li	a0,-1
  dc:	00008067          	ret

Disassembly of section .text.startup:

000000e0 <main>:
  e0:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3e38>
  e4:	00912a23          	sw	s1,20(sp)
  e8:	01212823          	sw	s2,16(sp)
  ec:	00812c23          	sw	s0,24(sp)
  f0:	01312623          	sw	s3,12(sp)
  f4:	01412423          	sw	s4,8(sp)
  f8:	00112e23          	sw	ra,28(sp)
  fc:	1a800493          	li	s1,424
 100:	00000413          	li	s0,0
 104:	fff00713          	li	a4,-1
 108:	00e00993          	li	s3,14
 10c:	00d00a13          	li	s4,13
 110:	17400913          	li	s2,372
 114:	0004a503          	lw	a0,0(s1)
 118:	00448493          	addi	s1,s1,4
 11c:	40e50533          	sub	a0,a0,a4
 120:	00153513          	seqz	a0,a0
 124:	f75ff0ef          	jal	ra,98 <nemu_assert>
 128:	00241793          	slli	a5,s0,0x2
 12c:	00f907b3          	add	a5,s2,a5
 130:	01340c63          	beq	s0,s3,148 <main+0x68>
 134:	fff00713          	li	a4,-1
 138:	01440463          	beq	s0,s4,140 <main+0x60>
 13c:	0007a703          	lw	a4,0(a5)
 140:	00140413          	addi	s0,s0,1
 144:	fd1ff06f          	j	114 <main+0x34>
 148:	00100513          	li	a0,1
 14c:	f4dff0ef          	jal	ra,98 <nemu_assert>
 150:	01c12083          	lw	ra,28(sp)
 154:	01812403          	lw	s0,24(sp)
 158:	01412483          	lw	s1,20(sp)
 15c:	01012903          	lw	s2,16(sp)
 160:	00c12983          	lw	s3,12(sp)
 164:	00812a03          	lw	s4,8(sp)
 168:	00000513          	li	a0,0
 16c:	02010113          	addi	sp,sp,32
 170:	00008067          	ret

Disassembly of section .rodata:

00000174 <CSWTCH.0>:
 174:	0000                	unimp
 176:	0000                	unimp
 178:	0002                	c.slli64	zero
 17a:	0000                	unimp
 17c:	0005                	c.nop	1
 17e:	0000                	unimp
 180:	0005                	c.nop	1
 182:	0000                	unimp
 184:	0008                	0x8
 186:	0000                	unimp
 188:	0008                	0x8
 18a:	0000                	unimp
 18c:	0008                	0x8
 18e:	0000                	unimp
 190:	0008                	0x8
 192:	0000                	unimp
 194:	000a                	c.slli	zero,0x2
 196:	0000                	unimp
 198:	000a                	c.slli	zero,0x2
 19a:	0000                	unimp
 19c:	000a                	c.slli	zero,0x2
 19e:	0000                	unimp
 1a0:	000a                	c.slli	zero,0x2
 1a2:	0000                	unimp
 1a4:	0000000f          	fence	unknown,unknown

Disassembly of section .data:

000001a8 <ans>:
 1a8:	ffff                	0xffff
 1aa:	ffff                	0xffff
 1ac:	0000                	unimp
 1ae:	0000                	unimp
 1b0:	0002                	c.slli64	zero
 1b2:	0000                	unimp
 1b4:	0005                	c.nop	1
 1b6:	0000                	unimp
 1b8:	0005                	c.nop	1
 1ba:	0000                	unimp
 1bc:	0008                	0x8
 1be:	0000                	unimp
 1c0:	0008                	0x8
 1c2:	0000                	unimp
 1c4:	0008                	0x8
 1c6:	0000                	unimp
 1c8:	0008                	0x8
 1ca:	0000                	unimp
 1cc:	000a                	c.slli	zero,0x2
 1ce:	0000                	unimp
 1d0:	000a                	c.slli	zero,0x2
 1d2:	0000                	unimp
 1d4:	000a                	c.slli	zero,0x2
 1d6:	0000                	unimp
 1d8:	000a                	c.slli	zero,0x2
 1da:	0000                	unimp
 1dc:	0000000f          	fence	unknown,unknown
 1e0:	ffff                	0xffff
 1e2:	ffff                	0xffff

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
