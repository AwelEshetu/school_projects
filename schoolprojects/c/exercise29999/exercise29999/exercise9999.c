#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define FILE_NAME "awesh.txt"
#define SIZE 80
#define NULL 0

int main()
{
	char line[SIZE];
	char name[SIZE];
	char string[SIZE];
	int add,sub;
	int value1=0;
	int value2=0;

	FILE *read;

	printf("this programme will read a specific command from a file format\n");
	printf("valid commands are add and sub\n");
	printf("please enter the name of the file to be read\n");
	scanf("%s",name);
	read=fopen(name,"r");
	if(read==NULL)
		printf("the file canot open\n");
	else
	{
		printf("the file will start reading...%s\n",name);
		if(!feof(read))
		{
			if(fgets(line,SIZE,read)!=NULL)
				if(sscanf(line,"%d%d%s",&value1,&value2,string)==3)
				{
					if(!strcmp(string,"add"))
					{
						add=value1+value2;
						printf("%d+%d= %d\n",value1,value2,add);

					}
					else if(!strcmp(string,"sub")){
						sub=value1-value2;
						printf("%d+%d=%d\n",value1,value2,sub);
					}
					else
						printf("formatting error%s",line);
				}
				else
				{
					printf("bad formatting%s\n",line);

				}


		}
	}
	fclose(read);
	return 0;


}