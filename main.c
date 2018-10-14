#include <stdio.h>
#include <string.h>

int main()
{
   char buf[1024] = "" ;        // the string which will be changed a bunch
   for (unsigned int i = 0; i<1000000000; i++){
     buf[0] = 0;                // empty the string by setting the first character to null
     sprintf(buf, "%u\n", i);   // put the current string representation of i in the buffer
   }
   printf("%s", buf); // print the final value of the buffer.
   return 0;
}
