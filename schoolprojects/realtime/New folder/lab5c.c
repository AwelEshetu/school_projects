#include <sys/stat.h>
#include <unistd.h>
#include <sys/types.h>
#include <errno.h>
#include <fcntl.h>
 
int main(void) 
{
	pid_t pid_of_child;
	
	int fd;
	fd=open("exlog.txt",O_CREAT|O_WRONLY|O_APPEND,0700);
	int a = 5;
	pid_of_child = fork();
	
	
	if (pid_of_child >0)  {  
	//this is parent
			//code for parent process
			//tasks of parent process  are performed

			// parent could wait for the child here
			sleep(300);
			exit(0); // parent terminates !
	}
	if (pid_of_child == 0) { // this is child
	
		write(fd,"AAAAA",5);
		sleep(1);
		write(fd,"AAAAA",5);
		sleep(1);
		write(fd,"AAAAA",5);
		sleep(1);
		write(fd,"AAAAA",5);
		sleep(1);
		write(fd,"AAAAA",5);
		sleep(1);
  		close(fd);
			//code for child process
			// tasks of child process are performed
			
			exit(5); //  child terminates !
	}
	// This part of code is never executed
}