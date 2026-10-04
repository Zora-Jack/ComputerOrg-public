
../riscv32/elf/bit:     file format elf32-littleriscv


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
  84:	0b0000ef          	jal	ra,134 <main>
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

000000bc <getbit>:
  bc:	4035d793          	srai	a5,a1,0x3
  c0:	00f50533          	add	a0,a0,a5
  c4:	00054503          	lbu	a0,0(a0)
  c8:	0075f593          	andi	a1,a1,7
  cc:	00b55533          	srl	a0,a0,a1
  d0:	00157513          	andi	a0,a0,1
  d4:	00008067          	ret

000000d8 <setbit>:
  d8:	4035d793          	srai	a5,a1,0x3
  dc:	ff010113          	addi	sp,sp,-16 # 3ff0 <main+0x3ebc>
  e0:	00f50533          	add	a0,a0,a5
  e4:	00a12623          	sw	a0,12(sp)
  e8:	0075f793          	andi	a5,a1,7
  ec:	00100593          	li	a1,1
  f0:	00f595b3          	sll	a1,a1,a5
  f4:	00c12783          	lw	a5,12(sp)
  f8:	02061063          	bnez	a2,118 <setbit+0x40>
  fc:	0007c783          	lbu	a5,0(a5)
 100:	fff5c593          	not	a1,a1
 104:	00f5f5b3          	and	a1,a1,a5
 108:	00c12783          	lw	a5,12(sp)
 10c:	00b78023          	sb	a1,0(a5)
 110:	01010113          	addi	sp,sp,16
 114:	00008067          	ret
 118:	0007c783          	lbu	a5,0(a5)
 11c:	00f5e5b3          	or	a1,a1,a5
 120:	00c12783          	lw	a5,12(sp)
 124:	0ff5f593          	andi	a1,a1,255
 128:	00b78023          	sb	a1,0(a5)
 12c:	01010113          	addi	sp,sp,16
 130:	00008067          	ret

Disassembly of section .text.startup:

00000134 <main>:
 134:	fe010113          	addi	sp,sp,-32
 138:	faa00793          	li	a5,-86
 13c:	00000593          	li	a1,0
 140:	00c10513          	addi	a0,sp,12
 144:	00112e23          	sw	ra,28(sp)
 148:	00f10623          	sb	a5,12(sp)
 14c:	f71ff0ef          	jal	ra,bc <getbit>
 150:	00153513          	seqz	a0,a0
 154:	f45ff0ef          	jal	ra,98 <nemu_assert>
 158:	00100593          	li	a1,1
 15c:	00c10513          	addi	a0,sp,12
 160:	f5dff0ef          	jal	ra,bc <getbit>
 164:	fff50513          	addi	a0,a0,-1
 168:	00153513          	seqz	a0,a0
 16c:	f2dff0ef          	jal	ra,98 <nemu_assert>
 170:	00200593          	li	a1,2
 174:	00c10513          	addi	a0,sp,12
 178:	f45ff0ef          	jal	ra,bc <getbit>
 17c:	00153513          	seqz	a0,a0
 180:	f19ff0ef          	jal	ra,98 <nemu_assert>
 184:	00300593          	li	a1,3
 188:	00c10513          	addi	a0,sp,12
 18c:	f31ff0ef          	jal	ra,bc <getbit>
 190:	fff50513          	addi	a0,a0,-1
 194:	00153513          	seqz	a0,a0
 198:	f01ff0ef          	jal	ra,98 <nemu_assert>
 19c:	00400593          	li	a1,4
 1a0:	00c10513          	addi	a0,sp,12
 1a4:	f19ff0ef          	jal	ra,bc <getbit>
 1a8:	00153513          	seqz	a0,a0
 1ac:	eedff0ef          	jal	ra,98 <nemu_assert>
 1b0:	00500593          	li	a1,5
 1b4:	00c10513          	addi	a0,sp,12
 1b8:	f05ff0ef          	jal	ra,bc <getbit>
 1bc:	fff50513          	addi	a0,a0,-1
 1c0:	00153513          	seqz	a0,a0
 1c4:	ed5ff0ef          	jal	ra,98 <nemu_assert>
 1c8:	00600593          	li	a1,6
 1cc:	00c10513          	addi	a0,sp,12
 1d0:	eedff0ef          	jal	ra,bc <getbit>
 1d4:	00153513          	seqz	a0,a0
 1d8:	ec1ff0ef          	jal	ra,98 <nemu_assert>
 1dc:	00700593          	li	a1,7
 1e0:	00c10513          	addi	a0,sp,12
 1e4:	ed9ff0ef          	jal	ra,bc <getbit>
 1e8:	fff50513          	addi	a0,a0,-1
 1ec:	00153513          	seqz	a0,a0
 1f0:	ea9ff0ef          	jal	ra,98 <nemu_assert>
 1f4:	00c10513          	addi	a0,sp,12
 1f8:	00100613          	li	a2,1
 1fc:	00800593          	li	a1,8
 200:	ed9ff0ef          	jal	ra,d8 <setbit>
 204:	00c10513          	addi	a0,sp,12
 208:	00000613          	li	a2,0
 20c:	00900593          	li	a1,9
 210:	ec9ff0ef          	jal	ra,d8 <setbit>
 214:	00c10513          	addi	a0,sp,12
 218:	00100613          	li	a2,1
 21c:	00a00593          	li	a1,10
 220:	eb9ff0ef          	jal	ra,d8 <setbit>
 224:	00c10513          	addi	a0,sp,12
 228:	00000613          	li	a2,0
 22c:	00b00593          	li	a1,11
 230:	ea9ff0ef          	jal	ra,d8 <setbit>
 234:	00c10513          	addi	a0,sp,12
 238:	00100613          	li	a2,1
 23c:	00c00593          	li	a1,12
 240:	e99ff0ef          	jal	ra,d8 <setbit>
 244:	00c10513          	addi	a0,sp,12
 248:	00000613          	li	a2,0
 24c:	00d00593          	li	a1,13
 250:	e89ff0ef          	jal	ra,d8 <setbit>
 254:	00c10513          	addi	a0,sp,12
 258:	00100613          	li	a2,1
 25c:	00e00593          	li	a1,14
 260:	e79ff0ef          	jal	ra,d8 <setbit>
 264:	00c10513          	addi	a0,sp,12
 268:	00000613          	li	a2,0
 26c:	00f00593          	li	a1,15
 270:	e69ff0ef          	jal	ra,d8 <setbit>
 274:	00d14503          	lbu	a0,13(sp)
 278:	fab50513          	addi	a0,a0,-85
 27c:	00153513          	seqz	a0,a0
 280:	e19ff0ef          	jal	ra,98 <nemu_assert>
 284:	01c12083          	lw	ra,28(sp)
 288:	00000513          	li	a0,0
 28c:	02010113          	addi	sp,sp,32
 290:	00008067          	ret

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
