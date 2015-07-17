#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<fcntl.h>
#include<errno.h>
#include<sys/types.h>
#include<sys/stat.h>
int main(void)
{
int i;
int fd;
fd=open("exlog.txt",O_CREAT|O_WRONLY|O_APPEND,S_IRUSR|S_IWUSR );
for(i=0;i<=100000;i++)
{
//lseek(fd,0L,SEEK_END);
write(fd,"BBBB",4);
}
close(fd);
}