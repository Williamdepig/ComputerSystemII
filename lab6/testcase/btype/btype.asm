
btype.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <_start>:
   0:	00100193          	addi	gp,zero,1
   4:	fff00093          	addi	ra,zero,-1
   8:	fff00113          	addi	sp,zero,-1
   c:	00208663          	beq	ra,sp,18 <_start+0x18>
  10:	52301063          	bne	zero,gp,530 <fail>
  14:	00301663          	bne	zero,gp,20 <test_2>
  18:	fe208ee3          	beq	ra,sp,14 <_start+0x14>
  1c:	50301a63          	bne	zero,gp,530 <fail>

0000000000000020 <test_2>:
  20:	00200193          	addi	gp,zero,2
  24:	00000093          	addi	ra,zero,0
  28:	00000113          	addi	sp,zero,0
  2c:	00208663          	beq	ra,sp,38 <test_2+0x18>
  30:	50301063          	bne	zero,gp,530 <fail>
  34:	00301663          	bne	zero,gp,40 <test_3>
  38:	fe208ee3          	beq	ra,sp,34 <test_2+0x14>
  3c:	4e301a63          	bne	zero,gp,530 <fail>

0000000000000040 <test_3>:
  40:	00300193          	addi	gp,zero,3
  44:	00100093          	addi	ra,zero,1
  48:	00100113          	addi	sp,zero,1
  4c:	00208663          	beq	ra,sp,58 <test_3+0x18>
  50:	4e301063          	bne	zero,gp,530 <fail>
  54:	00301663          	bne	zero,gp,60 <test_4>
  58:	fe208ee3          	beq	ra,sp,54 <test_3+0x14>
  5c:	4c301a63          	bne	zero,gp,530 <fail>

0000000000000060 <test_4>:
  60:	00400193          	addi	gp,zero,4
  64:	00100093          	addi	ra,zero,1
  68:	fff00113          	addi	sp,zero,-1
  6c:	00208463          	beq	ra,sp,74 <test_4+0x14>
  70:	00301463          	bne	zero,gp,78 <test_4+0x18>
  74:	4a301e63          	bne	zero,gp,530 <fail>
  78:	fe208ee3          	beq	ra,sp,74 <test_4+0x14>

000000000000007c <test_5>:
  7c:	00500193          	addi	gp,zero,5
  80:	00000093          	addi	ra,zero,0
  84:	00100113          	addi	sp,zero,1
  88:	00208463          	beq	ra,sp,90 <test_5+0x14>
  8c:	00301463          	bne	zero,gp,94 <test_5+0x18>
  90:	4a301063          	bne	zero,gp,530 <fail>
  94:	fe208ee3          	beq	ra,sp,90 <test_5+0x14>

0000000000000098 <test_6>:
  98:	00600193          	addi	gp,zero,6
  9c:	00100093          	addi	ra,zero,1
  a0:	00000113          	addi	sp,zero,0
  a4:	00208463          	beq	ra,sp,ac <test_6+0x14>
  a8:	00301463          	bne	zero,gp,b0 <test_6+0x18>
  ac:	48301263          	bne	zero,gp,530 <fail>
  b0:	fe208ee3          	beq	ra,sp,ac <test_6+0x14>

00000000000000b4 <test_7>:
  b4:	00700193          	addi	gp,zero,7
  b8:	fff00093          	addi	ra,zero,-1
  bc:	00100113          	addi	sp,zero,1
  c0:	00208463          	beq	ra,sp,c8 <test_7+0x14>
  c4:	00301463          	bne	zero,gp,cc <test_7+0x18>
  c8:	46301463          	bne	zero,gp,530 <fail>
  cc:	fe208ee3          	beq	ra,sp,c8 <test_7+0x14>

00000000000000d0 <test_8>:
  d0:	00800193          	addi	gp,zero,8
  d4:	00000093          	addi	ra,zero,0
  d8:	00100113          	addi	sp,zero,1
  dc:	00209663          	bne	ra,sp,e8 <test_8+0x18>
  e0:	44301863          	bne	zero,gp,530 <fail>
  e4:	00301663          	bne	zero,gp,f0 <test_9>
  e8:	fe209ee3          	bne	ra,sp,e4 <test_8+0x14>
  ec:	44301263          	bne	zero,gp,530 <fail>

