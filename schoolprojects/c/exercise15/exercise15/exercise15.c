/*Name: Awel Eshetu Fentaw
ID: 0705267
c programming exercise*/

/* a program which takes the largerst number from Function SelectfNumber and compare it to the two number in the main function
and prints the largest number*/


#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int SelectNumber(int x, int y );
int main()
{
	int m=0;
	int n=0;
	printf("Enter two numbers\n");
	scanf("%d %d",&m,&n);


	printf("The largest number is :%d\n", SelectNumber(m,n));

	return 0;
}
int SelectNumber(int x ,int y)
{

	if (x>y)
	{

		return x;
	}
	else
		return y;
}