#include<stdio.h>
int main(void){
//printf("i");
char ch='2';
//fflush(stdout);
//write(1,'1',1);
while(1){
write(1,&ch,1);
}
return 0;


}