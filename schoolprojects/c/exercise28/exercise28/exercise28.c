#include <stdio.h>
#include<stdlib.h>
#include <string.h>
#define TEMPSIZE 20
#define NULL 0
void main(void){

	int a,b;
	char op[20];
	char temp[TEMPSIZE];
	FILE *myFile;
	myFile = fopen( "awesh.txt",  "r");
	if (myFile!=NULL)

			{
		while(!feof(myFile)){
			if(fgets(temp,TEMPSIZE,myFile)){
				if(sscanf(temp,"%d %d %s", &a, &b,op) == 3){

					if(strcmp(op, "add") == 0) {
						printf("%d + %d = %d\n",a ,b, a+b);
					}
					else if (strcmp(op, "sub") == 0) {
						printf("%d - %d = %d\n",a ,b, a-b);
					}
					else
					{	printf("incorrect formating\n");
					printf(" %s \n", temp);}


				}
				else
				{printf("incompatable formating\n");
				printf("%s \n", temp);}
			}
		}
		fclose(myFile);
	}
	else
		printf("unable to read the file\n");


}
