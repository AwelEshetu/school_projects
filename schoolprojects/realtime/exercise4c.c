#include <stdio.h>
#include <stdlib.h>

#define SIZE 13



int main(void)
{
	int i;
	char buff[SIZE];
	setvbuf(stdout,buff,_IOFBF,5);

	while(fgets(buff,SIZE,stdin)!=NULL){
		for(i=0;i<SIZE;i++)
		{
		if(fputc(buff[i],stdout)==EOF)
	 
		printf("output error");
		sleep(1000);
		}
		
		if(ferror(stdin))
	
		printf("input error");

	}
	return 0;
}





       