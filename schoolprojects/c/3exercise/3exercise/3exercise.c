/*
studen name:Awel Eshetu Fentaw
group:cap07s
id:0705267
document: 3rd c programming exercise*/


#include<stdio.h>
#include<math.h>
//#define pi 3.1416
int main()
{
	int pi=3.1416;
	int C;
	int r;
	printf("Enter the radious of the circle?\n");
	scanf("%d",&r);
	C=2*pi*r;
    printf(" The circumfrence of the Your cirlce is :%d\n",C);
   return 0;
}