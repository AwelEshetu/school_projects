#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#define SIZE 80
#define NULL 0
#define FLAG 1
 struct detail
{
	char owner[SIZE];
	char manufacture[SIZE];
	char model[SIZE];
	char licence_plate[SIZE];
	int manufacturing_year;

};
int main()
{
	char info[SIZE];
    char name[SIZE];
	FILE * car_data;
	struct detail car_info;
	car_data=fopen("awesh.txt","wb");
	printf("enter the information of a car\n");
    printf("when you finished please type 'quit'\n");


	while(FLAG)
	{
    if(strcmp(info,"quit")==0)
        break;

	printf("owner:");
	scanf("%s",&car_info.owner);
	printf("\nmanufacturer:");
	scanf("%s",&car_info.manufacture);
	printf("\nmodel:");
	scanf("%s",&car_info.model);
	printf("\nlicence plate:");
	scanf("%s",&car_info.licence_plate);
	printf("\nmanufacturing year:");
	scanf("%d",&car_info.manufacturing_year);
	fwrite(&car_info,sizeof(struct detail),1,car_data);
    printf("do you want to continue?<type 'quit'to stop>\n");
    scanf("%s",info);

	fwrite(&car_info,sizeof(struct detail),1,car_data);
	}
	fclose(car_data);

	return 0;
}