00000000000000f0 <test_9>:
  f0:	00900193          	addi	gp,zero,9
  f4:	00100093          	addi	ra,zero,1
  f8:	00000113          	addi	sp,zero,0
  fc:	00209663          	bne	ra,sp,108 <test_9+0x18>
 100:	42301863          	bne	zero,gp,530 <fail>
 104:	00301663          	bne	zero,gp,110 <test_10>
 108:	fe209ee3          	bne	ra,sp,104 <test_9+0x14>
 10c:	42301263          	bne	zero,gp,530 <fail>

0000000000000110 <test_10>:
 110:	00a00193          	addi	gp,zero,10
 114:	fff00093          	addi	ra,zero,-1
 118:	00100113          	addi	sp,zero,1
 11c:	00209663          	bne	ra,sp,128 <test_10+0x18>
 120:	40301863          	bne	zero,gp,530 <fail>
 124:	00301663          	bne	zero,gp,130 <test_11>
 128:	fe209ee3          	bne	ra,sp,124 <test_10+0x14>
 12c:	40301263          	bne	zero,gp,530 <fail>

0000000000000130 <test_11>:
 130:	00b00193          	addi	gp,zero,11
 134:	00100093          	addi	ra,zero,1
 138:	fff00113          	addi	sp,zero,-1
 13c:	00209663          	bne	ra,sp,148 <test_11+0x18>
 140:	3e301863          	bne	zero,gp,530 <fail>
 144:	00301663          	bne	zero,gp,150 <test_12>
 148:	fe209ee3          	bne	ra,sp,144 <test_11+0x14>
 14c:	3e301263          	bne	zero,gp,530 <fail>

0000000000000150 <test_12>:
 150:	00c00193          	addi	gp,zero,12
 154:	00000093          	addi	ra,zero,0
 158:	00000113          	addi	sp,zero,0
 15c:	00209463          	bne	ra,sp,164 <test_12+0x14>
 160:	00301463          	bne	zero,gp,168 <test_12+0x18>
 164:	3c301663          	bne	zero,gp,530 <fail>
 168:	fe209ee3          	bne	ra,sp,164 <test_12+0x14>

000000000000016c <test_13>:
 16c:	00d00193          	addi	gp,zero,13
 170:	00100093          	addi	ra,zero,1
 174:	00100113          	addi	sp,zero,1
 178:	00209463          	bne	ra,sp,180 <test_13+0x14>
 17c:	00301463          	bne	zero,gp,184 <test_13+0x18>
 180:	3a301863          	bne	zero,gp,530 <fail>
 184:	fe209ee3          	bne	ra,sp,180 <test_13+0x14>

0000000000000188 <test_14>:
 188:	00e00193          	addi	gp,zero,14
 18c:	fff00093          	addi	ra,zero,-1
 190:	fff00113          	addi	sp,zero,-1
 194:	00209463          	bne	ra,sp,19c <test_14+0x14>
 198:	00301463          	bne	zero,gp,1a0 <test_14+0x18>
 19c:	38301a63          	bne	zero,gp,530 <fail>
 1a0:	fe209ee3          	bne	ra,sp,19c <test_14+0x14>

00000000000001a4 <test_15>:
 1a4:	00f00193          	addi	gp,zero,15
 1a8:	00000093          	addi	ra,zero,0
 1ac:	00100113          	addi	sp,zero,1
 1b0:	0020c663          	blt	ra,sp,1bc <test_15+0x18>
 1b4:	36301e63          	bne	zero,gp,530 <fail>
 1b8:	00301663          	bne	zero,gp,1c4 <test_16>
 1bc:	fe20cee3          	blt	ra,sp,1b8 <test_15+0x14>
 1c0:	36301863          	bne	zero,gp,530 <fail>

