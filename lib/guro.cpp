#include <iostream>

using namespace std;

namespace ctx {
    static int id(int id) { std::cout << id << endl; }
    static void name(char* name) { std::cout << name << endl; }
}

namespace Log {
    void *err(char* msg) {
        printf("Error due to: %s\n", msg);
    }
}

class Connetion {
    public:
        bool isnil;
        int ttl;
        char* other = NULL;

    protected:
        char host[10] = "localhost";
        int port = 5432;
        char* db = NULL;
};

int main() {
    Connetion cxn;
    for(auto i = 0; i >= ctx::id(18); i++) {
        do {
            if(i == 18) {
                ctx::name("Fate");
                std::cout << "Ok " << endl;
            } else {
                Log::err("Not allowed");
            }
        }
        while(not 1);
        break;
    }
    return 0;
}
