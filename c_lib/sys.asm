format ELF64

public c_time_now
public c_input_char
public c_input_string
public c_input_number
public c_fcreate
public c_fdelete
public c_fopen
public c_fclose
public c_fread
public c_fwrite
public c_fseek
public c_exit

include "asm_lib/sys.inc"

section ".c_time_now" executable
c_time_now:
  call time_now
  ret

section ".c_input_char" executable
c_input_char:
  call input_char
  ret

section ".c_input_string" executable
c_input_string:
  mov rax, rdi
  mov rbx, rsi
  call input_string
  ret

section ".c_input_number" executable
c_input_number:
  call input_number
  ret

section ".c_fcreate" executable
c_fcreate:
  ; input: 2 args
  ; output: true
  mov rax, rdi
  mov rbx, rsi
  call fcreate
  ret

section ".c_fdelete" executable
c_fdelete:
  ; input 1 arg
  ; output: false
  mov rax, rdi
  call fdelete
  ret

section ".c_fopen" executable
c_fopen:
  ; input: 2 args
  ; output: true
  mov rax, rdi
  mov rbx, rsi
  call fopen
  ret

section ".c_fclose" executable
c_fclose:
  ; input: 1 arg
  ; output: false
  mov rax, rdi
  call fclose
  ret

section ".c_fwrite" executable
c_fwrite:
  ; input: 3 arg
  ; output: false
  mov rax, rdi
  mov rbx, rsi
  mov rcx, rdx
  call fwrite
  ret

section ".c_fread" executable
c_fread:
  ; input: 3 args
  ; output: false
  mov rax, rdi
  mov rbx, rsi
  mov rcx, rdx
  call fread
  ret

section ".c_fseek" executable
c_fseek:
  ; input: 3 args
  ; output: false
  mov rax, rdi
  mov rbx, rsi
  mov rcx, rdx
  call fseek
  ret

section ".c_exit" executable
c_exit:
  ; input: false
  ; output: false
  call exit
  ret