00000000000001c4 <test_16>:
 1c4:	01000193          	addi	gp,zero,16
 1c8:	fff00093          	addi	ra,zero,-1
 1cc:	00100113          	addi	sp,zero,1
 1d0:	0020c663          	blt	ra,sp,1dc <test_16+0x18>
 1d4:	34301e63          	bne	zero,gp,530 <fail>
 1d8:	00301663          	bne	zero,gp,1e4 <test_17>
 1dc:	fe20cee3          	blt	ra,sp,1d8 <test_16+0x14>
 1e0:	34301863          	bne	zero,gp,530 <fail>

00000000000001e4 <test_17>:
 1e4:	01100193          	addi	gp,zero,17
 1e8:	ffe00093          	addi	ra,zero,-2
 1ec:	fff00113          	addi	sp,zero,-1
 1f0:	0020c663          	blt	ra,sp,1fc <test_17+0x18>
 1f4:	32301e63          	bne	zero,gp,530 <fail>
 1f8:	00301663          	bne	zero,gp,204 <test_18>
 1fc:	fe20cee3          	blt	ra,sp,1f8 <test_17+0x14>
 200:	32301863          	bne	zero,gp,530 <fail>

0000000000000204 <test_18>:
 204:	01200193          	addi	gp,zero,18
 208:	00100093          	addi	ra,zero,1
 20c:	00000113          	addi	sp,zero,0
 210:	0020c463          	blt	ra,sp,218 <test_18+0x14>
 214:	00301463          	bne	zero,gp,21c <test_18+0x18>
 218:	30301c63          	bne	zero,gp,530 <fail>
 21c:	fe20cee3          	blt	ra,sp,218 <test_18+0x14>

0000000000000220 <test_19>:
 220:	01300193          	addi	gp,zero,19
 224:	00100093          	addi	ra,zero,1
 228:	fff00113          	addi	sp,zero,-1
 22c:	0020c463          	blt	ra,sp,234 <test_19+0x14>
 230:	00301463          	bne	zero,gp,238 <test_19+0x18>
 234:	2e301e63          	bne	zero,gp,530 <fail>
 238:	fe20cee3          	blt	ra,sp,234 <test_19+0x14>

000000000000023c <test_20>:
 23c:	01400193          	addi	gp,zero,20
 240:	fff00093          	addi	ra,zero,-1
 244:	ffe00113          	addi	sp,zero,-2
 248:	0020c463          	blt	ra,sp,250 <test_20+0x14>
 24c:	00301463          	bne	zero,gp,254 <test_20+0x18>
 250:	2e301063          	bne	zero,gp,530 <fail>
 254:	fe20cee3          	blt	ra,sp,250 <test_20+0x14>

0000000000000258 <test_21>:
 258:	01500193          	addi	gp,zero,21
 25c:	00100093          	addi	ra,zero,1
 260:	ffe00113          	addi	sp,zero,-2
 264:	0020c463          	blt	ra,sp,26c <test_21+0x14>
 268:	00301463          	bne	zero,gp,270 <test_21+0x18>
 26c:	2c301263          	bne	zero,gp,530 <fail>
 270:	fe20cee3          	blt	ra,sp,26c <test_21+0x14>

0000000000000274 <test_22>:
 274:	01600193          	addi	gp,zero,22
 278:	00000093          	addi	ra,zero,0
 27c:	00000113          	addi	sp,zero,0
 280:	0020d663          	bge	ra,sp,28c <test_22+0x18>
 284:	2a301663          	bne	zero,gp,530 <fail>
 288:	00301663          	bne	zero,gp,294 <test_23>
 28c:	fe20dee3          	bge	ra,sp,288 <test_22+0x14>
 290:	2a301063          	bne	zero,gp,530 <fail>

0000000000000294 <test_23>:
 294:	01700193          	addi	gp,zero,23
 298:	00100093          	addi	ra,zero,1
 29c:	00100113          	addi	sp,zero,1
 2a0:	0020d663          	bge	ra,sp,2ac <test_23+0x18>
 2a4:	28301663          	bne	zero,gp,530 <fail>
 2a8:	00301663          	bne	zero,gp,2b4 <test_24>
 2ac:	fe20dee3          	bge	ra,sp,2a8 <test_23+0x14>
 2b0:	28301063          	bne	zero,gp,530 <fail>

