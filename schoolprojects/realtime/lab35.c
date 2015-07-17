#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<fcntl.h>
#include<errno.h>
#include<sys/types.h>
#include<sys/stat.h>

int OpenChatFellow();



int main(void){
/*//printf("i");
//char ch='2';
//fflush(stdout);
//write(1,'1',1);
while(1){
write(1,&ch,1);
}*/
int fellow_desc;
char chr_fellow;
char chr_kb;
int file_flags,result;
fellow_desc=OpenChatFellow();
//put keyboard to unblocked mode
file_flags=fcntl(0,F_GETFL); // read current file flags
file_flags=file_flags|O_NONBLOCK; // add o_NONBLOCK bit
fcntl(0,F_SETFL,file_flags); //write new flags back
file_flags=fcntl(fellow_desc,F_GETFL);
file_flags=file_flags|O_NONBLOCK;
fcntl(fellow_desc,F_SETFL,file_flags);
while(1)
{
//keyboard
result=read(0,&chr_kb,1);
if(result>0)
{
if(chr_kb=='Q'||chr_kb=='q')
exit(0);
else{
printf("%c",chr_kb);
fflush(stdout);
}
}
if(result==-1 && errno!=EAGAIN)
perror("keyboard error");
//Fellow input
result=read(fellow_desc,&chr_fellow,1);
if(result>0)
{
print("%c",chr_fellow);
fflush(stdout);
}
if (result==-1 && errno!=EAGAIN)
perror("Fellow error");
if(result==0) //End of file
exit(0);
}
/*n=read(fellow_desc,&char_fellow,1);
while(n>0){
write(1,&char_fellow,1);
n=read(0,&chr,1);
if (n>0)
write(1,&chr,1);
if (n==-1 && errno !=EAGAIN)
perror("keyboard read error!");
// we don't care the situation where n==-1 and errno==EAGAIN
n=read(fellow_desc,&char_fellow,1);
}*/

return EXIT_SUCCESS;


}