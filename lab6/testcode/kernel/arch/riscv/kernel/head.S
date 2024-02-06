.extern start_kernel

  .section .text.init
  .globl _start
_start:
  la sp, stack_top

  call mm_init
  call task_init

  la a0, _traps
  csrw stvec, a0

  li a0, 32  #0b100000
  csrs sie, a0

  li a0, 0x30000
  xor a1, a1, a1
  xor a2, a2, a2
  xor a3, a3, a3
  xor a4, a4, a4
  xor a5, a5, a5
  xor a6, a6, a6
  xor a7, a7, a7
  ecall

  li a0, 2
  csrs sstatus, a0

  jal start_kernel

  .section .stack.entry
  .globl stack_bottom
stack_bottom:
  .space 0x1000

  .globl stack_top
stack_top:

