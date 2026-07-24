/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   gnl_utils.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fiaudfiz <fiaudfiz@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/07/25 00:15:54 by fiaudfiz          #+#    #+#             */
/*   Updated: 2026/07/25 00:15:55 by fiaudfiz         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "gnl.h"

size_t	gnl_strlen(const char *s)
{
	size_t	i;

	i = 0;
	while (s && s[i])
		i++;
	return (i);
}

char	*gnl_strchr(const char *s, int c)
{
	while (s && *s)
	{
		if (*s == (char)c)
			return ((char *)s);
		s++;
	}
	if (s && (char)c == '\0')
		return ((char *)s);
	return (NULL);
}

char	*gnl_strjoin_free(char *s1, char *s2)
{
	char	*res;
	size_t	len1;
	size_t	len2;
	size_t	i;
	size_t	j;

	len1 = gnl_strlen(s1);
	len2 = gnl_strlen(s2);
	res = malloc(len1 + len2 + 1);
	if (!res)
		return (NULL);
	i = 0;
	while (i < len1)
	{
		res[i] = s1[i];
		i++;
	}
	j = 0;
	while (j < len2)
		res[i++] = s2[j++];
	res[i] = '\0';
	free(s1);
	return (res);
}

char	*gnl_extract_line(char *buf)
{
	char	*nl;
	char	*line;
	size_t	len;
	size_t	i;

	if (!buf || !buf[0])
		return (NULL);
	nl = gnl_strchr(buf, '\n');
	if (nl)
		len = (size_t)(nl - buf) + 1;
	else
		len = gnl_strlen(buf);
	line = malloc(len + 1);
	if (!line)
		return (NULL);
	i = 0;
	while (i < len)
	{
		line[i] = buf[i];
		i++;
	}
	line[i] = '\0';
	return (line);
}

char	*gnl_extract_rest(char *buf)
{
	char	*nl;
	char	*rest;
	size_t	i;

	if (!buf)
		return (NULL);
	nl = gnl_strchr(buf, '\n');
	if (!nl)
		return (NULL);
	rest = malloc(gnl_strlen(nl + 1) + 1);
	if (!rest)
		return (NULL);
	i = 0;
	while (nl[i + 1])
	{
		rest[i] = nl[i + 1];
		i++;
	}
	rest[i] = '\0';
	return (rest);
}