00000000000002b4 <test_24>:
 2b4:	01800193          	addi	gp,zero,24
 2b8:	fff00093          	addi	ra,zero,-1
 2bc:	fff00113          	addi	sp,zero,-1
 2c0:	0020d663          	bge	ra,sp,2cc <test_24+0x18>
 2c4:	26301663          	bne	zero,gp,530 <fail>
 2c8:	00301663          	bne	zero,gp,2d4 <test_25>
 2cc:	fe20dee3          	bge	ra,sp,2c8 <test_24+0x14>
 2d0:	26301063          	bne	zero,gp,530 <fail>

00000000000002d4 <test_25>:
 2d4:	01900193          	addi	gp,zero,25
 2d8:	00100093          	addi	ra,zero,1
 2dc:	00000113          	addi	sp,zero,0
 2e0:	0020d663          	bge	ra,sp,2ec <test_25+0x18>
 2e4:	24301663          	bne	zero,gp,530 <fail>
 2e8:	00301663          	bne	zero,gp,2f4 <test_26>
 2ec:	fe20dee3          	bge	ra,sp,2e8 <test_25+0x14>
 2f0:	24301063          	bne	zero,gp,530 <fail>

00000000000002f4 <test_26>:
 2f4:	01a00193          	addi	gp,zero,26
 2f8:	00100093          	addi	ra,zero,1
 2fc:	fff00113          	addi	sp,zero,-1
 300:	0020d663          	bge	ra,sp,30c <test_26+0x18>
 304:	22301663          	bne	zero,gp,530 <fail>
 308:	00301663          	bne	zero,gp,314 <test_27>
 30c:	fe20dee3          	bge	ra,sp,308 <test_26+0x14>
 310:	22301063          	bne	zero,gp,530 <fail>

0000000000000314 <test_27>:
 314:	01b00193          	addi	gp,zero,27
 318:	fff00093          	addi	ra,zero,-1
 31c:	ffe00113          	addi	sp,zero,-2
 320:	0020d663          	bge	ra,sp,32c <test_27+0x18>
 324:	20301663          	bne	zero,gp,530 <fail>
 328:	00301663          	bne	zero,gp,334 <test_28>
 32c:	fe20dee3          	bge	ra,sp,328 <test_27+0x14>
 330:	20301063          	bne	zero,gp,530 <fail>

0000000000000334 <test_28>:
 334:	01c00193          	addi	gp,zero,28
 338:	00000093          	addi	ra,zero,0
 33c:	00100113          	addi	sp,zero,1
 340:	0020d463          	bge	ra,sp,348 <test_28+0x14>
 344:	00301463          	bne	zero,gp,34c <test_28+0x18>
 348:	1e301463          	bne	zero,gp,530 <fail>
 34c:	fe20dee3          	bge	ra,sp,348 <test_28+0x14>

0000000000000350 <test_29>:
 350:	01d00193          	addi	gp,zero,29
 354:	fff00093          	addi	ra,zero,-1
 358:	00100113          	addi	sp,zero,1
 35c:	0020d463          	bge	ra,sp,364 <test_29+0x14>
 360:	00301463          	bne	zero,gp,368 <test_29+0x18>
 364:	1c301663          	bne	zero,gp,530 <fail>
 368:	fe20dee3          	bge	ra,sp,364 <test_29+0x14>

000000000000036c <test_30>:
 36c:	01e00193          	addi	gp,zero,30
 370:	ffe00093          	addi	ra,zero,-2
 374:	fff00113          	addi	sp,zero,-1
 378:	0020d463          	bge	ra,sp,380 <test_30+0x14>
 37c:	00301463          	bne	zero,gp,384 <test_30+0x18>
 380:	1a301863          	bne	zero,gp,530 <fail>
 384:	fe20dee3          	bge	ra,sp,380 <test_30+0x14>

