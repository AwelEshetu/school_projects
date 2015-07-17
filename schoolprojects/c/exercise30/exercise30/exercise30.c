#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#define SIZE 80
#define MAX 5
#define TRUE 1

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
	char line[SIZE];
	int count=0,i;
	int old_car=0,new_car=0;
	FILE * car_data;
	struct detail car_info[MAX];
	printf("enter the file name\n");
	scanf("%s",name);
	car_data=fopen(name,"rb");

	if(car_data==NULL)
		printf("ERROR, file can not open.\n");
	else
	{
		printf("the file will start reading%s\n",name);
		if(!feof(car_data)){
			count=fread(&car_info,sizeof(struct detail),MAX,car_data);

			for(i=0;i<count;i++){
				if(car_info[i].manufacturing_year > new_car){
					new_car=car_info[i].manufacturing_year; 
					
				}
			}

			for(i=0;i<count;i++){
				printf("\ncar information \n");
				printf("\n--------------------- \n");
				if(car_info[i].manufacturing_year==new_car)
					printf("owner: %s\nmanufacturer: %s\nmodel: %s\nlicenceplate: %s\nmanufacturing year: +%d\n"
					,car_info[i].owner,car_info[i].manufacture,car_info[i].model,car_info[i].licence_plate,new_car);
				else 
					
					printf("owner: %s\nmanufacturer: %s\nmodel: %s\nlicenceplate: %s\nmanufacturing year:  %d\n"
					,car_info[i].owner,car_info[i].manufacture,car_info[i].model,car_info[i].licence_plate,new_car);
			}

			printf("the total number of cars is %d\n",count);
		}


	}
	fclose(car_data);

	return 0;
}