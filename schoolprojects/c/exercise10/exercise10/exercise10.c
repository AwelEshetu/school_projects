/*
studen name:Awel Eshetu Fentaw
group:cap07s
id:0705267
document:  c programming exercise*/


#include<stdio.h>


int main()
{

	int number[4];	
    float average;	
	int sum=0;
	int n;

	int choice=0;

	printf("Enter the numbers?\n");
	//scanf("%d ",&number[n]);
		for( n=0;n<4 ;++n)
	{	
    
	scanf("%d ",&number[n]);
	if(number[n]<0)
	{
	printf("Only positive numbers are accepted!");
	}
	else{	

	sum+=number[n];
	 average=sum/4;	

	}
	 printf("the sum of the numbers is :%d\n",sum);	
		}
	printf("enter 0 to get the average of numbers!");
	scanf("%d",&choice);
	while(choice=0)
	{
	printf("The average of the numbers is:%.2f\n",average);
	}
	
	return 0;
}