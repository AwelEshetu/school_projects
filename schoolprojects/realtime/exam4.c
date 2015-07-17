#include<stdio.h>
#include<signal.h>
#include<unistd.h>
#include<stdlib.h>
#include<errno.h>
static void sig_usr(int signo){
if(signo == SIGUSR1){
//char buf[] = "SIGUSR1 signal caught!!\n";
//int wr = strlen(buf);
//write(STDOUT_FILENO, buf, wr);
//printf("%d",SIGUSR1);
}
return;
}

int main(void)
{
    pid_t pid, ppid;
	int i;
    ppid = getpid();
    struct sigaction sig;
    sigemptyset(&sig.sa_mask);
	sigaddset(&sig.sa_mask,SIGUSR1);
    sig.sa_flags = 0;
    sig.sa_handler = sig_usr;
    
    if((pid = fork()) == 0)
    {
for(i=0;i<100;i++)
{	//Child    
        kill(ppid, SIGUSR1);
		//exit(0);
		
		}
		
		}
		sleep(1);
		if(sigaction(SIGUSR1,&sig,NULL) == 0)
		//sleep(1);
	    printf("%d %d",ppid,SIGUSR1);
	 
         
         //printf("%d ", SIGUSR1);
				//sleep(10);
   
	
}