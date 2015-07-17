#include<stdio.h>
#include<unistd.h>
#include<fcntl.h>
#include<errno.h>


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
char char_fellow,chr;
int n;
int file_flags;
fellow_desc=OpenChatFellow();
//put keyboard to unblocked mode
file_flags=fcntl(0,F_GETFL); // read current file flags
file_flags=file_flags|O_NONBLOCK; // add o_NONBLOCK bit
fcntl(0,F_SETFL,file_flags); //write new flags back
n=read(fellow_desc,&char_fellow,1);
while(n>0){
write(1,&char_fellow,1);
n=read(0,&chr,1);
if (n>0)
write(1,&chr,1);
if (n==-1 && errno !=EAGAIN)
perror("keyboard read error!");
// we don't care the situation where n==-1 and errno==EAGAIN
n=read(fellow_desc,&char_fellow,1);
}

return 0;


}