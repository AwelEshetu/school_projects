/*Name: Awel Eshetu Fentaw
ID: 0705267
c programming exercise*/

/* a program which takes the largerst number from Function SelectfNumber and compare it to the two number in the main function
and prints the largest number*/


#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int PrintStar(int );
int SelectNumber(int );
int main()
{
	int mystar;	

	int m=0;
	
	
	//z=SelectNumber(m);
	mystar=PrintStar(m);
	
		
	return 0;
}
/*int SelectNumber(int x)
	{
	
printf("enter a positive number?\n");
scanf("%d",&x);
while (x<=0)
	{

	printf("please enter a positive number?\n");
    scanf("%d",&x);
}
	return x;
	
}*/
int PrintStar(int x)
{
	//int star;
	int n;
	printf("Enter the number of stars you want to print?\n");
	scanf("%d",&n);
	while (n<=0)
	{

	printf("please enter a positive number?\n");
    scanf("%d",&n);
	}

	
	
	
return n;	

}
