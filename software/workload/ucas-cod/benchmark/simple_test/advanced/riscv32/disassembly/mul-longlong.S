
../riscv32/elf/mul-longlong:     file format elf32-littleriscv


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
  84:	11c000ef          	jal	ra,1a0 <main>
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

000000bc <mul>:
  bc:	00050f13          	mv	t5,a0
  c0:	00058f93          	mv	t6,a1
  c4:	0cd05463          	blez	a3,18c <mul+0xd0>
  c8:	00100293          	li	t0,1
  cc:	00000393          	li	t2,0
  d0:	41f6d793          	srai	a5,a3,0x1f
  d4:	00c7c733          	xor	a4,a5,a2
  d8:	00d7c633          	xor	a2,a5,a3
  dc:	40f706b3          	sub	a3,a4,a5
  e0:	00d735b3          	sltu	a1,a4,a3
  e4:	40f60633          	sub	a2,a2,a5
  e8:	40b60633          	sub	a2,a2,a1
  ec:	00068713          	mv	a4,a3
  f0:	00000513          	li	a0,0
  f4:	00000593          	li	a1,0
  f8:	00000793          	li	a5,0
  fc:	001f5e93          	srli	t4,t5,0x1
 100:	01f00e13          	li	t3,31
 104:	04000313          	li	t1,64
 108:	0380006f          	j	140 <mul+0x84>
 10c:	011f1833          	sll	a6,t5,a7
 110:	00000893          	li	a7,0
 114:	011506b3          	add	a3,a0,a7
 118:	00a6b8b3          	sltu	a7,a3,a0
 11c:	01058833          	add	a6,a1,a6
 120:	00068513          	mv	a0,a3
 124:	010885b3          	add	a1,a7,a6
 128:	01f61693          	slli	a3,a2,0x1f
 12c:	00175713          	srli	a4,a4,0x1
 130:	00178793          	addi	a5,a5,1
 134:	00e6e733          	or	a4,a3,a4
 138:	40165613          	srai	a2,a2,0x1
 13c:	02678663          	beq	a5,t1,168 <mul+0xac>
 140:	00177693          	andi	a3,a4,1
 144:	fe078893          	addi	a7,a5,-32
 148:	fe0680e3          	beqz	a3,128 <mul+0x6c>
 14c:	40fe06b3          	sub	a3,t3,a5
 150:	00ff9833          	sll	a6,t6,a5
 154:	00ded6b3          	srl	a3,t4,a3
 158:	fa08dae3          	bgez	a7,10c <mul+0x50>
 15c:	00ff18b3          	sll	a7,t5,a5
 160:	0106e833          	or	a6,a3,a6
 164:	fb1ff06f          	j	114 <mul+0x58>
 168:	00100793          	li	a5,1
 16c:	00f29663          	bne	t0,a5,178 <mul+0xbc>
 170:	00039463          	bnez	t2,178 <mul+0xbc>
 174:	00008067          	ret
 178:	40a00533          	neg	a0,a0
 17c:	00a037b3          	snez	a5,a0
 180:	40b00833          	neg	a6,a1
 184:	40f805b3          	sub	a1,a6,a5
 188:	00008067          	ret
 18c:	00069463          	bnez	a3,194 <mul+0xd8>
 190:	f2061ce3          	bnez	a2,c8 <mul+0xc>
 194:	fff00293          	li	t0,-1
 198:	fff00393          	li	t2,-1
 19c:	f35ff06f          	j	d0 <mul+0x14>

Disassembly of section .text.startup:

