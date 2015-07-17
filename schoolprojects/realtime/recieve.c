#include <stdio.h>   
#include <signal.h>   
#include <termios.h>   
#include <unistd.h>   
#include <sys/types.h>   
#include <sys/time.h>
#include <aio.h>
#include <errno.h>   
#include <sys/un.h>   
#include <stdlib.h>   
#include <sys/socket.h>

   
int main(void) {   
        int val ;   
        int socketfd;   
        struct sockaddr_un srv_addr, clnt_addr;   
        int rec;   

        
        socketfd = socket(AF_UNIX,SOCK_DGRAM,0);   
   
        // bind   
        if (bind(socketfd, (struct sockaddr*)&srv_addr,sizeof(srv_addr))< 0)
		perror("Bind error.");   
   
	//recieve data
        while(1){   
   
                recvfrom(socketfd, &rec, sizeof(rec), 0,NULL,NULL);   
                printf("%d\n",rec);   
   
        }   
   
        close(socketfd); //close the socket   
        exit(0);   
   
   
}//end of main   
   
   

