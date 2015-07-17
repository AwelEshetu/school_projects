#include <stdio.h>


char * ch_str_switch_t(char *a);
int main()
{
char string[]="this is a string";
ch_str_switch_t(string);
printf("%s \n",string);
return 0;
}
char * ch_str_switch_t(char *a)
{
while(*a!='\0')
{
if(*a=='t')
*a='*';
a++;
}
return a;
}