000001a0 <main>:
 1a0:	fd010113          	addi	sp,sp,-48 # 3fd0 <ans+0x3c40>
 1a4:	02812423          	sw	s0,40(sp)
 1a8:	02912223          	sw	s1,36(sp)
 1ac:	01312e23          	sw	s3,28(sp)
 1b0:	01412c23          	sw	s4,24(sp)
 1b4:	01512a23          	sw	s5,20(sp)
 1b8:	01612823          	sw	s6,16(sp)
 1bc:	01812423          	sw	s8,8(sp)
 1c0:	02112623          	sw	ra,44(sp)
 1c4:	03212023          	sw	s2,32(sp)
 1c8:	01712623          	sw	s7,12(sp)
 1cc:	01912223          	sw	s9,4(sp)
 1d0:	01a12023          	sw	s10,0(sp)
 1d4:	00000a13          	li	s4,0
 1d8:	00400b13          	li	s6,4
 1dc:	39000a93          	li	s5,912
 1e0:	38000413          	li	s0,896
 1e4:	00000993          	li	s3,0
 1e8:	39000493          	li	s1,912
 1ec:	01f00c13          	li	s8,31
 1f0:	136a0063          	beq	s4,s6,310 <main+0x170>
 1f4:	00399c93          	slli	s9,s3,0x3
 1f8:	019a8cb3          	add	s9,s5,s9
 1fc:	00040d13          	mv	s10,s0
 200:	00048a93          	mv	s5,s1
 204:	00100913          	li	s2,1
 208:	04000b93          	li	s7,64
 20c:	000d2703          	lw	a4,0(s10)
 210:	00042883          	lw	a7,0(s0)
 214:	000cae83          	lw	t4,0(s9)
 218:	41f75613          	srai	a2,a4,0x1f
 21c:	004caf03          	lw	t5,4(s9)
 220:	41f8de13          	srai	t3,a7,0x1f
 224:	10061663          	bnez	a2,330 <main+0x190>
 228:	00100f93          	li	t6,1
 22c:	00000293          	li	t0,0
 230:	10070063          	beqz	a4,330 <main+0x190>
 234:	41f65793          	srai	a5,a2,0x1f
 238:	00e7c733          	xor	a4,a5,a4
 23c:	40f706b3          	sub	a3,a4,a5
 240:	00c7c633          	xor	a2,a5,a2
 244:	00d735b3          	sltu	a1,a4,a3
 248:	40f60633          	sub	a2,a2,a5
 24c:	00068713          	mv	a4,a3
 250:	40b60633          	sub	a2,a2,a1
 254:	00000513          	li	a0,0
 258:	00000813          	li	a6,0
 25c:	00000793          	li	a5,0
 260:	0018d313          	srli	t1,a7,0x1
 264:	0380006f          	j	29c <main+0xfc>
 268:	00b893b3          	sll	t2,a7,a1
 26c:	00000593          	li	a1,0
 270:	00b506b3          	add	a3,a0,a1
 274:	00a6b5b3          	sltu	a1,a3,a0
 278:	00780833          	add	a6,a6,t2
 27c:	00068513          	mv	a0,a3
 280:	01058833          	add	a6,a1,a6
 284:	01f61693          	slli	a3,a2,0x1f
 288:	00175713          	srli	a4,a4,0x1
 28c:	00178793          	addi	a5,a5,1
 290:	00e6e733          	or	a4,a3,a4
 294:	40165613          	srai	a2,a2,0x1
 298:	03778663          	beq	a5,s7,2c4 <main+0x124>
 29c:	00177693          	andi	a3,a4,1
 2a0:	fe078593          	addi	a1,a5,-32
 2a4:	fe0680e3          	beqz	a3,284 <main+0xe4>
 2a8:	40fc06b3          	sub	a3,s8,a5
 2ac:	00fe13b3          	sll	t2,t3,a5
 2b0:	00d356b3          	srl	a3,t1,a3
 2b4:	fa05dae3          	bgez	a1,268 <main+0xc8>
 2b8:	00f895b3          	sll	a1,a7,a5
 2bc:	0076e3b3          	or	t2,a3,t2
 2c0:	fb1ff06f          	j	270 <main+0xd0>
 2c4:	052f9c63          	bne	t6,s2,31c <main+0x17c>
 2c8:	04029a63          	bnez	t0,31c <main+0x17c>
 2cc:	00aec533          	xor	a0,t4,a0
 2d0:	010f4833          	xor	a6,t5,a6
 2d4:	01056533          	or	a0,a0,a6
 2d8:	00153513          	seqz	a0,a0
 2dc:	004d0d13          	addi	s10,s10,4
 2e0:	db9ff0ef          	jal	ra,98 <nemu_assert>
 2e4:	008c8c93          	addi	s9,s9,8
 2e8:	f3a492e3          	bne	s1,s10,20c <main+0x6c>
 2ec:	00100513          	li	a0,1
 2f0:	da9ff0ef          	jal	ra,98 <nemu_assert>
 2f4:	00498993          	addi	s3,s3,4
 2f8:	00300793          	li	a5,3
 2fc:	414989b3          	sub	s3,s3,s4
 300:	02fa0e63          	beq	s4,a5,33c <main+0x19c>
 304:	001a0a13          	addi	s4,s4,1
 308:	00440413          	addi	s0,s0,4
 30c:	ef6a14e3          	bne	s4,s6,1f4 <main+0x54>
 310:	00100513          	li	a0,1
 314:	d85ff0ef          	jal	ra,98 <nemu_assert>
 318:	fedff06f          	j	304 <main+0x164>
 31c:	40a00533          	neg	a0,a0
 320:	00a037b3          	snez	a5,a0
 324:	41000833          	neg	a6,a6
 328:	40f80833          	sub	a6,a6,a5
 32c:	fa1ff06f          	j	2cc <main+0x12c>
 330:	fff00f93          	li	t6,-1
 334:	fff00293          	li	t0,-1
 338:	efdff06f          	j	234 <main+0x94>
 33c:	00100513          	li	a0,1
 340:	d59ff0ef          	jal	ra,98 <nemu_assert>
 344:	02c12083          	lw	ra,44(sp)
 348:	02812403          	lw	s0,40(sp)
 34c:	02412483          	lw	s1,36(sp)
 350:	02012903          	lw	s2,32(sp)
 354:	01c12983          	lw	s3,28(sp)
 358:	01812a03          	lw	s4,24(sp)
 35c:	01412a83          	lw	s5,20(sp)
 360:	01012b03          	lw	s6,16(sp)
 364:	00c12b83          	lw	s7,12(sp)
 368:	00812c03          	lw	s8,8(sp)
 36c:	00412c83          	lw	s9,4(sp)
 370:	00012d03          	lw	s10,0(sp)
 374:	00000513          	li	a0,0
 378:	03010113          	addi	sp,sp,48
 37c:	00008067          	ret

