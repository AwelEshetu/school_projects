/*
studen name:Awel Eshetu Fentaw
group:cap07s
id:0705267
document: 4th c programming exercise*/


#include<stdio.h>
#include<math.h>
//const int addition=1;
//const int subtraction=2;
//const int division=3;
//const int multiplication=4;
#define addition 1
#define subtraction 2
#define division 3
#define multiplication 4


int main()
{
	int choice=1;
	int x,y;
	int sum=0;
	int prod=0;
	int div=0;
	int sub=0;

	printf("Enter two numbers\n");
	scanf("%d %d",&x,&y);
	printf("you entered %d and %d,what operation you want to perform?\n",x,y);
	printf("select '1' for addition\n");
	printf("select '2' for subtraction\n");
	printf("select '3' for division\n");
	printf("select '4' for multiplication\n");
	//printf("Enter your choice for opration?\n");
	scanf("%d",&choice);



	switch (choice)
	{

		sum=x+y;
		prod=x*y; 
		div=x/y;
		sub=x-y;

	case 1:

		printf("\n%d + %d= %d\n",x,y,sum);
		break;
	case 2:
		printf("\n%d - %d= %d\n",x,y,sub);
		break;
	case 3:
		if (choice ==3 && y==0)
		{
			printf("division by zero is not permited !");
			return 0;
		}
		else
			printf("\n%d / %d= %d\n",x,y,div);
		break;
	case 4:
		printf("\n%d * %d= %d\n",x,y,prod);
		break;
	default:

		printf("Illegal selection!\n");
	}

	return 0;
}