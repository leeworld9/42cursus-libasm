#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>

/*
On Linux, unlike Mac, it works with the same function name
as the function name in assembly language.
*/

size_t ft_strlen(char *str);
char	*ft_strcpy(char *dst, char const *src);
int		ft_strcmp(const char* str1, const char* str2);
ssize_t ft_write(int fildes, void *buf, size_t nbyte);
ssize_t ft_read(int fildes, void *buf, size_t nbyte);
char	*ft_strdup(const char *s);

int main()
{
	char *chr1 = "test char";
	char *chr2 = "";
	char *chr3 = NULL;

	printf("strlen\t\t : %ld\n", strlen(chr1));
	printf("strlen\t\t : %ld\n", strlen(chr2));
	//printf("strlen\t\t : %ld\n", strlen(chr3)); // error

	printf("ft_strlen\t : %ld\n", ft_strlen(chr1));
	printf("ft_strlen\t : %ld\n", ft_strlen(chr2));
	//printf("ft_strlen\t : %ld\n", ft_strlen(chr3)); // error

	////////////////////////////////////////////////////////////////////////////////

	char *chr4 = "test_chr4";
	char *chr5;
	
	chr5 = (char *)malloc(sizeof(char) * (ft_strlen(chr4) + 1));
	printf("strcpy\t\t -> chr4 : %s, chr5 : %s\n", chr4, strcpy(chr5, chr4));
	free(chr5);

	chr5 = (char *)malloc(sizeof(char) * (ft_strlen(chr4) + 1));
	printf("ft_strcpy\t -> chr4 : %s, chr5 : %s\n", chr4, ft_strcpy(chr5, chr4));
	free(chr5);
	////////////////////////////////////////////////////////////////////////////////

	char *chr6 = "test1";
	char *chr7 = "test2";
	char *chr8 = "test1";
	char *chr9 = "test";

	printf("strcmp\t\t : %d\n", strcmp(chr6, chr7));
	printf("strcmp\t\t : %d\n", strcmp(chr7, chr8));
	printf("strcmp\t\t : %d\n", strcmp(chr8, chr9));

	printf("ft_strcmp\t : %d\n", ft_strcmp(chr6, chr7));
	printf("ft_strcmp\t : %d\n", ft_strcmp(chr7, chr8));
	printf("ft_strcmp\t : %d\n", ft_strcmp(chr8, chr9));

	////////////////////////////////////////////////////////////////////////////////

	//read, write : mac에서 테스트 해야함

	////////////////////////////////////////////////////////////////////////////////

	printf("strdup\t\t : %s\n", strdup(chr9));
	printf("ft_strdup\t : %s\n", ft_strdup(chr9));
}