Disassembly of section .data:

00000380 <test_data>:
 380:	c2aa                	sw	a0,68(sp)
 382:	aeb1                	j	6de <ans+0x34e>
 384:	4500ff2b          	0x4500ff2b
 388:	877190af          	0x877190af
 38c:	2438                	fld	fa4,72(s0)
 38e:	11f4                	addi	a3,sp,236

00000390 <ans>:
 390:	18e4                	addi	s1,sp,124
 392:	db1a                	sw	t1,180(sp)
 394:	9ab9                	andi	a3,a3,-18
 396:	19d2                	slli	s3,s3,0x34
 398:	088e                	slli	a7,a7,0x3
 39a:	986d3ac3          	fmadd.s	fs5,fs10,ft6,fs3,rup
 39e:	ea15                	bnez	a2,3d2 <ans+0x42>
 3a0:	b236                	fsd	fa3,288(sp)
 3a2:	fc0d                	bnez	s0,2dc <main+0x13c>
 3a4:	e980                	fsw	fs0,16(a1)
 3a6:	2649                	jal	728 <ans+0x398>
 3a8:	7d30                	flw	fa2,120(a0)
 3aa:	0a4a                	slli	s4,s4,0x12
 3ac:	43da                	lw	t2,148(sp)
 3ae:	fa4c                	fsw	fa1,52(a2)
 3b0:	b139                	j	ffffffbe <ans+0xfffffc2e>
 3b2:	2c56                	fld	fs8,336(sp)
 3b4:	898e                	mv	s3,gp
 3b6:	1299                	addi	t0,t0,-26
 3b8:	9e65                	0x9e65
 3ba:	0a31                	addi	s4,s4,12
 3bc:	23d5                	jal	9a0 <ans+0x610>
 3be:	df81                	beqz	a5,2d6 <main+0x136>
 3c0:	dd68                	sw	a0,124(a0)
 3c2:	4c15                	li	s8,5
 3c4:	dfa8                	sw	a0,120(a5)
 3c6:	04d6                	slli	s1,s1,0x15
 3c8:	57a1                	li	a5,-24
 3ca:	d79b9e43          	fmadd.q	ft8,fs7,fs9,fs10,rtz
 3ce:	38c5                	jal	fffffcbe <ans+0xfffff92e>
 3d0:	4248                	lw	a0,4(a2)
 3d2:	1efc                	addi	a5,sp,892
 3d4:	f78b91cb          	fnmsub.q	ft3,fs7,fs8,ft10,rtz
 3d8:	cc40                	sw	s0,28(s0)
 3da:	7fdf 55a4 0142      	0x14255a47fdf

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
