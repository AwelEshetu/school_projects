/*Name: Awel Eshetu Fentaw
ID: 0705267
c programming exercise*/




#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int PrintStar(int star);
int main()
{
	int mystar;
	int n;
	printf("Enter the number of stars you want to print\n");
	scanf("%d",&n);
	for(n=1; ;n++)
	{
	mystar=PrintStar(n);
	}

	return 0;
}
int PrintStar(int star)
{
	
		printf("*");
	
return star;
}