int main(void){
int i,j;
pid_t pid;
char chr='A';
for (i =0;i<4;i++)
{
pid=fork();
if(pid==0)
{
chr='A'+i;
for(j=0;j<i+1;j++)
write(STDOUT_FILENO
}}