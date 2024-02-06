
itype.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <_start>:
   0:	00000093          	addi	ra,zero,0
   4:	00008713          	addi	a4,ra,0

0000000000000008 <test_2>:
   8:	00100093          	addi	ra,zero,1
   c:	00108713          	addi	a4,ra,1

0000000000000010 <test_3>:
  10:	00300093          	addi	ra,zero,3
  14:	00708713          	addi	a4,ra,7

0000000000000018 <test_4>:
  18:	00d00093          	addi	ra,zero,13
  1c:	00b08093          	addi	ra,ra,11

0000000000000020 <test_5>:
  20:	02000093          	addi	ra,zero,32

0000000000000024 <test_6>:
  24:	02100093          	addi	ra,zero,33
  28:	03208013          	addi	zero,ra,50

000000000000002c <test_7>:
  2c:	00000093          	addi	ra,zero,0
  30:	0000a713          	slti	a4,ra,0

0000000000000034 <test_8>:
  34:	00100093          	addi	ra,zero,1
  38:	0010a713          	slti	a4,ra,1

000000000000003c <test_9>:
  3c:	00300093          	addi	ra,zero,3
  40:	0070a713          	slti	a4,ra,7

0000000000000044 <test_10>:
  44:	00b00093          	addi	ra,zero,11
  48:	00d0a093          	slti	ra,ra,13

000000000000004c <test_11>:
  4c:	fff02093          	slti	ra,zero,-1

0000000000000050 <test_12>:
  50:	0f000093          	addi	ra,zero,240
  54:	00f0a013          	slti	zero,ra,15

0000000000000058 <test_13>:
  58:	00000093          	addi	ra,zero,0
  5c:	0000b713          	sltiu	a4,ra,0

0000000000000060 <test_14>:
  60:	00100093          	addi	ra,zero,1
  64:	0010b713          	sltiu	a4,ra,1

0000000000000068 <test_15>:
  68:	00300093          	addi	ra,zero,3
  6c:	0070b713          	sltiu	a4,ra,7

0000000000000070 <test_16>:
  70:	00b00093          	addi	ra,zero,11
  74:	00d0b093          	sltiu	ra,ra,13

0000000000000078 <test_17>:
  78:	fff03093          	sltiu	ra,zero,-1

000000000000007c <test_18>:
  7c:	0ff00093          	addi	ra,zero,255
  80:	0f00b013          	sltiu	zero,ra,240

0000000000000084 <test_19>:
  84:	00000093          	addi	ra,zero,0
  88:	00f0c713          	xori	a4,ra,15

000000000000008c <test_20>:
  8c:	0ff00093          	addi	ra,zero,255
  90:	00f0c713          	xori	a4,ra,15

0000000000000094 <test_21>:
  94:	00f00093          	addi	ra,zero,15
  98:	0f00c713          	xori	a4,ra,240

000000000000009c <test_22>:
  9c:	00000093          	addi	ra,zero,0
  a0:	00f0c093          	xori	ra,ra,15

00000000000000a4 <test_23>:
  a4:	0f004093          	xori	ra,zero,240

00000000000000a8 <test_24>:
  a8:	0ff00093          	addi	ra,zero,255
  ac:	00f0c013          	xori	zero,ra,15

00000000000000b0 <test_25>:
  b0:	0f000093          	addi	ra,zero,240
  b4:	0f00e713          	ori	a4,ra,240

00000000000000b8 <test_26>:
  b8:	0ff00093          	addi	ra,zero,255
  bc:	00f0e713          	ori	a4,ra,15

00000000000000c0 <test_27>:
  c0:	00f00093          	addi	ra,zero,15
  c4:	0f00e713          	ori	a4,ra,240

00000000000000c8 <test_28>:
  c8:	00000093          	addi	ra,zero,0
  cc:	0f00e093          	ori	ra,ra,240

00000000000000d0 <test_29>:
  d0:	0f006093          	ori	ra,zero,240

00000000000000d4 <test_30>:
  d4:	0ff00093          	addi	ra,zero,255
  d8:	00f0e013          	ori	zero,ra,15

00000000000000dc <test_31>:
  dc:	0f000093          	addi	ra,zero,240
  e0:	0f00f713          	andi	a4,ra,240

00000000000000e4 <test_32>:
  e4:	0ff00093          	addi	ra,zero,255
  e8:	00f0f713          	andi	a4,ra,15

00000000000000ec <test_33>:
  ec:	00f00093          	addi	ra,zero,15
  f0:	0f00f713          	andi	a4,ra,240

00000000000000f4 <test_34>:
  f4:	00000093          	addi	ra,zero,0
  f8:	0f00f093          	andi	ra,ra,240

00000000000000fc <test_35>:
  fc:	0f007093          	andi	ra,zero,240

