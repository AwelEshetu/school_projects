#include<stdio.h>
#include<unistd.h>
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
char char_fellow;
int n;
fellow_desc=OpenChatFellow();
n=read(fellow_desc,&char_fellow,1);
while(n>0){
write(1,&char_fellow,1);
n=read(fellow_desc,&char_fellow,1);
}
close(fellow_desc);
return 0;


}