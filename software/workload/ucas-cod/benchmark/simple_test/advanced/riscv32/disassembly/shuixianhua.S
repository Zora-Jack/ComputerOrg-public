
../riscv32/elf/shuixianhua:     file format elf32-littleriscv


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

000000bc <cube>:
  bc:	00100313          	li	t1,1
  c0:	00a04463          	bgtz	a0,c8 <cube+0xc>
  c4:	fff00313          	li	t1,-1
  c8:	41f55793          	srai	a5,a0,0x1f
  cc:	00a7c6b3          	xor	a3,a5,a0
  d0:	40f686b3          	sub	a3,a3,a5
  d4:	00068613          	mv	a2,a3
  d8:	00000593          	li	a1,0
  dc:	00000793          	li	a5,0
  e0:	02000893          	li	a7,32
  e4:	00167713          	andi	a4,a2,1
  e8:	00f51833          	sll	a6,a0,a5
  ec:	00178793          	addi	a5,a5,1
  f0:	00070463          	beqz	a4,f8 <cube+0x3c>
  f4:	010585b3          	add	a1,a1,a6
  f8:	40165613          	srai	a2,a2,0x1
  fc:	ff1794e3          	bne	a5,a7,e4 <cube+0x28>
 100:	00100793          	li	a5,1
 104:	00f30463          	beq	t1,a5,10c <cube+0x50>
 108:	40b005b3          	neg	a1,a1
 10c:	00000513          	li	a0,0
 110:	00000793          	li	a5,0
 114:	02000813          	li	a6,32
 118:	0016f713          	andi	a4,a3,1
 11c:	00f59633          	sll	a2,a1,a5
 120:	00178793          	addi	a5,a5,1
 124:	00070463          	beqz	a4,12c <cube+0x70>
 128:	00c50533          	add	a0,a0,a2
 12c:	4016d693          	srai	a3,a3,0x1
 130:	ff0794e3          	bne	a5,a6,118 <cube+0x5c>
 134:	00100793          	li	a5,1
 138:	00f31463          	bne	t1,a5,140 <cube+0x84>
 13c:	00008067          	ret
 140:	40a00533          	neg	a0,a0
 144:	00008067          	ret

Disassembly of section .text.startup:

00000148 <main>:
 148:	fd010113          	addi	sp,sp,-48 # 3fd0 <ans+0x3d78>
 14c:	01712623          	sw	s7,12(sp)
 150:	03212023          	sw	s2,32(sp)
 154:	01312e23          	sw	s3,28(sp)
 158:	01412c23          	sw	s4,24(sp)
 15c:	01512a23          	sw	s5,20(sp)
 160:	01612823          	sw	s6,16(sp)
 164:	02112623          	sw	ra,44(sp)
 168:	02812423          	sw	s0,40(sp)
 16c:	02912223          	sw	s1,36(sp)
 170:	01812423          	sw	s8,8(sp)
 174:	00000b13          	li	s6,0
 178:	06400a13          	li	s4,100
 17c:	06300993          	li	s3,99
 180:	00900913          	li	s2,9
 184:	25800b93          	li	s7,600
 188:	1f400a93          	li	s5,500
 18c:	000a0793          	mv	a5,s4
 190:	00000513          	li	a0,0
 194:	f9c78793          	addi	a5,a5,-100
 198:	00150513          	addi	a0,a0,1
 19c:	fef9cce3          	blt	s3,a5,194 <main+0x4c>
 1a0:	000a0793          	mv	a5,s4
 1a4:	00000413          	li	s0,0
 1a8:	ff678793          	addi	a5,a5,-10
 1ac:	00140413          	addi	s0,s0,1
 1b0:	fef94ce3          	blt	s2,a5,1a8 <main+0x60>
 1b4:	00895663          	bge	s2,s0,1c0 <main+0x78>
 1b8:	ff640413          	addi	s0,s0,-10
 1bc:	fe894ee3          	blt	s2,s0,1b8 <main+0x70>
 1c0:	000a0493          	mv	s1,s4
 1c4:	ff648493          	addi	s1,s1,-10
 1c8:	fe994ee3          	blt	s2,s1,1c4 <main+0x7c>
 1cc:	ef1ff0ef          	jal	ra,bc <cube>
 1d0:	00050c13          	mv	s8,a0
 1d4:	00040513          	mv	a0,s0
 1d8:	ee5ff0ef          	jal	ra,bc <cube>
 1dc:	00ac0c33          	add	s8,s8,a0
 1e0:	00048513          	mv	a0,s1
 1e4:	ed9ff0ef          	jal	ra,bc <cube>
 1e8:	00ac0533          	add	a0,s8,a0
 1ec:	05450663          	beq	a0,s4,238 <main+0xf0>
 1f0:	001a0a13          	addi	s4,s4,1
 1f4:	f95a1ce3          	bne	s4,s5,18c <main+0x44>
 1f8:	ffcb0513          	addi	a0,s6,-4
 1fc:	00153513          	seqz	a0,a0
 200:	e99ff0ef          	jal	ra,98 <nemu_assert>
 204:	02c12083          	lw	ra,44(sp)
 208:	02812403          	lw	s0,40(sp)
 20c:	02412483          	lw	s1,36(sp)
 210:	02012903          	lw	s2,32(sp)
 214:	01c12983          	lw	s3,28(sp)
 218:	01812a03          	lw	s4,24(sp)
 21c:	01412a83          	lw	s5,20(sp)
 220:	01012b03          	lw	s6,16(sp)
 224:	00c12b83          	lw	s7,12(sp)
 228:	00812c03          	lw	s8,8(sp)
 22c:	00000513          	li	a0,0
 230:	03010113          	addi	sp,sp,48
 234:	00008067          	ret
 238:	002b1793          	slli	a5,s6,0x2
 23c:	00fb87b3          	add	a5,s7,a5
 240:	0007a503          	lw	a0,0(a5)
 244:	001b0b13          	addi	s6,s6,1
 248:	41450533          	sub	a0,a0,s4
 24c:	00153513          	seqz	a0,a0
 250:	e49ff0ef          	jal	ra,98 <nemu_assert>
 254:	f9dff06f          	j	1f0 <main+0xa8>

Disassembly of section .data:

00000258 <ans>:
 258:	0099                	addi	ra,ra,6
 25a:	0000                	unimp
 25c:	0172                	slli	sp,sp,0x1c
 25e:	0000                	unimp
 260:	00000173          	0x173
 264:	00000197          	auipc	gp,0x0

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
