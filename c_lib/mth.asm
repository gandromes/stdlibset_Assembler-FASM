format ELF64

public c_srand
public c_rand
public c_gcd
public c_fibonacci
public c_factorial

include "asm_lib/mth.inc"

section ".c_srand" executable
c_srand:
  mov rax, rdi
  call srand
  ret

section ".c_rand" executable
c_rand:
  call rand
  ret

section ".c_gcd" executable
c_gcd:
  mov rax, rdi
  mov rbx, rsi
  call gcd
  ret

section ".c_fibonacci" executable
c_fibonacci:
  mov rax, rdi
  call fibonacci
  ret

section ".c_factorial" executable
c_factorial:
  mov rax, rdi
  call factorial
  ret
