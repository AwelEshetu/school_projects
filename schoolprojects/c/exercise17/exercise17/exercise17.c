/*Name: Awel Eshetu Fentaw
ID: 0705267
c programming exercise*/

/* a program which takes the largerst number from Function SelectfNumber and compare it to the two number in the main function
and prints the largest number*/


#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define SIZE 10
int number[SIZE],count;
int SelectNumber(int z[],int x);
int main()
{

	int n;
	n=SelectNumber(number,SIZE);


	printf("\n\nLargest value = %d\n",n);

	return 0;
}
int SelectNumber(int z[],int x)
{
	int count;
	for(count=0;count<SIZE;count++)
	{
		printf("enter a positive integer:");
		scanf("%d",&number[count]);
		while(number[count]<0)	
		{	
			printf("Negative number has been entered ,please enter postive number?\n");
			scanf("%d",&number[count]);
		}
	}
	for(count=0;count<SIZE;count++)
	{
		if(z[count+1]>z[count])

			x=z[count+1];

	}	
	return x;	
}



