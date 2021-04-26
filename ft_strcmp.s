; int		ft_strcmp(const char* s1, const char* s2)
; {
; 	int i;

; 	i = 0;
; 	while (s1[i] != '\0' && s2[i] != '\0')
; 	{
; 		if (s1[i] - s2[i] != 0)
; 			return (s1[i] - s2[i]);
; 		i++;
; 	}
; 	return (s1[i] - s2[i]);
; }

section .text
	global _ft_strcmp

_ft_strcmp:
	mov rax, 0
	mov rbx, 0
	jmp _loop

_loop:
	; 리눅스에서 정수 타입의 파라미터를 전달할 때는 rdi(1), rsi(2), rdx(3), rcx(4), r8(5), r9(6) 총 6개의 레지스터를 사용해서 순서대로 사용하며, 7개 이상이면 스택을 통해 전달.
	mov al, [rdi]		; rdi는 s1의 주소를 가리킴, [rdi]는 주소의 값. 즉 *s1을 가리킴 
	mov bl, [rsi]		; rsi는 s2의 주소를 가리킴, [rsi]는 주소의 값. 즉 *s2을 가리킴 
	cmp al, 0			; if (*s1 == '\0')
	je _compare
	cmp bl, 0			; if (*s2[i] == '\0')
	je _compare
	inc rdi				; s1++;
	inc rsi				; s2++;
	cmp al, bl			; if (*s1 != *s2)
	je _loop
	jne _compare

_compare:
	; rax == 64bit, eax == 32bit, ax == 16bit, ah == al == 8bit == 1byte
	; ex) ah, al은 ax의 하위 비트이다. 즉, ax : 0001100100111100 라고하면, ah : 00011001, al: 00111100
	sub rax, rbx		; al과 bl을 빼게 되면 8비트이기 때문에 오버플로우가 발생할 수 있음, 8비트 레지스터를 사용함에 유의. (https://man-25-1.tistory.com/60)
	ret
