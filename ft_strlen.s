; size_t	ft_strlen(const char *s)
; {
; 	size_t i;

; 	i = 0;
; 	while (s[i] != '\0')
; 		i++;
; 	return (i);
; }

section .text
	global	_ft_strlen

_ft_strlen:
	mov	rax, 0
	jmp	_count ; 원래는 필요 없으나 프로시저 이동간의 가독성을 위해 작성

_count:
	cmp byte [rdi + rax], 0 ; s의 주소는 rdi에 들어오게 되며 rdi에 저장된 값(문자)은 byte [rdi + 인덱스]로  불러 올 수 있다.
	je	_done
	inc	rax
	jmp _count

_done:
	ret ; 리턴 값은 rax를 통해 반환한다.
