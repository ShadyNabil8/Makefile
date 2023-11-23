#include <stdio.h>
#include "file1.h"
#include "lib/motor.h"
int main(int argc, char const *argv[])
{
    printf("Hello, this is a makefile example\n");
    printFileName();
    motorTurnLeft();
    motorTurnRight();

    return 0;
}
