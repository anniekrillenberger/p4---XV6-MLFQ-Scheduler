#include "types.h"
#include "stat.h"
#include "user.h"
#include "psched.h"

int main(int argc, char *argv[]) {
    struct pschedinfo pi;

    printf(1, "getschedstate: %d\n", getschedstate(&pi));

    return 0;
} 
