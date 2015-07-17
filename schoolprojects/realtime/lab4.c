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
char buff1[4]="AAA";
char buff2[4]="BBB";
fd=open("file.txt",O_WRONLY|O_TRUNC);
write(fd,buff1,3);
write(fd,buff1,3);
lseek(fd,0L,SEEK_SET); //TO THE BEGINING
write(fd,buff2,3);
lseek(fd,0L,SEEK_END); //TO THE End
write(fd,buff2,3);
close(fd);
}