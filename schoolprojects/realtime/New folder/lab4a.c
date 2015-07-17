	/* Awel Eshetu
	   ID 0507267
	   R.O.S exercise 4*/
	   #include<stdio.h>
		#include<stdlib.h>
		#include<unistd.h>
		#include<fcntl.h>
		#include<errno.h>
		#include<sys/types.h>
		#include<sys/stat.h>
	void inverted(int fd, int flags);
	int main (void) {
		int access_mode, file_flags,file_fd;
		int fd;
		
		fd = open("test.txt",O_CREAT|O_RDWR|O_NONBLOCK,0700);
		file_flags = fcntl(fd, F_GETFL); 
		file_fd = fcntl(fd, F_GETFD); 
		access_mode = file_flags & O_ACCMODE;
		if (access_mode == O_WRONLY)
			printf("\nAccess mode is Write Only\n");
		if (access_mode == O_RDONLY)
			printf("\nAccess mode is Read Only\n");
		if (access_mode == O_RDWR)
			printf("\nAccess mode is Read & Write\n");

		if (file_flags & O_APPEND)
			printf("\nO_APPEND is ON\n");
		else
			printf("\nO_APPEND is OFF\n");

		if (file_fd & FD_CLOEXEC)
			printf("\nFD_CLOEXEC is ON\n");
		else
			printf("\nFD_CLOEXEC is OFF\n");
		if (file_flags & O_NONBLOCK)
			printf("\nNon blocking mode is ON\n");
		else
		printf("\nNon blocking mode is OFF\n");
		
		inverted(fd, O_NONBLOCK);
		file_flags = fcntl(fd, F_SETFL); 
		
		if (file_flags & O_NONBLOCK)
			printf("\nNon blocking mode is ON\n");
		else
		printf("\nNon blocking mode is OFF\n");
		
		return 0;
		}
		
		
		void inverted(int fd, int flags)
		{
		int file_flags;	
		
			
		if (file_flags & flags)
			file_flags &=~flags;
		else
	   file_flags |=flags;	
		
		
	}
