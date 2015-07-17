#include<stdio.h>
#include<signal.h>
#include<unistd.h>
#include<stdlib.h>
#include<errno.h>
int main(void)
{
pid_t pid;
int pipe_fd[2];
int i;
pipe(pipe_fd);
for(i=0;i<5;i++)
{
pid=fork();
}
if(pid==0)
{
close(pipe_fd[1]);
printf("doing task1");
}
//sleep(1);
if(pid >0)
{
close(pipe_fd[0]);
printf("task1 has done!");
}

else
{
close(pipe_fd[1]);
printf("doing task2");
exit(0);
}
close(pipe_fd[0]);
printf("All tasks are done");
}