#include "letter-order.h"
#include <stdio.h>
#include <string.h>

int main(int argc, char const *argv[]) {
    if (letters_in_order(argv[1])) {
        printf("Letters are in order.\n");
    }
    else {
        printf("Letters not in order.\n");
    }

    return 0;
}
