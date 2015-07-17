/*
studen name:Awel Eshetu Fentaw
group:cap07s
id:0705267
document:  c programming exercise*/


#include<stdio.h>



int main()
{

	int number[4];	
	int average;	
	int sum=0;
	int n=0;

	int choice=0;

	printf("Enter the numbers?\n");
	//scanf("%d ",&number[n]);

	for( n=0;n<4;++n)
	{			
		scanf("%d ",&number[n]);
		sum+=number[n];
		average=sum/4;	


	}
	
	printf("the sum of the numbers is :%d\n",sum);
	printf("Enter '0' to get the average of the numbers .");
	scanf("%d",&choice);
	printf("The average of the numbers is:%d\n",average);



	return 0;
}