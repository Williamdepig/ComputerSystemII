.extern start_kernel

  .section .text.init
  .globl _start
_start:
  la sp, stack_top

  call mm_init
  call task_init

  la a0, _traps
  csrw stvec, a0

  li a0, 32
  csrs sie, a0

  rdtime a0
  li t0, 10000000
  add a0, a0, t0
  call sbi_set_timer

  csrs sstatus, 2

  jal start_kernel

  .section .stack.entry
  .globl stack_bottom
stack_bottom:
  .space 0x1000

  .globl stack_top
stack_top:

