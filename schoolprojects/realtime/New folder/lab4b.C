#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<fcntl.h>
#include<errno.h>
#include<sys/types.h>
#include<sys/stat.h>
int main(int argc,char *argv[]) 
{
    
	struct stat buff;
	int access_right;
	//int mod;
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
		
		printf("%s: %s \n",argv[1]);
		
	access_right=(buff.st_mode & ~S_IFMT);
	printf("access right %o",access_right);
	return 1;
}
