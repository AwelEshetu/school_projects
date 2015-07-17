#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define FILE_NAME "awesh.txt"
#define NULL 0


int main()
{
	char name[80];
	char line[80];
	int count=0;
	float sum=0;
	int value=0;
	int number;
	float average;
	FILE *read_file;
	printf("this programme will read a text file with data of a specific format\n");
	printf("the file will contain a list of numbers.\n");
	printf("the programme will then calculate the average of these numbers.\n");
	printf("please enter the name of the file to be read.\n");


	scanf("%s",name);
	if(strcmp(name,FILE_NAME) == 0){
		read_file = fopen(name,"r");
		if(read_file == NULL){
			printf("the file can not open %s",name);
		}
		else
		{
			printf("the file will start reading.....%s\n",name);
			if(fgets(line,80,read_file)!=NULL){
				if(sscanf(line,"%d",&number)==1)
				{

					while(!feof(read_file))
					{
						if(fgets(line,80,read_file)!=NULL){
							if(sscanf(line,"%d",&value)==1)
							{
								sum=sum+value;
								printf("reads%2.2f\n",sum);
								count ++;

							}
							else
							{
								printf("invalid line\n");
							}
						}
					}
				}
			}

			average=sum/count;
			printf(" the average is %2.2f\n",average);



		}



	}
	else
		printf("please enter the right file name\n");
	return 0;
}
