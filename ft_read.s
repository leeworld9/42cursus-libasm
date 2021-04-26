; ssize_t ft_read(int fildes, const void *buf, size_t nbyte);

extern ___error
section .text
	global _ft_read

_ft_read:
	mov rax, 0x2000003	; syscall 테이블 참고
	syscall				; 정상이라면 출력된 값이 rax에 저장, 아니라면 errno에 해당하는 수가 rax에 저장됨
	jc _err				; carry flag가 1이면 에러이므로 에러 처리를 위한 함수로 점프
	ret

_err:
	push rax			; rax에 담겨있는 error value를 push해 스택에 백업. (https://hyeonski.tistory.com/3)
	call ___error		; rax에 errno 포인터 return rax = error();
	pop rdx				; rdx = errno , rdx에 스택에 저장시켜 놨던 error value를 팝해온다. 
	mov [rax], rdx		; errno 포인터에 errno값 대입 *rax = rdx
	mov rax, -1			; return -1
	ret