0000000000000100 <test_36>:
 100:	0ff00093          	addi	ra,zero,255
 104:	00f0f013          	andi	zero,ra,15

0000000000000108 <test_37>:
 108:	00100093          	addi	ra,zero,1
 10c:	00009713          	slli	a4,ra,0x0

0000000000000110 <test_38>:
 110:	00100093          	addi	ra,zero,1
 114:	00109713          	slli	a4,ra,0x1

0000000000000118 <test_39>:
 118:	00100093          	addi	ra,zero,1
 11c:	00709713          	slli	a4,ra,0x7

0000000000000120 <test_40>:
 120:	00100093          	addi	ra,zero,1
 124:	00e09713          	slli	a4,ra,0xe

0000000000000128 <test_41>:
 128:	00100093          	addi	ra,zero,1
 12c:	00709093          	slli	ra,ra,0x7

0000000000000130 <test_42>:
 130:	02100093          	addi	ra,zero,33
 134:	01409013          	slli	zero,ra,0x14

0000000000000138 <test_43>:
 138:	20f00093          	addi	ra,zero,527
 13c:	0010d713          	srli	a4,ra,0x1

0000000000000140 <test_44>:
 140:	20f00093          	addi	ra,zero,527
 144:	0070d713          	srli	a4,ra,0x7

0000000000000148 <test_45>:
 148:	20f00093          	addi	ra,zero,527
 14c:	00e0d713          	srli	a4,ra,0xe

0000000000000150 <test_46>:
 150:	40000093          	addi	ra,zero,1024
 154:	0070d093          	srli	ra,ra,0x7

0000000000000158 <test_47>:
 158:	00405093          	srli	ra,zero,0x4

000000000000015c <test_48>:
 15c:	02100093          	addi	ra,zero,33
 160:	00a0d013          	srli	zero,ra,0xa

0000000000000164 <test_49>:
 164:	0ff00093          	addi	ra,zero,255
 168:	4000d713          	srai	a4,ra,0x0

000000000000016c <test_50>:
 16c:	0fc00093          	addi	ra,zero,252
 170:	4010d713          	srai	a4,ra,0x1

0000000000000174 <test_51>:
 174:	0ff00093          	addi	ra,zero,255
 178:	4070d713          	srai	a4,ra,0x7

000000000000017c <test_52>:
 17c:	18100093          	addi	ra,zero,385
 180:	4010d713          	srai	a4,ra,0x1

0000000000000184 <test_53>:
 184:	40405093          	srai	ra,zero,0x4

0000000000000188 <test_54>:
 188:	02100093          	addi	ra,zero,33
 18c:	40a0d013          	srai	zero,ra,0xa

0000000000000190 <test_55>:
 190:	0ff00793          	addi	a5,zero,255
 194:	1e000093          	addi	ra,zero,480
 198:	0180b703          	ld	a4,24(ra)

000000000000019c <test_56>:
 19c:	0ab00793          	addi	a5,zero,171
 1a0:	1e000093          	addi	ra,zero,480
 1a4:	0080b703          	ld	a4,8(ra)

00000000000001a8 <test_57>:
 1a8:	0de00793          	addi	a5,zero,222
 1ac:	1f800093          	addi	ra,zero,504
 1b0:	fe80b703          	ld	a4,-24(ra)

00000000000001b4 <test_58>:
 1b4:	0cd00793          	addi	a5,zero,205
 1b8:	1f800093          	addi	ra,zero,504
 1bc:	ff80b703          	ld	a4,-8(ra)

00000000000001c0 <test_59>:
 1c0:	1e000093          	addi	ra,zero,480
 1c4:	fe008093          	addi	ra,ra,-32
 1c8:	0200b283          	ld	t0,32(ra)

00000000000001cc <test_60>:
 1cc:	1e000093          	addi	ra,zero,480
 1d0:	ffd08093          	addi	ra,ra,-3
 1d4:	00b0b283          	ld	t0,11(ra)
 1d8:	c0001073          	unimp

Disassembly of section .data:

00000000000001e0 <tdat>:
 1e0:	00de                	.2byte	0xde
 1e2:	0000                	.2byte	0x0
 1e4:	0000                	.2byte	0x0
	...

00000000000001e8 <tdat2>:
 1e8:	000000ab          	.4byte	0xab
 1ec:	0000                	.2byte	0x0
	...

00000000000001f0 <tdat3>:
 1f0:	00cd                	.2byte	0xcd
 1f2:	0000                	.2byte	0x0
 1f4:	0000                	.2byte	0x0
	...

00000000000001f8 <tdat4>:
 1f8:	ff 00 00 00 	Address 0x1f8 is out of bounds.

 1fc:	00 
 1fd:	0000                	.2byte	0x0
	...