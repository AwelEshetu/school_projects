#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void read_data(double *,int num);
double get_average(double *,int num);
void findstand(double *, int num, double y);

int main()
{
	int num=0;
	double *ptr,x;

	printf("how many number do you want to enter\n");
	scanf("%d",&num);
	ptr=(double *)malloc(num*sizeof(double));
	if (ptr!=NULL)
	{read_data(ptr,num); 
	x=get_average(ptr,num);
	printf("the average is= %f\n",x);
	findstand(ptr,num,x);

	}
	else
		printf("the memory is not allocated\n");
	return 0;
}
void read_data(double *ptr, int num)
{
	int i;
	for (i=0; i<num; i++)
	{printf("enter the number\n");
	scanf("%lf",&ptr[i]);
	}

}
double get_average(double *ptr,int num)
{
	double sum=0,aver=0;
	int i;
	for (i=0; i<num; i++)
		sum+=ptr[i];
	aver=sum/num;
	return aver;

}
void findstand(double *ptr, int num, double y)
{
	int i;
	double dev=0;
	for (i=0; i<num; i++) 
		dev+=sqrt(((ptr[i]-y)*(ptr[i]-y))/num);
	printf("the standard devetion is=%f\n",dev);

}

