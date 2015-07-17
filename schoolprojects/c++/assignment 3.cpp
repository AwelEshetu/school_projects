#include <cstdlib>
#include <iostream>




using namespace std;
void initialize_xy(double a, double b, double x, double y) {
     a=x;
     b=y;
}
void initialize_xy(double a, double b)
{
   a=0;
   b=0;    
     
      

}
           




int main(int argc, char *argv[])
{
    double x,y;
     initialize_xy(x,y,1.0,2.0);
     cout<<"x="<<x<<"y="<<y<<"\n";
     initialize_xy(x,y);
      cout<<"x="<<x<<"y="<<y<<"\n";
     
     
    system("PAUSE");
    return EXIT_SUCCESS;
}
