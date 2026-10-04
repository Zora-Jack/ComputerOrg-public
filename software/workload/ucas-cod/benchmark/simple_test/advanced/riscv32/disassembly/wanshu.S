
../riscv32/elf/wanshu:     file format elf32-littleriscv


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
  bc:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3e64>
  c0:	00100693          	li	a3,1
  c4:	00812c23          	sw	s0,24(sp)
  c8:	00912a23          	sw	s1,20(sp)
  cc:	01212823          	sw	s2,16(sp)
  d0:	01312623          	sw	s3,12(sp)
  d4:	00112e23          	sw	ra,28(sp)
  d8:	01e00493          	li	s1,30
  dc:	00168413          	addi	s0,a3,1
  e0:	00000913          	li	s2,0
  e4:	17c00993          	li	s3,380
  e8:	04940263          	beq	s0,s1,12c <main+0x70>
  ec:	00100713          	li	a4,1
  f0:	00000613          	li	a2,0
  f4:	00040793          	mv	a5,s0
  f8:	00e44a63          	blt	s0,a4,10c <main+0x50>
  fc:	40e787b3          	sub	a5,a5,a4
 100:	fee7dee3          	bge	a5,a4,fc <main+0x40>
 104:	00079463          	bnez	a5,10c <main+0x50>
 108:	00e60633          	add	a2,a2,a4
 10c:	00170793          	addi	a5,a4,1
 110:	00e68663          	beq	a3,a4,11c <main+0x60>
 114:	00078713          	mv	a4,a5
 118:	fddff06f          	j	f4 <main+0x38>
 11c:	02860e63          	beq	a2,s0,158 <main+0x9c>
 120:	00040693          	mv	a3,s0
 124:	00168413          	addi	s0,a3,1
 128:	fc9412e3          	bne	s0,s1,ec <main+0x30>
 12c:	ffe90513          	addi	a0,s2,-2
 130:	00153513          	seqz	a0,a0
 134:	f65ff0ef          	jal	ra,98 <nemu_assert>
 138:	01c12083          	lw	ra,28(sp)
 13c:	01812403          	lw	s0,24(sp)
 140:	01412483          	lw	s1,20(sp)
 144:	01012903          	lw	s2,16(sp)
 148:	00c12983          	lw	s3,12(sp)
 14c:	00000513          	li	a0,0
 150:	02010113          	addi	sp,sp,32
 154:	00008067          	ret
 158:	00291793          	slli	a5,s2,0x2
 15c:	013787b3          	add	a5,a5,s3
 160:	0007a503          	lw	a0,0(a5)
 164:	00190913          	addi	s2,s2,1
 168:	40850533          	sub	a0,a0,s0
 16c:	00153513          	seqz	a0,a0
 170:	f29ff0ef          	jal	ra,98 <nemu_assert>
 174:	00040693          	mv	a3,s0
 178:	fadff06f          	j	124 <main+0x68>

Disassembly of section .sdata:

0000017c <ans>:
 17c:	0006                	c.slli	zero,0x1
 17e:	0000                	unimp
 180:	001c                	0x1c
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
