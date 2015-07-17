#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<fcntl.h>
#include<errno.h>
#include<sys/types.h>
#include<sys/stat.h>
int set_nonblock_flag (int fd, int value);
int main(void)
{
//int access_mode;
int fd_flags;
int fl_flags;
int fd;
int value;
fd=open("file.txt",O_CREAT|O_RDWR,O_NONBLOCK,0700);
if((fl_flags=fcntl(fd,F_GETFL)==-1))
perror("fcntl");
printf("%X %X %X",fl_flags,O_ACCMODE,(fl_flags & O_ACCMODE));
if((fl_flags & O_ACCMODE)==O_RDONLY)
printf("\nAccess mode is Read only");
if((fl_flags & O_ACCMODE)==O_WRONLY)
printf("\nAccess mode is Write only");
if((fl_flags & O_ACCMODE)==O_RDWR)
printf("\nAccess mode is Rread/Write");
fd_flags=fcntl(fd,F_GETFD);
if (fd_flags &FD_CLOEXEC)
printf("\nClose on Exec bit is ON");
else
printf("\nClose on Exec bit is OFF");
if(fl_flags & O_NONBLOCK)
printf("\nNon Blocking mode is ON");
else
printf("\nNon blocking mode is OFF");
if(fl_flags & O_APPEND)
printf("\n Append is ON");
else
printf("\n Append is OFF");
return 0;
}
 	

/* Set the O_NONBLOCK flag of desc if value is nonzero,
   or clear the flag if value is 0.
   Return 0 on success, or -1 on error with errno set. */

int
set_nonblock_flag (int fd, int value)
{
  int fl_flags = fcntl (fd, F_GETFL, 0);
  /* If reading the flags failed, return error indication now. */
  if (fl_flags == -1)
    return -1;
  /* Set just the flag we want to set. */
  if (value != 0)
    fl_flags |= O_NONBLOCK;
  else
    fl_flags &= ~O_NONBLOCK;
  /* Store modified flag word in the descriptor. */
  return fcntl (fd, F_SETFL, fl_flags);
}
