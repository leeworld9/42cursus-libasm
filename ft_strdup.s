; char		*ft_strdup(const char *s)
; {
; 	char	*dst;
; 	size_t	len;

; 	len = sizeof(char) * (unsigned long)ft_strlen(s) + 1;
; 	dst = (char *)malloc(len);
; 	if (dst != NULL)
; 		ft_strcpy(dst, s);
; 	else
; 		return (NULL);
; 	return (dst);
; }

extern _ft_strlen
extern _ft_strcpy
extern _malloc
section .text
	global _ft_strdup

_ft_strdup:
	call _ft_strlen		; rax = _ft_strlen
	inc rax				; rax++;
	push rdi			; rdi를 스택에 임시 저장
	mov rdi, rax 
	call _malloc		; rdi = malloc(rax);
	cmp rax, 0			; if (rdi == NULL)
	je _malloc_err
	pop rsi				; rsi = rdi 스택에 저장해놓은거 pop
	mov rdi, rax
	call _ft_strcpy
	ret

_malloc_err:
	ret