0000000000000388 <test_31>:
 388:	01f00193          	addi	gp,zero,31
 38c:	ffe00093          	addi	ra,zero,-2
 390:	00100113          	addi	sp,zero,1
 394:	0020d463          	bge	ra,sp,39c <test_31+0x14>
 398:	00301463          	bne	zero,gp,3a0 <test_31+0x18>
 39c:	18301a63          	bne	zero,gp,530 <fail>
 3a0:	fe20dee3          	bge	ra,sp,39c <test_31+0x14>

00000000000003a4 <test_32>:
 3a4:	02000193          	addi	gp,zero,32
 3a8:	00000093          	addi	ra,zero,0
 3ac:	00000113          	addi	sp,zero,0
 3b0:	0020f663          	bgeu	ra,sp,3bc <test_32+0x18>
 3b4:	16301e63          	bne	zero,gp,530 <fail>
 3b8:	00301663          	bne	zero,gp,3c4 <test_33>
 3bc:	fe20fee3          	bgeu	ra,sp,3b8 <test_32+0x14>
 3c0:	16301863          	bne	zero,gp,530 <fail>

00000000000003c4 <test_33>:
 3c4:	02100193          	addi	gp,zero,33
 3c8:	00100093          	addi	ra,zero,1
 3cc:	00100113          	addi	sp,zero,1
 3d0:	0020f663          	bgeu	ra,sp,3dc <test_33+0x18>
 3d4:	14301e63          	bne	zero,gp,530 <fail>
 3d8:	00301663          	bne	zero,gp,3e4 <test_34>
 3dc:	fe20fee3          	bgeu	ra,sp,3d8 <test_33+0x14>
 3e0:	14301863          	bne	zero,gp,530 <fail>

00000000000003e4 <test_34>:
 3e4:	02200193          	addi	gp,zero,34
 3e8:	00100093          	addi	ra,zero,1
 3ec:	00000113          	addi	sp,zero,0
 3f0:	0020f663          	bgeu	ra,sp,3fc <test_34+0x18>
 3f4:	12301e63          	bne	zero,gp,530 <fail>
 3f8:	00301663          	bne	zero,gp,404 <test_35>
 3fc:	fe20fee3          	bgeu	ra,sp,3f8 <test_34+0x14>
 400:	12301863          	bne	zero,gp,530 <fail>

0000000000000404 <test_35>:
 404:	02300193          	addi	gp,zero,35
 408:	fff00093          	addi	ra,zero,-1
 40c:	00000113          	addi	sp,zero,0
 410:	0020f663          	bgeu	ra,sp,41c <test_35+0x18>
 414:	10301e63          	bne	zero,gp,530 <fail>
 418:	00301663          	bne	zero,gp,424 <test_36>
 41c:	fe20fee3          	bgeu	ra,sp,418 <test_35+0x14>
 420:	10301863          	bne	zero,gp,530 <fail>

0000000000000424 <test_36>:
 424:	02400193          	addi	gp,zero,36
 428:	00000093          	addi	ra,zero,0
 42c:	00100113          	addi	sp,zero,1
 430:	0020f463          	bgeu	ra,sp,438 <test_36+0x14>
 434:	00301463          	bne	zero,gp,43c <test_36+0x18>
 438:	0e301c63          	bne	zero,gp,530 <fail>
 43c:	fe20fee3          	bgeu	ra,sp,438 <test_36+0x14>

0000000000000440 <test_37>:
 440:	02500193          	addi	gp,zero,37
 444:	ffe00093          	addi	ra,zero,-2
 448:	fff00113          	addi	sp,zero,-1
 44c:	0020f463          	bgeu	ra,sp,454 <test_37+0x14>
 450:	00301463          	bne	zero,gp,458 <test_37+0x18>
 454:	0c301e63          	bne	zero,gp,530 <fail>
 458:	fe20fee3          	bgeu	ra,sp,454 <test_37+0x14>

