/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dohelee <dohelee@student.42seoul.kr>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/12/31 02:18:29 by dohelee           #+#    #+#             */
/*   Updated: 2021/04/20 16:33:29 by dohelee          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

char		*ft_strdup(const char *s)
{
	char	*dst;
	size_t	len;

	len = sizeof(char) * (unsigned long)ft_strlen(s) + 1;
	dst = (char *)malloc(len);
	if (dst != NULL)
		ft_strcpy(dst, s);
	else
		return (NULL);
	return (dst);
}
