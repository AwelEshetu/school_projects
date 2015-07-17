//Testing file flags
#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
int main (void) {
	int access_mode, file_flags,file_fd;
	int fd;
	int inverted;
	fd = open("test.txt",O_APPEND,O_RDWR);
	file_flags = fcntl(fd, F_GETFL, 0); 
	file_fd = fcntl(fd, F_GETFD, 0); 
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
	sleep(5);
	file_flags=file_flags & ~O_NONBLOCK; 
	fcntl(fd,F_SETFL,file_flags);	
	if (!(file_flags & O_NONBLOCK))
		printf("\nNon blocking mode is OFF\n");
	close (fd);
	return 0;
}
