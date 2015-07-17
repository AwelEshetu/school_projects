#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#define ROW 3
#define COL 3
void read_data(int *vector,int a);
void read_data2(int *matrix[ROW],int y,int x);
void display_matrix(int *arr2[ROW],int b,int m);
void product(int *arr2[ROW],int *vec,int *arry,int n,int z);
void display_result(int *arry, int t);
int main()
{
	int *array1,*array2[ROW],*result,i;
	array1=(int *)malloc(COL*sizeof(int));
	result=(int *)malloc(COL*sizeof(int));
	read_data(array1,ROW);
	printf("the one dimensional vector are:\n");
	printf("*******************************\n");
	display_result(array1,ROW);
	printf("\n");
	for (i=0;i<ROW;i++)
		array2[i]=(int *)malloc(COL*sizeof(int));
	read_data2(array2,ROW,COL);
	printf("\n");
	printf("the matrix you entered before multipication \n");
	printf("*******************************************\n");
	display_matrix(array2,ROW,COL);
	product(array2,array1,result,ROW,COL);
	printf("the array after multipications\n");
	printf("******************************\n");
	display_result(result,ROW);
	printf("\n");	
	return 0;
}
void read_data(int *vector , int a)
{
	int index;

	for (index=0; index<ROW; index++)
	{
		printf("Enter the value of one dimensional vector \n");
		scanf("%d",(vector+index));
	}
}
void read_data2(int *matrix [ROW],int y, int x )
{
	int index,count;
	for (index=0; index<ROW; index++)
	{
		printf("enter the value of three by three matrix: \n");
		for (count=0; count<COL; count++)
			scanf("%d",(*(matrix+index)+count));
	}
}
void display_matrix(int *arr2 [ROW],int b,int m)
{
	int index,count;
	for (index=0; index<ROW; index++)
	{
		for (count=0; count<COL; count++)
			printf("\t%d ",*(*(arr2+index)+count));
		printf("\n");
	}
}
void product(int *arr2[ROW], int *vec,int *arry,int b,int z)
{
	int index,count,temp;
	for (index=0; index<ROW; index++)
	{
		temp=0;
		for (count=0; count<COL; count++)
			temp+= (*(*(arr2+index)+count))*(*(vec+count));
		*(arry+index)=temp;
		printf("\n");
	}
}
void display_result(int *arry, int t)
{
	int index;
	for (index=0; index<ROW; index++)
		printf("\t%d ",*(arry+index));
}