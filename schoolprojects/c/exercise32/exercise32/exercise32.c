/*Write a program that asks user to enter maximum amount of lines that he wants to enter.
Program then asks user to enter lines and dynamically allocates space for each string. User
may stop entering strings by entering a single dot. When user has finished entering lines
program writes the lines to a file and calculates number of characters that user has entered.*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define string_length 50
int main()
{
	FILE *my_file;
	char *sptr;
	int length,i,x;
	printf("how many line would you like to enter?\n");
	sscanf("%d",&length);
	sptr=(char *)malloc(length*sizeof(char));
	for (i=0; i<length; i++)
	{
		printf("enter the string\n");
		fgets(sptr, string_length,stdin);
		x=strlen(sptr);
		printf("%d\n",x);
		//if (sptr[i]!='.')
		//break;
		if (sptr[x-1] == '\n')
			sptr[x-1] = '\0';
		printf("\n");
	}
	i=0;
	my_file=fopen("myfile.tex","w");
	if (my_file!=NULL)
	{

		for (i=0; i<length; i++)
			fwrite(sptr,sizeof(sptr),1,my_file);
	}
	return 0;
}
