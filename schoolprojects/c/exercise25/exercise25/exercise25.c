#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#define COL 3
#define SIZE 30
typedef struct student_
{
    char first_name[SIZE];
    char middle_name[SIZE];
    char last_name[SIZE];
    int total_credit;
} student;
void read_input(student *);
void display(student *,int);
int maxi(student *ptr2);
int main()
{
    student record[COL],*ptr,*ptr2;
    int i,j;
    printf("this program records student full name and total credit\n");
    printf("Enter First name, Middle name, Last name and total credits for three students!\n");
    //ptr=record;
    read_input(record);
    //ptr2=record;
    j= maxi(record);
    printf("the maximum is:%d\n",j);
    printf("the full name you entered and the credit completed:\n");
    ptr=record;
    display(ptr,j);

}
void read_input(student *ptr)
{
   int i;
   for (i=0; i < COL; i++)
   {
    printf("Enter First name\n");
    scanf(" %s",ptr->first_name);
    printf("Enter middle name\n");
    scanf(" %s",ptr->middle_name);
    printf("Enter last name \n");
    scanf(" %s",ptr->last_name);
    printf("Enter total_credit\n");
    scanf(" %d",&ptr->total_credit);
    ++ptr;
    }
}
void display(student *ptr,int a)
{
int i;
for (i=0; i < COL; i++)
{
    if (ptr->total_credit==a)
	{
   printf("First Name   Middle Name   Last Name    Total credits\n");
   printf(" *%4s         %4s          %4s            %4d \n",ptr->first_name,ptr->middle_name,ptr->last_name,ptr->total_credit);
	}
    else
	printf("First Name   Middle Name   Last Name    Total credits\n");
    printf("  %4s        %4s           %4s           %4d \n",ptr->first_name,ptr->middle_name,ptr->last_name,ptr->total_credit);
    ++ptr;}
}
int maxi(student *ptr2)
{
    int i,max=0;
    for (i=0; i < COL; i++)
    {
        if (ptr2->total_credit>max)
        max=ptr2->total_credit;
       ++ptr2;
    }
    return max;

}