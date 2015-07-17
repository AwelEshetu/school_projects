#include<stdio.h>
#include<stdlib.h>
#define SIZE 12
int main()
{
	int n;
	float Element[SIZE]={123.1231,2593.0098, 3.1415,12.098,0.112,21.098,10.298,1.202,4.101,15.23,1233.435,12345.89};
	for(n=0;n<12;n++)
	{
		printf("Element[%d]=%5.4f\n",n,Element[n]);
	}
	return 0;
}