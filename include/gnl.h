/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   gnl.h                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fiaudfiz <fiaudfiz@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/12/08 15:33:48 by gd-hallu          #+#    #+#             */
/*   Updated: 2026/07/25 00:13:12 by fiaudfiz         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef GET_NEXT_LINE_H
# define GET_NEXT_LINE_H

# include <stdlib.h>
# include <unistd.h>

# ifndef BUFFER_SIZE
#  define BUFFER_SIZE 1024
# endif

# define GNL_MAX_FD 1024

char	*get_next_line(int fd);
char	*gnl_strjoin_free(char *s1, char *s2);
char	*gnl_extract_line(char *buf);
char	*gnl_extract_rest(char *buf);
size_t	gnl_strlen(const char *s);
char	*gnl_strchr(const char *s, int c);

#endif