/*
studen name:Awel Eshetu Fentaw
group:cap07s
id:0705267
document:  c programming exercise*/


#include<stdio.h>



int main()
{

	int number[10];	
	float average;	
	int sum=0;
	int n;

	printf("Enter the numbers?\n");
	for(n=0;n<10;n++)
	{

		scanf("%d ",&number[n]);	
		sum+=number[n];


	}
	average=sum/10;
	printf("the sum is :%d\n",sum);
	printf("The average of the numbers is:%.2f\n",average);


	return 0;
}