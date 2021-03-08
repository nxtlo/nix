#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include "types.h"

bool is_empty(Config conf) {
    if(conf.token == None) {
        return false;
    } else {
        return true;
    }
}

void __types__(int self);

char* fetch_token() {
    return getenv("BOT_TOKEN");
}

int run() {
    return 0;
}
