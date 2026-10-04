
../riscv32/elf/if-else:     file format elf32-littleriscv


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
  84:	114000ef          	jal	ra,198 <main>
  88:	05c000ef          	jal	ra,e4 <hit_good_trap>

0000008c <_halt>:
  8c:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3d5c>
  90:	00812e23          	sw	s0,28(sp)
  94:	02010413          	addi	s0,sp,32
  98:	fea42623          	sw	a0,-20(s0)
  9c:	000007b7          	lui	a5,0x0
  a0:	fec42703          	lw	a4,-20(s0)
  a4:	00e7a623          	sw	a4,12(a5) # c <global_result>
  a8:	0000006f          	j	a8 <_halt+0x1c>

000000ac <nemu_assert>:
  ac:	fe010113          	addi	sp,sp,-32
  b0:	00112e23          	sw	ra,28(sp)
  b4:	00812c23          	sw	s0,24(sp)
  b8:	02010413          	addi	s0,sp,32
  bc:	fea42623          	sw	a0,-20(s0)
  c0:	fec42783          	lw	a5,-20(s0)
  c4:	00079663          	bnez	a5,d0 <nemu_assert+0x24>
  c8:	00100513          	li	a0,1
  cc:	fc1ff0ef          	jal	ra,8c <_halt>
  d0:	00000013          	nop
  d4:	01c12083          	lw	ra,28(sp)
  d8:	01812403          	lw	s0,24(sp)
  dc:	02010113          	addi	sp,sp,32
  e0:	00008067          	ret

000000e4 <hit_good_trap>:
  e4:	ff010113          	addi	sp,sp,-16
  e8:	00112623          	sw	ra,12(sp)
  ec:	00812423          	sw	s0,8(sp)
  f0:	01010413          	addi	s0,sp,16
  f4:	00000513          	li	a0,0
  f8:	f95ff0ef          	jal	ra,8c <_halt>
  fc:	00000013          	nop
 100:	00c12083          	lw	ra,12(sp)
 104:	00812403          	lw	s0,8(sp)
 108:	01010113          	addi	sp,sp,16
 10c:	00008067          	ret

00000110 <if_else>:
 110:	fd010113          	addi	sp,sp,-48
 114:	02812623          	sw	s0,44(sp)
 118:	03010413          	addi	s0,sp,48
 11c:	fca42e23          	sw	a0,-36(s0)
 120:	fdc42703          	lw	a4,-36(s0)
 124:	1f400793          	li	a5,500
 128:	00e7d863          	bge	a5,a4,138 <if_else+0x28>
 12c:	09600793          	li	a5,150
 130:	fef42623          	sw	a5,-20(s0)
 134:	0500006f          	j	184 <if_else+0x74>
 138:	fdc42703          	lw	a4,-36(s0)
 13c:	12c00793          	li	a5,300
 140:	00e7d863          	bge	a5,a4,150 <if_else+0x40>
 144:	06400793          	li	a5,100
 148:	fef42623          	sw	a5,-20(s0)
 14c:	0380006f          	j	184 <if_else+0x74>
 150:	fdc42703          	lw	a4,-36(s0)
 154:	06400793          	li	a5,100
 158:	00e7d863          	bge	a5,a4,168 <if_else+0x58>
 15c:	04b00793          	li	a5,75
 160:	fef42623          	sw	a5,-20(s0)
 164:	0200006f          	j	184 <if_else+0x74>
 168:	fdc42703          	lw	a4,-36(s0)
 16c:	03200793          	li	a5,50
 170:	00e7d863          	bge	a5,a4,180 <if_else+0x70>
 174:	03200793          	li	a5,50
 178:	fef42623          	sw	a5,-20(s0)
 17c:	0080006f          	j	184 <if_else+0x74>
 180:	fe042623          	sw	zero,-20(s0)
 184:	fec42783          	lw	a5,-20(s0)
 188:	00078513          	mv	a0,a5
 18c:	02c12403          	lw	s0,44(sp)
 190:	03010113          	addi	sp,sp,48
 194:	00008067          	ret

