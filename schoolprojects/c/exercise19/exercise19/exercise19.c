/* a program which takes the largerst number from Function SelectfNumber and compare it to the two number in the main function
and prints the largest number*/


#include<stdio.h>
#include<stdlib.h>
#include<string.h>


int pointer(int x,int y);
int main()
{
	int y=0;
	int x=0;
	int n;

	n=pointer(x,y);



	return 0;
}
int pointer(int x, int y)
{
	int remaining_money;
	int money=0;
	int ticket_price;
	int *money_ptr=&money; // *money_ptr=money
	int *ticket_price_ptr=&ticket_price; //*ticket_price_ptr=ticket_price
	printf("how much money do you have in your pocket?\n");
	scanf("%d",&money);
	printf("what is the price of a single ticket?\n");
	scanf("%d",&ticket_price);
	if(money>=ticket_price)
	{

		remaining_money=*money_ptr-*ticket_price_ptr;
		printf("\n After buying your ticket the money in your pocket becomes:= %d\n",remaining_money);	

		return remaining_money;
	}
	else 
		printf("you don't have enough money to buy a single ticket because your money is=%d \n",money);
	return 0;
}