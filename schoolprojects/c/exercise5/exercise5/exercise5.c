/*
studen name:Awel Eshetu Fentaw
group:cap07s
id:0705267
document: 5th c programming exercise*/


#include<stdio.h>
#include<math.h>

int main()
{
	int Current_year;
	int Your_Age;
	int Year_Of_Birth;
	printf("Enter your Age?\n");
	scanf("%d",&Your_Age);
	printf("Enter the current year?\n");
	scanf("%d",&Current_year);
	Year_Of_Birth=Current_year-Your_Age;
	printf("You were born on:%d\n",Year_Of_Birth);
	if (Year_Of_Birth>=1980 && Year_Of_Birth<=1989)
	{
		printf("You were born in the 80s!\n");
	}
	return 0;
}