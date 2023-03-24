format ELF64

public c_string_to_number
public c_number_to_string
public c_length_string

include "asm_lib/str.inc"

section ".c_string_to_number" executable
c_string_to_number:
  mov rax, rdi
  call string_to_number
  ret

section ".c_number_to_string" executable
c_number_to_string:
  mov rax, rdi
  mov rbx, rsi
  mov rcx, rdx
  call number_to_string
  ret

section ".c_length_string" executable
c_length_string:
  mov rax, rdi
  call length_string
  ret
