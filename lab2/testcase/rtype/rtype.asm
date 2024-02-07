
rtype.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <_start>:
   0:	01000093          	addi	ra,zero,16
   4:	01e00113          	addi	sp,zero,30
   8:	00208033          	add	zero,ra,sp

000000000000000c <test_2>:
   c:	00000093          	addi	ra,zero,0
  10:	00000113          	addi	sp,zero,0
  14:	00208733          	add	a4,ra,sp

0000000000000018 <test_3>:
  18:	00100093          	addi	ra,zero,1
  1c:	00100113          	addi	sp,zero,1
  20:	00208733          	add	a4,ra,sp

0000000000000024 <test_4>:
  24:	00300093          	addi	ra,zero,3
  28:	00700113          	addi	sp,zero,7
  2c:	00208733          	add	a4,ra,sp

0000000000000030 <test_5>:
  30:	000000b3          	add	ra,zero,zero

0000000000000034 <test_6>:
  34:	00d00093          	addi	ra,zero,13
  38:	00b00113          	addi	sp,zero,11
  3c:	002080b3          	add	ra,ra,sp

0000000000000040 <test_7>:
  40:	00d00093          	addi	ra,zero,13
  44:	001080b3          	add	ra,ra,ra

0000000000000048 <test_8>:
  48:	00f00093          	addi	ra,zero,15
  4c:	00100133          	add	sp,zero,ra

0000000000000050 <test_9>:
  50:	02000093          	addi	ra,zero,32
  54:	00008133          	add	sp,ra,zero

0000000000000058 <test_10>:
  58:	ff100093          	addi	ra,zero,-15
  5c:	40100133          	sub	sp,zero,ra

0000000000000060 <test_11>:
  60:	00d00093          	addi	ra,zero,13
  64:	00b00113          	addi	sp,zero,11
  68:	402080b3          	sub	ra,ra,sp

000000000000006c <test_12>:
  6c:	00e00093          	addi	ra,zero,14
  70:	00b00113          	addi	sp,zero,11
  74:	40208133          	sub	sp,ra,sp

0000000000000078 <test_13>:
  78:	00d00093          	addi	ra,zero,13
  7c:	401080b3          	sub	ra,ra,ra

0000000000000080 <test_14>:
  80:	02000093          	addi	ra,zero,32
  84:	40008133          	sub	sp,ra,zero

0000000000000088 <test_15>:
  88:	400000b3          	sub	ra,zero,zero

000000000000008c <test_16>:
  8c:	01000093          	addi	ra,zero,16
  90:	01e00113          	addi	sp,zero,30
  94:	40208033          	sub	zero,ra,sp

0000000000000098 <test_17>:
  98:	00100093          	addi	ra,zero,1
  9c:	00700113          	addi	sp,zero,7
  a0:	002090b3          	sll	ra,ra,sp

00000000000000a4 <test_18>:
  a4:	00100093          	addi	ra,zero,1
  a8:	00e00113          	addi	sp,zero,14
  ac:	00209133          	sll	sp,ra,sp

00000000000000b0 <test_19>:
  b0:	00300093          	addi	ra,zero,3
  b4:	001090b3          	sll	ra,ra,ra

00000000000000b8 <test_20>:
  b8:	02000093          	addi	ra,zero,32
  bc:	00009133          	sll	sp,ra,zero

00000000000000c0 <test_21>:
  c0:	00f00093          	addi	ra,zero,15
  c4:	00101133          	sll	sp,zero,ra

00000000000000c8 <test_22>:
  c8:	000010b3          	sll	ra,zero,zero

00000000000000cc <test_23>:
  cc:	00e00093          	addi	ra,zero,14
  d0:	00d00113          	addi	sp,zero,13
  d4:	0020a0b3          	slt	ra,ra,sp

00000000000000d8 <test_24>:
  d8:	00b00093          	addi	ra,zero,11
  dc:	00d00113          	addi	sp,zero,13
  e0:	0020a133          	slt	sp,ra,sp

00000000000000e4 <test_25>:
  e4:	00d00093          	addi	ra,zero,13
  e8:	0010a0b3          	slt	ra,ra,ra

00000000000000ec <test_26>:
  ec:	fff00093          	addi	ra,zero,-1
  f0:	00102133          	slt	sp,zero,ra

00000000000000f4 <test_27>:
  f4:	fff00093          	addi	ra,zero,-1
  f8:	0000a133          	slt	sp,ra,zero

00000000000000fc <test_28>:
  fc:	000020b3          	slt	ra,zero,zero

