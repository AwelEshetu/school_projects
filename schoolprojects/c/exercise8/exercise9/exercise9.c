/*
studen name:Awel Eshetu Fentaw
group:cap07s
id:0705267
document:  c programming exercise*/


#include<stdio.h>
#include<math.h>


int main()
{

	int number[4];	
    float average;	
	int sum=0;
	int n;
	int choice=0;
	
	printf("Enter the numbers?\n");

	for( n=0;n<4;n++)
	{
			scanf("%d ",&number[n]);
	}

	for(n=0;n<4;n++)
		{
			sum+=number[n];
			average=sum/4;
			printf("Choose '0' to get the average of number\n",choice);
	        scanf("%d",&choice);
		
					
	    }
	

	printf("the sum is :%d\n",sum);
	
	if (choice==0)
	{
	printf("The average of the numbers is:%.2f\n",average);
	}
	

	return 0;
}