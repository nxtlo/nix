#include <stdlib.h>
#include <stdio.h>
#define None 0

typedef struct Config {
    char token;
    char prefix;
    int owner_id;
} Config;


typedef struct Pool {
    char host;
    int port;
    char user;
    char password;
    char dbname;
} Pool;

typedef struct _ {
} _;
