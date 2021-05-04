#include <detpic32.h>

void delay(int);

int main(void){
    TRISE = TRISE & 0xFFF0;
    LATE = LATE & 0xFFF0;

    int counter = 0;
    while(1){
        delay(200);
        LATE = (LATE & 0xFFF0) | counter++;
        if(counter == 16) counter = 0;
    }
    return 0;
}

void delay(int ms){
    for(; ms > 0; ms--) {
        resetCoreTimer();
        while(readCoreTimer() < 20000);
    }
}