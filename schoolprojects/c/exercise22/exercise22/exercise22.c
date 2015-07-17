#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define ROW  12
#define COL 15
void change_languge(char month_name[ROW][COL],int a);
int find_str(char name_month[ROW][COL],char *temp);
int main()
{
	char *ptr,month[ROW][COL];
	int choise,i,j;

	ptr=(char *)malloc(COL*sizeof(char));

	printf("choose 0 to display months in english\n");
	printf("choose 1 to display months in finnish\n");
	printf("Choose your language for display?\n");
	scanf("%d",&choise);
	change_languge(month,choise);
	for (i=0; i<ROW; i++)

		printf("%s\n",month[i]);
	printf("enter the month you want to see\n");
	scanf("%s",ptr);
	j=find_str(month,ptr);
	if(j!=-1)
		printf("the month number is:%d\n",j+1);
	else
		printf("the month in not found :%d\n",j+1);	
	return 0;                      
}
void change_languge(char month_name[ROW][COL], int a)
{
	char english_month[ROW][COL]={"January","February","March","April","May",
		"June","July","August","September","October","November","December"};
	char finnish_month[ROW][COL]={"tammikuu","helmikuu","maaliskuu","huhtikuu","toukokuu",
		"kesäkuu","heinäkuu","elokuu","syyskuu","lokakuu","marraskuu","joulukuu"};
	int i;
	switch(a)
	{
	case 0:
		printf("you have chosen to see the month in english\n");
		for (i=0; i<ROW; i++)
			strcpy(month_name[i],english_month[i]);
		break;
	case 1:
		printf("you have chosen to see the month in finnish\n");
		for (i=0; i<ROW; i++)
			strcpy(month_name[i],finnish_month[i]);
		break;
	default:
		printf("invalid choide\n");


	}
}

int find_str(char name_month[ROW][COL],char *temp)
{
	char *look_up;
	int i;
	for (i=0; i<ROW; i++)
	{ 
		look_up=strstr(name_month[i],temp);
		if (look_up!=NULL)
			return i;
	}
	if (look_up==NULL)
		return -1;
}