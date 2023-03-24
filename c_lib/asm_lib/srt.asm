format ELF64
public bubble_sort

section ".bubble_sort" executable
bubble_sort:
  push rax
  push rbx
  push rcx
  push rdx
    xor ecx, ecx
      .first_iter:
        cmp rcx, rbx
        je .break_first
        xor edx, edx
        push rbx
        sub rbx, rcx
        dec rbx
        .second_iter:
          cmp rdx, rbx
          je .break_second
          push rbx
          mov bl, [rax+rdx]
          cmp bl, [rax+rdx+1]
          jg .swap
          jmp .pass
        .swap:
          mov bh, [rax+rdx+1]
          mov [rax+rdx+1], bl
          mov [rax+rdx], bh
        .pass:
          pop rbx
          inc rdx
          jmp .second_iter
        .break_second:
          pop rbx
          inc rcx
          jmp .first_iter
      .break_first:
        pop rdx
        pop rcx
        pop rbx
        pop rax
        ret
