
../riscv32/elf/movsx:     file format elf32-littleriscv


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
  bc:	fe010113          	addi	sp,sp,-32 # 3fe0 <C+0x3dbc>
  c0:	00912a23          	sw	s1,20(sp)
  c4:	00812c23          	sw	s0,24(sp)
  c8:	00100713          	li	a4,1
  cc:	1fc00413          	li	s0,508
  d0:	01412423          	sw	s4,8(sp)
  d4:	00300793          	li	a5,3
  d8:	00e42223          	sw	a4,4(s0)
  dc:	00200713          	li	a4,2
  e0:	01212823          	sw	s2,16(sp)
  e4:	00e42423          	sw	a4,8(s0)
  e8:	00400713          	li	a4,4
  ec:	00f42623          	sw	a5,12(s0)
  f0:	1ef02c23          	sw	a5,504(zero) # 1f8 <b>
  f4:	00f42a23          	sw	a5,20(s0)
  f8:	00100513          	li	a0,1
  fc:	06100793          	li	a5,97
 100:	00112e23          	sw	ra,28(sp)
 104:	00e42823          	sw	a4,16(s0)
 108:	01312623          	sw	s3,12(sp)
 10c:	22f00223          	sb	a5,548(zero) # 224 <C>
 110:	1e002e23          	sw	zero,508(zero) # 1fc <A>
 114:	f85ff0ef          	jal	ra,98 <nemu_assert>
 118:	22400783          	lb	a5,548(zero) # 224 <C>
 11c:	22400993          	li	s3,548
 120:	f9f78513          	addi	a0,a5,-97
 124:	00153513          	seqz	a0,a0
 128:	00f980a3          	sb	a5,1(s3)
 12c:	f6dff0ef          	jal	ra,98 <nemu_assert>
 130:	22400783          	lb	a5,548(zero) # 224 <C>
 134:	f9f78513          	addi	a0,a5,-97
 138:	00153513          	seqz	a0,a0
 13c:	1ef02e23          	sw	a5,508(zero) # 1fc <A>
 140:	f59ff0ef          	jal	ra,98 <nemu_assert>
 144:	00442503          	lw	a0,4(s0)
 148:	f8000793          	li	a5,-128
 14c:	00f980a3          	sb	a5,1(s3)
 150:	fff50513          	addi	a0,a0,-1
 154:	f8000793          	li	a5,-128
 158:	00153513          	seqz	a0,a0
 15c:	1ef02e23          	sw	a5,508(zero) # 1fc <A>
 160:	f39ff0ef          	jal	ra,98 <nemu_assert>
 164:	00842503          	lw	a0,8(s0)
 168:	ffe50513          	addi	a0,a0,-2
 16c:	00153513          	seqz	a0,a0
 170:	f29ff0ef          	jal	ra,98 <nemu_assert>
 174:	00c42503          	lw	a0,12(s0)
 178:	ffd50513          	addi	a0,a0,-3
 17c:	00153513          	seqz	a0,a0
 180:	f19ff0ef          	jal	ra,98 <nemu_assert>
 184:	01042503          	lw	a0,16(s0)
 188:	ffc50513          	addi	a0,a0,-4
 18c:	00153513          	seqz	a0,a0
 190:	f09ff0ef          	jal	ra,98 <nemu_assert>
 194:	1f802503          	lw	a0,504(zero) # 1f8 <b>
 198:	ffd50513          	addi	a0,a0,-3
 19c:	00153513          	seqz	a0,a0
 1a0:	ef9ff0ef          	jal	ra,98 <nemu_assert>
 1a4:	01442503          	lw	a0,20(s0)
 1a8:	ffd50513          	addi	a0,a0,-3
 1ac:	00153513          	seqz	a0,a0
 1b0:	ee9ff0ef          	jal	ra,98 <nemu_assert>
 1b4:	00198503          	lb	a0,1(s3)
 1b8:	08050513          	addi	a0,a0,128
 1bc:	00153513          	seqz	a0,a0
 1c0:	ed9ff0ef          	jal	ra,98 <nemu_assert>
 1c4:	1fc02503          	lw	a0,508(zero) # 1fc <A>
 1c8:	08050513          	addi	a0,a0,128
 1cc:	00153513          	seqz	a0,a0
 1d0:	ec9ff0ef          	jal	ra,98 <nemu_assert>
 1d4:	01c12083          	lw	ra,28(sp)
 1d8:	01812403          	lw	s0,24(sp)
 1dc:	01412483          	lw	s1,20(sp)
 1e0:	01012903          	lw	s2,16(sp)
 1e4:	00c12983          	lw	s3,12(sp)
 1e8:	00812a03          	lw	s4,8(sp)
 1ec:	00000513          	li	a0,0
 1f0:	02010113          	addi	sp,sp,32
 1f4:	00008067          	ret

Disassembly of section .bss:

000001f8 <b>:
 1f8:	0000                	unimp
	...

000001fc <A>:
	...

00000224 <C>:
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
