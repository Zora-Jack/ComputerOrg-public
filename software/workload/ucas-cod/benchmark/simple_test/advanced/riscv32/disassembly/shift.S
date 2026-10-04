
../riscv32/elf/shift:     file format elf32-littleriscv


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
  bc:	fe010113          	addi	sp,sp,-32 # 3fe0 <srlv_ans+0x3dd8>
  c0:	00812c23          	sw	s0,24(sp)
  c4:	00912a23          	sw	s1,20(sp)
  c8:	1a800493          	li	s1,424
  cc:	01312623          	sw	s3,12(sp)
  d0:	02048993          	addi	s3,s1,32
  d4:	01212823          	sw	s2,16(sp)
  d8:	01412423          	sw	s4,8(sp)
  dc:	1a800913          	li	s2,424
  e0:	00112e23          	sw	ra,28(sp)
  e4:	01512223          	sw	s5,4(sp)
  e8:	00098a13          	mv	s4,s3
  ec:	1a800413          	li	s0,424
  f0:	00042503          	lw	a0,0(s0)
  f4:	0009a783          	lw	a5,0(s3)
  f8:	00440413          	addi	s0,s0,4
  fc:	00755513          	srli	a0,a0,0x7
 100:	40f50533          	sub	a0,a0,a5
 104:	00153513          	seqz	a0,a0
 108:	f91ff0ef          	jal	ra,98 <nemu_assert>
 10c:	00498993          	addi	s3,s3,4
 110:	ff4410e3          	bne	s0,s4,f0 <main+0x34>
 114:	04090a13          	addi	s4,s2,64
 118:	00048993          	mv	s3,s1
 11c:	00400413          	li	s0,4
 120:	00c00a93          	li	s5,12
 124:	0009a503          	lw	a0,0(s3)
 128:	000a2783          	lw	a5,0(s4)
 12c:	00498993          	addi	s3,s3,4
 130:	40855533          	sra	a0,a0,s0
 134:	40f50533          	sub	a0,a0,a5
 138:	00153513          	seqz	a0,a0
 13c:	00140413          	addi	s0,s0,1
 140:	f59ff0ef          	jal	ra,98 <nemu_assert>
 144:	004a0a13          	addi	s4,s4,4
 148:	fd541ee3          	bne	s0,s5,124 <main+0x68>
 14c:	06090913          	addi	s2,s2,96
 150:	00400413          	li	s0,4
 154:	00c00993          	li	s3,12
 158:	0004a503          	lw	a0,0(s1)
 15c:	00092783          	lw	a5,0(s2)
 160:	00448493          	addi	s1,s1,4
 164:	00855533          	srl	a0,a0,s0
 168:	40f50533          	sub	a0,a0,a5
 16c:	00153513          	seqz	a0,a0
 170:	00140413          	addi	s0,s0,1
 174:	f25ff0ef          	jal	ra,98 <nemu_assert>
 178:	00490913          	addi	s2,s2,4
 17c:	fd341ee3          	bne	s0,s3,158 <main+0x9c>
 180:	01c12083          	lw	ra,28(sp)
 184:	01812403          	lw	s0,24(sp)
 188:	01412483          	lw	s1,20(sp)
 18c:	01012903          	lw	s2,16(sp)
 190:	00c12983          	lw	s3,12(sp)
 194:	00812a03          	lw	s4,8(sp)
 198:	00412a83          	lw	s5,4(sp)
 19c:	00000513          	li	a0,0
 1a0:	02010113          	addi	sp,sp,32
 1a4:	00008067          	ret

Disassembly of section .data:

000001a8 <test>:
 1a8:	5678                	lw	a4,108(a2)
 1aa:	1234                	addi	a3,sp,296
 1ac:	5432                	lw	s0,44(sp)
 1ae:	9876                	add	a6,a6,t4
 1b0:	0000                	unimp
 1b2:	0000                	unimp
 1b4:	1000                	addi	s0,sp,32
 1b6:	effa                	fsw	ft10,220(sp)
 1b8:	ffff                	0xffff
 1ba:	7fff                	0x7fff
 1bc:	0000                	unimp
 1be:	8000                	0x8000
 1c0:	00000033          	add	zero,zero,zero
 1c4:	ffff                	0xffff
 1c6:	ffff                	0xffff

000001c8 <srl_ans>:
 1c8:	68ac                	flw	fa1,80(s1)
 1ca:	0024                	addi	s1,sp,8
 1cc:	eca8                	fsw	fa0,88(s1)
 1ce:	0130                	addi	a2,sp,136
 1d0:	0000                	unimp
 1d2:	0000                	unimp
 1d4:	f420                	fsw	fs0,104(s0)
 1d6:	01df ffff 00ff      	0xffffff01df
 1dc:	0000                	unimp
 1de:	0100                	addi	s0,sp,128
 1e0:	0000                	unimp
 1e2:	0000                	unimp
 1e4:	ffff                	0xffff
 1e6:	01ff                	0x1ff

000001e8 <srav_ans>:
 1e8:	01234567          	0x1234567
 1ec:	b2a1                	j	fffffb34 <srlv_ans+0xfffff92c>
 1ee:	0000fcc3          	fmadd.s	fs9,ft1,ft0,ft0
 1f2:	0000                	unimp
 1f4:	f420                	fsw	fs0,104(s0)
 1f6:	ffdf ffff 007f      	0x7fffffffdf
 1fc:	0000                	unimp
 1fe:	ffc0                	fsw	fs0,60(a5)
 200:	0000                	unimp
 202:	0000                	unimp
 204:	ffff                	0xffff
 206:	ffff                	0xffff

00000208 <srlv_ans>:
 208:	01234567          	0x1234567
 20c:	b2a1                	j	fffffb54 <srlv_ans+0xfffff94c>
 20e:	000004c3          	fmadd.s	fs1,ft0,ft0,ft0,rne
 212:	0000                	unimp
 214:	f420                	fsw	fs0,104(s0)
 216:	01df ffff 007f      	0x7fffff01df
 21c:	0000                	unimp
 21e:	0040                	addi	s0,sp,4
 220:	0000                	unimp
 222:	0000                	unimp
 224:	ffff                	0xffff
 226:	001f        	0x1f

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
