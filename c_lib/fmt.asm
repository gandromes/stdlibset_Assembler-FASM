format ELF64

public c_print_number
public c_print_bin
public c_print_oct
public c_print_hex
public c_print_string
public c_print_char
public c_print_empty_line
public c_print_bytes
public c_print_tab
public c_print_f

include "asm_lib/fmt.inc"

section ".c_print_number" executable
c_print_number:
  mov rax, rdi
  call print_number
  ret

section ".c_print_bin" executable
c_print_bin:
  mov rax, rdi
  call print_bin
  ret

section ".c_print_oct" executable
c_print_oct:
  mov rax, rdi
  call print_oct
  ret

section ".c_print_hex" executable
c_print_hex:
  mov rax, rdi
  call print_hex
  ret

section ".c_print_string" executable
c_print_string:
  mov rax, rdi
  call print_string
  ret

section ".c_print_char" executable
c_print_char:
  mov rax, rdi
  call print_char
  ret

section ".c_print_empty_line" executable
c_print_empty_line:
  call print_empty_line
  ret

section ".c_print_bytes" executable
c_print_bytes:
  mov rax, rdi
  mov rbx, rsi
  call print_bytes
  ret

section ".c_print_tab" executable
c_print_tab:
  call print_tab
  ret

section ".c_print_f" executable
c_print_f:
  push r9
  push r8
  push rcx
  push rdx
  push rsi
  mov rax, rdi
  call print_f
  pop rsi
  pop rdx
  pop rcx
  pop r8
  pop r9
  ret
