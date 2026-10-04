
../riscv32/elf/unalign:     file format elf32-littleriscv


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
  bc:	ff010113          	addi	sp,sp,-16 # 3ff0 <buf+0x3ea4>
  c0:	00112623          	sw	ra,12(sp)
  c4:	14c00793          	li	a5,332
  c8:	0037c703          	lbu	a4,3(a5)
  cc:	55443537          	lui	a0,0x55443
  d0:	fdd00713          	li	a4,-35
  d4:	00e781a3          	sb	a4,3(a5)
  d8:	0047c703          	lbu	a4,4(a5)
  dc:	32350513          	addi	a0,a0,803 # 55443323 <buf+0x554431d7>
  e0:	fcc00713          	li	a4,-52
  e4:	00e78223          	sb	a4,4(a5)
  e8:	0057c703          	lbu	a4,5(a5)
  ec:	fbb00713          	li	a4,-69
  f0:	00e782a3          	sb	a4,5(a5)
  f4:	0067c703          	lbu	a4,6(a5)
  f8:	faa00713          	li	a4,-86
  fc:	00e78323          	sb	a4,6(a5)
 100:	0037c603          	lbu	a2,3(a5)
 104:	0047c683          	lbu	a3,4(a5)
 108:	0057c703          	lbu	a4,5(a5)
 10c:	0067c783          	lbu	a5,6(a5)
 110:	00869693          	slli	a3,a3,0x8
 114:	00c6e6b3          	or	a3,a3,a2
 118:	01071713          	slli	a4,a4,0x10
 11c:	00d76733          	or	a4,a4,a3
 120:	01879793          	slli	a5,a5,0x18
 124:	00e7e7b3          	or	a5,a5,a4
 128:	00a78533          	add	a0,a5,a0
 12c:	00153513          	seqz	a0,a0
 130:	14f02423          	sw	a5,328(zero) # 148 <x>
 134:	f65ff0ef          	jal	ra,98 <nemu_assert>
 138:	00c12083          	lw	ra,12(sp)
 13c:	00000513          	li	a0,0
 140:	01010113          	addi	sp,sp,16
 144:	00008067          	ret

Disassembly of section .sdata:

00000148 <x>:
 148:	ffff                	0xffff
 14a:	ffff                	0xffff

Disassembly of section .bss:

0000014c <buf>:
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