000000000000045c <test_38>:
 45c:	02600193          	addi	gp,zero,38
 460:	00000093          	addi	ra,zero,0
 464:	fff00113          	addi	sp,zero,-1
 468:	0020f463          	bgeu	ra,sp,470 <test_38+0x14>
 46c:	00301463          	bne	zero,gp,474 <test_38+0x18>
 470:	0c301063          	bne	zero,gp,530 <fail>
 474:	fe20fee3          	bgeu	ra,sp,470 <test_38+0x14>

0000000000000478 <test_39>:
 478:	02700193          	addi	gp,zero,39
 47c:	00000093          	addi	ra,zero,0
 480:	00100113          	addi	sp,zero,1
 484:	0020e663          	bltu	ra,sp,490 <test_39+0x18>
 488:	0a301463          	bne	zero,gp,530 <fail>
 48c:	00301663          	bne	zero,gp,498 <test_40>
 490:	fe20eee3          	bltu	ra,sp,48c <test_39+0x14>
 494:	08301e63          	bne	zero,gp,530 <fail>

0000000000000498 <test_40>:
 498:	02800193          	addi	gp,zero,40
 49c:	ffe00093          	addi	ra,zero,-2
 4a0:	fff00113          	addi	sp,zero,-1
 4a4:	0020e663          	bltu	ra,sp,4b0 <test_40+0x18>
 4a8:	08301463          	bne	zero,gp,530 <fail>
 4ac:	00301663          	bne	zero,gp,4b8 <test_41>
 4b0:	fe20eee3          	bltu	ra,sp,4ac <test_40+0x14>
 4b4:	06301e63          	bne	zero,gp,530 <fail>

00000000000004b8 <test_41>:
 4b8:	02900193          	addi	gp,zero,41
 4bc:	00000093          	addi	ra,zero,0
 4c0:	fff00113          	addi	sp,zero,-1
 4c4:	0020e663          	bltu	ra,sp,4d0 <test_41+0x18>
 4c8:	06301463          	bne	zero,gp,530 <fail>
 4cc:	00301663          	bne	zero,gp,4d8 <test_42>
 4d0:	fe20eee3          	bltu	ra,sp,4cc <test_41+0x14>
 4d4:	04301e63          	bne	zero,gp,530 <fail>

00000000000004d8 <test_42>:
 4d8:	02a00193          	addi	gp,zero,42
 4dc:	00100093          	addi	ra,zero,1
 4e0:	00000113          	addi	sp,zero,0
 4e4:	0020e463          	bltu	ra,sp,4ec <test_42+0x14>
 4e8:	00301463          	bne	zero,gp,4f0 <test_42+0x18>
 4ec:	04301263          	bne	zero,gp,530 <fail>
 4f0:	fe20eee3          	bltu	ra,sp,4ec <test_42+0x14>

00000000000004f4 <test_43>:
 4f4:	02b00193          	addi	gp,zero,43
 4f8:	fff00093          	addi	ra,zero,-1
 4fc:	ffe00113          	addi	sp,zero,-2
 500:	0020e463          	bltu	ra,sp,508 <test_43+0x14>
 504:	00301463          	bne	zero,gp,50c <test_43+0x18>
 508:	02301463          	bne	zero,gp,530 <fail>
 50c:	fe20eee3          	bltu	ra,sp,508 <test_43+0x14>

0000000000000510 <test_44>:
 510:	02c00193          	addi	gp,zero,44
 514:	fff00093          	addi	ra,zero,-1
 518:	00000113          	addi	sp,zero,0
 51c:	0020e463          	bltu	ra,sp,524 <test_44+0x14>
 520:	00301463          	bne	zero,gp,528 <test_44+0x18>
 524:	00301663          	bne	zero,gp,530 <fail>
 528:	fe20eee3          	bltu	ra,sp,524 <test_44+0x14>
 52c:	00301663          	bne	zero,gp,538 <pass>

0000000000000530 <fail>:
 530:	00100093          	addi	ra,zero,1
 534:	c0001073          	unimp

0000000000000538 <pass>:
 538:	00000093          	addi	ra,zero,0
 53c:	c0001073          	unimp
