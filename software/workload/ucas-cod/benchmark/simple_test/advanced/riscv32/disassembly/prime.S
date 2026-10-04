
../riscv32/elf/prime:     file format elf32-littleriscv


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
  bc:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3e8c>
  c0:	01312623          	sw	s3,12(sp)
  c4:	00812c23          	sw	s0,24(sp)
  c8:	00912a23          	sw	s1,20(sp)
  cc:	01212823          	sw	s2,16(sp)
  d0:	00112e23          	sw	ra,28(sp)
  d4:	00000493          	li	s1,0
  d8:	06500413          	li	s0,101
  dc:	15400993          	li	s3,340
  e0:	09700913          	li	s2,151
  e4:	00200713          	li	a4,2
  e8:	00040793          	mv	a5,s0
  ec:	00e44863          	blt	s0,a4,fc <main+0x40>
  f0:	40e787b3          	sub	a5,a5,a4
  f4:	fee7dee3          	bge	a5,a4,f0 <main+0x34>
  f8:	02078463          	beqz	a5,120 <main+0x64>
  fc:	00170713          	addi	a4,a4,1
 100:	fe8714e3          	bne	a4,s0,e8 <main+0x2c>
 104:	00249793          	slli	a5,s1,0x2
 108:	00f987b3          	add	a5,s3,a5
 10c:	0007a503          	lw	a0,0(a5)
 110:	00148493          	addi	s1,s1,1
 114:	40850533          	sub	a0,a0,s0
 118:	00153513          	seqz	a0,a0
 11c:	f7dff0ef          	jal	ra,98 <nemu_assert>
 120:	00240413          	addi	s0,s0,2
 124:	fd2410e3          	bne	s0,s2,e4 <main+0x28>
 128:	ff648513          	addi	a0,s1,-10
 12c:	00153513          	seqz	a0,a0
 130:	f69ff0ef          	jal	ra,98 <nemu_assert>
 134:	01c12083          	lw	ra,28(sp)
 138:	01812403          	lw	s0,24(sp)
 13c:	01412483          	lw	s1,20(sp)
 140:	01012903          	lw	s2,16(sp)
 144:	00c12983          	lw	s3,12(sp)
 148:	00000513          	li	a0,0
 14c:	02010113          	addi	sp,sp,32
 150:	00008067          	ret

Disassembly of section .data:

00000154 <ans>:
 154:	0065                	c.nop	25
 156:	0000                	unimp
 158:	00000067          	jr	zero # 0 <start>
 15c:	0000006b          	0x6b
 160:	006d                	c.nop	27
 162:	0000                	unimp
 164:	0071                	c.nop	28
 166:	0000                	unimp
 168:	007f                	0x7f
 16a:	0000                	unimp
 16c:	00000083          	lb	ra,0(zero) # 0 <start>
 170:	0089                	addi	ra,ra,2
 172:	0000                	unimp
 174:	0000008b          	0x8b
 178:	0095                	addi	ra,ra,5
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
