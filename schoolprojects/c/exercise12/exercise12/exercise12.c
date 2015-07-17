#include<stdio.h>
#include<stdlib.h>
#define NUMBER_OF_STUDENTS 5// index shows number of students;
int main()
{
	int index=0;
	int sum=0;
	int average=0;
	int grade[NUMBER_OF_STUDENTS]= {0};
	for (index=0;index<NUMBER_OF_STUDENTS;index++){
		printf("Enter grade for student nr:%d\n",index+4500);
		scanf("%d",&grade[index]);

		sum+=grade[index];
		average=sum/NUMBER_OF_STUDENTS;
	}
	printf("the average grade is :%2.1d\n",average);




	return 0;
}