#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<fcntl.h>
#include<errno.h>
#include<sys/types.h>
#include<sys/stat.h>
int main(void)
{
int fd;
char buff[4];
fd=open("file2.txt",O_RDWR);
//update
read(fd,buff,3);//read
strcpy(buff,"XXX");//modify
lseek(fd,-3L,SEEK_CUR);//FILE POINTER BACKWARD
write(fd,buff,3); //write
read(fd,buff,3); //read the next data
close(fd);
}