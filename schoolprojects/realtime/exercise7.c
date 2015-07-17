#include <sys/stat.h>
#include <unistd.h>
#include <sys/types.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>

 
int main(void) 
{		char letter='A';
		pid_t pid;
		int i;
		int status;
		int fd;
		char fd_string[6];
		
		fd = open
		
		
		
		//for (i = 0; i < 5 ; i++) 
		{	
			pid = fork();
			if (pid == 0) 											
			{ 
			execl("./exercise7child.exe", "./exercise7child.exe", fd_string, (char*)0);
			/*	for(i=0;i<5;i++){
					printf("%c",letter);
					fflush(stdin);
				sleep(1);
				
				}

				exit(0);		
			*/
			}
		}
		i = 0;
		while ( (pid=waitpid(pid,NULL,0))>0) 
		{
		i++;
		printf("\nChild  %d has terminated\n",pid);
		wait(&status);
		
		}
}

