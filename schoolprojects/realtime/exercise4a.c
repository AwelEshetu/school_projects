
	#include<stdio.h>
	#include<stdlib.h>
	#include<unistd.h>
	#include<fcntl.h>
	#include<errno.h>
	#include<sys/types.h>
	#include<sys/stat.h>
	void set_fl(int fd, int flags);
	int main(void)
	{
	int access_mode;
	int fd_flags;
	int fl_flags;
	int fd;
	fd=open("file.txt",O_CREAT|O_RDWR|O_APPEND|0700);
	fl_flags=fcntl(fd,F_GETFL,0);
	fd_flags=fcntl(fd,F_GETFD,0);
    access_mode=fl_flags &O_ACCMODE;
	
	if((fl_flags & O_ACCMODE)==O_RDONLY)
	printf("\nAccess mode is Read only");
	if((fl_flags & O_ACCMODE)==O_WRONLY)
	printf("\nAccess mode is Write only");
	if((fl_flags & O_ACCMODE)==O_RDWR)
	printf("\nAccess mode is Rread/Write");

	if (fd_flags &FD_CLOEXEC)
	printf("\nClose on Exec bit is ON");
	else
	printf("\nClose on Exec bit is OFF");
	if(fl_flags & O_NONBLOCK)
	printf("\nNon Blocking mode is ON");
	else
	printf("\nNon blocking mode is OFF");
	if(fl_flags & O_APPEND)
	printf("\n Append is ON");
	else
	printf("\n Append is OFF");


	set_fl(fd, O_NONBLOCK);		
		
	fl_flags=fcntl(fd,F_GETFL,0);

		
		
		if(fl_flags & O_NONBLOCK)
			printf("\nNon Blocking mode is ON");
		else
			printf("\nNon blocking mode is OFF");		

	return 0;
	}
	void set_fl(int fd, int flags)
	{
		int current_fl;
		if((current_fl=fcntl(fd,F_GETFL,0))<0)
			printf("error\n");
		
		if (current_fl & flags)
		 current_fl &=~flags;
		else 
        current_fl |=flags;		
		
		if((fcntl(fd,F_SETFL,current_fl))<0)		
			printf("error\n");
	}

