format ELF64

public time_now
public input_char
public input_string
public input_number
public fcreate
public fdelete
public fopen
public fclose
public fread
public fwrite
public fseek
public exit

extrn string_to_number

section ".bss" writable
  _buffer_char_size equ 2
  _buffer_char rb _buffer_char_size
  _buffer_number_size equ 21
  _buffer_number rb _buffer_number_size

section ".time_now" executable
time_now:
  push rbx
    mov rax, 13
    xor ebx, ebx
    int 0x80
  pop rbx
  ret

section ".input_number" executable
input_number:
  push rbx
    mov rax, _buffer_number
    mov rbx, _buffer_number_size
    call input_string
    call string_to_number
  pop rbx
  ret

section ".input_char" executable
input_char:
  push rbx
    mov rax, _buffer_char
    mov rbx, _buffer_char_size
    call input_string
    mov rax, [rax]
  pop rbx
  ret

section ".input_string" executable
input_string:
  push rax
  push rbx
  push rcx
  push rdx
    push rax
    mov rcx, rax
    mov rdx, rbx
    mov rax, 3
    mov rbx, 2
    int 0x80
    pop rbx
    mov [rax+rbx-1], byte 0
  pop rdx
  pop rcx
  pop rbx
  pop rax
  ret

section ".fcreate" executable
; input:
; rax, filename
; rbx, permissions
; output:
; rax, descriptor
fcreate:
  push rbx
  push rcx
    mov rcx, rbx
    mov rbx, rax
    mov rax, 8
    int 0x80
  pop rcx
  pop rbx
  ret

section ".fdelete" executable
; input:
; rax, filename
fdelete:
  push rax
  push rbx
    mov rbx, rax
    mov rax, 10
    int 0x80
  pop rbx
  pop rax
  ret

section ".fopen" executable
; input:
; rax, filename
; rbx, mode
; ; O_RDONLY = 0
; ; O_WRONLY = 1
; ; O_RDWR   = 2
; output;
; rax, descriptor
fopen:
  push rbx
  push rcx
    mov rcx, rbx
    mov rbx, rax
    mov rax, 5
    int 0x80
  pop rcx
  pop rbx
  ret

section ".fclose" executable
; input:
; rax, descriptor
fclose:
  push rbx
    mov rbx, rax
    mov rax, 6
    int 0x80
  pop rbx
  ret

section ".fwrite" executable
; input:
; rax, descriptor
; rbx, data
; rcx, data.size
fwrite:
  push rax
  push rbx
  push rcx
  push rdx

    push rbx
    push rcx
      mov rbx, 1
      xor ecx, ecx
      call fseek
    pop rcx
    pop rbx

    mov rdx, rcx
    mov rcx, rbx
    mov rbx, rax
    mov rax, 4
    int 0x80

  pop rdx
  pop rcx
  pop rbx
  pop rax
  ret

section ".fread" executable
; input:
; rax, descriptor
; rbx, buffer
; rcx, buffer.size
fread:
  push rax
  push rbx
  push rcx
  push rdx

    push rbx
    push rcx
      mov rbx, 1
      xor ecx, ecx
      call fseek
    pop rcx
    pop rbx

    mov rdx, rcx
    mov rcx, rbx
    mov rbx, rax
    mov rax, 3
    int 0x80

  pop rdx
  pop rcx
  pop rbx
  pop rax
  ret

section ".fseek" executable
; input:
; rax, descriptor
; rbx, mode seek
; ; SEEK_SET = 0
; ; SEEK_CUR = 1
; ; SEEK_END = 2
; rcx, position
fseek:
  push rax
  push rbx
  push rdx
    mov rdx, rbx
    mov rbx, rax
    mov rax, 19
    int 0x80
  pop rdx
  pop rbx
  pop rax
  ret

section ".exit" executable
exit:
  xor eax, eax
  inc rax
  xor ebx, ebx
  int 0x80