00000198 <main>:
 198:	fe010113          	addi	sp,sp,-32
 19c:	00112e23          	sw	ra,28(sp)
 1a0:	00812c23          	sw	s0,24(sp)
 1a4:	02010413          	addi	s0,sp,32
 1a8:	fe042423          	sw	zero,-24(s0)
 1ac:	fe042623          	sw	zero,-20(s0)
 1b0:	0600006f          	j	210 <main+0x78>
 1b4:	fec42703          	lw	a4,-20(s0)
 1b8:	00271713          	slli	a4,a4,0x2
 1bc:	24c00793          	li	a5,588
 1c0:	00f707b3          	add	a5,a4,a5
 1c4:	0007a783          	lw	a5,0(a5)
 1c8:	00078513          	mv	a0,a5
 1cc:	f45ff0ef          	jal	ra,110 <if_else>
 1d0:	00050613          	mv	a2,a0
 1d4:	fe842783          	lw	a5,-24(s0)
 1d8:	00178713          	addi	a4,a5,1
 1dc:	fee42423          	sw	a4,-24(s0)
 1e0:	00279713          	slli	a4,a5,0x2
 1e4:	28400793          	li	a5,644
 1e8:	00f707b3          	add	a5,a4,a5
 1ec:	0007a783          	lw	a5,0(a5)
 1f0:	40f607b3          	sub	a5,a2,a5
 1f4:	0017b793          	seqz	a5,a5
 1f8:	0ff7f793          	andi	a5,a5,255
 1fc:	00078513          	mv	a0,a5
 200:	eadff0ef          	jal	ra,ac <nemu_assert>
 204:	fec42783          	lw	a5,-20(s0)
 208:	00178793          	addi	a5,a5,1
 20c:	fef42623          	sw	a5,-20(s0)
 210:	fec42703          	lw	a4,-20(s0)
 214:	00d00793          	li	a5,13
 218:	f8e7fee3          	bgeu	a5,a4,1b4 <main+0x1c>
 21c:	fec42783          	lw	a5,-20(s0)
 220:	ff278793          	addi	a5,a5,-14
 224:	0017b793          	seqz	a5,a5
 228:	0ff7f793          	andi	a5,a5,255
 22c:	00078513          	mv	a0,a5
 230:	e7dff0ef          	jal	ra,ac <nemu_assert>
 234:	00000793          	li	a5,0
 238:	00078513          	mv	a0,a5
 23c:	01c12083          	lw	ra,28(sp)
 240:	01812403          	lw	s0,24(sp)
 244:	02010113          	addi	sp,sp,32
 248:	00008067          	ret

Disassembly of section .data:

0000024c <test_data>:
 24c:	ffff                	0xffff
 24e:	ffff                	0xffff
 250:	0000                	unimp
 252:	0000                	unimp
 254:	0031                	c.nop	12
 256:	0000                	unimp
 258:	0032                	c.slli	zero,0xc
 25a:	0000                	unimp
 25c:	00000033          	add	zero,zero,zero
 260:	00000063          	beqz	zero,260 <test_data+0x14>
 264:	0064                	addi	s1,sp,12
 266:	0000                	unimp
 268:	0065                	c.nop	25
 26a:	0000                	unimp
 26c:	0000012b          	0x12b
 270:	012c                	addi	a1,sp,136
 272:	0000                	unimp
 274:	012d                	addi	sp,sp,11
 276:	0000                	unimp
 278:	000001f3          	0x1f3
 27c:	01f4                	addi	a3,sp,204
 27e:	0000                	unimp
 280:	01f5                	addi	gp,gp,29
	...

00000284 <ans>:
	...
 294:	0032                	c.slli	zero,0xc
 296:	0000                	unimp
 298:	0032                	c.slli	zero,0xc
 29a:	0000                	unimp
 29c:	0032                	c.slli	zero,0xc
 29e:	0000                	unimp
 2a0:	0000004b          	fnmsub.s	ft0,ft0,ft0,ft0,rne
 2a4:	0000004b          	fnmsub.s	ft0,ft0,ft0,ft0,rne
 2a8:	0000004b          	fnmsub.s	ft0,ft0,ft0,ft0,rne
 2ac:	0064                	addi	s1,sp,12
 2ae:	0000                	unimp
 2b0:	0064                	addi	s1,sp,12
 2b2:	0000                	unimp
 2b4:	0064                	addi	s1,sp,12
 2b6:	0000                	unimp
 2b8:	0096                	slli	ra,ra,0x5
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
