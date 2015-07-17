#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define ROW  12
#define COL 15
void set_months(char [][COL], int); 

void display_months(char [][COL], int);
int main()
{
	char months_name[ROW][COL];
	set_months(months_name,ROW); 
	printf("the months of the year you entered are\n");
	printf("*****************************************\n");
	printf(" Month#.........Month Name\n");
	display_months(months_name,ROW);
	return 0;
}

void  set_months(char name[][COL],int y)
{
	int count,x;
	for (count=0; count <y; count++)
	{
		printf("Enter month #%2d = ",count+1);
		fgets(name[count],COL,stdin);
		x=strlen(name[count]);
		if(name[count][x-1] == '\n')
			name[count][x-1] = '\0';


	}

	printf("\n");

}

void display_months(char name[][COL],int x)

{
	int index;
	for (index=0; index <x; index++)
		printf("%4d............%s\n", index+1, name[index]);
}