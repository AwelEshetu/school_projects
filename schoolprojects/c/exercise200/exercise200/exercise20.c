
/* Name:Awel Eshetu Fentaw
ID:0705267
c programming assignment*/

#include <stdio.h>
#include<string.h>

char * ch_str_switch_t(char *a);
int main()
{
	char string[]="this is a string that i try";
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