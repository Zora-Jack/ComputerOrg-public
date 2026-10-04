
../riscv32/elf/fact:     file format elf32-littleriscv


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
  84:	0c4000ef          	jal	ra,148 <main>
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

000000bc <fact>:
  bc:	00100793          	li	a5,1
  c0:	00a7e663          	bltu	a5,a0,cc <fact+0x10>
  c4:	00100513          	li	a0,1
  c8:	00008067          	ret
  cc:	0040006f          	j	d0 <fact.part.0>

000000d0 <fact.part.0>:
  d0:	ff010113          	addi	sp,sp,-16 # 3ff0 <f+0x3de0>
  d4:	00812423          	sw	s0,8(sp)
  d8:	00050413          	mv	s0,a0
  dc:	fff50513          	addi	a0,a0,-1
  e0:	00112623          	sw	ra,12(sp)
  e4:	fd9ff0ef          	jal	ra,bc <fact>
  e8:	fff00893          	li	a7,-1
  ec:	00805463          	blez	s0,f4 <fact.part.0+0x24>
  f0:	00100893          	li	a7,1
  f4:	41f45793          	srai	a5,s0,0x1f
  f8:	0087c6b3          	xor	a3,a5,s0
  fc:	40f686b3          	sub	a3,a3,a5
 100:	00000593          	li	a1,0
 104:	00000793          	li	a5,0
 108:	02000813          	li	a6,32
 10c:	0016f713          	andi	a4,a3,1
 110:	00f51633          	sll	a2,a0,a5
 114:	00178793          	addi	a5,a5,1
 118:	00070463          	beqz	a4,120 <fact.part.0+0x50>
 11c:	00c585b3          	add	a1,a1,a2
 120:	4016d693          	srai	a3,a3,0x1
 124:	ff0794e3          	bne	a5,a6,10c <fact.part.0+0x3c>
 128:	00100793          	li	a5,1
 12c:	00f88463          	beq	a7,a5,134 <fact.part.0+0x64>
 130:	40b005b3          	neg	a1,a1
 134:	00c12083          	lw	ra,12(sp)
 138:	00812403          	lw	s0,8(sp)
 13c:	00058513          	mv	a0,a1
 140:	01010113          	addi	sp,sp,16
 144:	00008067          	ret

Disassembly of section .text.startup:

00000148 <main>:
 148:	fe010113          	addi	sp,sp,-32
 14c:	00912a23          	sw	s1,20(sp)
 150:	01212823          	sw	s2,16(sp)
 154:	00812c23          	sw	s0,24(sp)
 158:	01312623          	sw	s3,12(sp)
 15c:	01412423          	sw	s4,8(sp)
 160:	00112e23          	sw	ra,28(sp)
 164:	21000913          	li	s2,528
 168:	1dc00493          	li	s1,476
 16c:	00000413          	li	s0,0
 170:	00100793          	li	a5,1
 174:	00d00993          	li	s3,13
 178:	00100a13          	li	s4,1
 17c:	01c0006f          	j	198 <main+0x50>
 180:	00100793          	li	a5,1
 184:	01440663          	beq	s0,s4,190 <main+0x48>
 188:	f49ff0ef          	jal	ra,d0 <fact.part.0>
 18c:	00050793          	mv	a5,a0
 190:	00490913          	addi	s2,s2,4
 194:	00448493          	addi	s1,s1,4
 198:	0004a503          	lw	a0,0(s1)
 19c:	00140413          	addi	s0,s0,1
 1a0:	00f92023          	sw	a5,0(s2)
 1a4:	40f50533          	sub	a0,a0,a5
 1a8:	00153513          	seqz	a0,a0
 1ac:	eedff0ef          	jal	ra,98 <nemu_assert>
 1b0:	00040513          	mv	a0,s0
 1b4:	fd3416e3          	bne	s0,s3,180 <main+0x38>
 1b8:	01c12083          	lw	ra,28(sp)
 1bc:	01812403          	lw	s0,24(sp)
 1c0:	01412483          	lw	s1,20(sp)
 1c4:	01012903          	lw	s2,16(sp)
 1c8:	00c12983          	lw	s3,12(sp)
 1cc:	00812a03          	lw	s4,8(sp)
 1d0:	00000513          	li	a0,0
 1d4:	02010113          	addi	sp,sp,32
 1d8:	00008067          	ret

Disassembly of section .data:

000001dc <ans>:
 1dc:	0001                	nop
 1de:	0000                	unimp
 1e0:	0001                	nop
 1e2:	0000                	unimp
 1e4:	0002                	c.slli64	zero
 1e6:	0000                	unimp
 1e8:	0006                	c.slli	zero,0x1
 1ea:	0000                	unimp
 1ec:	0018                	0x18
 1ee:	0000                	unimp
 1f0:	0078                	addi	a4,sp,12
 1f2:	0000                	unimp
 1f4:	02d0                	addi	a2,sp,324
 1f6:	0000                	unimp
 1f8:	13b0                	addi	a2,sp,488
 1fa:	0000                	unimp
 1fc:	9d80                	0x9d80
 1fe:	0000                	unimp
 200:	8980                	0x8980
 202:	0005                	c.nop	1
 204:	5f00                	lw	s0,56(a4)
 206:	15000037          	lui	zero,0x15000
 20a:	0261                	addi	tp,tp,24
 20c:	fc00                	fsw	fs0,56(s0)
 20e:	1c8c                	addi	a1,sp,624

Disassembly of section .bss:

00000210 <f>:
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
