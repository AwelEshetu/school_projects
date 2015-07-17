#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main()
{
	FILE *fptr;
	int num,i,x;
	printf("how many number do you want to save?\n");
	scanf("%d",&num);
	//printf("%d\n",num);
	fptr=fopen("awesh.text","w");
	
	if (fptr==NULL)
		printf("it is not possible to open the file\n");
	else
	{
		fprintf(fptr,"%d",num);
		
		for (i=0;i<num;i++)
		{
			scanf("%d",&x);
			fprintf(fptr,"%d",x);
		}
		
		fclose(fptr);
	
	}
	
	return 0;
}