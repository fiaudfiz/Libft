/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   gnl.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fiaudfiz <fiaudfiz@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/07/25 00:15:46 by fiaudfiz          #+#    #+#             */
/*   Updated: 2026/07/25 00:15:48 by fiaudfiz         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "gnl.h"

static int	fill_buffer(int fd, char **buf)
{
	char	read_buf[BUFFER_SIZE + 1];
	ssize_t	bytes_read;

	bytes_read = 1;
	while (!gnl_strchr(*buf, '\n') && bytes_read > 0)
	{
		bytes_read = read(fd, read_buf, BUFFER_SIZE);
		if (bytes_read == -1)
		{
			free(*buf);
			*buf = NULL;
			return (-1);
		}
		if (bytes_read == 0)
			break ;
		read_buf[bytes_read] = '\0';
		*buf = gnl_strjoin_free(*buf, read_buf);
		if (!*buf)
			return (-1);
	}
	return (0);
}

static char	*gnl_reset_all(void)
{
	char	**buf;
	int		i;

	buf = gnl_bufs();
	i = 0;
	while (i < GNL_MAX_FD)
	{
		free(buf[i]);
		buf[i] = NULL;
		i++;
	}
	return (NULL);
}

char	*get_next_line(int fd)
{
	char	**buf;
	char	*line;
	char	*tmp;

	if (fd == -1)
		return (gnl_reset_all());
	if (fd < 0 || fd >= GNL_MAX_FD || BUFFER_SIZE <= 0)
		return (NULL);
	buf = gnl_bufs();
	if (fill_buffer(fd, &buf[fd]) == -1)
		return (NULL);
	if (!buf[fd] || !buf[fd][0])
	{
		free(buf[fd]);
		buf[fd] = NULL;
		return (NULL);
	}
	line = gnl_extract_line(buf[fd]);
	tmp = buf[fd];
	buf[fd] = gnl_extract_rest(buf[fd]);
	free(tmp);
	return (line);
}