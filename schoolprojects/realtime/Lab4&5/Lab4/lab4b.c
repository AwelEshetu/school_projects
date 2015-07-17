#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <fcntl.h>
#include <stdlib.h>
int main(int argc,char *argv[]) 
{
	struct stat buff;
	int mod;
	stat(argv[1],&buff);
	//mod=stat.st_mode;
	if (S_ISDIR(buff.st_mode))
		printf("\n Is directory file\n");
	if (S_ISREG(buff.st_mode))
		printf("\n Is Regular file\n");
	if (S_ISCHR(buff.st_mode))
		printf("\n Is Character file\n");
	if(((buff.st_mode)&S_IFMT)==S_IRWXU)
		printf("\n Is directory file FILE FIELS\n");
	return 1;
}
