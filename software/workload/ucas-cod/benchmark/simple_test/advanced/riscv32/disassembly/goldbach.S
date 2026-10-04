
../riscv32/elf/goldbach:     file format elf32-littleriscv


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
  84:	10c000ef          	jal	ra,190 <main>
  88:	058000ef          	jal	ra,e0 <hit_good_trap>

0000008c <is_prime.part.0>:
  8c:	00200793          	li	a5,2
  90:	02a7d063          	bge	a5,a0,b0 <is_prime.part.0+0x24>
  94:	00200713          	li	a4,2
  98:	00050793          	mv	a5,a0
  9c:	40e787b3          	sub	a5,a5,a4
  a0:	fee7dee3          	bge	a5,a4,9c <is_prime.part.0+0x10>
  a4:	00078863          	beqz	a5,b4 <is_prime.part.0+0x28>
  a8:	00170713          	addi	a4,a4,1
  ac:	fea716e3          	bne	a4,a0,98 <is_prime.part.0+0xc>
  b0:	00100793          	li	a5,1
  b4:	00078513          	mv	a0,a5
  b8:	00008067          	ret

000000bc <_halt>:
  bc:	000007b7          	lui	a5,0x0
  c0:	00a7a623          	sw	a0,12(a5) # c <global_result>
  c4:	0000006f          	j	c4 <_halt+0x8>

000000c8 <nemu_assert>:
  c8:	00051a63          	bnez	a0,dc <nemu_assert+0x14>
  cc:	000007b7          	lui	a5,0x0
  d0:	00100713          	li	a4,1
  d4:	00e7a623          	sw	a4,12(a5) # c <global_result>
  d8:	0000006f          	j	d8 <nemu_assert+0x10>
  dc:	00008067          	ret

000000e0 <hit_good_trap>:
  e0:	000007b7          	lui	a5,0x0
  e4:	0007a623          	sw	zero,12(a5) # c <global_result>
  e8:	0000006f          	j	e8 <hit_good_trap+0x8>

000000ec <is_prime>:
  ec:	00100793          	li	a5,1
  f0:	00a7d463          	bge	a5,a0,f8 <is_prime+0xc>
  f4:	f99ff06f          	j	8c <is_prime.part.0>
  f8:	00000513          	li	a0,0
  fc:	00008067          	ret

00000100 <goldbach>:
 100:	00200793          	li	a5,2
 104:	08a7d263          	bge	a5,a0,188 <goldbach+0x88>
 108:	ff010113          	addi	sp,sp,-16 # 3ff0 <main+0x3e60>
 10c:	00812423          	sw	s0,8(sp)
 110:	00912223          	sw	s1,4(sp)
 114:	01212023          	sw	s2,0(sp)
 118:	00112623          	sw	ra,12(sp)
 11c:	00050493          	mv	s1,a0
 120:	00200413          	li	s0,2
 124:	00100913          	li	s2,1
 128:	00040513          	mv	a0,s0
 12c:	f61ff0ef          	jal	ra,8c <is_prime.part.0>
 130:	408487b3          	sub	a5,s1,s0
 134:	00140413          	addi	s0,s0,1
 138:	00050a63          	beqz	a0,14c <goldbach+0x4c>
 13c:	00078513          	mv	a0,a5
 140:	00f95663          	bge	s2,a5,14c <goldbach+0x4c>
 144:	f49ff0ef          	jal	ra,8c <is_prime.part.0>
 148:	02051263          	bnez	a0,16c <goldbach+0x6c>
 14c:	fc849ee3          	bne	s1,s0,128 <goldbach+0x28>
 150:	00c12083          	lw	ra,12(sp)
 154:	00812403          	lw	s0,8(sp)
 158:	00412483          	lw	s1,4(sp)
 15c:	00012903          	lw	s2,0(sp)
 160:	00000513          	li	a0,0
 164:	01010113          	addi	sp,sp,16
 168:	00008067          	ret
 16c:	00c12083          	lw	ra,12(sp)
 170:	00812403          	lw	s0,8(sp)
 174:	00412483          	lw	s1,4(sp)
 178:	00012903          	lw	s2,0(sp)
 17c:	00100513          	li	a0,1
 180:	01010113          	addi	sp,sp,16
 184:	00008067          	ret
 188:	00000513          	li	a0,0
 18c:	00008067          	ret

Disassembly of section .text.startup:

00000190 <main>:
 190:	ff010113          	addi	sp,sp,-16
 194:	00812423          	sw	s0,8(sp)
 198:	00912223          	sw	s1,4(sp)
 19c:	00112623          	sw	ra,12(sp)
 1a0:	00400413          	li	s0,4
 1a4:	02000493          	li	s1,32
 1a8:	00040513          	mv	a0,s0
 1ac:	f55ff0ef          	jal	ra,100 <goldbach>
 1b0:	fff50513          	addi	a0,a0,-1
 1b4:	00240413          	addi	s0,s0,2
 1b8:	00153513          	seqz	a0,a0
 1bc:	f0dff0ef          	jal	ra,c8 <nemu_assert>
 1c0:	fe9414e3          	bne	s0,s1,1a8 <main+0x18>
 1c4:	00c12083          	lw	ra,12(sp)
 1c8:	00812403          	lw	s0,8(sp)
 1cc:	00412483          	lw	s1,4(sp)
 1d0:	00000513          	li	a0,0
 1d4:	01010113          	addi	sp,sp,16
 1d8:	00008067          	ret

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
