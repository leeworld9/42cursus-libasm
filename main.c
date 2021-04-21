#include <stdio.h>
#include <string.h>

// Mac : https://heeyamsec.tistory.com/21 참고
//size_t ft_strlen(char *str);

// Linux : 리눅스에서는 Mac과 달리 어셈블리어에서의 함수명과 같은 함수명으로 작동함.
size_t _ft_strlen(char *str);

int main()
{
	char *chr1 = "test char";
	char *chr2 = "";
	char *chr3 = NULL;

	printf("ft_strlen : %ld\n", _ft_strlen(chr1));
	printf("ft_strlen : %ld\n", _ft_strlen(chr2));
	//printf("ft_strlen : %ld\n", _ft_strlen(chr3)); // error

	printf("ft_strlen : %ld\n", strlen(chr1));
	printf("ft_strlen : %ld\n", strlen(chr2));
	//printf("ft_strlen : %ld\n", strlen(chr3)); // error
}