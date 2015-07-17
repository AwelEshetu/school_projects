#include <stdio.h>
#include <stdlib.h>
#include<string.h>
typedef struct ortogonal_
{
	int x;
	int y;
} record;
void read_data (record *ptr);
void display(record *ptr);
int check_ortog(record *ptr,record *ptr2);
int main()
{
	record vec1,vec2;
	int product;	
	read_data(&vec1);
	read_data(&vec2);	
	display(&vec1);
	display(&vec2);
	product=check_ortog(&vec1,&vec2);
	if (product)
		printf("The two vector  are  ortogonal\n");
	else
		printf("The vectors are not ortogonal\n");	
	return 0;
}
void read_data (record *ptr)
{
	printf("Enter the first coordinates of the vecotor?\n");
	scanf("%d",&ptr->x);	
	printf("Enter the second coordinates of the vecotor?\n");
	scanf("%d",&ptr->y);
}
void display(record *ptr)
{
	int i;
	printf("The vectors are \n");
	{
		printf("%d ",ptr->x);
		printf("%d ",ptr->y);

		printf("\n");
	}
}
int check_ortog(record *ptr, record *ptr2)
{
	int sum=0;
	sum=(ptr->x)*(ptr2->x)+(ptr->y)*(ptr2->y);
	printf(" the sum %d\n",sum);
	if (sum==0)
		return 1;
	else 
		return 0;
}