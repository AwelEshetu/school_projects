	#include <unistd.h>
	#include<stdio.h>
	#include<sys/types.h>
	#include<stdlib.h>
	#include<errno.h>
	#include<sys/stat.h>
	#include <fcntl.h>
		int main (void)
		{
			int fd;
			char buff[10];
			fd = open(”filetest.txt”, O_RDONLY);
			read(fd, buff, 10);
			close(fd);
			return 0;
		}
