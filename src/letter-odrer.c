#include "letter-order.h"
#include <string.h>


/**
 * This function shall return 1 when letters are in alphabetical order 0 when they're not.
 * e.g. All a's before all b's before all c's.
 * You may encounter duplicate letters. Everything will be lowercase.
*/
int letters_in_order(const char * str) {
    if (str == NULL) {
        return 1;
    }
    size_t len = strlen(str);

    if (len == 0) {
        return 1;
    }
    for (size_t i = 0; i < len-1; i++) {
        if (str[i] > str[i+1]) {
            return 0;
        }
    }

    return 1;
}
