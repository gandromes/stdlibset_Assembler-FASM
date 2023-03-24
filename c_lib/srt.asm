format ELF64

public c_bubble_sort

include "asm_lib/srt.inc"

section ".c_bubble_sort" executable
c_bubble_sort:
  mov rax, rdi
  mov rbx, rsi
  call bubble_sort
  ret
