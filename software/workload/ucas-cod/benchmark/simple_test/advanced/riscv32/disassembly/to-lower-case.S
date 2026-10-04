
../riscv32/elf/to-lower-case:     file format elf32-littleriscv


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
  84:	054000ef          	jal	ra,d8 <main>
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

000000bc <to_lower_case>:
  bc:	fbf50793          	addi	a5,a0,-65
  c0:	0ff7f793          	andi	a5,a5,255
  c4:	01900713          	li	a4,25
  c8:	00f76663          	bltu	a4,a5,d4 <to_lower_case+0x18>
  cc:	02050513          	addi	a0,a0,32
  d0:	0ff57513          	andi	a0,a0,255
  d4:	00008067          	ret

Disassembly of section .text.startup:

000000d8 <main>:
  d8:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3e84>
  dc:	00912a23          	sw	s1,20(sp)
  e0:	00812c23          	sw	s0,24(sp)
  e4:	01212823          	sw	s2,16(sp)
  e8:	01312623          	sw	s3,12(sp)
  ec:	00112e23          	sw	ra,28(sp)
  f0:	00100413          	li	s0,1
  f4:	00000513          	li	a0,0
  f8:	15c00493          	li	s1,348
  fc:	08000913          	li	s2,128
 100:	01900993          	li	s3,25
 104:	008487b3          	add	a5,s1,s0
 108:	fff7c783          	lbu	a5,-1(a5)
 10c:	40a78533          	sub	a0,a5,a0
 110:	00153513          	seqz	a0,a0
 114:	f85ff0ef          	jal	ra,98 <nemu_assert>
 118:	0ff47513          	andi	a0,s0,255
 11c:	fbf50793          	addi	a5,a0,-65
 120:	0ff7f793          	andi	a5,a5,255
 124:	02050713          	addi	a4,a0,32
 128:	01240a63          	beq	s0,s2,13c <main+0x64>
 12c:	00f9e463          	bltu	s3,a5,134 <main+0x5c>
 130:	0ff77513          	andi	a0,a4,255
 134:	00140413          	addi	s0,s0,1
 138:	fcdff06f          	j	104 <main+0x2c>
 13c:	01c12083          	lw	ra,28(sp)
 140:	01812403          	lw	s0,24(sp)
 144:	01412483          	lw	s1,20(sp)
 148:	01012903          	lw	s2,16(sp)
 14c:	00c12983          	lw	s3,12(sp)
 150:	00000513          	li	a0,0
 154:	02010113          	addi	sp,sp,32
 158:	00008067          	ret

Disassembly of section .data:

0000015c <ans>:
 15c:	0100                	addi	s0,sp,128
 15e:	0302                	c.slli64	t1
 160:	0504                	addi	s1,sp,640
 162:	0706                	slli	a4,a4,0x1
 164:	0908                	addi	a0,sp,144
 166:	0b0a                	slli	s6,s6,0x2
 168:	0d0c                	addi	a1,sp,656
 16a:	0f0e                	slli	t5,t5,0x3
 16c:	1110                	addi	a2,sp,160
 16e:	1312                	slli	t1,t1,0x24
 170:	1514                	addi	a3,sp,672
 172:	1716                	slli	a4,a4,0x25
 174:	1918                	addi	a4,sp,176
 176:	1b1a                	slli	s6,s6,0x26
 178:	1d1c                	addi	a5,sp,688
 17a:	1f1e                	slli	t5,t5,0x27
 17c:	2120                	fld	fs0,64(a0)
 17e:	2322                	fld	ft6,8(sp)
 180:	2524                	fld	fs1,72(a0)
 182:	2726                	fld	fa4,72(sp)
 184:	2928                	fld	fa0,80(a0)
 186:	2b2a                	fld	fs6,136(sp)
 188:	2d2c                	fld	fa1,88(a0)
 18a:	2f2e                	fld	ft10,200(sp)
 18c:	3130                	fld	fa2,96(a0)
 18e:	3332                	fld	ft6,296(sp)
 190:	3534                	fld	fa3,104(a0)
 192:	3736                	fld	fa4,360(sp)
 194:	3938                	fld	fa4,112(a0)
 196:	3b3a                	fld	fs6,424(sp)
 198:	3d3c                	fld	fa5,120(a0)
 19a:	3f3e                	fld	ft10,488(sp)
 19c:	6140                	flw	fs0,4(a0)
 19e:	6362                	flw	ft6,24(sp)
 1a0:	6564                	flw	fs1,76(a0)
 1a2:	6766                	flw	fa4,88(sp)
 1a4:	6968                	flw	fa0,84(a0)
 1a6:	6b6a                	flw	fs6,152(sp)
 1a8:	6d6c                	flw	fa1,92(a0)
 1aa:	6f6e                	flw	ft10,216(sp)
 1ac:	7170                	flw	fa2,100(a0)
 1ae:	7372                	flw	ft6,60(sp)
 1b0:	7574                	flw	fa3,108(a0)
 1b2:	7776                	flw	fa4,124(sp)
 1b4:	7978                	flw	fa4,116(a0)
 1b6:	5b7a                	lw	s6,188(sp)
 1b8:	5d5c                	lw	a5,60(a0)
 1ba:	5f5e                	lw	t5,244(sp)
 1bc:	6160                	flw	fs0,68(a0)
 1be:	6362                	flw	ft6,24(sp)
 1c0:	6564                	flw	fs1,76(a0)
 1c2:	6766                	flw	fa4,88(sp)
 1c4:	6968                	flw	fa0,84(a0)
 1c6:	6b6a                	flw	fs6,152(sp)
 1c8:	6d6c                	flw	fa1,92(a0)
 1ca:	6f6e                	flw	ft10,216(sp)
 1cc:	7170                	flw	fa2,100(a0)
 1ce:	7372                	flw	ft6,60(sp)
 1d0:	7574                	flw	fa3,108(a0)
 1d2:	7776                	flw	fa4,124(sp)
 1d4:	7978                	flw	fa4,116(a0)
 1d6:	7b7a                	flw	fs6,188(sp)
 1d8:	7d7c                	flw	fa5,124(a0)
 1da:	7f7e                	flw	ft10,252(sp)

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
