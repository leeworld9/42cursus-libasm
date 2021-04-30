; char	*ft_strcpy(char *dst, char const *src)
; {
; 	int i;

; 	i = 0;
; 	while (src[i] != '\0')
; 	{
; 		dst[i] = src[i];
; 		i++;
; 	}
; 	dst[i] = '\0';
; 	return (dst);
; }

section .text
	global _ft_strcpy

_ft_strcpy:
	mov rax, 0
	jmp _copy

_copy:
	cmp byte [rsi + rax], 0		; dst와 src는 각각 rdi와 rsi에 저장된다
	je _done
	mov dl, byte [rsi + rax]	; rdi에 값을 바로 넣을 수 없으며 rsi의 값을 dh나 dl에 임시 저장한 다음 넣는다. 
	mov byte [rdi + rax], dl	; 	=> 어셈블리어에서 연산은 메모리-메모리는 불가능하다. 따라서, 따로 한번 레지스터에 저장시킨 후에 다시 연산해줘야 하는 것임.
	inc rax
	jmp _copy

_done:
	mov byte [rdi + rax], 0		; rdi의 마지막(byte [rdi + rax])에 널 문자를 넣는다.
	mov rax, rdi				; 리턴 값은 rax를 통해 반환한다.
	ret
