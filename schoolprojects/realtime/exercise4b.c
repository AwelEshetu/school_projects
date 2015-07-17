#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
 

int main(void)
{
	int i;
	int fd;
	int access_right;
	struct stat buff;
	char *x;
		
		stat("/users4/a/awele/algorithm/Algorithm_note.txt",&buff);
		
		if(S_ISDIR(buff.st_mode)) 
			x= "Directory";
		else if(S_ISREG(buff.st_mode))
			x= "Regular file";
		else if(S_ISCHR(buff.st_mode))
			x="charachter special";
		else
			x="other type";
			
	
	printf("%s: %s \n",x);
	
	access_right=(buff.st_mode & ~S_IFMT);
	printf("access right %o",access_right);
	
	return 1;
}
