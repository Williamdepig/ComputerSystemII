
syn/syn.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <_start>:
   0:	00100093          	addi	ra,zero,1
   4:	00100113          	addi	sp,zero,1
   8:	00500213          	addi	tp,zero,5

000000000000000c <fibonacci>:
   c:	002081b3          	add	gp,ra,sp
  10:	003100b3          	add	ra,sp,gp
  14:	00308133          	add	sp,ra,gp
  18:	fff20213          	addi	tp,tp,-1
  1c:	fe4018e3          	bne	zero,tp,c <fibonacci>
  20:	63d00293          	addi	t0,zero,1597
  24:	0c511e63          	bne	sp,t0,100 <fail>

0000000000000028 <test2>:
  28:	11000113          	addi	sp,zero,272
  2c:	15000193          	addi	gp,zero,336
  30:	00010083          	lb	ra,0(sp)
  34:	00118023          	sb	ra,0(gp)
  38:	00110083          	lb	ra,1(sp)
  3c:	001180a3          	sb	ra,1(gp)
  40:	00211083          	lh	ra,2(sp)
  44:	00119123          	sh	ra,2(gp)
  48:	00412083          	lw	ra,4(sp)
  4c:	0011a223          	sw	ra,4(gp)
  50:	00813083          	ld	ra,8(sp)
  54:	0011b423          	sd	ra,8(gp)
  58:	00014083          	lbu	ra,0(sp)
  5c:	0011b823          	sd	ra,16(gp)
  60:	00010083          	lb	ra,0(sp)
  64:	0011bc23          	sd	ra,24(gp)
  68:	00015083          	lhu	ra,0(sp)
  6c:	0211b023          	sd	ra,32(gp)
  70:	00011083          	lh	ra,0(sp)
  74:	0211b423          	sd	ra,40(gp)
  78:	00016083          	lwu	ra,0(sp)
  7c:	0211b823          	sd	ra,48(gp)
  80:	00012083          	lw	ra,0(sp)
  84:	0211bc23          	sd	ra,56(gp)
  88:	00800093          	addi	ra,zero,8
  8c:	00800293          	addi	t0,zero,8

0000000000000090 <memcmp>:
  90:	02008063          	beq	ra,zero,b0 <test3>
  94:	00013203          	ld	tp,0(sp)
  98:	0001b303          	ld	t1,0(gp)
  9c:	00510133          	add	sp,sp,t0
  a0:	005181b3          	add	gp,gp,t0
  a4:	fff08093          	addi	ra,ra,-1
  a8:	04621c63          	bne	tp,t1,100 <fail>
  ac:	fe5ff06f          	jal	zero,90 <memcmp>

00000000000000b0 <test3>:
  b0:	deadb0b7          	lui	ra,0xdeadb
  b4:	0ef06113          	ori	sp,zero,239
  b8:	002081b3          	add	gp,ra,sp
  bc:	00140413          	addi	s0,s0,1
  c0:	02041413          	slli	s0,s0,0x20
  c4:	008181b3          	add	gp,gp,s0
  c8:	401100b3          	sub	ra,sp,ra
  cc:	00100113          	addi	sp,zero,1
  d0:	0021d233          	srl	tp,gp,sp
  d4:	0040f133          	and	sp,ra,tp
  d8:	215250b7          	lui	ra,0x21525
  dc:	06708093          	addi	ra,ra,103 # 21525067 <_end+0x21524f17>
  e0:	02111063          	bne	sp,ra,100 <fail>
  e4:	00000097          	auipc	ra,0x0
  e8:	00c08093          	addi	ra,ra,12 # f0 <jalr_here>
  ec:	000080e7          	jalr	ra,0(ra)

00000000000000f0 <jalr_here>:
  f0:	00000117          	auipc	sp,0x0
  f4:	00010113          	addi	sp,sp,0 # f0 <jalr_here>
  f8:	00209463          	bne	ra,sp,100 <fail>

00000000000000fc <pass>:
  fc:	0000006f          	jal	zero,fc <pass>

0000000000000100 <fail>:
 100:	0000006f          	jal	zero,100 <fail>

Disassembly of section .data:

0000000000000110 <databegin>:
 110:	f6f8                	c.sd	a4,232(a3)
 112:	f234                	c.sd	a3,96(a2)
 114:	4321                	c.li	t1,8
 116:	8765                	c.srai	a4,0x19
 118:	23333333          	0x23333333
 11c:	6666                	c.ldsp	a2,88(sp)
 11e:	6666                	c.ldsp	a2,88(sp)
 120:	00f8                	c.addi4spn	a4,sp,76
 122:	0000                	c.unimp
 124:	0000                	c.unimp
 126:	0000                	c.unimp
 128:	fff8                	c.sd	a4,248(a5)
 12a:	ffff                	0xffff
 12c:	ffff                	0xffff
 12e:	ffff                	0xffff
 130:	f6f8                	c.sd	a4,232(a3)
 132:	0000                	c.unimp
 134:	0000                	c.unimp
 136:	0000                	c.unimp
 138:	f6f8                	c.sd	a4,232(a3)
 13a:	ffff                	0xffff
 13c:	ffff                	0xffff
 13e:	ffff                	0xffff
 140:	f6f8                	c.sd	a4,232(a3)
 142:	f234                	c.sd	a3,96(a2)
 144:	0000                	c.unimp
 146:	0000                	c.unimp
 148:	f6f8                	c.sd	a4,232(a3)
 14a:	f234                	c.sd	a3,96(a2)
 14c:	ffff                	0xffff
 14e:	ffff                	0xffff

Disassembly of section .riscv.attributes:

0000000000000000 <.riscv.attributes>:
   0:	1941                	c.addi	s2,-16
   2:	0000                	c.unimp
   4:	7200                	c.ld	s0,32(a2)
   6:	7369                	c.lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <fibonacci+0x8>
   c:	0000000f          	fence	unknown,unknown
  10:	7205                	c.lui	tp,0xfffe1
  12:	3676                	c.fldsp	fa2,376(sp)
  14:	6934                	c.ld	a3,80(a0)
  16:	7032                	0x7032
  18:	0030                	c.addi4spn	a2,sp,8
