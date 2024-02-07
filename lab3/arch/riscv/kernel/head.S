.extern start_kernel

  .section .text.entry
  .globl _start, _end
_start:
  la sp, stack_top
  jal start_kernel

  .section .stack.entry
  .globl stack_bottom
stack_bottom:
  .space 0x1000

  .globl stack_top
stack_top:

