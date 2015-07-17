#include<stdio.h>
#include<unistd.h>
#include<errno.h>
#include<sys/socket.h>
#include<sys/un.h>
#include<sys/stat.h>
#include<stdlib.h>

#define size 5

int main(void) {
	int i,sockfd;
	int val=0;
	struct sockaddr_un srv_addr, clnt_addr;
	char chr;
	
	srv_addr.sun_family=AF_UNIX;        
	strcpy(srv_addr.sun_path,"filename.sock");

	//create a socket
	sockfd = socket(AF_UNIX, SOCK_DGRAM,0);
	printf("Writer started!\n");
	
		
	for(i=0;i<10;i++){
        	if( sendto(sockfd,&i, sizeof(i), 0, (struct sockaddr*)&srv_addr,sizeof(srv_addr))< 0){
			perror("Sendto error.");
			exit(0);
		}
	        
		printf("%d sent\n",i);
		sleep(1);
	}
        close(sockfd);
	printf("Writer terminated!\n");
}
