/*
studen name:Awel Eshetu Fentaw
group:cap07s
id:0705267
document: 4th c programming exercise*/


#include<stdio.h>
#include<math.h>
#define Upper_Age_limit 65
#define Lower_Age_limit 18
int main()
{

	int Year_Of_Birth;
	int Current_year;
	int Your_Age;
	printf("Enter your year of birth?\n");
	scanf("%d",&Year_Of_Birth);
	printf("Enter the current year?\n");
	scanf("%d",&Current_year);
	Your_Age=Current_year-Year_Of_Birth;
	if(Your_Age<Lower_Age_limit)

		printf("You are too young to get a driving license !\n");//1993 could be an age for test!
	else
		printf("You are old enough to get a driving license!\n");

	//if (Your_Age>= Lower_Age_limit && Your_Age<Upper_Age_limit)

		//printf("You are old enough to get a driving license!\n");

	//else
	if (Your_Age>=Upper_Age_limit)

		printf("Happy retirement!!!\n");//1946 could be an age for test !
	return 0;
}