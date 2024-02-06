
utype.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <_start>:
   0:	00100193          	addi	gp,zero,1
   4:	000000b7          	lui	ra,0x0
   8:	00000393          	addi	t2,zero,0
   c:	08709863          	bne	ra,t2,9c <fail>

0000000000000010 <test_2>:
  10:	00200193          	addi	gp,zero,2
  14:	fffff0b7          	lui	ra,0xfffff
  18:	4010d093          	srai	ra,ra,0x1
  1c:	80000393          	addi	t2,zero,-2048
  20:	06709e63          	bne	ra,t2,9c <fail>

0000000000000024 <test_3>:
  24:	00300193          	addi	gp,zero,3
  28:	7ffff0b7          	lui	ra,0x7ffff
  2c:	4140d093          	srai	ra,ra,0x14
  30:	7ff00393          	addi	t2,zero,2047
  34:	06709463          	bne	ra,t2,9c <fail>

0000000000000038 <test_4>:
  38:	00400193          	addi	gp,zero,4
  3c:	800000b7          	lui	ra,0x80000
  40:	4140d093          	srai	ra,ra,0x14
  44:	80000393          	addi	t2,zero,-2048
  48:	04709a63          	bne	ra,t2,9c <fail>

000000000000004c <test_5>:
  4c:	00500193          	addi	gp,zero,5
  50:	80000037          	lui	zero,0x80000
  54:	00000393          	addi	t2,zero,0
  58:	04701263          	bne	zero,t2,9c <fail>

000000000000005c <test_6>:
  5c:	00600193          	addi	gp,zero,6
  60:	00000517          	auipc	a0,0x0
  64:	3f450513          	addi	a0,a0,1012 # 454 <_end+0x3a4>
  68:	004005ef          	jal	a1,6c <test_6+0x10>
  6c:	40b50533          	sub	a0,a0,a1
  70:	3e800393          	addi	t2,zero,1000
  74:	02751463          	bne	a0,t2,9c <fail>

0000000000000078 <test_7>:
  78:	00700193          	addi	gp,zero,7
  7c:	00000013          	addi	zero,zero,0
  80:	00000517          	auipc	a0,0x0
  84:	c2450513          	addi	a0,a0,-988 # fffffffffffffca4 <_end+0xfffffffffffffbf4>
  88:	004005ef          	jal	a1,8c <test_7+0x14>
  8c:	40b50533          	sub	a0,a0,a1
  90:	c1800393          	addi	t2,zero,-1000
  94:	00751463          	bne	a0,t2,9c <fail>
  98:	00301663          	bne	zero,gp,a4 <pass>

000000000000009c <fail>:
  9c:	00100093          	addi	ra,zero,1
  a0:	c0001073          	unimp

00000000000000a4 <pass>:
  a4:	00000093          	addi	ra,zero,0
  a8:	c0001073          	unimp
