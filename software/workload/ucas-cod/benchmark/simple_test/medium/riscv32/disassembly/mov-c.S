
../riscv32/elf/mov-c:     file format elf32-littleriscv


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
  bc:	ff010113          	addi	sp,sp,-16 # 3ff0 <A+0x3e70>
  c0:	00812423          	sw	s0,8(sp)
  c4:	18002023          	sw	zero,384(zero) # 180 <A>
  c8:	18000413          	li	s0,384
  cc:	00100713          	li	a4,1
  d0:	00e42223          	sw	a4,4(s0)
  d4:	00200713          	li	a4,2
  d8:	00300793          	li	a5,3
  dc:	00912223          	sw	s1,4(sp)
  e0:	00e42423          	sw	a4,8(s0)
  e4:	00400713          	li	a4,4
  e8:	00100513          	li	a0,1
  ec:	00112623          	sw	ra,12(sp)
  f0:	00f42623          	sw	a5,12(s0)
  f4:	00e42823          	sw	a4,16(s0)
  f8:	16f02e23          	sw	a5,380(zero) # 17c <b>
  fc:	00f42a23          	sw	a5,20(s0)
 100:	f99ff0ef          	jal	ra,98 <nemu_assert>
 104:	00442503          	lw	a0,4(s0)
 108:	fff50513          	addi	a0,a0,-1
 10c:	00153513          	seqz	a0,a0
 110:	f89ff0ef          	jal	ra,98 <nemu_assert>
 114:	00842503          	lw	a0,8(s0)
 118:	ffe50513          	addi	a0,a0,-2
 11c:	00153513          	seqz	a0,a0
 120:	f79ff0ef          	jal	ra,98 <nemu_assert>
 124:	00c42503          	lw	a0,12(s0)
 128:	ffd50513          	addi	a0,a0,-3
 12c:	00153513          	seqz	a0,a0
 130:	f69ff0ef          	jal	ra,98 <nemu_assert>
 134:	01042503          	lw	a0,16(s0)
 138:	ffc50513          	addi	a0,a0,-4
 13c:	00153513          	seqz	a0,a0
 140:	f59ff0ef          	jal	ra,98 <nemu_assert>
 144:	17c02503          	lw	a0,380(zero) # 17c <b>
 148:	ffd50513          	addi	a0,a0,-3
 14c:	00153513          	seqz	a0,a0
 150:	f49ff0ef          	jal	ra,98 <nemu_assert>
 154:	01442503          	lw	a0,20(s0)
 158:	ffd50513          	addi	a0,a0,-3
 15c:	00153513          	seqz	a0,a0
 160:	f39ff0ef          	jal	ra,98 <nemu_assert>
 164:	00c12083          	lw	ra,12(sp)
 168:	00812403          	lw	s0,8(sp)
 16c:	00412483          	lw	s1,4(sp)
 170:	00000513          	li	a0,0
 174:	01010113          	addi	sp,sp,16
 178:	00008067          	ret

Disassembly of section .bss:

0000017c <b>:
 17c:	0000                	unimp
	...

00000180 <A>:
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
