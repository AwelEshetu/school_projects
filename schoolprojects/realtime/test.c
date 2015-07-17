#include <unistd.h>
#include<fcntl.h>
int main(void){
int fd;
char buff[10];
fd=open("file.txt",O_RDONLY);
read(fd,buff,10);
close(fd);
return 0;
}