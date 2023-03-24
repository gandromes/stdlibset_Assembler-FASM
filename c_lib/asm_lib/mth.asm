format ELF64

section ".bss" writable
  _next dq 1

public gcd
public fibonacci
public factorial
public srand
public rand

section ".srand" executable
srand:
  mov [_next], rax
  ret

section ".rand" executable
rand:
  push rbx
  push rdx
    mov rax, [_next]
    mov rbx, 1103515245 * 12345
    mul rbx
    mov [_next], rax
    xor edx, edx
    mov rbx, 65536
    div rbx
    xor edx, edx
    mov rbx, 32768
    div rbx
    mov rax, rdx
  pop rdx
  pop rbx
  ret

section ".gcd" executable
gcd:
  push rbx
  push rdx
    .next_iter:
      cmp rbx, 0
      je .close
      xor edx, edx
      div rbx
      push rbx
      mov rbx, rdx
      pop rax
      jmp .next_iter
  .close:
    pop rdx
    pop rbx
    ret

section ".fibonacci" executable
fibonacci:
  push rbx
  push rcx
  xor ebx, ebx
  xor ecx, ecx
  cmp rax, 0
  jle .close
  inc ecx
    .next_iter:
      cmp rax, 1
      jle .close
      push rcx
      add rcx, rbx
      pop rbx
      dec rax
      jmp .next_iter
  .close:
    mov rax, rcx
    pop rbx
    pop rcx
    ret

section ".factorial" executable
factorial:
  push rbx
    mov rbx, rax
    xor eax, eax
    inc eax
      .next_iter:
        cmp rbx, 1
        jle .close
        mul rbx
        dec rbx
        jmp .next_iter
  .close:
    pop rbx
    ret