0000000000000100 <test_29>:
 100:	01000093          	addi	ra,zero,16
 104:	01e00113          	addi	sp,zero,30
 108:	0020a033          	slt	zero,ra,sp

000000000000010c <test_30>:
 10c:	00e00093          	addi	ra,zero,14
 110:	00d00113          	addi	sp,zero,13
 114:	0020b0b3          	sltu	ra,ra,sp

0000000000000118 <test_31>:
 118:	00b00093          	addi	ra,zero,11
 11c:	00d00113          	addi	sp,zero,13
 120:	0020b133          	sltu	sp,ra,sp

0000000000000124 <test_32>:
 124:	00d00093          	addi	ra,zero,13
 128:	0010b0b3          	sltu	ra,ra,ra

000000000000012c <test_33>:
 12c:	fff00093          	addi	ra,zero,-1
 130:	00103133          	sltu	sp,zero,ra

0000000000000134 <test_34>:
 134:	fff00093          	addi	ra,zero,-1
 138:	0000b133          	sltu	sp,ra,zero

000000000000013c <test_35>:
 13c:	000030b3          	sltu	ra,zero,zero

0000000000000140 <test_36>:
 140:	01000093          	addi	ra,zero,16
 144:	01e00113          	addi	sp,zero,30
 148:	0020b033          	sltu	zero,ra,sp

000000000000014c <test_37>:
 14c:	0ff00093          	addi	ra,zero,255
 150:	00f00113          	addi	sp,zero,15
 154:	0020c733          	xor	a4,ra,sp

0000000000000158 <test_38>:
 158:	00f00093          	addi	ra,zero,15
 15c:	0f000113          	addi	sp,zero,240
 160:	0020c733          	xor	a4,ra,sp

0000000000000164 <test_39>:
 164:	00000093          	addi	ra,zero,0
 168:	00f00113          	addi	sp,zero,15
 16c:	0020c0b3          	xor	ra,ra,sp

0000000000000170 <test_40>:
 170:	000040b3          	xor	ra,zero,zero

0000000000000174 <test_41>:
 174:	01100093          	addi	ra,zero,17
 178:	02200113          	addi	sp,zero,34
 17c:	0020c033          	xor	zero,ra,sp

0000000000000180 <test_42>:
 180:	00700093          	addi	ra,zero,7
 184:	0010d0b3          	srl	ra,ra,ra

0000000000000188 <test_43>:
 188:	00f00093          	addi	ra,zero,15
 18c:	00105133          	srl	sp,zero,ra

0000000000000190 <test_44>:
 190:	02000093          	addi	ra,zero,32
 194:	0000d133          	srl	sp,ra,zero

0000000000000198 <test_45>:
 198:	000050b3          	srl	ra,zero,zero

000000000000019c <test_46>:
 19c:	00700093          	addi	ra,zero,7
 1a0:	4010d0b3          	sra	ra,ra,ra

00000000000001a4 <test_47>:
 1a4:	00f00093          	addi	ra,zero,15
 1a8:	40105133          	sra	sp,zero,ra

00000000000001ac <test_48>:
 1ac:	02000093          	addi	ra,zero,32
 1b0:	4000d133          	sra	sp,ra,zero

00000000000001b4 <test_49>:
 1b4:	400050b3          	sra	ra,zero,zero

00000000000001b8 <test_50>:
 1b8:	00000093          	addi	ra,zero,0
 1bc:	00f00113          	addi	sp,zero,15
 1c0:	0020e0b3          	or	ra,ra,sp

00000000000001c4 <test_51>:
 1c4:	00f00093          	addi	ra,zero,15
 1c8:	0f000113          	addi	sp,zero,240
 1cc:	0020e733          	or	a4,ra,sp

00000000000001d0 <test_52>:
 1d0:	01100093          	addi	ra,zero,17
 1d4:	02200113          	addi	sp,zero,34
 1d8:	0020e033          	or	zero,ra,sp

00000000000001dc <test_53>:
 1dc:	0ff00093          	addi	ra,zero,255
 1e0:	00f00113          	addi	sp,zero,15
 1e4:	0020f733          	and	a4,ra,sp

00000000000001e8 <test_54>:
 1e8:	00f00093          	addi	ra,zero,15
 1ec:	0f000113          	addi	sp,zero,240
 1f0:	0020f733          	and	a4,ra,sp

00000000000001f4 <test_55>:
 1f4:	000070b3          	and	ra,zero,zero

00000000000001f8 <test_56>:
 1f8:	01100093          	addi	ra,zero,17
 1fc:	02200113          	addi	sp,zero,34
 200:	0020f033          	and	zero,ra,sp
 204:	c0001073          	unimp
