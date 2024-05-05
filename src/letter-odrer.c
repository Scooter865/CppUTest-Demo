#include "letter-order.h"
#include <string.h>


/** This function shall return 1 when letters are in alphabetical order.
 * e.g. All a's before all b's before all c's.
 * You may encounter duplicate letters. Everything will be lowercase. String length will be between 1 and 100 chars.
*/
int letters_in_order(const char * str) {
    size_t len = strlen(str);

    for (size_t i = 0; i < len-1; i++) {
        if (str[i] > str[i+1]) {
            return 0;
        }
    }
    return 1;
}
