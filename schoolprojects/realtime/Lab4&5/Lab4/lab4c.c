//Testing file flags
#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
int main (void) {
	
	int i;
	char c;
	char buffer[5];
	setvbuf(stdout,buffer,_IOFBF,sizeof(buffer));
	while((c=getc(stdin))!=EOF)
	{
	// if (c!=EOF)
	 putc(c,stdout);
	 sleep(1);
	}
	//fflush(stdout);
	return 0;
	//exit(0);
}

